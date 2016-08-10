using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Aletha.bsp;
using OpenTK;
using OpenTK.Graphics.OpenGL;

namespace Aletha
{
    public enum skybox_type
    {
        six_tex,
        one_tex
    }



    public class skybox
    {
        private skybox_type type;
        private cubemap map;
        private int skymap;

        static int skyboxBuffer = -1;
        static int skyboxIndexBuffer = -1;
        static int skyboxIndexCount = 0;
        static Matrix4 skyboxMat;
        static shader_gl skyShader;
        //static bool has_skyparams;

        public String skybox_env_url = Config.q3bsp_base_folder + "/env/" + Config.mapName + "/";

        public skybox()
        {
            //skyboxBuffer = null;
            //skyboxIndexBuffer = null;
            //skyboxIndexCount = 0;
            skyboxMat = Matrix4.Identity;
            map = null;
        }

        public static void loadSkyTexture(shader_gl shader,
                                   shader_p surface,
                                   OnTextueLoad onTextureLoading,
                                   OnTextueLoad onTextureLoadComplete)
        {
            bool has_skyparams = shader.sky_env_map != null;



            if (has_skyparams)
            {
                // hard code in six or one texture mode for now

                String url = Config.q3bsp_base_folder + "/" + shader.sky_env_map.@params;
                String back_url = url + "_bk.jpg";
                String down_url = url + "_dn.jpg";
                String front_url = url + "_ft.jpg";
                String left_url = url + "_lf.jpg";
                String right_url = url + "_rt.jpg";
                String up_url = url + "_up.jpg";

                cubemap_texture_six.load(back_url,
                                         down_url,
                                         front_url,
                                         left_url,
                                         right_url,
                                         up_url,
                (int texture) =>
                {
                    onTextureLoading(texture);
                },
                (int texture) =>
                {
                    onTextureLoadComplete(texture);
                });



                //TODO: support for single texture mode using something like this. need to find test map.

                //      cubemap_texture_one.load(back_url, gl, 
                //      (GLTexture texture)
                //      {
                //        onTextureLoading(texture);
                //      }, 
                //      (GLTexture texture)
                //      {
                //        onTextureLoadComplete(texture);
                //      });

                //cubemap_texture_one.load(q3bsp_base_folder + '/' + stage.map, gl, null, onTextureLoadComplete);
            }
            else
            {
                //UNTESTED condition
            }
        }

        public static skybox loadFromShader(shader_p surface, shader_gl shader)
        {
            skybox sky = new skybox();

            // determine type of skybox: number of textures to load

            sky.type = skybox_type.one_tex;


            buildSkyboxbuffers();


            loadSkyTexture(shader, surface, (int texture) =>
            {
                sky.skymap = texture;
            },
            (int texture) =>
            {
                sky.skymap = texture;

                //gl.generateMipmap(RenderingContext.TEXTURE_CUBE_MAP);
            });

            return sky;
        }



        public void bindSkyTexture(stage_gl stage, shader_prog_t program, float time)
        {
            
            //map.render();

            //    if(type == skybox_type.one_tex)
            //    {
            //if(skymap == null) { skymap = q3bsp.glshading.defaultTexture; }

            GL.ActiveTexture(TextureUnit.Texture0);
            GL.Uniform1(program.uniform["texture"], 0);
            GL.BindTexture(TextureTarget.TextureCubeMap, skymap);


            //    }
            //    else if(type == skybox_type.six_tex)
            //    {
            //      
            //    }
        }

        public void bindSkySingleTexture(float time)
        {
            //shader_gl shader =  q3bsp.shaders[skyShader.name];

            //if(skymap == null) { skymap = q3bsp.glshading.defaultTexture; }

            GL.ActiveTexture(TextureUnit.Texture0);
            //gl.uniform1i(program.uniform['texture'], 0);
            GL.BindTexture(TextureTarget.TextureCubeMap, skymap);
        }

