using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using OpenTK;

namespace Aletha.bsp
{
    public delegate void OnBspIncompatible(bsp_header_t header);

    public class bsp_parser_ibsp_v46
    {
        /// <summary>
        /// Parses the BSP file
        /// </summary>
        /// <param name="src"></param>
        /// <param name="tesselationLevel"></param>
        /// <param name="onIncompatible"></param>
        public static void parse(BinaryStreamReader src, int tesselationLevel, OnBspIncompatible onIncompatible)
        {
            bsp_header_t header = readHeader(src);

            // Check for appropriate format
            if (header.tag != "IBSP" || header.version != 46)
            {
                onIncompatible(header);

                return;
            }

            // info on different versions: https://github.com/zturtleman/bsp-sekai

            /*---- LUMP INDEX ----
            Index       Lump Name         Description
            0           Entities          Game-related object descriptions.
            1           Textures          Surface descriptions (shaders).
            2           Planes            Planes used by map geometry.
            3           Nodes             BSP tree nodes.
            4           Leafs             BSP tree leaves.
            5           Leaffaces         Lists of face indices, one list per leaf.
            6           Leafbrushes       Lists of brush indices, one list per leaf.
            7           Models            Descriptions of rigid world geometry in map.
            8           Brushes           Convex polyhedra used to describe solid space.
            9           Brushsides        Brush surfaces.
            10          Vertexes          Vertices used to describe faces.
            11          Meshverts         Lists of offsets, one list per mesh.
            12          Effects           List of special map effects.
            13          Faces             Surface geometry.
            14          Lightmaps         Packed lightmap data.
            15          Lightvols         Local illumination data.
            16          Visdata           Cluster-cluster visibility data.*/


            // Read map entities
            bsp_parser_ibsp_v46.readEntities(header.lumps[0], src);
            /*  The entities lump stores game-related map information, 
             *  including information about the map name, weapons, health, armor, triggers, spawn points, 
             *  lights, and .md3 models to be placed in the map. 
             *  The lump contains only one record, a string that describes all of the entities */

            bsp_tree tree = new bsp_tree();
            List<shader_p> shaders;

            // Load visual map components
            tree.surfaces = shaders = bsp_parser_ibsp_v46.readShaders(header.lumps[1], src);
            List<lightmap_rect_t> lightmaps = bsp_parser_ibsp_v46.readLightmaps(header.lumps[14], src);
            List<Vertex> verts = bsp_parser_ibsp_v46.readVerts(header.lumps[10], src);
            List<int> meshVerts = bsp_parser_ibsp_v46.readMeshVerts(header.lumps[11], src);
            List<Face> faces = bsp_parser_ibsp_v46.readFaces(header.lumps[13], src);

            

            // COMPILE MAP
            BspCompiler.compileMap(verts, faces, meshVerts, lightmaps, shaders, tesselationLevel);

         //   postMessage2({
         //       "type": 'status',
         //"message": 'Geometry compiled, parsing collision tree...'
         //   },null);


            // Load bsp components
            tree.planes = bsp_parser_ibsp_v46.readPlanes(header.lumps[2], src);
            tree.nodes = bsp_parser_ibsp_v46.readNodes(header.lumps[3], src);
            tree.leaves = bsp_parser_ibsp_v46.readLeaves(header.lumps[4], src);
            tree.leafFaces = bsp_parser_ibsp_v46.readLeafFaces(header.lumps[5], src);
            tree.leafBrushes = bsp_parser_ibsp_v46.readLeafBrushes(header.lumps[6], src);
            tree.brushes = bsp_parser_ibsp_v46.readBrushes(header.lumps[8], src);
            tree.brushSides = bsp_parser_ibsp_v46.readBrushSides(header.lumps[9], src);
            VisData visData = bsp_parser_ibsp_v46.readVisData(header.lumps[16], src);
            tree.visBuffer = visData.buffer;
            tree.visSize = visData.size;

            BspCompiler.visBuffer = visData.buffer;
            BspCompiler.visSize = visData.size;

            //tree.visData = visData;

            q3bsp.onMessage(new MessageParams()
            {
                type = "bsp",
                bsp = tree
            });
        }

