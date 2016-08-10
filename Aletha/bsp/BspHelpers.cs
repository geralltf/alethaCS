using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OpenTK;

namespace Aletha.bsp
{
    public class BspHelpers
    {
        /// <summary>
        /// Scale up an RGB color
        /// </summary>
        public static byte[] brightnessAdjust(byte[] color, float factor)
        {
            float scale = 1.0f, temp = 0.0f;

            color[0] = (byte)((float)color[0] * factor);
            color[1] = (byte)((float)color[1] * factor);
            color[2] = (byte)((float)color[2] * factor);

            if (color[0] > 255 && (temp = 255 / color[0]) < scale) { scale = temp; }
            if (color[1] > 255 && (temp = 255 / color[1]) < scale) { scale = temp; }
            if (color[2] > 255 && (temp = 255 / color[2]) < scale) { scale = temp; }

            color[0] = (byte)((float)color[0] * scale);
            color[1] = (byte)((float)color[1] * scale);
            color[2] = (byte)((float)color[2] * scale);

            return color;
        }

        public static Vector4 brightnessAdjustVertex(Vector4 color, float factor)
        {
            float scale = 1.0f, temp = 0.0f;

            color.X *= factor;
            color.Y *= factor;
            color.Z *= factor;

            if (color.X > 1 && (temp = 1 / color.X) < scale) { scale = temp; }
            if (color.Y > 1 && (temp = 1 / color.Y) < scale) { scale = temp; }
            if (color.Z > 1 && (temp = 1 / color.Z) < scale) { scale = temp; }

            color.X *= scale;
            color.Y *= scale;
            color.Z *= scale;

            return color;
        }

        public static Vector4 colorToVec(ulong color)
        {
            return new Vector4(
                (color & 0xFF) / 0xFF,
                ((color & 0xFF00) >> 8) / 0xFF,
                ((color & 0xFF0000) >> 16) / 0xFF,
                1.0f
            );
        }

    }
}