        public void render(float time, Viewport leftViewport, Matrix4 leftViewMat, Matrix4 leftProjMat)
        {
            //q3bsp.skybox_env.bindSkyTexture(gl, stage, program, time);

            // Loop through all shaders, drawing all surfaces associated with them
            if (q3bsp.surfaces.Count > 0)
            {

                shader_gl shader = skyShader == null ? q3bsp.glshading.defaultShader : skyShader;

                // If we have a skybox, render it first
                if (shader != null && skyboxIndexBuffer != -1 && skyboxBuffer != -1)
                {
                    //bindSkySingleTexture(gl,time);


                    // SkyBox Buffers
                    GL.BindBuffer(BufferTarget.ElementArrayBuffer, skyboxIndexBuffer);
                    GL.BindBuffer(BufferTarget.ArrayBuffer, skyboxBuffer);

                    // Render Skybox
                    if (q3bsp.glshading.setShader(shader))
                    {
                        stage_gl stage;
                        shader_prog_t shaderProgram;

                        for (int j = 0; j < shader.stages.Count; ++j)
                        {
                            stage = shader.stages[j];

                            shaderProgram = q3bsp.glshading.setShaderStage(shader, stage, time);

                            if (shaderProgram == null) { continue; }

                            skybox.bindSkyAttribs(shaderProgram);

                            // Draw Sky geometry
                            skybox.bindSkyMatrix(shaderProgram, leftViewMat, leftProjMat);
                            q3bsp.setViewport(leftViewport);

                            //GL.DrawElements(RenderingContext.TRIANGLES, skyboxIndexCount, RenderingContext.UNSIGNED_SHORT, 0);
                            GL.DrawElements(BeginMode.Triangles, skyboxIndexCount, DrawElementsType.UnsignedInt, 0);

                            //                  if (rightViewMat != null) {
                            //                    skybox.bindSkyMatrix(shaderProgram, rightViewMat, rightProjMat);
                            //                    q3bsp.setViewport(rightViewport);
                            //                      
                            //                      gl.drawElements(RenderingContext.TRIANGLES, 
                            //                          skyboxIndexCount, 
                            //                              RenderingContext.UNSIGNED_SHORT, 
                            //                              0);
                            //                  }
                        }
                        if (shader.stages.Count == 0)
                        {
                            // NO SHADER for sky  so use default shader if possible

                            shaderProgram = q3bsp.glshading.defaultProgram;

                            bindSkyTexture(null, shaderProgram, time);

                            skybox.bindSkyAttribs(shaderProgram);

                            skybox.bindSkyMatrix(shaderProgram, leftViewMat, leftProjMat);

                            q3bsp.setViewport(leftViewport);

                            GL.UseProgram(shaderProgram.program);

                            GL.Disable(EnableCap.DepthTest);

                            //GL.DrawElements(RenderingContext.TRIANGLES, skyboxIndexCount, RenderingContext.UNSIGNED_SHORT, 0);
                            GL.DrawElements(BeginMode.Triangles, skyboxIndexCount, DrawElementsType.UnsignedInt, 0);

                            GL.Enable(EnableCap.DepthTest);
                        }
                    }
                }
            }
        }

        static void bindSkyMatrix(shader_prog_t shader, Matrix4 modelViewMat, Matrix4 projectionMat)
        {
            skyboxMat = modelViewMat; //mat4.set(modelViewMat, this.skyboxMat);

            // Clear out the translation components
            skyboxMat.M12 = 0.0f;
            skyboxMat.M13 = 0.0f;
            skyboxMat.M14 = 0.0f;

            // Set uniforms
            GL.UniformMatrix4(shader.uniform["modelViewMat"], false, ref skyboxMat);
            GL.UniformMatrix4(shader.uniform["projectionMat"], false, ref projectionMat);
        }

        static void bindSkyAttribs(shader_prog_t shader)
        {
            // Setup vertex attributes
            GL.EnableVertexAttribArray(shader.attrib["position"]);
            GL.VertexAttribPointer(shader.attrib["position"],
                                   3,
                                   VertexAttribPointerType.Float,
                                   false,
                                   Config.q3bsp_sky_vertex_stride,
                                   0);

            if (shader.attrib["texCoord"] != -1)
            {
                GL.EnableVertexAttribArray(shader.attrib["texCoord"]);
                GL.VertexAttribPointer(shader.attrib["texCoord"],
                                       2,
                                       VertexAttribPointerType.Float,
                                       false,
                                       Config.q3bsp_sky_vertex_stride,
                                       3 * 4);
            }
        }

