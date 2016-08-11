using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OpenTK;

namespace Aletha.bsp
{
    public class bsp_tess
    {
        /// <summary>
        /// Build Bezier curve
        /// </summary>
        public static void Tesselate(Face face, List<Vertex> verts, List<int> meshVerts, int level)
        {
            if (level < 0) level = 0;

            int i, j, row, col, px, py;
            int off = face.vertex;
            //int count = face.vertCount;

            int L1 = level + 1;

            face.vertex = verts.Count;
            face.meshVert = meshVerts.Count;

            face.vertCount = 0;
            face.meshVertCount = 0;

            for (py = 0; py < face.size.y - 2; py += 2)
            {
                for (px = 0; px < face.size.x - 2; px += 2)
                {

                    int rowOff = (py * face.size.x);

                    // Store control points
                    Vertex c0 = verts[(int)(off + rowOff + px)], 
                           c1 = verts[(int)(off + rowOff + px + 1)], 
                           c2 = verts[(int)(off + rowOff + px + 2)];

                    rowOff += face.size.x;

                    Vertex c3 = verts[(int)(off + rowOff + px)], 
                           c4 = verts[(int)(off + rowOff + px + 1)], 
                           c5 = verts[(int)(off + rowOff + px + 2)];

                    rowOff += face.size.x;

                    Vertex c6 = verts[(int)(off + rowOff + px)], 
                           c7 = verts[(int)(off + rowOff + px + 1)], 
                           c8 = verts[(int)(off + rowOff + px + 2)];

                    int indexOff = face.vertCount;
                    face.vertCount += L1 * L1;

                    // Tesselate!
                    for (i = 0; i < L1; ++i)
                    {
                        float a = (float)i / (float)level;

                        Vector3 pos = getCurvePoint3(c0.pos, c3.pos, c6.pos, a);
                        Vector2 lmCoord = getCurvePoint2(c0.lmCoord, c3.lmCoord, c6.lmCoord, a);
                        Vector2 texCoord = getCurvePoint2(c0.texCoord, c3.texCoord, c6.texCoord, a);
                        Vector3 color = getCurvePoint3(c0.color, c3.color, c6.color, a);

                        Vertex vert = new Vertex()
                        {
                            pos = pos,
                            texCoord = texCoord,
                            lmCoord = lmCoord,
                            color = new Vector4(color.X, color.Y, color.Z, 1.0f),
                            lmNewCoord = new Vector2(0, 0),
                            normal = new Vector3(0, 0, 1)
                        };

                        verts.Add(vert);
                    }

                    for (i = 1; i < L1; i++)
                    {
                        float a = (float)i / (float)level;

                        Vector3 pc0 = getCurvePoint3(c0.pos, c1.pos, c2.pos, a);
                        Vector3 pc1 = getCurvePoint3(c3.pos, c4.pos, c5.pos, a);
                        Vector3 pc2 = getCurvePoint3(c6.pos, c7.pos, c8.pos, a);

                        Vector3 tc0 = getCurvePoint3(c0.texCoord, c1.texCoord, c2.texCoord, a);
                        Vector3 tc1 = getCurvePoint3(c3.texCoord, c4.texCoord, c5.texCoord, a);
                        Vector3 tc2 = getCurvePoint3(c6.texCoord, c7.texCoord, c8.texCoord, a);

                        Vector3 lc0 = getCurvePoint3(c0.lmCoord, c1.lmCoord, c2.lmCoord, a);
                        Vector3 lc1 = getCurvePoint3(c3.lmCoord, c4.lmCoord, c5.lmCoord, a);
                        Vector3 lc2 = getCurvePoint3(c6.lmCoord, c7.lmCoord, c8.lmCoord, a);

                        Vector3 cc0 = getCurvePoint3(c0.color, c1.color, c2.color, a);
                        Vector3 cc1 = getCurvePoint3(c3.color, c4.color, c5.color, a);
                        Vector3 cc2 = getCurvePoint3(c6.color, c7.color, c8.color, a);

                        for (j = 0; j < L1; j++)
                        {
                            float b = (float)i / (float)level;

                            Vector3 pos = getCurvePoint3(pc0, pc1, pc2, b);
                            Vector2 texCoord = getCurvePoint2(tc0, tc1, tc2, b);
                            Vector2 lmCoord = getCurvePoint2(lc0, lc1, lc2, b);
                            Vector3 color = getCurvePoint3(cc0, cc1, cc2, a);

                            Vertex vert = new Vertex()
                            {
                                pos = pos,
                                texCoord = texCoord,
                                lmCoord = lmCoord,
                                color = new Vector4(color.X, color.Y, color.Z, 1.0f),
                                lmNewCoord = new Vector2(0, 0),
                                normal = new Vector3(0, 0, 1)
                            };

                            verts.Add(vert);
                        }
                    }

                    face.meshVertCount += level * level * 6;

                    for (row = 0; row < level; ++row)
                    {
                        for (col = 0; col < level; ++col)
                        {
                            meshVerts.Add(indexOff + (row + 1) * L1 + col);
                            meshVerts.Add(indexOff + row * L1 + col);
                            meshVerts.Add(indexOff + row * L1 + (col + 1));

                            meshVerts.Add(indexOff + (row + 1) * L1 + col);
                            meshVerts.Add(indexOff + row * L1 + (col + 1));
                            meshVerts.Add(indexOff + (row + 1) * L1 + (col + 1));
                        }
                    }

                }
            }
        }

