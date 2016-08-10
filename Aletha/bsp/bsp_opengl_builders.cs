using Aletha.bsp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OpenTK;
using OpenTK.Graphics.OpenGL;

namespace Aletha
{

    public class bsp_opengl_builders
    {
        public static void buildBuffers(float[] vertices, int[] indices)
        {
            // Float32List
            // Uint16List
            //Float32List verts = new Float32List(vertices.length);
            //verts.setAll(0, vertices);

            int[] ind = indices.ToArray();

            GL.GenBuffers(1, out q3bsp.vertexBuffer);
            GL.GenBuffers(1, out q3bsp.indexBuffer);

            GL.BindBuffer(BufferTarget.ArrayBuffer, q3bsp.vertexBuffer);
            GL.BufferData(BufferTarget.ArrayBuffer, (IntPtr)(vertices.Length * sizeof(float)), vertices, BufferUsageHint.StaticDraw);

            GL.BindBuffer(BufferTarget.ElementArrayBuffer, q3bsp.indexBuffer);
            GL.BufferData(BufferTarget.ElementArrayBuffer, (IntPtr)(ind.Length * sizeof(int)), ind, BufferUsageHint.StaticDraw);

            q3bsp.indexCount = indices.Length;
        }

        public static void buildLightmaps(int size, List<lightmap_t> lightmaps)
        {
            GL.BindTexture(TextureTarget.Texture2D, q3bsp.lightmap);

            //gl.texImage2D(RenderingContext.TEXTURE_2D, 0, RenderingContext.RGBA, size, size, 0, RenderingContext.RGBA, RenderingContext.UNSIGNED_BYTE);
            GL.TexImage2D(TextureTarget.Texture2D, 0, PixelInternalFormat.Rgba, size, size, 0, PixelFormat.Rgba, PixelType.UnsignedByte, IntPtr.Zero);
            GL.TexParameter(TextureTarget.Texture2D, TextureParameterName.TextureMagFilter, (int)TextureMagFilter.Linear);
            GL.TexParameter(TextureTarget.Texture2D, TextureParameterName.TextureMinFilter, (int)TextureMinFilter.LinearMipmapLinear);

            for (int i = 0; i < lightmaps.Count; ++i)
            {
                byte[] lightmap_bytes = lightmaps[i].bytes;

                GL.TexSubImage2D(TextureTarget.Texture2D,
                    0,
                    (int)lightmaps[i].x,
                    (int)lightmaps[i].y,
                    (int)lightmaps[i].width,
                    (int)lightmaps[i].height,
                    PixelFormat.Rgba,
                    PixelType.UnsignedByte, 
                    lightmap_bytes); // UNSIGNED_BYTE
            }

            GL.GenerateMipmap(GenerateMipmapTarget.Texture2D);

            GL.BindTexture(TextureTarget.Texture2D, 0);

            q3bsp.glshading.init();
        }

        public static void buildShaders(List<shader_t> shaders)
        {
            q3bsp.shaders = new Dictionary<string, shader_gl>();

            for (var i = 0; i < shaders.Count; ++i)
            {
                shader_t shader = shaders[i];

                if (shader == null) continue;

                shader_gl glShader = q3bsp.glshading.build(shader, null);

                String shader_name = shader.name;

                q3bsp.shaders[shader_name] = glShader;
            }
        }
    }
}
