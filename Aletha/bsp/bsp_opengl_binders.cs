using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OpenTK;
using OpenTK.Graphics.OpenGL4;

namespace Aletha.bsp
{

    public class bsp_opengl_binders
    {
        // Draw the map

        public static void bindShaderMatrix(shader_prog_t shader, Matrix4 modelViewMat, Matrix4 projectionMat)
        {
            GL.UniformMatrix4(shader.uniform["modelViewMat"], false, ref modelViewMat);
            GL.UniformMatrix4(shader.uniform["projectionMat"], false, ref projectionMat);
        }

        public static void bindShaderAttribs(shader_prog_t shader)
        {

            // Setup vertex attributes
            GL.EnableVertexAttribArray(shader.attrib["position"]);
            GL.VertexAttribPointer(shader.attrib["position"], 3,
                                   VertexAttribPointerType.Float,
                                   false,
                                   Config.q3bsp_vertex_stride,
                                   0);

            if (shader.attrib.ContainsKey("texCoord"))
            {
                GL.EnableVertexAttribArray(shader.attrib["texCoord"]);
                GL.VertexAttribPointer(shader.attrib["texCoord"], 2,
                                       VertexAttribPointerType.Float,
                                       false,
                                       Config.q3bsp_vertex_stride,
                                       3 * sizeof(float));
            }

            if (shader.attrib.ContainsKey("lightCoord"))
            {
                GL.EnableVertexAttribArray(shader.attrib["lightCoord"]);
                GL.VertexAttribPointer(shader.attrib["lightCoord"],
                                       2,
                                       VertexAttribPointerType.Float,
                                       false,
                                       Config.q3bsp_vertex_stride,
                                       5 * sizeof(float));
            }

            if (shader.attrib.ContainsKey("normal"))
            {
                GL.EnableVertexAttribArray(shader.attrib["normal"]);
                GL.VertexAttribPointer(shader.attrib["normal"],
                    3,
                    VertexAttribPointerType.Float,
                    false,
                    Config.q3bsp_vertex_stride,
                    7 * sizeof(float));
            }

            if (shader.attrib.ContainsKey("color"))
            {
                GL.EnableVertexAttribArray(shader.attrib["color"]);
                GL.VertexAttribPointer(shader.attrib["color"],
                    4,
                    VertexAttribPointerType.Float,
                    false,
                    Config.q3bsp_vertex_stride,
                    10 * sizeof(float));
            }
        }


    }
}
