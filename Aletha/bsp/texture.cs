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

                    try
                    {


                        image = new Bitmap(url);

                        AlethaApplication.incReqests();
                        AlethaApplication.update_progress_bar(AlethaApplication.request_number, url);

                        onloadComplete(texture, image);

                        Console.WriteLine(url);
                    }
                    catch(Exception ex)
                    {
                        Console.WriteLine("[warning] could not find texture '{0}'", url);
                    }
                }


                //fetch_update(url);
            }
        }
    }
}
