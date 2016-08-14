using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Aletha.bsp;
using OpenTK;
using OpenTK.Graphics.OpenGL4;

namespace Aletha
{
    public enum skybox_type
    {
        six_tex,
        one_tex
    }

    public delegate void OnSkymapPartLoadComplete(dynamic image, int target);
    public delegate void OnSkymapLoadComplete(dynamic texture, int target, OnTextueLoad onloadComplete);

    public class skybox
    {
        //private skybox_type type;
        //private cubemap map;
        private int skymap;

        static int skyboxBuffer = -1;
        static int skyboxIndexBuffer = -1;
        static int skyboxIndexCount = 0;
        static Matrix4 skyboxMat;
        public static shader_gl skyShader;
        //static bool has_skyparams;

        public string skybox_env_url = Config.q3bsp_base_folder + "/env/" + Config.mapName + "/";

        public skybox()
        {
            //skyboxBuffer = null;
            //skyboxIndexBuffer = null;
            //skyboxIndexCount = 0;
            skyboxMat = Matrix4.Identity;
            //map = null;
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

            //sky.type = skybox_type.one_tex;


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

        public void Render(float time, Viewport leftViewport, Matrix4 leftViewMat, Matrix4 leftProjMat)
        {
            //q3bsp.skybox_env.bindSkyTexture(gl, stage, program, time);

            // Loop through all shaders, drawing all surfaces associated with them
            if (q3bsp.surfaces.Count > 0)
            {

                shader_gl shader = skyShader == null ? q3bsp.glshading.defaultShader : skyShader;

                // If we have a skybox, render it first
                if (shader != null && skyboxIndexBuffer != -1 && skyboxBuffer != -1)
                {
                    //bindSkySingleTexture(time);


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
                            GL.DrawElements(BeginMode.Triangles, skyboxIndexCount, DrawElementsType.UnsignedShort, 0);

                        }
                        if (shader.stages.Count == 0)
                        {
                            // NO SHADER for sky  so use default shader if possible

                            shaderProgram = q3bsp.glshading.defaultProgram;


                            GL.UseProgram(shaderProgram.program);

                            //bindSkyTexture(null, shaderProgram, time);

                            skybox.bindSkyAttribs(shaderProgram);

                            skybox.bindSkyMatrix(shaderProgram, leftViewMat, leftProjMat);

                            q3bsp.setViewport(leftViewport);


                            GL.Disable(EnableCap.DepthTest);


                            //bindSkySingleTexture(time);

                            GL.DrawElements(BeginMode.Triangles, skyboxIndexCount, DrawElementsType.UnsignedShort, 0);

                            GL.Enable(EnableCap.DepthTest);
                        }
                    }
                }
            }
        }

        static void bindSkyMatrix(shader_prog_t shader, Matrix4 modelViewMat, Matrix4 projectionMat)
        {
            skyboxMat = modelViewMat; //mat4.set(modelViewMat, this.skyboxMat);
                                      //skyboxMat = Matrix4.Identity;
                                      //skyboxMat = new Matrix4(modelViewMat.Row0, modelViewMat.Row1, modelViewMat.Row2, modelViewMat.Row3);

            //skyboxMat = Matrix4.Identity * AlethaApplication.camera.GetWorldOrientation();

            

            // Clear out the translation components
            //skyboxMat.M12 = 0.0f;
            //skyboxMat.M13 = 0.0f;
            //skyboxMat.M14 = 0.0f;

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

            if (shader.attrib.ContainsKey("texCoord"))
            {
                GL.EnableVertexAttribArray(shader.attrib["texCoord"]);
                GL.VertexAttribPointer(shader.attrib["texCoord"],
                                       2,
                                       VertexAttribPointerType.Float,
                                       false,
                                       Config.q3bsp_sky_vertex_stride,
                                       3 * 4);
            }


            if (shader.attrib.ContainsKey("lightCoord"))
            {
                GL.EnableVertexAttribArray(shader.attrib["lightCoord"]);
                GL.VertexAttribPointer(shader.attrib["lightCoord"],
                                       2,
                                       VertexAttribPointerType.Float,
                                       false,
                                       Config.q3bsp_vertex_stride,
                                       5 * sizeof(float));
            }

            if (shader.attrib.ContainsKey("normal"))
            {
                GL.EnableVertexAttribArray(shader.attrib["normal"]);
                GL.VertexAttribPointer(shader.attrib["normal"],
                    3,
                    VertexAttribPointerType.Float,
                    false,
                    Config.q3bsp_vertex_stride,
                    7 * sizeof(float));
            }

            if (shader.attrib.ContainsKey("color"))
            {
                GL.EnableVertexAttribArray(shader.attrib["color"]);
                GL.VertexAttribPointer(shader.attrib["color"],
                    4,
                    VertexAttribPointerType.Float,
                    false,
                    Config.q3bsp_vertex_stride,
                    10 * sizeof(float));
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

}
