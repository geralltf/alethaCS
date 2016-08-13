using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using OpenTK;
using OpenTK.Graphics.OpenGL4;
using System.Threading;

namespace Aletha.bsp
{
    public delegate void OnEntitiesParsed(List<Q3Entity> entities);
    public delegate void OnSurfacesParsed(List<shader_p> surfaces);
    public delegate void OnBspLoadComplete(q3bsptree tree);


    public class q3bsp
    {

        public static void postMessage2(MessageParams @params, MessageParams replay)
        {

            string type = @params.type;

            if (replay != null)
            {


                if (type == "worker")
                {
                    q3bsp.onMessage(replay);
                    BspCompiler._onmessage(replay);

                    return;
                }
            }
            switch (type)
            {
                case "geometry":

                    //worker.postMessage(params);
                    //_onmessage(params);
                    //q3bsp.onMessage(params);
                    //return;
                    break;
            }


            BspCompiler._onmessage(@params);
            q3bsp.onMessage(@params);

            Console.WriteLine("Please wait");
            //fetch_update("Plese Wait");
        }

        public static OnBspLoadComplete onbsp = null;
        public static OnEntitiesParsed onentitiesloaded = null;
        public static OnSurfacesParsed onsurfaces = null;

        public static List<Q3Entity> entities;
        public static int vertexBuffer;
        public static int indexBuffer;

        public static int indexCount;
        public static int lightmap;
        public static List<shader_p> surfaces;
        public static Dictionary<String, shader_gl> shaders;
        public static string highlighted; // highlighted shader

        public static List<shader_p> unshadedSurfaces;
        public static List<shader_p> defaultSurfaces;
        public static List<shader_p> modelSurfaces;
        public static List<shader_p> effectSurfaces;
        public static q3bsptree bspTree;
        public static int startTime;
        public static BgMusic bgMusic;
        public static Timer interval;
        public static q3glshader glshading;
        public static skybox skybox_env;

        public q3bsp()
        {
            //map = this;
            glshading = new q3glshader();

            //showLoadStatus();

            // Map elements
            skybox_env = null;

            vertexBuffer = -1;
            indexBuffer = -1;
            indexCount = 0;
            lightmap = glshading.createSolidTexture(new Vector4(255, 255, 255, 255));
            surfaces = null;
            shaders = new Dictionary<string, shader_gl>();

            highlighted = null;

            // Sorted draw elements
            unshadedSurfaces = new List<shader_p>();
            defaultSurfaces = new List<shader_p>();
            modelSurfaces = new List<shader_p>();
            effectSurfaces = new List<shader_p>();

            // BSP Elements
            bspTree = null;

            // Effect elements
            startTime = (int)DateTime.Now.Ticks;
            bgMusic = null;
        }


        public void highlightShader(string name)
        {
            highlighted = name;
        }



        public void playMusic(bool play)
        {
            if (bgMusic == null) { return; }

            if (play)
            {
                bgMusic.play();
            }
            else
            {
                bgMusic.pause();
            }
        }

        public static void onMessage(MessageParams msg)
        {
            //if(msg.data is String) return;

            string type = msg.type;
            switch (type)
            {
                case "entities":
                    entities = msg.entities;
                    processEntities(entities);
                    break;
                case "geometry":
                    BspOpenglBuilders.buildBuffers(msg.vertices, msg.indices);
                    surfaces = msg.surfaces;
                    bindShaders(); // compiles in another thread 
                    break;
                case "lightmap":
                    BspOpenglBuilders.buildLightmaps(msg.size, msg.lightmaps);
                    break;
                case "shaders":
                    BspOpenglBuilders.buildShaders(msg.shaders);
                    break;
                case "bsp":
                    bspTree = new q3bsptree(msg.bsp);
                    if (onbsp != null)
                    {
                        onbsp(bspTree);
                    }
                    //clearLoadStatus();
                    break;
                case "visibility":
                    setVisibility(msg.visibleSurfaces);
                    break;
                case "status":
                    Console.WriteLine(msg.message);
                    //onLoadStatus(msg.message);
                    break;
                default:
                    throw new Exception("Unexpected message type: " + msg.type);
            }
        }