        /// <summary>
        /// Read all lump headers
        /// </summary>
        private static bsp_header_t readHeader(BinaryStreamReader src)
        {
            bsp_header_lump_t lump;
            bsp_header_t header;

            // Read the magic number and the version
            header = new bsp_header_t();
            header.tag = src.ReadString(0, 4);
            header.version = src.ReadInt32(); //src.readULong();
            header.lumps = new List<bsp_header_lump_t>();

            header.company = "GoldSrc"; // GoldSrc doesnt have a magic number

            if (header.tag.StartsWith("I"))
            {
                header.company = "iD Software";
            }
            else if (header.tag.StartsWith("V"))
            {
                header.company = "Valve Software";
            }

            // Read the lump headers
            for (int i = 0; i < 17; ++i)
            {
                lump = new bsp_header_lump_t();

                //lump.offset = (ulong)src.ReadInt32();
                //lump.length = (ulong)src.ReadInt32();

                //lump.offset = src.ReadUInt64();
                //lump.length = src.ReadUInt64();

                //lump.offset = src.ReadUInt64();
                //lump.length = src.ReadUInt64();

                lump.offset = src.ReadUInt32();
                lump.length = src.ReadUInt32();

                header.lumps.Add(lump);
            }

            return header;
        }



        /// <summary>
        /// Read all entity structures
        /// </summary>
        private static void readEntities(bsp_header_lump_t lump, BinaryStreamReader src)
        {
            string entities;
            List<Q3Entity> elements;

            src.Seek(lump.offset);

            entities = src.ReadString(0, lump.length);

            // general entities parser and loader
            //TODO: note may need tools like md3 viewer to complete this.

            // info_player_deathmatch

            elements = new List<Q3Entity>();
            //elements.Add("targets", new Dictionary<string, Entity>());

            //elements.Add(new Q3Entity()
            //{
            //    name = "targets",
            //    Index = 0,
            //    entity = null
            //});


            Regex patt_match_elements = new Regex("\\{([^}]*)\\}*");
            Regex patt_match_entities = new Regex("\"(.+)\"* \"(.+)\"*"); // "(.+)" "(.+)"$mg
            Regex patt_match_origin_coord = new Regex("(.+) (.+) (.+)");
            MatchCollection matches;

            //TODO: complete the port of matching code below

            matches = patt_match_elements.Matches(entities);

            int id = 1;

            foreach (Match m in matches)
            {
                //var g1 = m.Groups[0].Captures[1]; // Groups([0, 1]);

                string g1 = m.Groups[0].Value;

                Q3Entity entity = new Q3Entity()
                {
                    name = "",
                    classname = "unknown"
                };

                MatchCollection ma0 = patt_match_entities.Matches(g1); //.groups([0])[0]).toList();


                for (int j = 0; j < ma0.Count; j++)
                {
                    Match m1 = ma0[j];

                    MatchCollection ma1 = patt_match_entities.Matches(m1.Groups[0].Value); //.groups([0])[0]).toList();
                    
                    /* Parse the key value tokens */
                    for (int i = 0; i < ma1.Count; i++)
                    {
                        Match m2 = ma1[i];

                        //string g0 = m2.Groups[1].Value; //([1, 2]);

                        string entity_key = m2.Groups[1].Value;
                        string entity_value = m2.Groups[2].Value;

                        entity_key = entity_key.StartsWith("\"") ? entity_key.Substring(1) : entity_key;
                        entity_key = entity_key.EndsWith("\"") ? entity_key.Substring(0, entity_key.Length - 1) : entity_key;
                        entity_value = entity_value.StartsWith("\"") ? entity_value.Substring(1) : entity_value;
                        entity_value = entity_value.EndsWith("\"") ? entity_value.Substring(0, entity_value.Length - 1) : entity_value;

                        switch (entity_key)
                        {
                            case "origin":
                                MatchCollection component_matches = patt_match_origin_coord.Matches(entity_value);

                                Match m_components = component_matches[0];
                                float x = float.Parse(m_components.Groups[1].Value);
                                float y = float.Parse(m_components.Groups[2].Value);
                                float z = float.Parse(m_components.Groups[3].Value);

                                Vector3 origin = new Vector3(x, y, z);

                                entity.Fields[entity_key] = origin;

                                //patt_match_origin_coord.allMatches(entity_value).forEach((Match m) => {
                                //    var coord = m.groups([1, 2, 3]);
                                //    entity[entity_key] = [double.Parse(coord[0]), double.Parse(coord[1]), double.Parse(coord[2])];
                                //});

                                break;
                          case "angle":
                                double angle = double.Parse(entity_value);

                                entity.Fields[entity_key] = angle;

                                //entity[entity_key] = double.Parse(entity_value);
                                break;
                          default:
                                //entity[entity_key] = entity_value;
                                entity.Fields[entity_key] = entity_value;

                                switch (entity_key)
                                {
                                    case "targetname":
                                        entity.targetname = entity_value;
                                        break;
                                    case "classname":
                                        entity.classname = entity_value;
                                        break;
                                    case "name":
                                        entity.name = entity_value;
                                        break;
                                }

                                break;
                        }
                    }
        
                    if (entity.targetname != null)
                    {
                        //elements.Add(new Q3Entity()
                        //{
                        //    classname = "targets",
                        //    targetname = entity.targetname;
                        //});

                        //Dictionary<string, Entity> targets = (Dictionary<string, Entity>)elements["targets"];
                        //targets[entity.targetname] = entity;
                        //elements["targets"] = targets;

                        //elements[0] = new Q3Entity()
                        //{
                        //    entity = entity,
                        //    Index = id,
                        //    name = entity.targetname
                        //}; // targets

                        //elements.Add(new Q3Entity()
                        //{
                        //    Index = id,

                        //    entity = entity.entity,
                        //    name = entity.targetname
                        //});

                    }
                    //if (elements[entity.classname] == null)
                    //{
                    //    elements[entity.classname] = null;
                    //}

                    elements.Add(entity);

                    //elements[entity.classname] = entity;

                    id++;
                }
            }

            // Send the entity data back to the render thread

            q3bsp.onMessage(new MessageParams()
            {
                type = "entities",
                entities = elements,
            });
        }

