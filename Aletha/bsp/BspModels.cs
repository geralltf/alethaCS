using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OpenTK;
using OpenTK.Graphics.OpenGL4;
using System.Runtime.InteropServices;

namespace Aletha.bsp
{

    
    public class Q3Entity
    {
        //public Entity entity;
        public string name;
        public string classname;
        public string targetname;
        public int Index;
        public Dictionary<string, object> Fields = new Dictionary<string, object>();
    }

    //class trace_output
    //    {
    //        bool allSolid;
    //        bool startSolid;
    //        double fraction;
    //        Vector3 endPos;
    //        Plane plane;
    //    }
    //    class Plane
    //    {
    //        Vector3 normal;
    //        double distance;
    //    }

    //public class Entity
    //{
    //    public string classname;
    //    public string targetname;
    //    public float? angle;
    //    public Vector3 origin;
    //}

    public class bsp_tree
    {
        public List<Plane> planes;
        public List<bsp_tree_node> nodes;
        public List<Leaf> leaves;
        public List<long> leafFaces;
        public List<long> leafBrushes;
        public List<Brush> brushes;
        public List<BrushSide> brushSides;
        public List<shader_p> surfaces;
        public ushort[] visBuffer;
        public long visSize;
    }

    public class bsp_tree_node
    {
        public long plane; // long
        public long[] children; // nodes are indexed, there are two
        public long[] min;
        public long[] max;
    }

    public class sky_env_map_p
    {
        public string @params;
        public List<string> cubemap_urls;
        public bool single_textured;

        public sky_env_map_p(string skyparams)
        {
            this.@params = skyparams;

            single_textured = true;
            cubemap_urls = new List<string>();
        }
    }

    public class shader_p
    {
        public string shaderName;
        public int flags;
        public int contents;
        public shader_gl shader;
        public List<Face> faces;
        public int indexOffset;
        public int elementCount = 0;
        public bool visible = true;
        public long geomType;
    }
    public class shader_t
    {
        public string url;
        public string name = null;
        public string cull = "back";
        public bool sky = false;
        public bool blend = false;
        public bool opaque = false;
        public int sort = 0;
        public List<deform_t> vertexDeforms = new List<deform_t>();
        public List<stage_t> stages = new List<stage_t>();
        public sky_env_map_p sky_env_map;
    }
    public class shader_gl
    {
        public string name;
        public List<stage_gl> stages;
        public CullFaceMode? cull;
        public bool blend;
        public int sort;
        public bool sky;
        public bool model;
        public sky_env_map_p sky_env_map;
    }
    public class stage_t
    {
        public string map = null;
        public bool clamp = false;
        public string tcGen = "base";
        public string rgbGen = "identity";
        public waveform_t rgbWaveform = null;
        public string alphaGen = "1.0";
        public string alphaFunc = null;
        public waveform_t alphaWaveform = null;
        public string blendSrc = "GL_ONE";//can be int problem
        public string blendDest = "GL_ZERO";
        public bool hasBlendFunc = false;
        public List<tcMod_t> tcMods = new List<tcMod_t>();
        public List<string> animMaps = new List<string>(); // list of URIs
        public double animFreq = 0;
        public string depthFunc = "lequal";// can be int problem
        public bool depthWrite = true;
        public bool isLightmap = false;
        public bool depthWriteOverride = false;
        public List<stage_t> stages = new List<stage_t>();
        public bool blend;
        public bool opaque;
        public shader_src_t shaderSrc;
        //public var texture;
        //public var animFrame;
        //public var animTexture;
    }
    public class stage_gl
    {
        public string map;
        public double? animFreq;
        public int texture;
        public List<int> animTexture = new List<int>();
        public shader_prog_t program;
        public int blendSrc;
        public int blendDest;
        public bool depthWrite;
        public DepthFunction depthFunc;
        public bool isLightmap;
        public List<string> animMaps = new List<string>(); // list of URIs
        public int animFrame;
        public shader_src_t shaderSrc;
        public bool clamp;

