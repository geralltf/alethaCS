using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OpenTK;
using OpenTK.Graphics.OpenGL4;
using System.Drawing;

namespace Aletha
{
    public delegate void OnTextueLoad(int texture);
    public delegate void OnTextueImageLoadComplete(int texture, System.Drawing.Bitmap image);

    public class texture
    {
        //TODO: implement async texture loading


        public static Dictionary<String, int> url_cache_texture = new Dictionary<String, int>();
        public static Dictionary<String, Object> data_cache_texture = new Dictionary<String, Object>();

        public static System.Drawing.Imaging.BitmapData UnlockBitmap(System.Drawing.Bitmap image)
        {
            System.Drawing.Imaging.BitmapData pixelData;
            System.Drawing.Rectangle boundingbox;

            boundingbox = new System.Drawing.Rectangle(0, 0, image.Width, image.Height);

            pixelData = image.LockBits(boundingbox,
                System.Drawing.Imaging.ImageLockMode.ReadOnly,
                System.Drawing.Imaging.PixelFormat.Format32bppArgb);

            return pixelData;
        }

        public static void fetch_texture(String url, OnTextueLoad onGlTexture, OnTextueImageLoadComplete onloadComplete)
        {
            int texture = -1;
            Bitmap image = null;

            if (onGlTexture != null)
            {
                if (url_cache_texture.ContainsKey(url))
                {
                    texture = url_cache_texture[url];
                }
                else
                {
                    texture = GL.GenTexture();
                }

                onGlTexture(texture);
            }

            if (onloadComplete != null)
            {
                if (data_cache_texture.ContainsKey(url))
                {
                    image = (Bitmap)data_cache_texture[url];
                }
                else
                {
                    //      fetch(url,'arraybuffer').then((HttpRequest request){
                    //        var respp = request.response;
                    //        
                    //        print("["+request.statusText+"] "+request.responseUrl);
                    //        
                    //        var image = respp;
                    //        onloadComplete(texture,image);
                    //      });

                    //try
                    //{
                        url = url.Replace("/", "\\"); // they are all located in base folder on local file system not on web

                        image = new Bitmap(url);

                        var newSize = GetTextureGLMaxSize(image);

                        Rescale(ref image, newSize);


                    //AlethaApplication.incReqests();
                    //    AlethaApplication.update_progress_bar(AlethaApplication.request_number, url);

                    //    onloadComplete(texture, image);

                    //    Console.WriteLine(url);
                    //}
                    //catch
                    //{
                    //    Console.WriteLine("[warning] could not find texture '{0}'", url);
                    //}
            }
                AlethaApplication.incReqests();
                AlethaApplication.update_progress_bar(AlethaApplication.request_number, url);

                onloadComplete(texture, image);

                Console.WriteLine(url);

                //fetch_update(url);
            }
        }

        public static void Rescale(ref Bitmap image, Size newSize)
        {
            if (image.Width != newSize.Width || image.Height != newSize.Height)
            {
                /* Scale the image according to OpenGL requirements */
                Image newImage = image.GetThumbnailImage(newSize.Width, newSize.Height, null, IntPtr.Zero);

                image.Dispose();
                image = (Bitmap)newImage;
            }
        }

        public static Size GetTextureGLMaxSize(Bitmap image)
        {
            Size result;
            int[] textureMaxSize;
            int glTexWidth, 
                glTexHeight;

            /*	Get the maximum texture size supported by OpenGL: */
            textureMaxSize = new int[] { 0 };
            GL.GetInteger(GetPName.MaxTextureSize, textureMaxSize);
            //gl.GetInteger(OpenGL.GL_MAX_TEXTURE_SIZE,textureMaxSize);

            /*	Find the target width and height sizes, which is just the highest
             *	posible power of two that'll fit into the image. */
            glTexWidth = textureMaxSize[0];
            glTexHeight = textureMaxSize[0];
            for (int size = 1; size <= textureMaxSize[0]; size *= 2)
            {
                if (image.Width < size)
                {
                    glTexWidth = size / 2;
                    break;
                }
                if (image.Width == size)
                    glTexWidth = size;

            }

            for (int size = 1; size <= textureMaxSize[0]; size *= 2)
            {
                if (image.Height < size)
                {
                    glTexHeight = size / 2;
                    break;
                }
                if (image.Height == size)
                    glTexHeight = size;
            }

            result = new Size()
            {
                Width = glTexWidth,
                Height = glTexHeight
            };

            return result;
        }
    }
}
