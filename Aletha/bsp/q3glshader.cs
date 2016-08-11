using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OpenTK;
using OpenTK.Graphics.OpenGL4;
using Aletha.bsp;
using System.Drawing;
using System.Drawing.Imaging;

namespace Aletha
{

    /// <summary>
    /// q3glshader.js - Transforms a parsed Q3 shader definition into a set of OpenGL compatible states
    /// </summary>
    public class q3glshader
    {
        private int white;
        public shader_gl defaultShader;
        public int defaultTexture, defaultTextureRed;
        private Matrix4 texMat;
        public shader_prog_t defaultProgram;
        private shader_prog_t modelProgram;
        private bool shader_source_tracing = false;

        public q3glshader()
        {
            white = -1;
            defaultShader = null;
            defaultTexture = -1;
            texMat = Matrix4.Identity; // mat4.create()
            defaultProgram = null;

            defaultShader = buildDefault(null);

            defaultProgram = compileShaderProgram(Config.q3bsp_default_vertex, Config.q3bsp_default_fragment);
        }


        public void init()
        {
            white = createSolidTexture(new Vector4(255, 255, 255, 255));
            //white = createSolidTexture(gl, [0,0,0,255]);

            defaultProgram = compileShaderProgram(Config.q3bsp_default_vertex, Config.q3bsp_default_fragment);
            modelProgram = compileShaderProgram(Config.q3bsp_default_vertex, Config.q3bsp_model_fragment);


            // Load default texture
            texture.fetch_texture(Config.q3bsp_no_shader_default_texture_url, (int defau) =>
            {
                defaultTexture = defau;
            },
            (int defau, Bitmap image) =>
            {
                bool isPowerOf2 = false;
                BitmapData pixelData;
                Rectangle boundingbox;

                boundingbox = new Rectangle(0, 0, image.Width, image.Height);

                pixelData = image.LockBits(boundingbox,
                    System.Drawing.Imaging.ImageLockMode.ReadOnly,
                    System.Drawing.Imaging.PixelFormat.Format32bppArgb);

                GL.BindTexture(TextureTarget.Texture2D, defau);
                GL.TexImage2D(TextureTarget.Texture2D, 0, PixelInternalFormat.Rgba, image.Width, image.Height, 0, OpenTK.Graphics.OpenGL4.PixelFormat.Bgra, PixelType.UnsignedByte, pixelData.Scan0);
                GL.TexParameter(TextureTarget.Texture2D, TextureParameterName.TextureMagFilter, (isPowerOf2 ? (int)TextureMinFilter.LinearMipmapNearest : (int)TextureMinFilter.Linear));
                GL.TexParameter(TextureTarget.Texture2D, TextureParameterName.TextureMinFilter, (int)TextureMinFilter.Linear);

                if (isPowerOf2) GL.GenerateMipmap(GenerateMipmapTarget.Texture2D);

                image.UnlockBits(pixelData);
            });
            texture.fetch_texture(Config.q3bsp_no_shader_default_texture_url2, (int defau) =>
            {
                defaultTextureRed = defau;
            },
            (int defau, Bitmap image) =>
            {
                bool isPowerOf2 = false;
                BitmapData pixelData;
                Rectangle boundingbox;

                boundingbox = new Rectangle(0, 0, image.Width, image.Height);

                pixelData = image.LockBits(boundingbox,
                    System.Drawing.Imaging.ImageLockMode.ReadOnly,
                    System.Drawing.Imaging.PixelFormat.Format32bppArgb);

                GL.BindTexture(TextureTarget.Texture2D, defau);
                GL.TexImage2D(TextureTarget.Texture2D, 0, PixelInternalFormat.Rgba, image.Width, image.Height, 0, OpenTK.Graphics.OpenGL4.PixelFormat.Bgra, PixelType.UnsignedByte, pixelData.Scan0);
                GL.TexParameter(TextureTarget.Texture2D, TextureParameterName.TextureMagFilter, (isPowerOf2 ? (int)TextureMinFilter.LinearMipmapNearest : (int)TextureMinFilter.Linear));
                GL.TexParameter(TextureTarget.Texture2D, TextureParameterName.TextureMinFilter, (int)TextureMinFilter.Linear);

                if (isPowerOf2) GL.GenerateMipmap(GenerateMipmapTarget.Texture2D);
            });

            // Load default stage
            defaultShader = buildDefault(null);
        }