        /// <summary>
        /// Curve Tesselation
        /// </summary>
        public static Vector3 getCurvePoint3(Vector4 c0, Vector4 c1, Vector4 c2, float dist)
        {
            return getCurvePoint3(c0.Xyz, c1.Xyz, c2.Xyz, dist);
        }

        /// <summary>
        /// Curve Tesselation
        /// </summary>
        public static Vector3 getCurvePoint3(Vector2 c0, Vector2 c1, Vector2 c2, float dist)
        {
            return getCurvePoint3(new Vector3(c0), new Vector3(c1), new Vector3(c2), dist);
        }

        /// <summary>
        /// Curve Tesselation
        /// </summary>
        public static Vector3 getCurvePoint3(Vector3 c0, Vector3 c1, Vector3 c2, float dist)
        {
            Vector3 result;

            float b = 1.0f - dist;

            Vector3 a0;
            Vector3 a1;
            Vector3 a3;

            a0 = (c0 * (b * b));
            a1 = (c1 * (2f * b * dist));
            a3 = (c2 * (dist * dist));

            result = (a0 + a1 ) + a3;

            //   result =  vec3.add(
            //       vec3.add(
            //           vec3.scale(c0, (b*b), [0, 0, 0]),
            //           vec3.scale(c1, (2*b*dist), [0, 0, 0])
            //       ),
            //       vec3.scale(c2, (dist*dist), [0, 0, 0])
            //   );

            return result;
    }

        /// <summary>
        /// Curve Tesselation
        /// </summary>
        public static Vector2 getCurvePoint2(Vector3 c0, Vector3 c1, Vector3 c2, float dist)
        {
            return getCurvePoint2(c0.Xy, c1.Xy, c2.Xy, dist);
        }

        /// <summary>
        /// Curve Tesselation
        /// </summary>
        public static Vector2 getCurvePoint2(Vector2 c0, Vector2 c1, Vector2 c2, float dist)
        {
            Vector3 result;

            float b = 1.0f - dist;

            Vector3 c30 = new Vector3(c0.X, c0.Y, 0.0f);
            Vector3 c31 = new Vector3(c1.X, c1.Y, 0.0f);
            Vector3 c32 = new Vector3(c2.X, c2.Y, 0.0f);

            Vector3 a0;
            Vector3 a1;
            Vector3 a3;

            a0 = (c30 * (b * b));
            a1 = (c31 * (2f * b * dist));
            a3 = (c32 * (dist * dist));

            result = (a0 + a1) + a3;

            return new Vector2(result.X, result.Y);
        }
    }
}
