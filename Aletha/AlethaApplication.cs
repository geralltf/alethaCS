using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using System.Threading;
using System.Linq;

using OpenTK;
using OpenTK.Input;
using OpenTK.Graphics.OpenGL;
using g = OpenTK.Graphics;
using X3D.Engine;
using Aletha.bsp;

namespace Aletha
{
    public partial class AlethaApplication : GameWindow
    {
        public static int ResWidth = 800;
        public static int ResHeight = 600;
        public static g.GraphicsMode graphicsMode = new g.GraphicsMode(32, 16, 0, 4);
        Matrix4 leftViewMat, rightViewMat;
        Matrix4 leftProjMat, rightProjMat;
		bool FULLSCREEN = false;
        bool GAME_INIT_MODE = false;
        int lastIndex;

        public TestCamera camera;
        public static q3bsp map;

        public static void Initilise()
        {
            BackgroundWorker bw; // Have to use the BackgroundWorker to stop COM Interop flop x_x
            AutoResetEvent closureEvent;
            AlethaApplication application;

            closureEvent = new AutoResetEvent(false);
            bw = new BackgroundWorker();

            bw.WorkerReportsProgress = true;
            bw.WorkerSupportsCancellation = true;
            bw.DoWork += new DoWorkEventHandler((object sender, DoWorkEventArgs e) =>
            {
                application = new AlethaApplication();
                application.Title = "Initilising..";
#if FORCE_HIGH_FPS
                application.Run();
#else
                application.Run(60);
#endif
            });
            bw.RunWorkerCompleted += new RunWorkerCompletedEventHandler((object sender, RunWorkerCompletedEventArgs e) =>
            {
                closureEvent.Set();
            });

            bw.RunWorkerAsync();
            closureEvent.WaitOne();

			Console.ReadLine ();
        }

        public AlethaApplication() : base(ResWidth, ResHeight, graphicsMode)
        {
            this.VSync = VSyncMode.On;
			this.Keyboard.KeyUp += HandleKeyUp;

            camera = new TestCamera(ResWidth, ResHeight);
        }

        protected override void OnLoad(EventArgs e)
        {
            Console.WriteLine("LOAD <> ");
            this.time_at_init = DateTime.Now;
            Console.Title = AppInfo;
            int[] t = new int[2];
            GL.GetInteger(GetPName.MajorVersion, out t[0]);
            GL.GetInteger(GetPName.MinorVersion, out t[1]);
            Console.ForegroundColor = ConsoleColor.White;
            Console.WriteLine("OpenGL Version " + t[0] + "." + t[1]);

            // INIT
            
			initGL();
			initMap();

            if(GAME_INIT_MODE&&FULLSCREEN)
            {
                Console.ForegroundColor=ConsoleColor.DarkGreen;
                Console.WriteLine("Sleeping for 5 secs so you can read me");
                Console.ForegroundColor=ConsoleColor.DarkCyan;
                System.Threading.Thread.Sleep(5000);
                WindowState=WindowState.Fullscreen;
            }
            else if (FULLSCREEN)
            {
                WindowState = WindowState.Fullscreen;
            }
        }

		void initGL()
		{
			GL.ClearColor(0.0f, 0.0f, 0.0f, 1.0f);
			GL.ClearDepth(1.0);

			GL.Enable(EnableCap.DepthTest);
			GL.Enable(EnableCap.Blend);
			GL.Enable(EnableCap.CullFace);
			GL.DepthFunc(DepthFunction.Lequal);                 // The Type Of Depth Testing To Do
			GL.Hint(HintTarget.PerspectiveCorrectionHint, HintMode.Nicest);  // Really Nice Perspective Calculations

			leftViewMat = Matrix4.Identity;
			rightViewMat = Matrix4.Identity;
			leftProjMat = Matrix4.Identity;
			rightProjMat = Matrix4.Identity;

			//leftViewport = Viewport.zero();
			//rightViewport = Viewport.zero();

		}

		private void initMap()
        {
            int tess_level = 0;

            map = new q3bsp();
            q3bsp.onentitiesloaded = bsp_entities_initilised;
            q3bsp.onbsp = bsp_initilised;
            //map.onsurfaces = initSurfaces;
            q3bsp.loadShaders(Config.mapShaders);

            BspCompiler.load(Config.map_uri, tess_level, null);
        }

		private void bsp_initilised(q3bsptree bsp)
		{
			camera.playerMover = new Q3Movement(camera,bsp);
		}

		private void bsp_entities_initilised(dynamic entities)
        {
            // Process entities loaded from the map  
        }

        
        // "Respawns" the player at a specific spawn point. Passing -1 will move the player to the next spawn point.
        private void respawnPlayer(int index) 
        {
            if (q3bsp.entities != null && camera.playerMover != null)
            {
                String spawn_point_param_name;
                List<Q3Entity> spawns;
                

                spawn_point_param_name = "info_player_deathmatch"; // Quake 3 bsp file
                spawns = q3bsp.entities.Where(e => e.name == spawn_point_param_name).ToList();

                if (!spawns.Any())
                {
                    spawn_point_param_name = "info_player_start"; // TREMULOUS bsp file

                    spawns = q3bsp.entities.Where(e => e.name == spawn_point_param_name).ToList();
                }

                

                if (index == -1)
                {
                    index = (lastIndex + 1) % spawns.Count;
                }
                lastIndex = index;

                Q3Entity spawnPoint = spawns.First(e => e.Index == index);
                //Entity spawnPoint = q3bsp.entities[spawn_point_param_name];

                float zAngle = -((spawnPoint.entity.angle.HasValue ? spawnPoint.entity.angle.Value : 0.0f)) 
                                    * ((float)Math.PI / 180.0f) + ((float)Math.PI * 0.5f); // Negative angle in radians + 90 degrees
                float xAngle = 0.0f;

                Vector3 rotation = new Vector3(xAngle, 0.0f, zAngle);

                camera.setOrigin(new Vector3(
                    spawnPoint.entity.origin.X,
                    spawnPoint.entity.origin.Y,
                    spawnPoint.entity.origin.Z + 30 // Start a little ways above the floor) [
                ), rotation);

                camera.velocity = Vector3.Zero;

                //camera.Reset();
            }
        }

        protected override void OnResize(EventArgs e)
        {
            
        }

        protected override void OnUpdateFrame(FrameEventArgs e)
        {

        }

        protected override void OnRenderFrame(FrameEventArgs e)
        {
            _prev = DateTime.Now;
            GL.Clear(ClearBufferMask.ColorBufferBit | ClearBufferMask.DepthBufferBit);

            //if(map == null || playerMover == null) 
            //{ 
            //    return; 
            //}

            //const int timing = 16;
    
            //// Update player movement to 60FPS
            //// The while ensures that we update at a fixed rate even if the rendering bogs down
            //while(elapsed - lastMove >= timing) 
            //{
            //    updateInput(timing);
            //    lastMove += timing;
            //}

            //// For great laggage!
            //for (int i = 0; i < REPEAT_FRAMES; ++i)
            //{
            //    drawFrame(gl);
            //}

            if (e != null)
            {
                UpdateTitle(e);
            }
            SwapBuffers();
        }
    }
}