        /// <summary>
        /// Shader building
        /// </summary>
        public shader_gl build(shader_t shader, shader_p surface)
        {
            if (shader == null) return null;

            shader_gl glShader = new shader_gl();

            glShader.cull = translateCull(shader.cull);
            glShader.sort = shader.sort;
            glShader.sky = shader.sky;
            glShader.blend = shader.blend;
            glShader.name = shader.name;
            glShader.sky_env_map = shader.sky_env_map;
            glShader.stages = new List<stage_gl>();

            for (int j = 0; j < shader.stages.Count; ++j)
            {
                stage_t t = shader.stages[j];
                stage_gl s = new stage_gl();

                //s.animFrame = t.animFrame;
                s.animFreq = t.animFreq;
                s.animMaps = t.animMaps;
                //s.animTexture = t.animTexture;
                s.texture = -1;
                s.blendSrc = translateBlendSrc(t.blendSrc);
                s.blendDest = translateBlendDest(t.blendDest);
                s.depthFunc = translateDepthFunc(t.depthFunc);
                s.map = t.map;
                s.tcMods = t.tcMods;

                s.depthWrite = t.depthWrite;
                s.isLightmap = t.isLightmap;
                s.shaderSrc = t.shaderSrc;
                s.clamp = t.clamp;
                s.tcGen = t.tcGen;
                s.rgbGen = t.rgbGen;
                s.rgbWaveform = t.rgbWaveform;
                s.alphaGen = t.alphaGen;
                s.alphaFunc = t.alphaFunc;
                s.alphaWaveform = t.alphaWaveform;
                s.hasBlendFunc = t.hasBlendFunc;
                s.depthWriteOverride = t.depthWriteOverride;
                s.blend = t.blend;
                s.opaque = t.opaque;

                glShader.stages.Add(s);
            }

            return glShader;
        }

        public shader_gl buildDefault(shader_p surface)
        {
            stage_gl diffuseStage = new stage_gl();
            diffuseStage.map = (surface != null ? surface.shaderName + ".jpg" : null);
            diffuseStage.isLightmap = false;
            diffuseStage.blendSrc = (int)BlendingFactorSrc.One;
            diffuseStage.blendDest = (int)BlendingFactorDest.Zero;
            diffuseStage.depthFunc = DepthFunction.Lequal;
            diffuseStage.depthWrite = true;

            shader_gl glShader = new shader_gl();
            glShader.cull = CullFaceMode.Front;
            glShader.blend = false;
            glShader.sort = 3;
            glShader.stages = (new stage_gl[] { diffuseStage }).ToList();
            glShader.sky = false;

            if (surface != null)
            {
                loadTexture(glShader, surface, diffuseStage);
            }
            else
            {
                diffuseStage.texture = defaultTexture;
            }

            return glShader;
        }

        public DepthFunction translateDepthFunc(string depth)
        {
            if (depth == null) { return DepthFunction.Lequal; }
            switch (depth.ToLower())
            {
                case "gequal": return DepthFunction.Gequal;
                case "lequal": return DepthFunction.Lequal;
                case "equal": return DepthFunction.Equal;
                case "greater": return DepthFunction.Greater;
                case "less": return DepthFunction.Less;
                default: return DepthFunction.Lequal;
            }
        }

        public CullFaceMode translateCull(string cull)
        {
            if (cull == null) { return CullFaceMode.Front; }
            switch (cull.ToLower())
            {
                case "disable":
                case "none": return CullFaceMode.FrontAndBack;
                case "front": return CullFaceMode.Back;
                case "back":
                default: return CullFaceMode.Front;
            }
        }

