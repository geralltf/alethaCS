using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OpenTK.Graphics.OpenGL4;

namespace Aletha
{
    public class cubemap_texture_six : cubemap // disable DEPTH_TEST to render behind scene
    {
        private static int skymap;
        //private static dynamic back, down, front, left, right, up;
        private static System.Drawing.Bitmap xpos, xneg, ypos, yneg, zpos, zneg;
        private static int num_loaded = 0;

        public static void LoadComplete(int index, TextureTarget target, OnTextueLoad onloadComplete) // OnSkymapLoadComplete
        {
            var context = new OpenTK.Graphics.GraphicsContext(AlethaApplication.GraphicsMode, AlethaApplication.NativeWindowContext.WindowInfo);
            context.MakeCurrent(AlethaApplication.NativeWindowContext.WindowInfo);

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
}
