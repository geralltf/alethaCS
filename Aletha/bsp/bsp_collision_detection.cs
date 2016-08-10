using OpenTK;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Aletha.bsp
{
    /// <summary>
    ///  BSP Collision Detection
    /// </summary>
    public class bsp_collision_detection
    {
        public static Vector3? trace(long traceId, Vector3 start, Vector3 end, float radius, bool slide = false)
        {
            if (radius == 0) { radius = 0.0f; }

            if (BspCompiler.brushSides == null) { return end; }

            TraceOutput output = new TraceOutput()
            {
                startsOut = true,
                allSolid = false,
                plane = null,
                fraction = 1.0f
            };


            traceNode(0, 0, 1, start, end, radius, output);

            if (output.fraction != 1)
            { // collided with something
                if (slide && output.plane != null)
                {
                    float endDist = (float)Math.Abs (Vector3.Dot(end, output.plane.normal) - (output.plane.distance + radius + 0.03125));

                    end.X = end.X + endDist * (output.plane.normal.X);
                    end.Y = end.Y + endDist * (output.plane.normal.Y);
                    end.Z = end.Z + endDist * (output.plane.normal.Z);

                    //for (var i = 0; i< 3; i++) {
                    //    end[i] = end[i] + endDist* (output.plane.normal[i]);
                    //}
                }
                else
                {
                    end.X = start.X + output.fraction * (end.X - start.X);
                    end.Y = start.Y + output.fraction * (end.Y - start.Y);
                    end.Z = start.Z + output.fraction * (end.Z - start.Z);

                    //for (var i = 0; i< 3; i++) {
                    //    end[i] = start[i] + output.fraction * (end[i] - start[i]);
                    //}
                }
            }


            q3bsp.postMessage2(new MessageParams()
            {
                type = "trace",
                traceId = traceId,
                end = end
            }, null);

            return null;
        }

        public static void traceNode(long nodeIdx, float startFraction, float endFraction,
            Vector3 start, Vector3 end, float radius, TraceOutput output)
        {
            if (nodeIdx < 0)
            { // Leaf node?
                Leaf leaf = BspCompiler.leaves[(int)-(nodeIdx + 1)];

                for (int i = 0; i < leaf.leafBrushCount; i++)
                {
                    Brush brush = BspCompiler.brushes[(int)BspCompiler.leafBrushes[(int)(leaf.leafBrush) + i]];
                    shader_p shader = BspCompiler.shaders[(int)brush.shader];

                    if (brush.brushSideCount > 0 && (shader.contents == 0)) // (shader['contents'] & 1)) 
                    {
                        traceBrush(brush, start, end, radius, ref output);
                    }
                }
                return;
            }

            // Tree node
            bsp_tree_node node = BspCompiler.nodes[(int)nodeIdx];
            Plane plane = BspCompiler.planes[(int)node.plane];

            float startDist = Vector3.Dot(plane.normal, start) - plane.distance;
            float endDist = Vector3.Dot(plane.normal, end) - plane.distance;

            if (startDist >= radius && endDist >= radius)
            {
                traceNode(node.children[0], startFraction, endFraction, start, end, radius, output);
            }
            else if (startDist < -radius && endDist < -radius)
            {
                traceNode(node.children[1], startFraction, endFraction, start, end, radius, output);
            }
            else
            {
                int side;
                float fraction1, fraction2, middleFraction;
                Vector3 middle = Vector3.Zero;

                if (startDist < endDist)
                {
                    side = 1; // back
                    var iDist = 1 / (startDist - endDist);
                    fraction1 = (startDist - radius + 0.03125f) * iDist;
                    fraction2 = (startDist + radius + 0.03125f) * iDist;
                }
                else if (startDist > endDist)
                {
                    side = 0; // front
                    var iDist = 1 / (startDist - endDist);
                    fraction1 = (startDist + radius + 0.03125f) * iDist;
                    fraction2 = (startDist - radius - 0.03125f) * iDist;
                }
                else
                {
                    side = 0; // front
                    fraction1 = 1.0f;
                    fraction2 = 0.0f;
                }

                if (fraction1 < 0) fraction1 = 0.0f;
                else if (fraction1 > 1) fraction1 = 1.0f;
                if (fraction2 < 0) fraction2 = 0.0f;
                else if (fraction2 > 1) fraction2 = 1.0f;

                middleFraction = startFraction + (endFraction - startFraction) * fraction1;

                middle.X = start.X + fraction1 * (end.X - start.X);
                middle.Y = start.Y + fraction1 * (end.Y - start.Y);
                middle.Z = start.Z + fraction1 * (end.Z - start.Z);
                //for (var i = 0; i < 3; i++)
                //{
                //    middle[i] = start[i] + fraction1 * (end[i] - start[i]);
                //}

                traceNode(node.children[side], startFraction, middleFraction, start, middle, radius, output);

                middleFraction = startFraction + (endFraction - startFraction) * fraction2;

                middle.X = start.X + fraction2 * (end.X - start.X);
                middle.Y = start.Y + fraction2 * (end.Y - start.Y);
                middle.Z = start.Z + fraction2 * (end.Z - start.Z);
                //for (var i = 0; i < 3; i++)
                //{
                //    middle[i] = start[i] + fraction2 * (end[i] - start[i]);
                //}

                traceNode(node.children[side == 0 ? 1 : 0], middleFraction, endFraction, middle, end, radius, output);
            }
        }

        private static void traceBrush(Brush brush, Vector3 start, Vector3 end, float radius, ref TraceOutput output)
        {
            float startFraction = -1;
            float endFraction = 1;
            bool startsOut = false;
            bool endsOut = false;
            Plane collisionPlane = null;

            for (var i = 0; i < brush.brushSideCount; i++)
            {
                BrushSide brushSide = BspCompiler.brushSides[(int)brush.brushSide + i];
                Plane plane = BspCompiler.planes[(int)brushSide.plane];

                float startDist = Vector3.Dot(start, plane.normal) - (plane.distance + radius);
                float endDist = Vector3.Dot(end, plane.normal) - (plane.distance + radius);

                if (startDist > 0) startsOut = true;
                if (endDist > 0) endsOut = true;

                // make sure the trace isn't completely on one side of the brush
                if (startDist > 0 && endDist > 0) { return; }
                if (startDist <= 0 && endDist <= 0) { continue; }

                if (startDist > endDist)
                { // line is entering into the brush
                    float fraction = (startDist - 0.03125f) / (startDist - endDist);
                    if (fraction > startFraction)
                    {
                        startFraction = fraction;
                        collisionPlane = plane;
                    }
                }
                else
                { // line is leaving the brush
                    float fraction = (startDist + 0.03125f) / (startDist - endDist);
                    if (fraction < endFraction)
                        endFraction = fraction;
                }
            }

            if (startsOut == false)
            {
                output.startsOut = false;
                if (endsOut == false)
                    output.allSolid = true;
                return;
            }

            if (startFraction < endFraction)
            {
                if (startFraction > -1 && startFraction < output.fraction)
                {
                    output.plane = collisionPlane;
                    if (startFraction < 0)
                        startFraction = 0;
                    output.fraction = startFraction;
                }
            }

            return;
        }
    }
}