        public int translateBlendSrc(string blend)
        {
            if (blend == null) { return (int)BlendingFactorSrc.One; }
            switch (blend.ToUpper())
            {
                case "GL_ONE": return (int)BlendingFactorSrc.One;
                case "GL_ZERO": return (int)BlendingFactorSrc.Zero;
                case "GL_DST_COLOR": return (int)BlendingFactorSrc.DstColor;
                case "GL_ONE_MINUS_DST_COLOR": return (int)BlendingFactorSrc.OneMinusDstColor;
                case "GL_SRC_ALPHA": return (int)BlendingFactorSrc.SrcAlpha;
                case "GL_ONE_MINUS_SRC_ALPHA": return (int)BlendingFactorSrc.OneMinusSrcAlpha;
                case "GL_SRC_COLOR": return (int)BlendingFactorDest.SrcColor;
                case "GL_ONE_MINUS_SRC_COLOR": return (int)BlendingFactorDest.OneMinusSrcColor;
                default: return (int)BlendingFactorSrc.One;
            }
        }

        public int translateBlendDest(string blend)
        {
            if (blend == null) { return (int)BlendingFactorDest.One; }
            switch (blend.ToUpper())
            {
                case "GL_ONE": return (int)BlendingFactorDest.One;
                case "GL_ZERO": return (int)BlendingFactorDest.Zero;
                case "GL_DST_COLOR": return (int)BlendingFactorDest.DstColor;
                case "GL_ONE_MINUS_DST_COLOR": return (int)BlendingFactorDest.OneMinusDstColor;
                case "GL_SRC_ALPHA": return (int)BlendingFactorDest.SrcAlpha;
                case "GL_ONE_MINUS_SRC_ALPHA": return (int)BlendingFactorDest.OneMinusSrcAlpha;
                case "GL_SRC_COLOR": return (int)BlendingFactorDest.SrcColor;
                case "GL_ONE_MINUS_SRC_COLOR": return (int)BlendingFactorDest.OneMinusSrcColor;
                default: return (int)BlendingFactorDest.One;
            }
        }

        /// <summary>
        /// Texture loading
        /// </summary>
        public void loadShaderMaps(shader_p surface, shader_gl shader)
        {
            if (shader.sky == true)
            {
                q3bsp.skybox_env = skybox.loadFromShader(surface, shader);
            }
            for (var i = 0; i < shader.stages.Count; ++i)
            {
                stage_gl stage = shader.stages[i];
                if (stage.map != null)
                {
                    loadTexture(shader, surface, stage);
                }
                if (stage.shaderSrc != null && stage.program == null)
                {
                    Console.WriteLine("Compiling " + shader.name);
                    //fetch_update("Compiling " + shader.name);
                    stage.program = compileShaderProgram(stage.shaderSrc.vertex.source_code,
                                                             stage.shaderSrc.fragment.source_code);
                }
            }
        }

        public void loadTexture(shader_gl shader, shader_p surface, stage_gl stage)
        {
            if (shader.name == "textures/atcs/skybox_s" || shader.sky)
            {
                //var aaa = 1;
            }
            if (stage.map == null)
            {
                stage.texture = white;
                return;
            }
            else if (stage.map.Contains("$lightmap"))
            {
                stage.texture = (surface.geomType != 3 ? q3bsp.lightmap : white);
                return;
            }
            else if (stage.map.Contains("$whiteimage"))
            {
                stage.texture = white;
                return;
            }

            stage.texture = defaultTexture;

            if (stage.map == "anim")
            {
                stage.animTexture = new List<int>();

                for (int i = 0; i < stage.animMaps.Count; ++i)
                {
                    if (i > stage.animTexture.Count - 1)
                    {
                        stage.animTexture.Add(defaultTexture);
                    }

                    String url = Config.q3bsp_base_folder + "/" + stage.animMaps[i];

                    loadTextureUrl(stage, url, (int texture) =>
                    {
                        stage.animTexture.Insert(i, texture);
                    });
                }

                stage.animFrame = 0;
            }
            else
            {


                //if(shader.sky == false)
                //{
                String url = Config.q3bsp_base_folder + "/" + stage.map;
                loadTextureUrl(stage, url, (int texture) =>
                {
                    stage.texture = texture;
                });
                //}
            }
        }


