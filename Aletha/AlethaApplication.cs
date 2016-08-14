using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using System.Threading;
using System.Linq;

using OpenTK;
using OpenTK.Input;
using OpenTK.Graphics.OpenGL4;
using OpenTK.Graphics;
using X3D.Engine;
using Aletha.bsp;

namespace Aletha
{
    public partial class AlethaApplication : GameWindow
    {
        public static int ResWidth = 800;
        public static int ResHeight = 600;
        public static GraphicsMode GraphicsMode = new GraphicsMode(32, 16, 0, 4);
        Matrix4 leftViewMat;

		bool FULLSCREEN = false;
        bool GAME_INIT_MODE = false;
        private string progress_status;

        int lastIndex;
        bool drawMap = true;
        //float xAngle = 0.0f, yAngle = 0.0f;

        long startTime;
        long lastTimestamp;
        Vector2 mouseDelta;

        bool? lockMouseCursor = true;
        private bool fastFlySpeed = false;
        private bool slowFlySpeed = false;
        public static float playerDirectionMagnitude = 1.0f;
        public static float movementSpeed = 1.0f;

        public static int request_number = 0;

        public static SceneCamera camera;
        public static q3bsp map;

        private static AutoResetEvent closureEvent;
        private static BackgroundWorker bw;

        public static INativeWindow NativeWindowContext { get; set; }

        public static AlethaApplication CurrentApplication { get; set; }

        public static void Initilise()
        {
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
        }

        public void Quit()
        {
            bw.CancelAsync();
            closureEvent.Set();
            System.Diagnostics.Process.GetCurrentProcess().Kill();
        }

        public AlethaApplication() : base(ResWidth, ResHeight, GraphicsMode)
        {
            this.VSync = VSyncMode.On;
			this.Keyboard.KeyUp += Keyboard_KeyUp;
            this.Keyboard.KeyDown += Keyboard_KeyDown;

            camera = new SceneCamera(ResWidth, ResHeight);


            NativeWindowContext = this;
            CurrentApplication = this;
        }

        // "Respawns" the player at a specific spawn point. Passing -1 will move the player to the next spawn point.
        public void RespawnPlayer(int index)
        {
            if (q3bsp.entities != null && camera != null && camera.playerMover != null)
            {
                String spawn_point_param_name;
                List<Q3Entity> spawns;


                spawn_point_param_name = "info_player_deathmatch"; // Quake 3 bsp file
                spawns = q3bsp.entities.Where(e => e.name == spawn_point_param_name || e.classname == spawn_point_param_name).ToList();

                if (!spawns.Any())
                {
                    spawn_point_param_name = "info_player_start"; // TREMULOUS bsp file

                    spawns = q3bsp.entities.Where(e => e.name == spawn_point_param_name || e.classname == spawn_point_param_name).ToList();
                }



                if (index == -1)
                {
                    index = (lastIndex + 1) % spawns.Count;
                }
                lastIndex = index;

                Q3Entity spawnPoint = spawns[index]; //spawns.First(e => e.Index == index);
                //Entity spawnPoint = q3bsp.entities[spawn_point_param_name];

                float zAngle;
                float xAngle;

                if (spawnPoint.Fields.ContainsKey("angle"))
                {
                    zAngle = (float)((double)(spawnPoint.Fields["angle"]));
                }
                else
                {
                    zAngle = 0.0f;
                }

                zAngle = -(zAngle);
                zAngle *= ((float)Math.PI / 180.0f) + ((float)Math.PI * 0.5f); // Negative angle in radians + 90 degrees

                xAngle = 0.0f;

                xAngle = (xAngle / 360f) * MathHelper.TwoPi ;
                zAngle = (zAngle / 360f) * MathHelper.TwoPi; // + MathHelper.Pi + MathHelper.PiOver4;

                Vector3 rotation = new Vector3(xAngle, 0.0f, zAngle);

                Vector3 origin = (Vector3)spawnPoint.Fields["origin"];
                origin.Z += 30; // Start a little ways above the floor

                camera.Reset();

                camera.SetOrigin(origin, rotation);

                camera.velocity = Vector3.Zero;

                
            }
        }

