using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OpenTK.Graphics.OpenGL4;

namespace Aletha
{
    public class cubemap_texture_one : cubemap
    {
        //Texture skybox;

        public static void load(String url, OnTextueLoad onloading, OnTextueLoad onloadComplete)
        {
            texture.fetch_texture(url, (int skybox) =>
            {
                onloading(skybox);
            },
            (int skybox, System.Drawing.Bitmap image) =>
            {
                bool isPowerOf2 = false;
                System.Drawing.Imaging.BitmapData pixelData;

                pixelData = texture.UnlockBitmap(image);

                GL.Enable(EnableCap.TextureCubeMap);
                GL.BindTexture(TextureTarget.TextureCubeMap, skybox);

                //gl.texImage2D(types[i], 0, GL_RGB, pImage->columns(), pImage->rows(), 0, RenderingContext.RGBA,
                //     RenderingContext.UNSIGNED_BYTE, blob.data());
                GL.TexImage2D(TextureTarget.TextureCubeMap, 0, PixelInternalFormat.Rgba, image.Width, image.Height, 0, OpenTK.Graphics.OpenGL4.PixelFormat.Bgra, PixelType.UnsignedByte, pixelData.Scan0);

                GL.TexParameter(TextureTarget.TextureCubeMap, TextureParameterName.TextureWrapS, (int)TextureWrapMode.ClampToEdge);
                GL.TexParameter(TextureTarget.TextureCubeMap, TextureParameterName.TextureWrapT, (int)TextureWrapMode.ClampToEdge);
                GL.TexParameter(TextureTarget.TextureCubeMap, TextureParameterName.TextureMagFilter, (int)TextureMinFilter.Linear);
                GL.TexParameter(TextureTarget.TextureCubeMap, TextureParameterName.TextureMinFilter, (isPowerOf2 ? (int)TextureMinFilter.LinearMipmapNearest : (int)TextureMinFilter.Linear));

                if (isPowerOf2) GL.GenerateMipmap(GenerateMipmapTarget.Texture2D);

                onloadComplete(skybox);
            });
        }
    }
}