        public static void load(String url, int tesselationLevel)
        {
            if (tesselationLevel <= 0)
            {
                tesselationLevel = 5;
            }
            q3bsp.postMessage2(new MessageParams()
            {
                type = "load",
                url = "../" + Config.q3bsp_base_folder + "/" + url,
                tesselationLevel = tesselationLevel
            }, null);
        }

        public static void loadShaders(String[] urls)
        {
            for (int i = 0; i < urls.Length; ++i)
            {
                urls[i] = Config.q3bsp_base_folder + '/' + urls[i];
            }

            q3shader.loadList(urls, (List<shader_t> shaders) =>
            {
                BspOpenglBuilders.buildShaders(shaders);
            });
        }

        public static void processEntities(List<Q3Entity> entities)
        {
            if (onentitiesloaded != null)
            {
                onentitiesloaded(entities);
            }

            // Background music
            /*if(entities.worldspawn[0].music) {
                this.bgMusic = new Audio(q3bsp_base_folder + '/' + entities.worldspawn[0].music.replace('.wav', '.ogg'));
                // TODO: When can we change this to simply setting the 'loop' property?
                this.bgMusic.addEventListener('ended', function(){
                    this.currentTime = 0;
                }, false);
                this.bgMusic.play();
            }*/

            // It would be relatively easy to do some ambient sound processing here, but I don't really feel like
            // HTML5 audio is up to the task. For example, lack of reliable gapless looping makes them sound terrible!
            // Look into this more when browsers get with the program.
            /*var speakers = entities.target_speaker;
            for(var i = 0; i < 1; ++i) {
                var speaker = speakers[i];
                q3bspCreateSpeaker(speaker);
            }*/
        }

        public static void q3bspCreateSpeaker(object speaker)
        {
            //speaker.audio = new Audio(q3bsp_base_folder + '/' + speaker.noise.replace('.wav', '.ogg'));

            // TODO: When can we change this to simply setting the 'loop' property?
            //speaker.audio.addEventListener('ended', (){
            //    this.currentTime = 0;
            //}, false);
            //speaker.audio.play();
        }



        public static void bindShaders()
        {
            Thread th;
            ThreadStart ts;
            shader_p surface;

            if (surfaces == null) { return; }

            if (onsurfaces != null)
            {
                onsurfaces(surfaces);
            }

            for (var i = 0; i < surfaces.Count; ++i)
            {
                surface = surfaces[i];

                if (surface.elementCount == 0 || surface.shader != null || surface.shaderName == "noshader")
                {
                    continue;
                }

                unshadedSurfaces.Add(surface);
            }

            /* FAST dirty async code */
            ts = new ThreadStart(() =>
            {
                OpenTK.Graphics.IGraphicsContext context;
                Stack<shader_p> work_items;
                bool processSurfaces;

                context = new OpenTK.Graphics.GraphicsContext(AlethaApplication.GraphicsMode, AlethaApplication.NativeWindowContext.WindowInfo);
                context.MakeCurrent(AlethaApplication.NativeWindowContext.WindowInfo);
                work_items = new Stack<shader_p>(unshadedSurfaces);
                processSurfaces = true;

                while (processSurfaces)//(work_items.Count > 0 && processSurfaces)
                {
                    // PROCESS SURFACE SHADERS
                    // as they come in until there are none left

                    if (work_items.Count == 0)
                    {
                        // Have we processed all surfaces?
                        // Sort to ensure correct order of transparent objects

                        effectSurfaces.Sort((shader_p a, shader_p b) =>
                        {
                            int order = a.shader.sort - b.shader.sort;
                            // TODO: Sort by state here to cut down on changes?
                            return order; //(order == 0 ? 1 : order);
                        });

                        //processSurfaces = false;
                    }
                    
                    {
                        String shader_name;
                        shader_gl shader;


                        if (work_items.Count != 0)
                        {
                            surface = work_items.Pop();
                            unshadedSurfaces.RemoveAt(0);

                            //shader_p surface = unshadedSurfaces.RemoveAt(0); // var surface = unshadedSurfaces.shift();

                            shader_name = surface.shaderName;
                            //shader_name = shader_name.startsWith('"')?shader_name.substring(1):shader_name; // BUG

                            if (q3bsp.shaders.ContainsKey(shader_name))
                            {
                                shader = q3bsp.shaders[shader_name];
                            }
                            else
                            {
                                shader = null;
                            }

                            //shader_gl skyshader = q3bsp.shaders['textures/atcs/skybox_s'];

                            if (shader == null)
                            {
                                surface.shader = glshading.buildDefault(surface);

                                if (surface.geomType == 3)
                                {
                                    surface.shader.model = true;
                                    modelSurfaces.Add(surface);
                                }
                                else
                                {
                                    defaultSurfaces.Add(surface);
                                }
                            }
                            else
                            {
                                surface.shader = shader;

                                if (shader.sky == true)
                                {
                                    skybox.skyShader = shader; // Sky does not get pushed into effectSurfaces. It's a separate pass
                                }
                                else
                                {
                                    effectSurfaces.Add(surface);
                                }

                                glshading.loadShaderMaps(surface, shader);
                            }
                        }

                    }

                }


                Console.WriteLine("Processed surfaces");
            });

            th = new Thread(ts);
            th.Start();
        }