        #region Rendering Methods

        protected override void OnLoad(EventArgs e)
        {
            Console.WriteLine("LOAD <QUAKE3_{0}> ", Config.mapName);
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

        private void initGL()
		{
			GL.ClearColor(0.0f, 0.0f, 0.0f, 1.0f);
			GL.ClearDepth(1.0);

			GL.Enable(EnableCap.DepthTest);
			GL.Enable(EnableCap.Blend);
			GL.Enable(EnableCap.CullFace);
			GL.DepthFunc(DepthFunction.Lequal);                 // The Type Of Depth Testing To Do
			GL.Hint(HintTarget.PerspectiveCorrectionHint, HintMode.Nicest);  // Really Nice Perspective Calculations

			leftViewMat = Matrix4.Identity;

            startTime = DateTime.Now.Ticks;
            lastTimestamp = startTime;

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

        private void OnMapLoaded (string map)
        {

            Console.WriteLine("[loaded] bsp scene");

            RespawnPlayer(0);

            OnResize(null);

            //progress_status = "";
        }

        public static void incReqests()
        {
            ++request_number;
        }

        public static void update_progress_bar(int request_number, String url)
        {
            float progress = (request_number / (float)Config.map_tasks_count);
            string status = string.Format("{0:n2}%", progress * 100);

            //Console.WriteLine(status);
            CurrentApplication.progress_status = status;

            if (request_number == Config.map_tasks_count)
            {

                CurrentApplication.OnMapLoaded(Config.mapName);
            }
        }



        protected override void OnRenderFrame(FrameEventArgs e)
        {
            _prev = DateTime.Now;
            GL.Clear(ClearBufferMask.ColorBufferBit | ClearBufferMask.DepthBufferBit);
            GL.ClearColor(System.Drawing.Color.White);

            if (map == null || camera.playerMover == null)
            {
                return;
            }

            RenderQuakeBSP((float)e.Time);

            if (e != null)
            {
                UpdateTitle(e);
            }

            SwapBuffers();
        }


        protected override void OnResize(EventArgs e)
        {
            camera.ApplyViewport(this.Width, this.Height);
        }

        protected override void OnUpdateFrame(FrameEventArgs e)
        {
            ApplyKeyBindings((float)e.Time);

            if (isFullscreen)
            {
                mouseDelta = new Vector2
                (
                   System.Windows.Forms.Cursor.Position.X - (this.Bounds.Width / 2.0f),
                   System.Windows.Forms.Cursor.Position.Y - (this.Bounds.Height / 2.0f)
                );

                mouseDelta *= 0.0005f;
                mouseDelta.Y += 0.009999956f; // mouse not in exact center

                UpdateCamera();

                LockMouseCursor();
            }
        }





        #endregion

        #region Private Methods

        private void UpdateCamera()
        {
            Vector3 direction = Vector3.Zero;

            //if (Math.Abs(mouseDelta.X) > Math.Abs(mouseDelta.Y))
            //    direction.X = (dx > 0) ? 0.1f : -0.1f;
            //else
            //    direction.Y = (dy > 0) ? 0.1f : -0.1f;



            direction = new Vector3(mouseDelta);

            float xAngle = (direction.X);
            float yAngle = (direction.Y);



            camera.ApplyYaw(xAngle);
            camera.ApplyPitch(yAngle);
            camera.ApplyRotation();
        }

        private void RenderQuakeBSP(float frameTime)
        {
            Viewport leftViewport;

            GL.DepthMask(true);

            GL.Clear(ClearBufferMask.ColorBufferBit | ClearBufferMask.DepthBufferBit);
            GL.Enable(EnableCap.DepthTest);
            GL.DepthMask(true);
            GL.DepthFunc(DepthFunction.Lequal);

            if (map == null || camera.playerMover == null) { return; }

            // Matrix setup
            leftViewMat = camera.ViewMatrix;

            camera.ApplyTransformations();

            if (camera.HasChanges)
            {
                //camera_onchange(camera);
            }

            leftViewport = new Viewport();
            leftViewport.width = this.Width;
            leftViewport.height = this.Height;
            leftViewport.x = 0.0f;
            leftViewport.y = 0.0f;

            if (drawMap)
            {
                //float time = (float)(DateTime.Now.Ticks - startTime) / 1000.0f;

                if (q3bsp.skybox_env != null)
                {
                    q3bsp.skybox_env.Render(frameTime, leftViewport, leftViewMat, camera.Projection);
                }

                q3bsp.Render(leftViewMat, camera.Projection, leftViewport, frameTime);
            }

            //player.RenderPlayerModels(gl, leftViewMat, leftProjMat, leftViewport);
        }

        private void bsp_initilised(q3bsptree bsp)
        {
            camera.playerMover = new Q3Movement(camera, bsp);

            // although we have the bsp tree
            // the rest of map not fully loaded yet
        }

        private void bsp_entities_initilised(List<Q3Entity> entities)
        {
            // Process entities loaded from the map  
            string msg;
            string fields;

            foreach (Q3Entity entity in entities)
            {


                msg = string.Format("[~entity~] {3}-{0} {1} {2} ", entity.classname, entity.targetname, entity.name, entity.Index);
                fields = "";

                foreach (var field in entity.Fields)
                {
                    fields += " [" + field.Key + "=" + field.Value + "]";
                }

                Console.WriteLine(msg + " fields=" + fields.Trim());

            }
        }

        private void ApplyKeyBindings(float frameTime)
        {
            if (camera.playerMover == null) { return; }

            Vector3 direction = Vector3.Zero;
            bool translated = false;

            slowFlySpeed = Keyboard[Key.AltLeft];
            fastFlySpeed = Keyboard[Key.ShiftLeft];
            movementSpeed = fastFlySpeed ? 10.0f : 1.0f;
            movementSpeed = slowFlySpeed ? 0.01f : movementSpeed;

            if (Keyboard[Key.Escape] || Keyboard[Key.Q])
            {
                // QUIT APPLICATION
                if (this.WindowState == WindowState.Fullscreen)
                {
                    this.WindowState = WindowState.Normal;
                }

                Quit();
            }

            Vector3 lookat = QuaternionLib.Rotate(camera.Orientation, Vector3.UnitY);
            Vector3 forward = new Vector3(lookat.X, 0, lookat.Z).Normalized();
            Vector3 up = Vector3.UnitZ;
            Vector3 left = up.Cross(forward);
            Vector3 right = up.Cross(camera.Direction);

            if (Keyboard[Key.W])
            {
                //direction += camera.Direction * Config.playerDirectionMagnitude;
                camera.Forward = new Vector3(lookat.X, 0, lookat.Z).Normalized();
                direction -= camera.Forward * Config.playerDirectionMagnitude;

                translated = true;
            }
            if (Keyboard[Key.S])
            {
                camera.Forward = new Vector3(lookat.X, 0, lookat.Z).Normalized();
                direction += camera.Forward * Config.playerDirectionMagnitude;

                //direction -= camera.Direction * Config.playerDirectionMagnitude;
                translated = true;
            }
            if (Keyboard[Key.A])
            {
                camera.Forward = new Vector3(lookat.X, 0, lookat.Z).Normalized();
                camera.Right = right;

                direction += camera.Right * Config.playerDirectionMagnitude;
                translated = true;
            }
            if (Keyboard[Key.D])
            {
                camera.Forward = new Vector3(lookat.X, 0, lookat.Z).Normalized();
                camera.Right = right;

                direction -= camera.Right * Config.playerDirectionMagnitude;
                translated = true;
            }


            if (Keyboard[Key.T])
            {
                camera.Fly(playerDirectionMagnitude * movementSpeed);
            }
            if (Keyboard[Key.G])
            {
                camera.Fly(-playerDirectionMagnitude * movementSpeed);
            }

            //if (Keyboard[Key.W])
            //{
            //    camera.Walk(playerDirectionMagnitude * movementSpeed);
            //}
            //if (Keyboard[Key.S])
            //{
            //    camera.Walk(-playerDirectionMagnitude * movementSpeed);
            //}
            //if (Keyboard[Key.A])
            //{
            //    camera.Strafe(playerDirectionMagnitude * movementSpeed);
            //}
            //if (Keyboard[Key.D])
            //{
            //    camera.Strafe(-playerDirectionMagnitude * movementSpeed);
            //}

            if (Keyboard[Key.PageUp])
            {
                //drawMap = false;
            }
            if (Keyboard[Key.PageDown])
            {
                //drawMap = true;
            }

            bool rotated = false;
            if (Keyboard[Key.Left])
            {
                camera.ApplyYaw(-0.1f);
                rotated = true;
            }
            if (Keyboard[Key.Right])
            {
                camera.ApplyYaw(0.1f);
                rotated = true;
            }
            if (Keyboard[Key.Up])
            {
                camera.ApplyPitch(-0.1f);
                rotated = true;
            }
            if (Keyboard[Key.Down])
            {
                camera.ApplyPitch(0.1f); 
                rotated = true;
            }

            // Calibrator (for translation debugging)
            if (Keyboard[Key.Number1])
            {
                camera.calibTrans.X += camera.calibSpeed.X;
            }
            if (Keyboard[Key.Number2])
            {
                camera.calibTrans.X -= camera.calibSpeed.X;
            }
            if (Keyboard[Key.Number3])
            {
                camera.calibTrans.Y += camera.calibSpeed.Y;
            }
            if (Keyboard[Key.Number4])
            {
                camera.calibTrans.Y -= camera.calibSpeed.Y;
            }
            if (Keyboard[Key.Number5])
            {
                camera.calibTrans.Z += camera.calibSpeed.Z;
            }
            if (Keyboard[Key.Number6])
            {
                camera.calibTrans.Z -= camera.calibSpeed.Z;
            }

            // Calibrator (for orientation debugging)
            if (Keyboard[Key.Number6])
            {
                camera.calibOrient.X += camera.calibSpeed.X;
            }
            if (Keyboard[Key.Number7])
            {
                camera.calibOrient.X -= camera.calibSpeed.X;
            }
            if (Keyboard[Key.Number8])
            {
                camera.calibOrient.Y += camera.calibSpeed.Y;
            }
            if (Keyboard[Key.Number9])
            {
                camera.calibOrient.Y -= camera.calibSpeed.Y;
            }
            if (Keyboard[Key.Minus])
            {
                camera.calibOrient.Z += camera.calibSpeed.Z;
            }
            if (Keyboard[Key.Plus])
            {
                camera.calibOrient.Z -= camera.calibSpeed.Z;
            }



            if (rotated)
            {
                camera.ApplyRotation();
            }

            //if (translated)
            //{
                camera.move(direction, frameTime);
            //}


            //playerMover.move(vec3(direction),frameTime);

            //camera.update(frameTime);
        }

        private void LockMouseCursor()
        {
            if (lockMouseCursor.HasValue == false)
            {
                var result = System.Windows.Forms.MessageBox.Show(
                    "Do you want to allow this application to lock the mouse cursor?\n (Note if you allow the lock, you can quit the application by pressing 'q')",
                    "Lock Mouse Cursor",
                    System.Windows.Forms.MessageBoxButtons.YesNo);

                lockMouseCursor = (result == System.Windows.Forms.DialogResult.Yes);
            }

            if (lockMouseCursor.HasValue && lockMouseCursor.Value == true)
            {
                //        System.Windows.Forms.Cursor.Position = new System.Drawing.Point(window.Bounds.Left + (window.Bounds.Width / 2),
                //window.Bounds.Top + (window.Bounds.Height / 2));



                if (this.isFullscreen)
                {
                    System.Drawing.Rectangle screen = System.Windows.Forms.Screen.PrimaryScreen.WorkingArea;

                    System.Windows.Forms.Cursor.Position = new System.Drawing.Point(screen.Width / 2,
                        screen.Height / 2);
                }

            }
        }

        #endregion
    }
}