        /// <summary>
        /// Read all shader structures
        /// </summary>
        private static List<shader_p> readShaders(bsp_header_lump_t lump, BinaryStreamReader src)
        {
            int count = (int)lump.length / 72;
            List<shader_p> elements = new List<shader_p>();
            shader_p shader;

            src.Seek(lump.offset);

            for (var i = 0; i < count; ++i)
            {
                shader = new shader_p();
                shader.shaderName = src.ReadString(0, 64);
                shader.flags = src.ReadInt32(); // ReadInt64
                shader.contents = src.ReadInt32();
                shader.shader = null;
                shader.faces = new List<Face>();
                shader.indexOffset = 0;
                shader.elementCount = 0;
                shader.visible = true;

                elements.Add(shader);
            }

            return elements;
        }


        /// <summary>
        /// Read all lightmaps
        /// </summary>
        private static List<lightmap_rect_t> readLightmaps(bsp_header_lump_t lump, BinaryStreamReader src)
        {
            int lightmapSize = 128 * 128;
            int count = (int)lump.length / (lightmapSize * 3);

            var gridSize = 2;

            while (gridSize * gridSize < count)
            {
                gridSize *= 2;
            }

            var textureSize = gridSize * 128;

            int xOffset = 0;
            int yOffset = 0;

            List<lightmap_t> lightmaps = new List<lightmap_t>();
            List<lightmap_rect_t> lightmapRects = new List<lightmap_rect_t>();
            Vector3 rgb = Vector3.Zero;
            
            src.Seek(lump.offset);
            for (int i = 0; i < count; ++i)
            {
                byte[] elements = new byte[lightmapSize * 4];

                for (int j = 0; j < lightmapSize * 4; j += 4)
                {
                    rgb.X = src.ReadUByte();
                    rgb.Y = src.ReadUByte();
                    rgb.Z = src.ReadUByte();

                    rgb = BspHelpers.brightnessAdjust(rgb, 4.0f);

                    elements[j] = (byte)rgb.X;
                    elements[j + 1] = (byte)rgb.Y;
                    elements[j + 2] = (byte)rgb.Z;
                    elements[j + 3] = 255;
                }

                lightmap_t l = new lightmap_t();
                l.x = xOffset;
                l.y = yOffset;
                l.width = 128;
                l.height = 128;
                l.bytes = elements;
                lightmaps.Add(l);

                lightmap_rect_t r = new lightmap_rect_t();
                r.x = (float)xOffset / (float)textureSize;
                r.y = (float)yOffset / (float)textureSize;
                r.xScale = 128f / (float)textureSize;
                r.yScale = 128f / (float)textureSize;
                lightmapRects.Add(r);

                xOffset += 128;

                if (xOffset >= textureSize)
                {
                    yOffset += 128;
                    xOffset = 0;
                }
            }

            // Send the lightmap data back to the render thread
            q3bsp.onMessage(new MessageParams()
            {
                type = "lightmap",
                size = textureSize,
                lightmaps = lightmaps
            });

            return lightmapRects;
        }