        public static void buildSkyboxbuffers()
        {
            float[] skyVerts;
            int[] skyIndices;

            // CUBE GEOMETRY
            skyVerts = new float[]
            {
                -128.0f, 128.0f, 128.0f, 0.0f, 0.0f,
                128.0f, 128.0f, 128.0f, 1.0f, 0.0f,
                -128.0f, -128.0f, 128.0f, 0.0f, 1.0f,
                128.0f, -128.0f, 128.0f, 1.0f, 1.0f,

                -128.0f, 128.0f, 128.0f, 0.0f, 1.0f,
                128.0f, 128.0f, 128.0f, 1.0f, 1.0f,
                -128.0f, 128.0f, -128.0f, 0.0f, 0.0f,
                128.0f, 128.0f, -128.0f, 1.0f, 0.0f,

                -128.0f, -128.0f, 128.0f, 0.0f, 0.0f,
                128.0f, -128.0f, 128.0f, 1.0f, 0.0f,
                -128.0f, -128.0f, -128.0f, 0.0f, 1.0f,
                128.0f, -128.0f, -128.0f, 1.0f, 1.0f,

                128.0f, 128.0f, 128.0f, 0.0f, 0.0f,
                128.0f, -128.0f, 128.0f, 0.0f, 1.0f,
                128.0f, 128.0f, -128.0f, 1.0f, 0.0f,
                128.0f, -128.0f, -128.0f, 1.0f, 1.0f,

                -128.0f, 128.0f, 128.0f, 1.0f, 0.0f,
                -128.0f, -128.0f, 128.0f, 1.0f, 1.0f,
                -128.0f, 128.0f, -128.0f, 0.0f, 0.0f,
                -128.0f, -128.0f, -128.0f, 0.0f, 1.0f
            };

            skyIndices = new int[]
            {
                0, 1, 2,
                1, 2, 3,

                4, 5, 6,
                5, 6, 7,

                8, 9, 10,
                9, 10, 11,

                12, 13, 14,
                13, 14, 15,

                16, 17, 18,
                17, 18, 19
            };

            //Uint16List wgl_coordIndex=normalize_indicies_as_uint16(Int32List here);  // restricted to uint16 atm

            GL.GenBuffers(1, out skyboxBuffer);
            GL.BindBuffer(BufferTarget.ArrayBuffer, skyboxBuffer);
            GL.BufferData(BufferTarget.ArrayBuffer, (IntPtr)(skyVerts.Length * sizeof(float)), skyVerts, BufferUsageHint.StaticDraw);

            GL.GenBuffers(1, out skyboxIndexBuffer);
            GL.BindBuffer(BufferTarget.ElementArrayBuffer, skyboxIndexBuffer);
            GL.BufferData(BufferTarget.ElementArrayBuffer, (IntPtr)(skyIndices.Length * sizeof(int)), skyIndices, BufferUsageHint.StaticDraw);

            skyboxIndexCount = skyIndices.Length;
        }
    }

    public abstract class cubemap
    {
        //render();

    }

    delegate void OnSkymapPartLoadComplete(dynamic image, int target);
    delegate void OnSkymapLoadComplete(dynamic texture, int target, OnTextueLoad onloadComplete);

    public class cubemap_texture_six : cubemap // disable DEPTH_TEST to render behind scene
    {
        private static int skymap;
        //private static dynamic back, down, front, left, right, up;
        private static System.Drawing.Bitmap xpos, xneg, ypos, yneg, zpos, zneg;
        private static int num_loaded = 0;

