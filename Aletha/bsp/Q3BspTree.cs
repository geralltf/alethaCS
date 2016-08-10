using System;
using OpenTK;



namespace Aletha.bsp
{
    delegate void OnBSPInitilised(q3bsptree bsp);



    /// <summary>
    /// BSP Tree Collision Detection
    /// </summary>
	public class q3bsptree
    {
        private bsp_tree bsp;

        public q3bsptree(bsp_tree bsp_data)
        {
            this.bsp = bsp_data;
        }

        public TraceOutput trace(Vector3 start, Vector3 end, float radius = 0.0f)
        {
            TraceOutput output = new TraceOutput()
            {
                allSolid = false,
                startSolid = false,
                fraction = 1.0f,
                endPos = end,
                plane = null
            };

            if (this.bsp == null)
            {
                return output;
            }

            output = this.traceNode(0, 0.0f, 1.0f, start, end, radius, output);

            if (output.fraction != 1.0f)
            {
                // collided with something

                output.endPos.X = start.X + output.fraction * (end.X - start.X);
                output.endPos.Y = start.Y + output.fraction * (end.Y - start.Y);
                output.endPos.Z = start.Z + output.fraction * (end.Z - start.Z);
            }

            return output;
        }

        public TraceOutput traceNode(long nodeIdx, float startFraction, float endFraction,
             Vector3 start, Vector3 end, float radius, TraceOutput output)
        {
            if (nodeIdx < 0) // Leaf node? 
            {
                Leaf leaf = this.bsp.leaves[(int)(-(nodeIdx + 1))];
                for (var i = 0; i < leaf.leafBrushCount; i++)
                {
                    Brush brush = this.bsp.brushes[(int)(this.bsp.leafBrushes[(int)(leaf.leafBrush + i)])];
                    shader_p surface = this.bsp.surfaces[(int)brush.shader];

                    if (brush.brushSideCount > 0 && surface.contents != 0) // surface['contents'] & 1 
                    {
                        output = this.traceBrush(brush, start, end, radius, output);
                    }
                }
                return output;
            }

            // Tree node
            bsp_tree_node node = this.bsp.nodes[(int)nodeIdx];
            Plane plane = this.bsp.planes[(int)node.plane];

            float startDist = Vector3.Dot(plane.normal, start) - plane.distance;
            float endDist = Vector3.Dot(plane.normal, end) - plane.distance;

            if (startDist >= radius && endDist >= radius)
            {
                output = this.traceNode(node.children[0], startFraction, endFraction, start, end, radius, output);
            }
            else if (startDist < -radius && endDist < -radius)
            {
                output = this.traceNode(node.children[1], startFraction, endFraction, start, end, radius, output);
            }
            else
            {
                int side;
                float fraction1;
                float fraction2;
                float middleFraction;

                Vector3 middle = Vector3.Zero;

                if (startDist < endDist)
                {
                    side = 1; // back
                    var iDist = 1 / (startDist - endDist);
                    fraction1 = (startDist - radius + Config.q3bsptree_trace_offset) * iDist;
                    fraction2 = (startDist + radius + Config.q3bsptree_trace_offset) * iDist;
                }
                else if (startDist > endDist)
                {
                    side = 0; // front
                    var iDist = 1 / (startDist - endDist);
                    fraction1 = (startDist + radius + Config.q3bsptree_trace_offset) * iDist;
                    fraction2 = (startDist - radius - Config.q3bsptree_trace_offset) * iDist;
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

                output = this.traceNode(node.children[side], startFraction, middleFraction, start, middle, radius, output);

                middleFraction = startFraction + (endFraction - startFraction) * fraction2;

                middle.X = start.X + fraction2 * (end.X - start.X);
                middle.Y = start.Y + fraction2 * (end.Y - start.Y);
                middle.Z = start.Z + fraction2 * (end.Z - start.Z);
                //for (var i = 0; i < 3; i++)
                //{
                //    middle[i] = start[i] + fraction2 * (end[i] - start[i]);
                //}

                output = this.traceNode(node.children[side == 0 ? 1 : 0], middleFraction, endFraction, middle, end, radius, output);
            }

            return output;
        }


        public TraceOutput traceBrush(Brush brush, Vector3 start, Vector3 end, float radius, TraceOutput output)
        {
            float startFraction = -1.0f;
            float endFraction = 1.0f;
            bool startsOut = false;
            bool endsOut = false;
            Plane collisionPlane = null;

            for (int i = 0; i < brush.brushSideCount; i++)
            {
                var brushSide = this.bsp.brushSides[(int)brush.brushSide + i];
                Plane plane = this.bsp.planes[(int)brushSide.plane];

                //Vector3

                float startDist = Vector3.Dot(start, plane.normal) - (plane.distance + radius);
                float endDist = Vector3.Dot(end, plane.normal) - (plane.distance + radius);

                if (startDist > 0) startsOut = true;
                if (endDist > 0) endsOut = true;

                // make sure the trace isn't completely on one side of the brush
                if (startDist > 0 && endDist > 0)
                {
                    return output;
                }
                if (startDist <= 0 && endDist <= 0)
                {
                    continue;
                }

                if (startDist > endDist)
                { // line is entering into the brush
                    float fraction = (startDist - Config.q3bsptree_trace_offset) / (startDist - endDist);

                    if (fraction > startFraction)
                    {
                        startFraction = fraction;
                        collisionPlane = plane;
                    }
                }
                else
                { // line is leaving the brush
                    float fraction = (startDist + Config.q3bsptree_trace_offset) / (startDist - endDist);
                    if (fraction < endFraction)
                        endFraction = fraction;
                }
            }

            if (startsOut == false)
            {
                output.startSolid = true;
                if (endsOut == false)
                    output.allSolid = true;
                return output;
            }

            if (startFraction < endFraction)
            {
                if (startFraction > -1 && startFraction < output.fraction)
                {
                    output.plane = collisionPlane;
                    if (startFraction < 0)
                        startFraction = 0.0f;
                    output.fraction = startFraction;
                }
            }

            return output;
        }
    }
}
