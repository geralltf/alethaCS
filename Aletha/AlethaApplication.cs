﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using System.Threading;
using System.Linq;

using OpenTK;
using OpenTK.Input;
using OpenTK.Graphics.OpenGL4;
using g = OpenTK.Graphics;
using X3D.Engine;
using Aletha.bsp;

namespace Aletha
{
    public partial class AlethaApplication : GameWindow
    {
        public static int ResWidth = 800;
        public static int ResHeight = 600;
        public static g.GraphicsMode GraphicsMode = new g.GraphicsMode(32, 16, 0, 4);
        Matrix4 leftViewMat, rightViewMat;
        Matrix4 leftProjMat, rightProjMat;

		bool FULLSCREEN = false;
        bool GAME_INIT_MODE = false;

        int lastIndex;
        bool drawMap = true;
        float xAngle = 0.0f, yAngle = 0.0f;

        long startTime;
        long lastTimestamp;

        public static int request_number = 0;

        public TestCamera camera;
        public static q3bsp map;

        public static INativeWindow NativeWindowContext { get; set; }

        public static AlethaApplication CurrentApplication { get; set; }

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

        public AlethaApplication() : base(ResWidth, ResHeight, GraphicsMode)
        {
            this.VSync = VSyncMode.On;
			this.Keyboard.KeyUp += Keyboard_KeyUp;
            this.Keyboard.KeyDown += Keyboard_KeyDown;

            camera = new TestCamera(ResWidth, ResHeight);

            NativeWindowContext = this;
            CurrentApplication = this;
        }



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
			rightViewMat = Matrix4.Identity;
			leftProjMat = Matrix4.Identity;
			rightProjMat = Matrix4.Identity;

            //leftViewport = Viewport.zero();
            //rightViewport = Viewport.zero();


            startTime = DateTime.Now.Ticks;
            lastTimestamp = startTime;
            //lastFps = (int)startTime;

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

        private void OnMapLoaded (String map)
        {
            //hide_progress_bar();
            //hide_levelshot();
            //hide_splash();

            ////display_audio_graph();
            //display_viewport_ui();
            //display_crosshair_ui();

            Console.WriteLine("[loaded] bsp scene");

            respawnPlayer(0);

            OnResize(null);
        }

        public static void incReqests()
        {
            ++request_number;
        }

        public static void update_progress_bar(int request_number, String url)
        {
            float progress = (request_number / (float)Config.map_tasks_count);

            Console.WriteLine("{0:n2}", progress * 100);

            if (request_number == Config.map_tasks_count)
            {

                CurrentApplication.OnMapLoaded(Config.mapName);
            }
        }

        private void bsp_initilised(q3bsptree bsp)
		{
			camera.playerMover = new Q3Movement(camera,bsp);

            // although we have the bsp tree
            // the rest of map not fully loaded yet
        }

		private void bsp_entities_initilised(List<Q3Entity> entities)
        {
            // Process entities loaded from the map  

            foreach (Q3Entity entity in entities)
            {
                Console.WriteLine("[entity] {3}-{0} {1} {2} ", entity.classname, entity.targetname, entity.name, entity.Index);

            }
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

                float zAngle;
                float xAngle;

                if (spawnPoint.Fields.ContainsKey("angle"))
                {
                    zAngle = (float)spawnPoint.Fields["angle"];
                }
                else
                {
                    zAngle = 0.0f;
                }

                zAngle = -(zAngle);
                zAngle *= ((float)Math.PI / 180.0f) + ((float)Math.PI * 0.5f); // Negative angle in radians + 90 degrees

                xAngle = 0.0f;

                Vector3 rotation = new Vector3(xAngle, 0.0f, zAngle);

                Vector3 origin = (Vector3)spawnPoint.Fields["origin"];
                origin.Z += 30; // Start a little ways above the floor

                camera.setOrigin(origin, rotation);

                camera.velocity = Vector3.Zero;

                //camera.Reset();
            }
        }

        protected override void OnRenderFrame(FrameEventArgs e)
        {
            _prev = DateTime.Now;
            GL.Clear(ClearBufferMask.ColorBufferBit | ClearBufferMask.DepthBufferBit);

            if (map == null || camera.playerMover == null)
            {
                return;
            }

            
            updateInput((float)e.Time);

            drawFrame((float)e.Time);

            if (e != null)
            {
                UpdateTitle(e);
            }
            SwapBuffers();
        }


        protected override void OnResize(EventArgs e)
        {
            float aspectRatio = this.Width / (float)this.Height;
            float zNear = 1.0f;
            float zFar = 4096.0f;
            float fovYRadians = (float)Math.PI / 4.0f;

            GL.Viewport(0, 0, Width, Height);

            leftProjMat = Matrix4.CreatePerspectiveFieldOfView(fovYRadians, aspectRatio, zNear, zFar);
            //leftProjMat = makePerspectiveMatrix(fovYRadians, aspectRatio, zNear, zFar);
            //mat4.perspective(45.0, canvas.width/canvas.height, 1.0, 4096.0, leftProjMat);
        }

        protected override void OnUpdateFrame(FrameEventArgs e)
        {

        }


