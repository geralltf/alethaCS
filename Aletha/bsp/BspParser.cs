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
        public static void parse(binary_stream src, int tesselationLevel, OnBspIncompatible onIncompatible)
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
            1           Textures          Surface descriptions.
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
            List<long> meshVerts = bsp_parser_ibsp_v46.readMeshVerts(header.lumps[11], src);
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
        public static bsp_header_t readHeader(binary_stream src)
        {
            // Read the magic number and the version
            bsp_header_t header = new bsp_header_t();
            header.tag = src.readString(0, 4);
            header.version = src.readULong();
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
            for (var i = 0; i < 17; ++i)
            {
                bsp_header_lump_t lump = new bsp_header_lump_t();
                lump.offset = src.readULong();
                lump.length = src.readULong();
                header.lumps.Add(lump);
            }

            return header;
        }



        /// <summary>
        /// Read all entity structures
        /// </summary>
        public static void readEntities(bsp_header_lump_t lump, binary_stream src)
        {
            src.seek(lump.offset);
            String entities = src.readString(0, lump.length);

            // general entities parser and loader
            //TODO: note may need tools like md3 viewer to complete this.

            // info_player_deathmatch

            List<Q3Entity> elements = new List<Q3Entity>();
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
        public static List<shader_p> readShaders(bsp_header_lump_t lump, binary_stream src)
        {
            int count = (int)lump.length / 72;
            List<shader_p> elements = new List<shader_p>();
            shader_p shader;

            src.seek(lump.offset);

            for (var i = 0; i < count; ++i)
            {
                shader = new shader_p();
                shader.shaderName = src.readString(0, 64);
                shader.flags = src.readLong();
                shader.contents = src.readLong();
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
        public static List<lightmap_rect_t> readLightmaps(bsp_header_lump_t lump, binary_stream src)
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
            byte[] rgb = new byte[] { 0, 0, 0 };

            src.seek(lump.offset);
            for (var i = 0; i < count; ++i)
            {
                byte[] elements = new byte[lightmapSize * 4];
                for (var j = 0; j < lightmapSize * 4; j += 4)
                {
                    rgb[0] = src.readUByte();
                    rgb[1] = src.readUByte();
                    rgb[2] = src.readUByte();

                    rgb = BspHelpers.brightnessAdjust(rgb, 4.0f);

                    elements[j] = rgb[0];
                    elements[j + 1] = rgb[1];
                    elements[j + 2] = rgb[2];
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
                r.x = xOffset / textureSize;
                r.y = yOffset / textureSize;
                r.xScale = 128 / textureSize;
                r.yScale = 128 / textureSize;
                lightmapRects.Add(r);

                xOffset += 128;
                if (xOffset >= textureSize)
                {
                    yOffset += 128;
                    xOffset = 0;
                }
            }

            // Send the lightmap data back to the render thread
            //postMessage2({
            //    "type": 'lightmap',
            //   "size": textureSize,
            //   "lightmaps": lightmaps
            //},null);

            return lightmapRects;
        }



        public static List<Vertex> readVerts(bsp_header_lump_t lump, binary_stream src)
        {
            int count = (int)lump.length / 44;
            List<Vertex> elements = new List<Vertex>();

            src.seek(lump.offset);
            for (var i = 0; i < count; ++i)
            {

                elements.Add(new Vertex()
                {
                    pos = new Vector3(src.readFloat(), src.readFloat(), src.readFloat()),
                    texCoord = new Vector2(src.readFloat(), src.readFloat()),
                    lmCoord = new Vector2(src.readFloat(), src.readFloat()),
                    lmNewCoord = new Vector2(0.0f, 0.0f),
                    normal = new Vector3(src.readFloat(), src.readFloat(), src.readFloat()),
                    color = BspHelpers.brightnessAdjustVertex(BspHelpers.colorToVec(src.readULong()), 4.0f)
                });
            }

            return elements;
        }

        public static List<long> readMeshVerts(bsp_header_lump_t lump, binary_stream src)
        {
            int count = (int)lump.length / 4;
            List<long> meshVerts = new List<long>();

            src.seek(lump.offset);
            for (var i = 0; i < count; ++i)
            {
                meshVerts.Add(src.readLong());
            }

            return meshVerts;
        }




        /// <summary>
        /// Read all face structures
        /// </summary>
        public static List<Face> readFaces(bsp_header_lump_t lump, binary_stream src)
        {
            int faceCount = (int)lump.length / 104;
            List<Face> faces = new List<Face>();
            Face face;

            src.seek(lump.offset);

            for (var i = 0; i < faceCount; ++i)
            {
                face = new Face()
                {
                    shader = src.readLong(),
                    effect = src.readLong(),
                    type = src.readLong(),
                    vertex = src.readLong(),
                    vertCount = src.readLong(),
                    meshVert = src.readLong(),
                    meshVertCount = src.readLong(),
                    lightmap = src.readLong(),
                    lmStart = new vector2_int64_t(src.readLong(), src.readLong()),
                    lmSize = new vector2_int64_t(src.readLong(), src.readLong()),
                    lmOrigin = new Vector3(src.readFloat(), src.readFloat(), src.readFloat()),
                    lmVecs = new Vector3[] { new Vector3(src.readFloat(), src.readFloat(), src.readFloat()),
                                     new Vector3(src.readFloat(), src.readFloat(), src.readFloat()) },
                    normal = new Vector3(src.readFloat(), src.readFloat(), src.readFloat()),
                    size = new vector2_int64_t(src.readLong(), src.readLong()),
                    indexOffset = -1
                };

                faces.Add(face);
            }

            return faces;
        }

        /// <summary>
        /// Read all Plane structures
        /// </summary>
        public static List<Plane> readPlanes(bsp_header_lump_t lump, binary_stream src)
        {
            int count = (int)lump.length / 16;
            List<Plane> elements = new List<Plane>();

            src.seek(lump.offset);
            for (var i = 0; i < count; ++i)
            {
                Plane p = new Plane();

                p.normal = new Vector3(src.readFloat(), src.readFloat(), src.readFloat());
                p.distance = src.readFloat();

                elements.Add(p);
            }

            return elements;
        }

        /// <summary>
        /// Read all Node structures
        /// </summary>
        public static List<bsp_tree_node> readNodes(bsp_header_lump_t lump, binary_stream src)
        {
            int count = (int)lump.length / 36;
            List<bsp_tree_node> elements = new List<bsp_tree_node>();
            bsp_tree_node node;

            src.seek(lump.offset);

            for (var i = 0; i < count; ++i)
            {
                node = new bsp_tree_node();
                node.plane = src.readLong();
                node.children = new long[] { src.readLong(), src.readLong() };
                node.min = new long[] { src.readLong(), src.readLong(), src.readLong() };
                node.max = new long[] { src.readLong(), src.readLong(), src.readLong() };
                elements.Add(node);
            }

            return elements;
        }


        /// <summary>
        /// Read all Leaf structures
        /// </summary>
        public static List<Leaf> readLeaves(bsp_header_lump_t lump, binary_stream src)
        {
            int count = (int)lump.length / 48;
            List<Leaf> elements = new List<Leaf>();
            Leaf leave;

            src.seek(lump.offset);
            for (var i = 0; i < count; ++i)
            {
                leave = new Leaf()
                {
                    cluster = src.readLong(),
                    area = src.readLong(),
                    min = new long[] { src.readLong(), src.readLong(), src.readLong() },
                    max = new long[] { src.readLong(), src.readLong(), src.readLong() },
                    leafFace = src.readLong(),
                    leafFaceCount = src.readLong(),
                    leafBrush = src.readLong(),
                    leafBrushCount = src.readLong()
                };

                elements.Add(leave);
            }

            return elements;
        }

        /// <summary>
        /// Read all Leaf Faces
        /// </summary>
        public static List<long> readLeafFaces(bsp_header_lump_t lump, binary_stream src)
        {
            int count = (int)lump.length / 4;
            List<long> elements = new List<long>();

            src.seek(lump.offset);
            for (var i = 0; i < count; ++i)
            {
                elements.Add(src.readLong());
            }

            return elements;
        }



        /// <summary>
        /// Read all Brushes
        /// </summary>
        public static List<Brush> readBrushes(bsp_header_lump_t lump, binary_stream src)
        {
            int count = (int)lump.length / 12;
            List<Brush> elements = new List<Brush>();

            src.seek(lump.offset);

            for (var i = 0; i < count; ++i)
            {
                elements.Add(new Brush()
                {
                    brushSide = src.readLong(),
                    brushSideCount = src.readLong(),
                    shader = src.readLong()
                });
            }

            return elements;
        }

        /// <summary>
        /// Read all Leaf Brushes
        /// </summary>
        public static List<long> readLeafBrushes(bsp_header_lump_t lump, binary_stream src)
        {
            int count = (int)lump.length / 4;
            List<long> elements = new List<long>();

            src.seek(lump.offset);

            for (var i = 0; i < count; ++i)
            {
                elements.Add(src.readLong());
            }

            return elements;
        }


        /// <summary>
        /// Read all Brush Sides
        /// </summary>
        public static List<BrushSide> readBrushSides(bsp_header_lump_t lump, binary_stream src)
        {
            int count = (int)lump.length / 8;
            List<BrushSide> elements = new List<BrushSide>();

            src.seek(lump.offset);

            for (var i = 0; i < count; ++i)
            {
                elements.Add(new BrushSide()
                {
                    plane = src.readLong(),
                    shader = src.readLong()
                });
            }

            return elements;
        }


        /// <summary>
        /// Read all Vis Data
        /// </summary>
        public static VisData readVisData(bsp_header_lump_t lump, binary_stream src)
        {
            src.seek(lump.offset);
            long vecCount = src.readLong();
            long size = src.readLong();

            long byteCount = vecCount * size;
            ushort[] elements = new ushort[byteCount];

            for (var i = 0; i < byteCount; ++i)
            {
                elements[i] = src.readUByte();
            }

            return new VisData()
            {
                buffer = elements,
                size = size
            };
        }


    }
}