        private static List<Vertex> readVerts(bsp_header_lump_t lump, BinaryStreamReader src)
        {
            int count = (int)lump.length / 44;
            List<Vertex> elements = new List<Vertex>();

            src.Seek(lump.offset);
            for (int i = 0; i < count; ++i)
            {

                elements.Add(new Vertex()
                {
                    pos = new Vector3(src.ReadFloat(), src.ReadFloat(), src.ReadFloat()),
                    texCoord = new Vector2(src.ReadFloat(), src.ReadFloat()),
                    lmCoord = new Vector2(src.ReadFloat(), src.ReadFloat()),
                    lmNewCoord = new Vector2(0.0f, 0.0f),
                    normal = new Vector3(src.ReadFloat(), src.ReadFloat(), src.ReadFloat()),
                    color = BspHelpers.brightnessAdjustVertex(BspHelpers.colorToVec(src.ReadUInt32()), 4.0f) // ReadUInt64
                });
            }

            return elements;
        }

        private static List<int> readMeshVerts(bsp_header_lump_t lump, BinaryStreamReader src)
        {
            int count = (int)lump.length / 4;
            List<int> meshVerts = new List<int>();

            src.Seek(lump.offset);
            for (int i = 0; i < count; ++i)
            {
                meshVerts.Add(src.ReadInt32()); // ReadInt64
            }

            return meshVerts;
        }




        /// <summary>
        /// Read all face structures
        /// </summary>
        private static List<Face> readFaces(bsp_header_lump_t lump, BinaryStreamReader src)
        {
            int faceCount = (int)lump.length / 104;
            List<Face> faces = new List<Face>();
            Face face;

            src.Seek(lump.offset);

            for (var i = 0; i < faceCount; ++i)
            {
                face = new Face()
                {
                    shader = src.ReadInt32(),
                    effect = src.ReadInt32(),
                    type = src.ReadInt32(),
                    vertex = src.ReadInt32(),
                    vertCount = src.ReadInt32(),
                    meshVert = src.ReadInt32(),
                    meshVertCount = src.ReadInt32(),
                    lightmap = src.ReadInt32(), // ReadInt64
                    lmStart = new vector2_int64_t(src.ReadInt32(), src.ReadInt32()),
                    lmSize = new vector2_int64_t(src.ReadInt32(), src.ReadInt32()),
                    lmOrigin = new Vector3(src.ReadFloat(), src.ReadFloat(), src.ReadFloat()),
                    lmVecs = new Vector3[] { new Vector3(src.ReadFloat(), src.ReadFloat(), src.ReadFloat()),
                                     new Vector3(src.ReadFloat(), src.ReadFloat(), src.ReadFloat()) },
                    normal = new Vector3(src.ReadFloat(), src.ReadFloat(), src.ReadFloat()),
                    size = new vector2_int64_t(src.ReadInt32(), src.ReadInt32()),
                    indexOffset = -1
                };

                faces.Add(face);
            }

            return faces;
        }

        /// <summary>
        /// Read all Plane structures
        /// </summary>
        private static List<Plane> readPlanes(bsp_header_lump_t lump, BinaryStreamReader src)
        {
            int count = (int)lump.length / 16;
            List<Plane> elements = new List<Plane>();

            src.Seek(lump.offset);
            for (int i = 0; i < count; ++i)
            {
                Plane p = new Plane();

                p.normal = new Vector3(src.ReadFloat(), src.ReadFloat(), src.ReadFloat());
                p.distance = src.ReadFloat();

                elements.Add(p);
            }

            return elements;
        }

