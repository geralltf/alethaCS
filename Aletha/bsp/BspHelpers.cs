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
        public static Vector3 brightnessAdjust(Vector3 color, float factor)
        {
            float scale = 1.0f, temp = 0.0f;

            Vector3 c = new Vector3(color);

            c.X *= factor;
            c.Y *= factor;
            c.Z *= factor;

            if (c.X > 255f && (temp = 255f / c.X) < scale) { scale = temp; }
            if (c.Y > 255f && (temp = 255f / c.Y) < scale) { scale = temp; }
            if (c.Z > 255f && (temp = 255f / c.Z) < scale) { scale = temp; }

            c.X = (float)c.X * scale;
            c.Y = (float)c.Y * scale;
            c.Z = (float)c.Z * scale;

            return c;
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

        public static Vector4 colorToVec(uint color)
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