        // Update which portions of the map are visible based on position

        public static void updateVisibility(Vector3 pos)
        {
            postMessage2(new MessageParams()
            {
                type = "visibility",
                pos = pos
            }, null);
        }

        public static void setVisibility(Dictionary<long, bool> visibilityList)
        {
            if (surfaces.Count > 0)
            {
                for (int i = 0; i < surfaces.Count; ++i)
                {
                    surfaces[i].visible = (visibilityList[i] == true);
                }
            }
        }



        public static void setViewport(Viewport viewport)
        {
            if (viewport != null)
            {
                if (viewport.x < 0) viewport.x = 0.0f;
                if (viewport.y < 0) viewport.y = 0.0f;
                if (viewport.width < 0) viewport.width = 0.0f;
                if (viewport.height < 0) viewport.height = 0.0f;

                GL.Viewport((int)viewport.x, (int)viewport.y, (int)viewport.width, (int)viewport.height);
            }
            else
            {
                viewport = Viewport.Zero;
            }
        }

        public static void Render(Matrix4 leftViewMat, Matrix4 leftProjMat, Viewport leftViewport, float time)
        {
            if (vertexBuffer == -1 || indexBuffer == -1) { return; } // Not ready to draw yet

            // Seconds passed since map was initialized
            //float time = (DateTime.Now.Ticks - startTime) / 1000.0f;
            //int i = 0;

            // Loop through all shaders, drawing all surfaces associated with them
            if (surfaces.Count > 0)
            {
                render_default_surfaces(leftViewMat, leftProjMat, leftViewport, time);


                // Model shader surfaces (can bind shader once and draw all of them very quickly)
                if (modelSurfaces.Count > 0)
                {
                    render_model_surfaces(leftViewMat, leftProjMat, leftViewport, time);
                }


                //BUG: at the moment with effect surfaces

                render_effect_surfaces(leftViewMat, leftProjMat, leftViewport, time);
            }

            //render_models(leftViewMat, leftProjMat, leftViewport, time);
        }




        public static void render_models(Matrix4 leftViewMat, Matrix4 leftProjMat, Viewport leftViewport, double time)
        {
            //TODO: porting md3 model loader soon
        }