        public void loadTextureUrl(stage_gl stage, String url, OnTextueLoad onload)
        {
            texture.fetch_texture(url, (int texture) =>
            {
                onload(texture);
            },
              (int texture, Bitmap image) =>
              {
                  bool isPowerOf2 = false;
                  BitmapData pixelData;
                  Rectangle boundingbox;

                  boundingbox = new Rectangle(0, 0, image.Width, image.Height);

                  pixelData = image.LockBits(boundingbox,
                      System.Drawing.Imaging.ImageLockMode.ReadOnly,
                      System.Drawing.Imaging.PixelFormat.Format32bppArgb);

                  GL.BindTexture(TextureTarget.Texture2D, texture);
                  GL.TexImage2D(TextureTarget.Texture2D, 0, PixelInternalFormat.Rgba, image.Width, image.Height, 0, OpenTK.Graphics.OpenGL4.PixelFormat.Bgra, PixelType.UnsignedByte, pixelData.Scan0);
                  GL.TexParameter(TextureTarget.Texture2D, TextureParameterName.TextureMagFilter, (isPowerOf2 ? (int)TextureMinFilter.LinearMipmapNearest : (int)TextureMinFilter.Linear));
                  GL.TexParameter(TextureTarget.Texture2D, TextureParameterName.TextureMinFilter, (int)TextureMinFilter.Linear);

                  if (stage.clamp == true)
                  {
                      GL.TexParameter(TextureTarget.Texture2D, TextureParameterName.TextureWrapS, (int)TextureWrapMode.ClampToEdge);
                      GL.TexParameter(TextureTarget.Texture2D, TextureParameterName.TextureWrapT, (int)TextureWrapMode.ClampToEdge);
                  }

                  if (isPowerOf2) GL.GenerateMipmap(GenerateMipmapTarget.Texture2D);

                  onload(texture);
              });

        }

        public int createSolidTexture(Vector4 color)
        {
            byte[] data;
            List<byte> pixels = new List<byte>();

            pixels.Add((byte)color.X);
            pixels.Add((byte)color.Y);
            pixels.Add((byte)color.Z);
            pixels.Add((byte)color.W);

            data = pixels.ToArray();

            int texture = GL.GenTexture();

            GL.BindTexture(TextureTarget.Texture2D, texture);
            GL.TexImage2D(TextureTarget.Texture2D, 0, PixelInternalFormat.Rgba, 1, 1, 0, OpenTK.Graphics.OpenGL4.PixelFormat.Rgba, PixelType.UnsignedByte, data);
            GL.TexParameter(TextureTarget.Texture2D, TextureParameterName.TextureMagFilter, (int)TextureMagFilter.Nearest);
            GL.TexParameter(TextureTarget.Texture2D, TextureParameterName.TextureMinFilter, (int)TextureMinFilter.Nearest);
            GL.BindTexture(TextureTarget.Texture2D, 0);

            return texture;
        }

        /// <summary>
        /// Render state setup
        /// </summary>
        public bool setShader(shader_gl shader)
        {
            if (shader == null)
            {
                GL.Enable(EnableCap.CullFace);
                GL.CullFace(CullFaceMode.Back);
            }
            else if (shader.cull.HasValue && shader.sky == false)
            {
                GL.Enable(EnableCap.CullFace);
                GL.CullFace(shader.cull.Value);
            }
            else
            {
                GL.Disable(EnableCap.CullFace);
            }

            return true;
        }

