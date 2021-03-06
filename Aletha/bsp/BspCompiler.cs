using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Linq;

namespace Aletha.bsp
{
	public delegate void OnLoadError();

	public class BspCompiler
	{
		public static int lastLeaf = -1;

        public static List<Leaf> leaves;
        public static List<Plane> planes;
        public static List<bsp_tree_node> nodes;
        public static List<Face> faces;
        public static List<Brush> brushes;
        public static List<BrushSide> brushSides;
        public static List<long> leafFaces, leafBrushes;
        public static List<shader_p> shaders; // This needs to be kept here for collision detection (indicates non-solid surfaces)



		public static void OnMessage(MessageParams msg) 
		{  
			switch(msg.type) 
			{
				case "load":
				    String url = msg.url;
				    int tessLevel = msg.tesselationLevel;

                    BspCompiler.Load(url, tessLevel, () => {
                        // Fallback to account for Opera handling URLs in a worker 
                        // differently than other browsers. 
                        BspCompiler.Load("../" + url, tessLevel,null);
				    });
				break;

				case "loadShaders":
				    ShaderParser.loadList(msg.sources,null);
				break;

				case "trace":
				    BspCollisionDetection.trace(msg.traceId, msg.start, msg.end, msg.radius, msg.slide);
				break;

				case "visibility":
				    BspVisibilityChecking.buildVisibleList(BspVisibilityChecking.getLeaf(msg.pos));
				break;

				default:
                    throw new Exception("Unexpected message type: " + msg.data);
				//print ;
			}
		}

		public static void Load (string mapURL, int tesselationLevel, OnLoadError errorCallback)
		{
            byte[] data;
            MemoryStream ms;
            string file;

            if (tesselationLevel <= 0)
            {
                tesselationLevel = 5;
            }

            file = Config.q3bsp_base_folder + mapURL;

            data = System.IO.File.ReadAllBytes(file);
            ms = new MemoryStream(data);
            ms.Position = 0;

            AlethaApplication.incReqests();
            AlethaApplication.update_progress_bar(AlethaApplication.request_number, mapURL);

            q3bsp.onMessage(new MessageParams()
            {
                type = "status",
                message = "Map downloaded, parsing level geometry..."
            });


            bsp_parser_ibsp_v46.Parse(new BinaryStreamReader(ms), tesselationLevel, (bsp_header_t header) => {

                q3bsp.onMessage(new MessageParams()
                {
                    type = "status",
                    message = "Incompatible BSP version. " + header.company + " " + header.tag + " V." + header.version.ToString()
                });
                
            });
        }

        /// <summary>
        /// Compile the map into a stream of OpenGL-compatible data
        /// </summary>
        public static void CompileMap   ( List<Vertex> verts, 
		                     List<Face> faces, 
		                     List<int> meshVerts, 
		                     List<lightmap_rect_t> lightmaps, 
		                     List<shader_p> shaders, 
		                     int tesselationLevel ) 
		{
            Vertex vert;

            BspCompiler.faces = faces;

            q3bsp.onMessage( new MessageParams(){
                type = "status",
            	message = "Map geometry parsed, compiling shaders..."
            });

            // Find associated shaders for all clusters

            // Per-face operations
            for (int i = 0; i < faces.Count; ++i) 
			{
				Face face = faces[i];

				if(face.type == 1 || face.type == 2 || face.type == 3) 
				{
					// Add face to the appropriate texture face list
					shader_p shader = shaders[(int)face.shader];
					shader.faces.Add(face);
					lightmap_rect_t lightmap = face.lightmap > 0 ? lightmaps[(int)face.lightmap] : null;

					if(lightmap == null) 
					{
						lightmap = lightmaps[0];
					}

					if(face.type == 1 || face.type == 3) 
					{
						shader.geomType = face.type;
						// Transform lightmap coords to match position in combined texture
						for(int j = 0; j < face.meshVertCount; ++j) 
						{
							vert = verts[(int)face.vertex + (int)meshVerts[(int)face.meshVert + j]];

							vert.lmNewCoord.X = (vert.lmCoord.X * lightmap.xScale) + lightmap.x;
							vert.lmNewCoord.Y = (vert.lmCoord.Y * lightmap.yScale) + lightmap.y;
						}
					} 
					else 
					{
                        q3bsp.onMessage(new MessageParams() {
                            type = "status",
							message = "Tesselating face " + i.ToString() + " of " + faces.Count.ToString()

                        });

                        // Build Bezier curve
                        BspTess.Tesselate(face, verts, meshVerts, tesselationLevel);

						for(int j = 0; j < face.vertCount; ++j) 
						{
							vert = verts[(int)face.vertex + j];

							vert.lmNewCoord.X = (vert.lmCoord.X * lightmap.xScale) + lightmap.x;
							vert.lmNewCoord.Y = (vert.lmCoord.Y * lightmap.yScale) + lightmap.y;
						}
					}
				}
			}

            // Compile vert list INTERLEAVE
            float[] vertices;

            vertices = Interleave(verts);


            // Compile index list
            List<ushort> lst_indices = new List<ushort>();

			for(int i = 0; i <  shaders.Count; ++i) 
			{
				shader_p shader = shaders[i];

				if(shader.faces.Count > 0) 
				{
					shader.indexOffset = lst_indices.Count * 2; // Offset is in bytes

					for(int j = 0; j < shader.faces.Count; ++j) 
					{
						Face face = shader.faces[j];
						face.indexOffset = lst_indices.Count * 2;

						for(int k = 0; k < face.meshVertCount; ++k) 
						{
							lst_indices.Add((ushort)(face.vertex + meshVerts[face.meshVert + k]));
						}
						shader.elementCount += (int)face.meshVertCount;
					}
				}
				shader.faces = null; // Don't need to send this to the render thread.
			}

            ushort[] indices = lst_indices.ToArray();


            // Send the compiled vertex/index data back to the render thread
            q3bsp.onMessage( new MessageParams()
            {
                type = "geometry",
				vertices = vertices,
				indices = indices,
				surfaces = shaders

            });
        }

        /// <summary>
        /// Interleave the vertices into a float array
        /// </summary>
        private static float[] Interleave(List<Vertex> verticies)
        {
            Vertex vert;
            float[] vertices;
            int offset;

            vertices = new float[verticies.Count * 14]; ;
            offset = 0;

            for (int i = 0; i < verticies.Count; ++i)
            {
                vert = verticies[i];

                vertices[offset++] = vert.pos.X;
                vertices[offset++] = vert.pos.Y;
                vertices[offset++] = vert.pos.Z;

                vertices[offset++] = vert.texCoord.X;
                vertices[offset++] = vert.texCoord.Y;

                vertices[offset++] = vert.lmNewCoord.X;
                vertices[offset++] = vert.lmNewCoord.Y;

                vertices[offset++] = vert.normal.X;
                vertices[offset++] = vert.normal.Y;
                vertices[offset++] = vert.normal.Z;

                vertices[offset++] = vert.color.X;
                vertices[offset++] = vert.color.Y;
                vertices[offset++] = vert.color.Z;
                vertices[offset++] = vert.color.W;
            }

            return vertices;
        }
	}
}