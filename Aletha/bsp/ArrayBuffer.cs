// ArrayBuffer.
// This is the result of an interesting trick that Google does in their
// GWT port of Quake 2. (For floats, anyway...) Rather than parse and 
// calculate the values manually they share the contents of a byte array
// between several types of buffers, which allows you to push into one and
// read out the other. The end result is, effectively, a typecast!

using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;

namespace Aletha.bsp
{
    /// <summary>
    /// Array Buffer base class 
    /// Implicit array type conversions between primative types
    /// </summary>
    [StructLayout(LayoutKind.Explicit, Pack = 2)]
    public class ArrayBuffer
    {
        #region Fields

        [FieldOffset(0)]
        public int size;

        /// <summary>
        /// Shared buffer memory for quick memory access between all other buffer types bellow
        /// providing a quick means to cast between values of different buffer types.
        /// Works similar to JavaScript's and Google's ArrayBuffer.
        /// </summary>
        [FieldOffset(8)]
        public byte[] bytes;

        // no conversion is needed as 'shorts' field '
        // appear in 'bytes' field 
        // and short values appear in 'shorts' 
        // field when 'bytes' field is set due to shared memory.

        [FieldOffset(8)]
        protected ushort[] shorts;

        [FieldOffset(8)]
        protected short[] sshorts;

        [FieldOffset(8)]
        protected uint[] ints;

        [FieldOffset(8)]
        protected int[] sints;

        [FieldOffset(8)]
        protected float[] floats;

        [FieldOffset(8)]
        protected long[] longs;

        [FieldOffset(8)]
        protected ulong[] slongs;

        #endregion

        #region Properties

        public int SizeInBytes
        {
            get
            {
                return bytes.Length;
            }
        }

        #endregion

        #region Constructors

        public ArrayBuffer(int size)
        {
            bytes = new byte[size];
        }

        public ArrayBuffer(byte[] buffer)
        {
            bytes = buffer;

            //buffer = BitConverter.IsLittleEndian ? buffer.Reverse().ToArray() : buffer;
        }

        #endregion

        #region Implicit Operators

        public static implicit operator float[] (ArrayBuffer buffer)
        {
            return buffer.floats;
        }

        public static implicit operator Int16[] (ArrayBuffer buffer)
        {
            return buffer.sshorts;
        }

        public static implicit operator UInt16[] (ArrayBuffer buffer)
        {
            return buffer.shorts;
        }

        public static implicit operator Int64[] (ArrayBuffer buffer)
        {
            return buffer.longs;
        }

        public static implicit operator UInt64[] (ArrayBuffer buffer)
        {
            return buffer.slongs;
        }

        public static implicit operator int[] (ArrayBuffer buffer)
        {
            return buffer.sints;
        }

        #endregion
    }

    #region Array Buffer Types

    public class Int16ArrayBuffer : ArrayBuffer
    {
        public short[] Shorts
        {
            get
            {
                return base.sshorts;
            }
            set
            {
                base.sshorts = value;
            }
        }

        public Int16ArrayBuffer(int size) : base(size) { }

        public Int16ArrayBuffer(byte[] buffer) : base(buffer)
        {
            bytes = buffer;
        }

        public Int16ArrayBuffer(short[] buffer) : base(-1)
        {
            base.sshorts = buffer;
        }
    }

    public class UInt16ArrayBuffer : ArrayBuffer
    {
        public ushort[] Shorts
        {
            get
            {
                return base.shorts;
            }
            set
            {
                base.shorts = value;
            }
        }

        public UInt16ArrayBuffer(int size) : base(size) { }

        public UInt16ArrayBuffer(byte[] buffer) : base(buffer)
        {
            bytes = buffer;
        }

        public UInt16ArrayBuffer(ushort[] buffer) : base(-1)
        {
            base.shorts = buffer;
        }
    }

    public class Int32ArrayBuffer : ArrayBuffer
    {
        public int[] Ints
        {
            get
            {
                return base.sints;
            }
            set
            {
                base.sints = value;
            }
        }

        public Int32ArrayBuffer(int size) : base(size) { }

        public Int32ArrayBuffer(byte[] buffer) : base(buffer)
        {
            bytes = buffer;
        }

        public Int32ArrayBuffer(int[] buffer) : base(-1)
        {
            base.sints = buffer;
        }
    }

    public class UInt32ArrayBuffer : ArrayBuffer
    {
        public UInt32[] Ints
        {
            get
            {
                return base.ints;
            }
            set
            {
                base.ints = value;
            }
        }

        public UInt32ArrayBuffer(int size) : base(size) { }

        public UInt32ArrayBuffer(byte[] buffer) : base(buffer)
        {
            bytes = buffer;
        }

        public UInt32ArrayBuffer(UInt32[] buffer) : base(-1)
        {
            base.ints = buffer;
        }
    }

    public class Int64ArrayBuffer : ArrayBuffer
    {
        public long[] Longs
        {
            get
            {
                return base.longs;
            }
            set
            {
                base.longs = value;
            }
        }

        public Int64ArrayBuffer(int size) : base(size) { }

        public Int64ArrayBuffer(byte[] buffer) : base(buffer)
        {
            bytes = buffer;
        }

        public Int64ArrayBuffer(long[] buffer) : base(-1)
        {
            base.longs = buffer;
        }
    }

    public class UInt64ArrayBuffer : ArrayBuffer
    {
        public UInt64[] Longs
        {
            get
            {
                return base.slongs;
            }
            set
            {
                base.slongs = value;
            }
        }

        public UInt64ArrayBuffer(int size) : base(size) { }

        public UInt64ArrayBuffer(byte[] buffer) : base(buffer)
        {
            bytes = buffer;
        }

        public UInt64ArrayBuffer(UInt64[] buffer) : base(-1)
        {
            base.slongs = buffer;
        }
    }

    public class FloatArrayBuffer : ArrayBuffer
    {
        public float[] Floats
        {
            get
            {
                return base.floats;
            }
            set
            {
                base.floats = value;
            }
        }

        public FloatArrayBuffer(int size) : base(size) { }

        public FloatArrayBuffer(byte[] buffer) : base(buffer)
        {
            bytes = buffer;
        }

        public FloatArrayBuffer(float[] buffer) : base(-1)
        {
            base.floats = buffer;
        }
    }

    #endregion
}