        public shader_prog_t setShaderStage(shader_gl shader, stage_gl shaderStage, float time)
        {
            shader_prog_t program;

            stage_gl stage = shaderStage;

            if (stage == null)
            {
                stage = defaultShader.stages[0];
            }

            if (stage.animFreq.HasValue && stage.animFreq != 0)
            {
                // Texture animation seems like a natural place for setInterval, but that approach has proved error prone. 
                // It can easily get out of sync with other effects (like rgbGen pulses and whatnot) which can give a 
                // jittery or flat out wrong appearance. Doing it this way ensures all effects are synced.
                float ff = time * (float)stage.animFreq.Value;

                //var animFrame = ff.floor() % stage.animTexture.length;
                stage.texture = stage.animTexture[stage.animFrame]; // stage.animTexture.animFrame;
            }

            GL.BlendFunc((BlendingFactorSrc)stage.blendSrc, (BlendingFactorDest)stage.blendDest);

            if (stage.depthWrite == true && shader.sky == false)
            {
                GL.DepthMask(true);
            }
            else
            {
                GL.DepthMask(false);
            }

            GL.DepthFunc(stage.depthFunc);

            program = stage.program;
            int prog = program != null ? program.program : -1;

            if (prog == -1)
            {
                if (shader.model == true)
                {
                    program = modelProgram;
                    prog = program.program;
                }
                else
                {
                    program = defaultProgram;
                    prog = program.program;
                }
            }

            GL.UseProgram(prog);

            if (shader.sky == true)
            {
                //q3bsp.skybox_env.bindSkyTexture(stage, program, time);
                //var a = 3;

            }
            else
            {
                int texture = stage.texture;
                if (texture == -1) texture = defaultTexture;

                GL.ActiveTexture(TextureUnit.Texture0);
                GL.Uniform1(program.uniform["texture"], 0);
                GL.BindTexture(TextureTarget.Texture2D, texture);
            }

            if (program.uniform.ContainsKey("lightmap"))
            {
                GL.ActiveTexture(TextureUnit.Texture1);
                GL.Uniform1(program.uniform["lightmap"], 1);
                GL.BindTexture(TextureTarget.Texture2D, q3bsp.lightmap);
            }

            if (program.uniform.ContainsKey("time"))
            {
                GL.Uniform1(program.uniform["time"], time);
            }

            return program;
        }