        public static void LoadComplete(int index, TextureTarget target, OnTextueLoad onloadComplete) // OnSkymapLoadComplete
        {
            int skybox = GL.GenTexture();
            index = skybox;
            skymap = skybox;
            System.Drawing.Imaging.BitmapData xposd, yposd, zposd, xnegd, ynegd, znegd;



            //gl.enable(RenderingContext.TEXTURE_CUBE_MAP);
            GL.BindTexture(TextureTarget.TextureCubeMap, skybox);

            GL.TexParameter(TextureTarget.TextureCubeMap, TextureParameterName.TextureMagFilter, (int)TextureMinFilter.Linear);
            GL.TexParameter(TextureTarget.TextureCubeMap, TextureParameterName.TextureMinFilter, (int)TextureMinFilter.Linear);
            GL.TexParameter(TextureTarget.TextureCubeMap, TextureParameterName.TextureWrapS, (int)TextureWrapMode.ClampToEdge);
            GL.TexParameter(TextureTarget.TextureCubeMap, TextureParameterName.TextureWrapT, (int)TextureWrapMode.ClampToEdge);

            //gl.TexParameter(RenderingContext.TEXTURE_CUBE_MAP, RenderingContext.TEXTURE_WRAP_R, RenderingContext.CLAMP_TO_EDGE);

            int level = 0;
            PixelInternalFormat format = PixelInternalFormat.Rgba;
            PixelFormat pformat = PixelFormat.Rgba;
            PixelType type = PixelType.UnsignedByte;            

            xposd = texture.UnlockBitmap(xpos);
            yposd = texture.UnlockBitmap(ypos);
            zposd = texture.UnlockBitmap(zpos);
            xnegd = texture.UnlockBitmap(xneg);
            ynegd = texture.UnlockBitmap(yneg);
            znegd = texture.UnlockBitmap(zneg);

            // gl.texImage2D(RenderingContext.TEXTURE_2D, 0, RenderingContext.RGBA, RenderingContext.RGBA, RenderingContext.UNSIGNED_BYTE, image);
            GL.TexImage2D(TextureTarget.TextureCubeMapPositiveX, level, format, xpos.Width, xpos.Height, 0, pformat, type, xposd.Scan0);
            GL.TexImage2D(TextureTarget.TextureCubeMapNegativeX, level, format, xneg.Width, xneg.Height, 0, pformat, type, xnegd.Scan0);
            GL.TexImage2D(TextureTarget.TextureCubeMapPositiveY, level, format, ypos.Width, ypos.Height, 0, pformat, type, yposd.Scan0);
            GL.TexImage2D(TextureTarget.TextureCubeMapNegativeY, level, format, yneg.Width, yneg.Height, 0, pformat, type, ynegd.Scan0);
            GL.TexImage2D(TextureTarget.TextureCubeMapPositiveZ, level, format, zpos.Width, zpos.Height, 0, pformat, type, zposd.Scan0);
            GL.TexImage2D(TextureTarget.TextureCubeMapNegativeZ, level, format, zneg.Width, zneg.Height, 0, pformat, type, znegd.Scan0);

            onloadComplete(skybox);
        }

        private static void PartLoadComplete(System.Drawing.Bitmap image, TextureTarget target)
        {
            switch (target)
            {
                case TextureTarget.TextureCubeMapPositiveX:
                    xpos = image;
                    break;
                case TextureTarget.TextureCubeMapNegativeX:
                    xneg = image;
                    break;
                case TextureTarget.TextureCubeMapPositiveY:
                    ypos = image;
                    break;
                case TextureTarget.TextureCubeMapNegativeY:
                    yneg = image;
                    break;
                case TextureTarget.TextureCubeMapPositiveZ:
                    zpos = image;
                    break;
                case TextureTarget.TextureCubeMapNegativeZ:
                    zneg = image;
                    break;
            }
        }

