using OpenTK;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Aletha.bsp
{
    /// <summary>
    /// Visibility Checking
    /// </summary>
    public class BspVisibilityChecking
    {
        public static byte[] visBuffer;
        public static long visSize;

        private static bool checkVis(long visCluster, long testCluster)
        {
            if (visCluster == testCluster || visCluster == -1)
            {
                return true;
            }

            var i = (visCluster * visSize) + (testCluster >> 3);
            byte visSet = visBuffer[i];

            return ((visSet > 0) & (1 << ((int)testCluster & 7)) != 0);
        }

        public static int getLeaf(Vector3 pos)
        {
            int index = 0;

            bsp_tree_node node = null;
            Plane plane = null;
            double distance = 0.0;

            while (index >= 0)
            {
                node = BspCompiler.nodes[index];
                plane = BspCompiler.planes[(int)node.plane];

                distance = Vector3.Dot(plane.normal, pos) - plane.distance;

                if (distance >= 0)
                {
                    index = (int)node.children[0];
                }
                else
                {
                    index = (int)node.children[1];
                }
            }

            return -(index + 1);
        }

        public static void buildVisibleList(int leafIndex)
        {
            // Determine visible faces
            if (leafIndex == BspCompiler.lastLeaf) { return; }
            BspCompiler.lastLeaf = leafIndex;

            Leaf curLeaf = BspCompiler.leaves[leafIndex];

            Dictionary<long,bool> visibleShaders = new Dictionary<long, bool>(q3bsp.shaders.Count);

            for (var i = 0; i < BspCompiler.leaves.Count; ++i)
            {
                Leaf leaf = BspCompiler.leaves[i];

                if (checkVis(curLeaf.cluster, leaf.cluster))
                {
                    for (var j = 0; j < leaf.leafFaceCount; ++j)
                    {
                        Face face = BspCompiler.faces[(int)BspCompiler.leafFaces[j + (int)(leaf.leafFace)]];

                        if (face != null)
                        {
                            visibleShaders[face.shader] = true; // elementAt()
                        }
                    }
                }
            }

            byte[] ar = new byte[BspVisibilityChecking.visSize];

            for (int i = 0; i < BspVisibilityChecking.visSize; ++i)
            {
                ar[i] = BspVisibilityChecking.visBuffer[(curLeaf.cluster * BspVisibilityChecking.visSize) + i];
            }

            q3bsp.postMessage2( new MessageParams(){
                type = "visibility",
                visibleSurfaces = visibleShaders
            },null);
        }

    }
}