        /// <summary>
        /// Shader program compilation
        /// </summary>
        public shader_prog_t compileShaderProgram(string vertexSrc, string fragmentSrc)
        {
            int fragmentShader = GL.CreateShader(ShaderType.FragmentShader);
            GL.ShaderSource(fragmentShader, fragmentSrc);
            GL.CompileShader(fragmentShader);
            String si;

            int i;
            int attrib;
            int uniform;
            int attribCount;
            int uniformCount;

            //var xf = GL.getShaderParameter(fragmentShader, RenderingContext.COMPILE_STATUS);
            si = GL.GetShaderInfoLog(fragmentShader);
            //if (!(xf != null && xf == true))

            if (!string.IsNullOrEmpty(si.Trim()))
            {

                si = si == null ? "" : si;

                Console.WriteLine("[shader-exception] fragment compilation error " + si);

                if (shader_source_tracing)
                {
                    Console.WriteLine("[shader].[begin]");
                    Console.WriteLine(vertexSrc);
                    Console.WriteLine("[shader].[end]");
                    Console.WriteLine("[shader].[begin]");
                    Console.WriteLine(fragmentSrc);
                    Console.WriteLine("[shader].[end]");
                }

                GL.DeleteShader(fragmentShader);
                return null;
            }

            int vertexShader = GL.CreateShader(ShaderType.VertexShader);
            GL.ShaderSource(vertexShader, vertexSrc);
            GL.CompileShader(vertexShader);

            //var xv = GL.getShaderParameter(vertexShader, RenderingContext.COMPILE_STATUS);
            si = GL.GetShaderInfoLog(vertexShader);

            //if (!(xv != null && xv == true))

            if (!string.IsNullOrEmpty(si.Trim()))
            {


                si = si == null ? "" : si;

                Console.WriteLine("[shader-exception] vertex compilation error: " + si);
                if (shader_source_tracing)
                {
                    Console.WriteLine("[shader].[begin]");
                    Console.WriteLine(vertexSrc);
                    Console.WriteLine("[shader].[end]");
                    Console.WriteLine("[shader].[begin]");
                    Console.WriteLine(fragmentSrc);
                    Console.WriteLine("[shader].[end]");
                }

                GL.DeleteShader(vertexShader);
                return null;
            }

            int shaderProgram = GL.CreateProgram();
            GL.AttachShader(shaderProgram, vertexShader);
            GL.AttachShader(shaderProgram, fragmentShader);
            GL.LinkProgram(shaderProgram);

            //var xp = GL.getProgramParameter(shaderProgram, RenderingContext.LINK_STATUS);

            si = GL.GetProgramInfoLog(shaderProgram);

            //if (!(xp != null && xp == true))
            if (!string.IsNullOrEmpty(si.Trim()))
            {
                GL.DeleteProgram(shaderProgram);
                GL.DeleteShader(vertexShader);
                GL.DeleteShader(fragmentShader);

                Console.WriteLine("[shader-exception] Could not link shaders. Check if there are any additional errors.");
                /*
                console.debug(vertexSrc);
                console.debug(fragmentSrc);*/
                return null;
            }

            shader_prog_t shader_prog = new shader_prog_t();
            shader_prog.program = shaderProgram;
            shader_prog.attrib = new Dictionary<string, int>();
            shader_prog.uniform = new Dictionary<string, int>();

            // SHADER PROGRAM INTROSPECTION

            GL.GetProgramInterface(shaderProgram, ProgramInterface.ProgramInput, ProgramInterfaceParameter.ActiveResources, out attribCount);
            GL.GetProgramInterface(shaderProgram, ProgramInterface.Uniform, ProgramInterfaceParameter.ActiveResources, out uniformCount);

            string name;
            ProgramProperty[] properties;
            int[] values;
            int length;
            StringBuilder nameBuilder;

            properties = new ProgramProperty[]
            {
            ProgramProperty.NameLength,
            ProgramProperty.Type,
            ProgramProperty.ArraySize
            };

            values = new int[properties.Length];
            nameBuilder = new StringBuilder();

            for (i = 0; i < attribCount; i++)
            {
                GL.GetProgramResource(shaderProgram, ProgramInterface.ProgramInput, i, properties.Length, properties, values.Length, out length, values);

#pragma warning disable
                GL.GetProgramResourceName(shaderProgram, ProgramInterface.ProgramInput, i, 256, out length, nameBuilder);
#pragma warning restore

                name = nameBuilder.ToString();

                shader_prog.attrib[name] = GL.GetAttribLocation(shaderProgram, name);
            }

            for (i = 0; i < uniformCount; i++)
            {
                GL.GetProgramResource(shaderProgram, ProgramInterface.Uniform, i, properties.Length, properties, values.Length, out length, values);

#pragma warning disable
                GL.GetProgramResourceName(shaderProgram, ProgramInterface.Uniform, i, 256, out length, nameBuilder);
#pragma warning restore

                name = nameBuilder.ToString();

                shader_prog.uniform[name] = GL.GetUniformLocation(shaderProgram, name);
            }

            //attribCount = GL.getProgramParameter(shaderProgram, RenderingContext.ACTIVE_ATTRIBUTES);
            //uniformCount = gl.getProgramParameter(shaderProgram, RenderingContext.ACTIVE_UNIFORMS);
            //shader_prog.uniform = { };

            //for (i = 0; i < uniformCount; i++)
            //{
            //    uniform = gl.getActiveUniform(shaderProgram, i);

            //    shader_prog.uniform[uniform.name] = gl.getUniformLocation(shaderProgram, uniform.name);
            //}

            return shader_prog;
        }
    }
}