        /// <summary>
        /// Read all Node structures
        /// </summary>
        private static List<bsp_tree_node> readNodes(bsp_header_lump_t lump, BinaryStreamReader src)
        {
            int count = (int)lump.length / 36;
            List<bsp_tree_node> elements = new List<bsp_tree_node>();
            bsp_tree_node node;

            src.Seek(lump.offset);

            for (int i = 0; i < count; ++i)
            {
                node = new bsp_tree_node();
                node.plane = src.ReadInt32(); // ReadInt64
                node.children = new long[] { src.ReadInt32(), src.ReadInt32() };
                node.min = new long[] { src.ReadInt32(), src.ReadInt32(), src.ReadInt32() };
                node.max = new long[] { src.ReadInt32(), src.ReadInt32(), src.ReadInt32() };
                elements.Add(node);
            }

            return elements;
        }


        /// <summary>
        /// Read all Leaf structures
        /// </summary>
        private static List<Leaf> readLeaves(bsp_header_lump_t lump, BinaryStreamReader src)
        {
            int count = (int)lump.length / 48;
            List<Leaf> elements = new List<Leaf>();
            Leaf leave;

            src.Seek(lump.offset);
            for (int i = 0; i < count; ++i)
            {
                leave = new Leaf()
                {
                    cluster = src.ReadInt32(),
                    area = src.ReadInt32(),
                    min = new int[] { src.ReadInt32(), src.ReadInt32(), src.ReadInt32() }, // ReadInt64
                    max = new int[] { src.ReadInt32(), src.ReadInt32(), src.ReadInt32() },
                    leafFace = src.ReadInt32(),
                    leafFaceCount = src.ReadInt32(),
                    leafBrush = src.ReadInt32(),
                    leafBrushCount = src.ReadInt32()
                };

                elements.Add(leave);
            }

            return elements;
        }

        /// <summary>
        /// Read all Leaf Faces
        /// </summary>
        private static List<long> readLeafFaces(bsp_header_lump_t lump, BinaryStreamReader src)
        {
            int count = (int)lump.length / 4;
            List<long> elements = new List<long>();

            src.Seek(lump.offset);
            for (int i = 0; i < count; ++i)
            {
                elements.Add(src.ReadInt32()); // ReadInt64
            }

            return elements;
        }



        /// <summary>
        /// Read all Brushes
        /// </summary>
        private static List<Brush> readBrushes(bsp_header_lump_t lump, BinaryStreamReader src)
        {
            int count = (int)lump.length / 12;
            List<Brush> elements = new List<Brush>();

            src.Seek(lump.offset);

            for (int i = 0; i < count; ++i)
            {
                elements.Add(new Brush()
                {
                    brushSide = src.ReadInt32(),
                    brushSideCount = src.ReadInt32(), // ReadInt64
                    shader = src.ReadInt32()
                });
            }

            return elements;
        }

        /// <summary>
        /// Read all Leaf Brushes
        /// </summary>
        private static List<long> readLeafBrushes(bsp_header_lump_t lump, BinaryStreamReader src)
        {
            int count = (int)lump.length / 4;
            List<long> elements = new List<long>();

            src.Seek(lump.offset);

            for (int i = 0; i < count; ++i)
            {
                elements.Add(src.ReadInt32()); // ReadInt64
            }

            return elements;
        }


        /// <summary>
        /// Read all Brush Sides
        /// </summary>
        private static List<BrushSide> readBrushSides(bsp_header_lump_t lump, BinaryStreamReader src)
        {
            int count = (int)lump.length / 8;
            List<BrushSide> elements = new List<BrushSide>();

            src.Seek(lump.offset);

            for (int i = 0; i < count; ++i)
            {
                elements.Add(new BrushSide()
                {
                    plane = src.ReadInt32(), // ReadInt64
                    shader = src.ReadInt32()
                });
            }

            return elements;
        }


        /// <summary>
        /// Read all Vis Data
        /// </summary>
        private static VisData readVisData(bsp_header_lump_t lump, BinaryStreamReader src)
        {
            src.Seek(lump.offset);
            int vecCount = src.ReadInt32(); // ReadInt64
            int size = src.ReadInt32();

            int byteCount = vecCount * size;
            byte[] elements = new byte[byteCount];

            for (int i = 0; i < byteCount; ++i)
            {
                elements[i] = src.ReadUByte();
            }

            return new VisData()
            {
                buffer = elements,
                size = size
            };
        }


    }
}