        public static void load(String back_url,
            String down_url,
            String front_url,
            String left_url,
            String right_url,
            String up_url,
            OnTextueLoad onloading,
            OnTextueLoad onloadComplete)
        {


            // DISPATCH requests

            //onloading(skymap);

            //ASYNC loading of skybox right here
            texture.fetch_texture(back_url, (t) => { }, (int t, System.Drawing.Bitmap image) =>
            {
                TextureTarget target = TextureTarget.TextureCubeMapNegativeZ;

                PartLoadComplete(image, target);

                num_loaded++;
                if (num_loaded == 6)
                {
                    LoadComplete(-1, target, onloadComplete);
                }
            });

            texture.fetch_texture(down_url, (t) => { }, (int t, System.Drawing.Bitmap image) =>
            {
                TextureTarget target = TextureTarget.TextureCubeMapPositiveX;

                PartLoadComplete(image, target);

                num_loaded++;
                if (num_loaded == 6)
                {
                    LoadComplete(t, target, onloadComplete);
                }
            });

            texture.fetch_texture(front_url, (t) => { }, (int t, System.Drawing.Bitmap image) =>
            {
                TextureTarget target = TextureTarget.TextureCubeMapNegativeX;

                PartLoadComplete(image, target);

                num_loaded++;
                if (num_loaded == 6)
                {
                    LoadComplete(t, target, onloadComplete);
                }
            });

            texture.fetch_texture(left_url, (t) => { }, (int t, System.Drawing.Bitmap image) =>
            {
                TextureTarget target = TextureTarget.TextureCubeMapPositiveY;

                PartLoadComplete(image, target);

                num_loaded++;
                if (num_loaded == 6)
                {
                    LoadComplete(t, target, onloadComplete);
                }
            });

            texture.fetch_texture(right_url, (t) => { }, (int t, System.Drawing.Bitmap image) =>
            {
                TextureTarget target = TextureTarget.TextureCubeMapNegativeY;

                PartLoadComplete(image, target);

                num_loaded++;
                if (num_loaded == 6)
                {
                    LoadComplete(t, target, onloadComplete);
                }
            });

            texture.fetch_texture(up_url, (t) => { }, (int t, System.Drawing.Bitmap image) =>
            {
                TextureTarget target = TextureTarget.TextureCubeMapPositiveZ;

                PartLoadComplete(image, target);

                num_loaded++;
                if (num_loaded == 6)
                {
                    LoadComplete(t, target, onloadComplete);
                }
            });
        }
    }

    public class cubemap_texture_one : cubemap
    {
        //Texture skybox;

        public static void load(String url, OnTextueLoad onloading, OnTextueLoad onloadComplete)
        {
            texture.fetch_texture(url, (int skybox) =>
            {
                onloading(skybox);
            },
            (int skybox, System.Drawing.Bitmap image) =>
            {
                bool isPowerOf2 = false;
                System.Drawing.Imaging.BitmapData pixelData;

                pixelData = texture.UnlockBitmap(image);

                GL.Enable(EnableCap.TextureCubeMap);
                GL.BindTexture(TextureTarget.TextureCubeMap, skybox);

                //gl.texImage2D(types[i], 0, GL_RGB, pImage->columns(), pImage->rows(), 0, RenderingContext.RGBA,
                //     RenderingContext.UNSIGNED_BYTE, blob.data());
                GL.TexImage2D(TextureTarget.TextureCubeMap, 0, PixelInternalFormat.Rgba, image.Width, image.Height, 0, OpenTK.Graphics.OpenGL.PixelFormat.Bgra, PixelType.UnsignedByte, pixelData.Scan0);

                GL.TexParameter(TextureTarget.TextureCubeMap, TextureParameterName.TextureWrapS, (int)TextureWrapMode.ClampToEdge);
                GL.TexParameter(TextureTarget.TextureCubeMap, TextureParameterName.TextureWrapT, (int)TextureWrapMode.ClampToEdge);
                GL.TexParameter(TextureTarget.TextureCubeMap, TextureParameterName.TextureMagFilter, (int)TextureMinFilter.Linear);
                GL.TexParameter(TextureTarget.TextureCubeMap, TextureParameterName.TextureMinFilter, (isPowerOf2 ? (int)TextureMinFilter.LinearMipmapNearest : (int)TextureMinFilter.Linear));

                if (isPowerOf2) GL.GenerateMipmap(GenerateMipmapTarget.Texture2D);
                
                onloadComplete(skybox);
            });
        }
    }
}
