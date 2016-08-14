using System;
using System.Drawing;
using System.Reflection;

using OpenTK;
using OpenTK.Input;
using OpenTK.Graphics.OpenGL4;
using g = OpenTK.Graphics;
using System.Runtime.InteropServices;

namespace Aletha
{
    public partial class AlethaApplication
    {
        bool isFullscreen;
        private static bool systemCursorVisible = true;
        private int navType = (int)NavigationType.Walk;

        [DllImport("user32.dll")]
        private static extern int ShowCursor(bool bShow);

        public void ToggleCursor()
        {
            if (systemCursorVisible)
            {
                ShowCursor(false);
            }
            else
            {
                ShowCursor(true);
            }
            systemCursorVisible = !systemCursorVisible;
        }

        private void Keyboard_KeyDown(object sender, KeyboardKeyEventArgs e)
        {
            if (e.Key == Key.C)
            {
                camera.playerMover.crouchDn();
            }
            if (e.Key == Key.Space)
            {
                camera.playerMover.jump();
            }
            if (e.Key == Key.R)
            {
                RespawnPlayer(-1);
            }
            if (e.Key == Key.I)
            {
                camera.invert();
            }
        }

        private void Keyboard_KeyUp(object sender, OpenTK.Input.KeyboardKeyEventArgs e)
		{
			if (e.Key == Key.F) 
			{
				if (WindowState == WindowState.Fullscreen) 
				{
					WindowState = WindowState.Normal;
				} 
				else 
				{
					WindowState = WindowState.Fullscreen;
				}

                isFullscreen = !isFullscreen;

                ToggleCursor();
            }
            if (e.Key == Key.F1)
            {
                navType = (navType + 1) % (int)NavigationType._LastType;
                navigationType = (NavigationType)navType;
            }
            if (e.Key == Key.C)
            {
                camera.playerMover.crouchUp();
            }
		}


        /// <summary>
        /// The current time in the Virtual World
        /// The VWT
        /// </summary>
        public static TimeSpan WorldTime { get; set; }

        int fps;

        private int _fps = 0;
        private int draw_time;
        private DateTime time_at_init;


        public sealed class App
        {

            public static string MapPath(string relativePath)
            {
                return System.IO.Path.GetFullPath(relativePath);
            }

            public static string Path
            {
                get
                {
                    //return System.Windows.Forms.Application.StartupPath+"\\";
                    return (new System.IO.FileInfo(System.Reflection.Assembly.GetExecutingAssembly().Location)).Directory.FullName + "\\";
                }
            }
        }

        public static string AppInfo
        {
            get
            {
                Assembly asm;
                AssemblyProductAttribute productName;
                AssemblyFileVersionAttribute ver;
                AssemblyDescriptionAttribute desc;

                asm = Assembly.GetAssembly(typeof(Aletha.Program));
                productName = (AssemblyProductAttribute)Attribute.GetCustomAttribute(asm, typeof(AssemblyProductAttribute));
                ver = (AssemblyFileVersionAttribute)Attribute.GetCustomAttribute(asm, typeof(AssemblyFileVersionAttribute));
                desc = (AssemblyDescriptionAttribute)Attribute.GetCustomAttribute(asm, typeof(AssemblyDescriptionAttribute));

                return (productName.Product + " " + ver.Version + " " + desc.Description + "").Trim();
            }
        }

        private DateTime _prev;
        private System.Threading.Timer tmrTitleUpdate;
        private string title;

        const int TITLE_UPDATE_INTERVAL = 2000;

        private void UpdateTitle(FrameEventArgs e)
        {
#if LIVE_FPS
            draw_time=DateTime.Now.Subtract(_prev).Milliseconds;
            fps=GetFps(e.Time);

            string dt=draw_time.ToString();
            if(dt.Length<2) {
                if(dt.Length==1) {
                    dt=" "+dt;
                }
                else {
                    dt="  ";
                }
            }
            title=fps.ToString()+"f/s "+dt+"ms";
#else
            if (tmrTitleUpdate == null)
            {
                tmrTitleUpdate = new System.Threading.Timer(new System.Threading.TimerCallback(
                    (object obj) =>
                    {
                        draw_time = DateTime.Now.Subtract(_prev).Milliseconds;
                        fps = GetFps(e.Time);

                        string dt = draw_time.ToString();
                        if (dt.Length < 2)
                        {
                            if (dt.Length == 1)
                            {
                                dt = " " + dt;
                            }
                            else
                            {
                                dt = "  ";
                            }
                        }
                        title = fps.ToString() + "f/s " + dt + "ms";
                    }
                ), null, 0, TITLE_UPDATE_INTERVAL);
            }
#endif

            // update world time a bit faster:
            WorldTime = DateTime.Now.Subtract(time_at_init);
            this.Title = "Aletha Q3 C# Player " + title + " " + WorldTime.ToString() + "vwt " + progress_status;
        }

        private int GetFps(double time)
        {
            _fps = (int)(1.0 / time);

            return _fps;
        }

    }
}