        public static void render_default_surfaces(Matrix4 leftViewMat, Matrix4 leftProjMat, Viewport leftViewport, float time)
        {
            // Map Geometry buffers
            GL.BindBuffer(BufferTarget.ElementArrayBuffer, indexBuffer);
            GL.BindBuffer(BufferTarget.ArrayBuffer, vertexBuffer);

            // Default shader surfaces (can bind shader once and draw all of them very quickly)
            if (defaultSurfaces.Count > 0 || unshadedSurfaces.Count > 0)
            {
                // Setup State
                shader_gl shader = glshading.defaultShader;
                glshading.setShader(shader);
                stage_gl stage = shader.stages[0];
                shader_prog_t shaderProgram = glshading.setShaderStage(shader, stage, time);


                BspOpenglBinders.bindShaderAttribs(shaderProgram);

                GL.ActiveTexture(TextureUnit.Texture0);
                GL.BindTexture(TextureTarget.Texture2D, glshading.defaultTexture);

                BspOpenglBinders.bindShaderMatrix(shaderProgram, leftViewMat, leftProjMat);
                setViewport(leftViewport);

                int i;

                for (i = 0; i < unshadedSurfaces.Count; ++i)
                {
                    shader_p surface = unshadedSurfaces[i];
                    GL.DrawElements(BeginMode.Triangles, surface.elementCount, DrawElementsType.UnsignedShort, surface.indexOffset);
                }
                for (i = 0; i < defaultSurfaces.Count; ++i)
                {
                    shader_p surface = defaultSurfaces[i];
                    stage_gl stage2 = surface.shader.stages[0];
                    GL.BindTexture(TextureTarget.Texture2D, stage2.texture);
                    GL.DrawElements(BeginMode.Triangles, surface.elementCount, DrawElementsType.UnsignedShort, surface.indexOffset);
                }

            }
        }

        public static void render_effect_surfaces(Matrix4 leftViewMat, Matrix4 leftProjMat, Viewport leftViewport, float time)
        {
            // Effect surfaces
            for (int i = 0; i < effectSurfaces.Count; ++i)
            {
                shader_p surface = effectSurfaces[i];
                if (surface.elementCount == 0 || surface.visible != true) { continue; }

                // Bind the surface shader
                shader_gl shader = surface.shader;

                if (highlighted != null && highlighted == surface.shaderName)
                {
                    shader = glshading.defaultShader;
                }

                shader = glshading.defaultShader; // test to show that effect shaders are buggy. Later remove this line to use the effect shader properly.

                if (!glshading.setShader(shader)) { continue; }

                for (int j = 0; j < shader.stages.Count; ++j)
                {
                    stage_gl stage = shader.stages[j];

                    shader_prog_t shaderProgram = glshading.setShaderStage(shader, stage, time);

                    if (shaderProgram == null) { continue; }

                    BspOpenglBinders.bindShaderAttribs(shaderProgram);
                    BspOpenglBinders.bindShaderMatrix(shaderProgram, leftViewMat, leftProjMat);

                    setViewport(leftViewport);

                    // Draw all geometry that uses this textures
                    GL.DrawElements(BeginMode.Triangles, surface.elementCount, DrawElementsType.UnsignedInt, surface.indexOffset);

                    ErrorCode result = GL.GetError();

                    if (result == ErrorCode.NoError)
                    {
                        Console.WriteLine("[effect surfaces]");
                    }
                    else
                    {
                        Console.WriteLine("[ERROR effect surfaces]");
                    }
                }
            }
        }
        public static void render_model_surfaces(Matrix4 leftViewMat, Matrix4 leftProjMat, Viewport leftViewport, float time)
        {
            // Setup State
            shader_gl shader = modelSurfaces[0].shader;
            glshading.setShader(shader);
            stage_gl stage = shader.stages[0];
            shader_prog_t shaderProgram = glshading.setShaderStage(shader, stage, time);
            BspOpenglBinders.bindShaderAttribs(shaderProgram);
            GL.ActiveTexture(TextureUnit.Texture0);

            BspOpenglBinders.bindShaderMatrix(shaderProgram, leftViewMat, leftProjMat);
            setViewport(leftViewport);

            for (int i = 0; i < modelSurfaces.Count; ++i)
            {
                shader_p surface = modelSurfaces[i];
                stage_gl stage2 = surface.shader.stages[0];
                GL.BindTexture(TextureTarget.Texture2D, stage2.texture);
                GL.DrawElements(BeginMode.Triangles, surface.elementCount, DrawElementsType.UnsignedInt, surface.indexOffset);
            }

        }
    }
}