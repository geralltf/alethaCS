﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OpenTK;
using OpenTK.Graphics.OpenGL4;
using X3D;
using X3D.Engine;

namespace Aletha.bsp
{

    public class BspOpenglBinders
    {
        // Draw the map

        public static void BindShaderMatrix(shader_prog_t shader, Matrix4 modelViewMat, Matrix4 perspective)
        {
            Matrix4 model;
            SceneCamera cam;
            Matrix4 cameraTransl;
            Matrix4 cameraRot;
            Matrix4 MV;
            
            model = Matrix4.Identity;
            cam = AlethaApplication.camera;
            
            cameraTransl = Matrix4.CreateTranslation(-cam.Position - new Vector3(0, 0, Config.playerHeight));

            cameraRot = Matrix4.CreateFromQuaternion(cam.Orientation);

            MV = (model * cameraTransl) * cameraRot;

            GL.UniformMatrix4(shader.uniform["modelViewMat"], false, ref MV);
            GL.UniformMatrix4(shader.uniform["projectionMat"], false, ref perspective);
        }

        public static void BindShaderAttribs(shader_prog_t shader)
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