        public string tcGen = "base";
        public string rgbGen = "identity";
        public waveform_t rgbWaveform = null;
        public string alphaGen = "1.0";
        public string alphaFunc = null;
        public waveform_t alphaWaveform = null;
        public bool hasBlendFunc = false;
        public List<tcMod_t> tcMods = new List<tcMod_t>();
        public bool depthWriteOverride = false;
        public List<stage_t> stages = new List<stage_t>();
        public bool blend;
        public bool opaque;
    }

    public class shader_src_t
    {
        public vertex_shader_src_t vertex;
        public fragment_shader_src_t fragment;
    }

    public class tcMod_t
    {
        public String type;
        public double angle;
        public double scaleX;
        public double scaleY;
        public double sSpeed;
        public double tSpeed;
        public waveform_t waveform;
        public turbulance_t turbulance;
    }

    public class turbulance_t
    {
        public double @base;
        public double amp;
        public double phase;
        public double freq;
    }

    public class waveform_t
    {
        public String funcName;
        public double @base;
        public double amp;
        public object phase; // string then set as double 
        public double freq;
    }

    public class deform_t
    {
        public String type;
        public double spread;
        public waveform_t waveform;
    }

    public class vertex_shader_src_t
    {
        public String source_code;
    }

    public class fragment_shader_src_t
    {
        public String source_code;
    }

    public class shader_prog_t
    {
        public int program;
        public Dictionary<string,int> attrib = new Dictionary<string, int>();
        public Dictionary<string,int> uniform = new Dictionary<string, int>();
    }

    public class surface_t
    {
        public String shaderName;
        public int geomType;
        public shader_gl shader;
        public int elementCount;
        public int indexOffset;
        public bool visible;
    }
    //class lightmap_t
    //{
    //    int x;
    //    int y;
    //    var width;
    //    var height;
    //    var bytes;
    //}
    //class lightmap_rect_t
    //{
    //    var x;
    //    var y;
    //    var xScale;
    //    var yScale;
    //}

    public class TraceOutput
    {
        public bool allSolid;
        public bool startSolid;
        public float fraction;
        public Vector3 endPos;

        public Plane plane;
        public bool startsOut;
    }

    public class Plane
    {
        public Vector3 normal;
        public float distance;
    }

    public class bsp_header_t
    {
        public String company;
        public String tag;
        public int version;
        public List<bsp_header_lump_t> lumps;
    }
    public class bsp_header_lump_t
    {
        public uint offset;
        public uint length;
    }
    public class Leaf
    {
        public int cluster;
        public int area;
        public int[] min;
        public int[] max;
        public int leafFace;
        public int leafFaceCount;
        public int leafBrush;
        public int leafBrushCount;
    }
    public class lightmap_rect_t
    {
        public float x, y;
        public float xScale, yScale;
    }
    public class lightmap_t
    {
        public int x, y;
        public int width, height;
        public byte[] bytes;
    }
    public struct Vertex
    {
        public Vector3 pos;
        public Vector2 texCoord;
        public Vector2 lmCoord;
        public Vector2 lmNewCoord;
        public Vector3 normal;
        public Vector4 color;

        public static readonly int Stride = Marshal.SizeOf(default(Vertex));
    }

    public struct vector2_int64_t
    {
        public int x;
        public int y;
        public vector2_int64_t(int x, int y)
        {
            this.x = x;
            this.y = y;
        }
    }

    public struct vector3_int64_t
    {
        public int x;
        public int y;
        public int z;
        public vector3_int64_t(int x, int y, int z)
        {
            this.x = x;
            this.y = y;
            this.z = z;
        }
    }

    public class Face
    {
        public int shader;
        public int effect;
        public int type;
        public int vertex;
        public int vertCount;
        public int meshVert;
        public int meshVertCount;
        public int lightmap;
        public vector2_int64_t lmStart;
        public vector2_int64_t lmSize;
        public Vector3 lmOrigin;
        public Vector3[] lmVecs;
        public Vector3 normal;
        public vector2_int64_t size;
        public int indexOffset;
    }
    public class Brush
    {
        public long brushSide;
        public long brushSideCount;
        public long shader;
    }
    public class BrushSide
    {
        public long plane;
        public long shader;
    }
    public class VisData
    {
        public ushort[] buffer;
        public long size;
    }

    public class BgMusic
    {
        public void play()
        {

        }
        public void pause()
        {

        }
    }
}