        public Matrix4 getViewMatrix(bool translated, Vector3? vrPosition, Vector4? vrOrientation, Vector3? eyeOffset, Matrix4 projection)
        {
            Matrix4 result = Matrix4.Identity;

            //if (vrPosition.HasValue)
            //{
            //    //Quaternion orientationQuaternion = getQuaternionXYZW(-vrOrientation.Value.X, -vrOrientation.Value.Y, -vrOrientation.Value.Z, vrOrientation.Value.W);
            //    //hmdOrientationMatrix = mat4FromQuat(orientationQuaternion);
            //    //quat4.toMat4([-vrPosition.orientation.x, -vrPosition.orientation.y, -vrPosition.orientation.z, vrPosition.orientation.w], hmdOrientationMatrix);

            //    if (eyeOffset != null)
            //    {
            //        result = result.translate(-eyeOffset.Value.X * Config.vrIPDScale, -eyeOffset.Value.Y * vrIPDScale, -eyeOffset.Value.Z * vrIPDScale);
            //        //mat4.translate(out, [-eyeOffset[0]*vrIPDScale, -eyeOffset[1]*vrIPDScale, -eyeOffset[2]*vrIPDScale]);
            //    }

            //    result = result.multiply(hmdOrientationMatrix);
            //    //mat4.multiply(out, hmdOrientationMatrix, out);

            //    if (translated && vrPosition['position'])
            //    {
            //        result = result.translate(-vrPosition.position.x * vrIPDScale, -vrPosition.position.y * vrIPDScale, -vrPosition.position.z * vrIPDScale);
            //        //mat4.translate(out, [-vrPosition.position.x*vrIPDScale, -vrPosition.position.y*vrIPDScale, -vrPosition.position.z*vrIPDScale]);
            //    }

            //    return result;
            //}

            camera.ApplyTransformations();
            result = result * camera.Matrix;

            if (camera.HasChanges)
            {
                //camera_onchange(camera);
            }

            //display_player_position(camera.Position);

            return result;
        }

        private void drawFrame(float frameTime)
        {
            Viewport leftViewport;

            // Clear back buffer but not color buffer (we expect the entire scene to be overwritten)
            GL.DepthMask(true);
            GL.Clear(ClearBufferMask.DepthBufferBit);
            //gl.clearColor(0.0, 0.0, 0.0,1.0);

            if (map == null || camera.playerMover == null) { return; }

            bool translated = true;
            // Matrix setup
            leftViewMat = getViewMatrix(translated, null, null, null, leftProjMat);

            leftViewport = new Viewport();
            leftViewport.width = (double)this.Width;
            leftViewport.height = (double)this.Height;
            leftViewport.x = 0.0;
            leftViewport.y = 0.0;

            if (drawMap)
            {
                //float time = (float)(DateTime.Now.Ticks - startTime) / 1000.0f;

                if (q3bsp.skybox_env != null)
                {
                    q3bsp.skybox_env.render(frameTime, leftViewport, leftViewMat, leftProjMat);
                }

                q3bsp.draw(leftViewMat, leftProjMat, leftViewport);
            }

            //player.RenderPlayerModels(gl, leftViewMat, leftProjMat, leftViewport);
        }

        private void moveLookLocked(int xDelta, int yDelta)
        {


            xAngle = xDelta * 0.0025f;
            yAngle = yDelta * 0.0025f;

            //xAngle = MathHelper.ClampCircular(xAngle, 0.0, TwoPi);
            //yAngle = MathHelper.ClampCircular(yAngle, 0.0, TwoPi);

            //xAngle = MathHelper.ClampCircular(xAngle, 0.0, TwoPi);
            //yAngle = MathHelper.ClampCircular(yAngle, 0.0, HalfPi);

            //    while (xAngle < 0)
            //      xAngle += TwoPi;
            //    while (xAngle >= TwoPi)
            //      xAngle -= TwoPi;
            //
            //    while (yAngle < -HalfPi)
            //      yAngle = -HalfPi;
            //    while (yAngle > HalfPi)
            //      yAngle = HalfPi;

            camera.ApplyYaw(xAngle);
            camera.ApplyPitch(yAngle);

            camera.ApplyRotation();
        }

        private float filterDeadzone(float value)
        {
            return Math.Abs(value) > 0.35f ? value : 0;
        }

        private void moveViewOriented(Vector3 direction, int frameTime)
        {
            //  if(direction[0] != 0 || direction[1] != 0 || direction[2] != 0) 
            //  {      
            //      cameraMat = new Matrix4.identity();
            //      
            //      if (vrEnabled == true) 
            //      {
            //        vrEuler = eulerFromQuaternion(vrPosition['orientation'], VrPositionCoordinateOrder.YXZ);
            //
            //        cameraMat = cameraMat.rotateZ(camera.zAngle - vrEuler[1]);
            //      } 
            //      else 
            //      {
            //        cameraMat = cameraMat.rotateZ(camera.zAngle);
            //      }
            //      
            //      cameraMat = mat4_inverse(cameraMat);
            //      cameraMat = mat4MultiplyVec3(cameraMat, direction);
            //  }

            // Send desired movement direction to the player mover for collision detection against the map
            camera.playerMover.move(direction, frameTime);


        }

        private void updateInput(float frameTime)
        {
            if (camera.playerMover == null) { return; }

            Vector3 direction = Vector3.Zero;


            if (Keyboard[Key.W])
            {
                direction += camera.Direction * Config.playerDirectionMagnitude;
            }
            if (Keyboard[Key.S])
            {
                direction -= camera.Direction * Config.playerDirectionMagnitude;
            }
            if (Keyboard[Key.A])
            {
                camera.Right = camera.Up.Cross(camera.Direction);
                direction += camera.Right * Config.playerDirectionMagnitude;
            }
            if (Keyboard[Key.D])
            {
                camera.Right = camera.Up.Cross(camera.Direction);
                direction -= camera.Right * Config.playerDirectionMagnitude;
            }

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
                camera.ApplyPitch(-0.1f); // yaw
                rotated = true;
            }
            if (Keyboard[Key.Down])
            {
                camera.ApplyPitch(0.1f); // yaw
                rotated = true;
            }

            if (rotated)
            {
                camera.ApplyRotation();
            }



            //playerMover.move(vec3(direction),frameTime);

            camera.move(direction, frameTime);
            //camera.update(frameTime);
        }






    }
}
