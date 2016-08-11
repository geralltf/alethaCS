using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Runtime.InteropServices;

namespace Aletha.bsp
{
    /// <summary>
    /// Binary Stream Reader supporting 64 bit addressing.
    /// Better than BinaryReader and BitConverter but a work in progress.
    /// </summary>
    public class BinaryStreamReader
    {
        private Stream stream;
        private byte[] data;
        private ulong length;
        private ulong offset;

        public BinaryStreamReader(Stream stream)
        {
            this.stream = stream;
            this.length = (ulong)stream.Length;
            this.offset = 0;

            using (MemoryStream memoryStream = new MemoryStream())
            {
                stream.CopyTo(memoryStream);
                data = memoryStream.ToArray();
            }

            //reader = new BinaryReader(stream);
            stream.Position = 0;
        }

        #region Stream Movement

        public void Forward(ulong offset = 1)
        {
            this.offset += offset;
        }

        public void Backward(ulong offset = 1)
        {
            this.offset -= offset;
        }

        public ulong RemainingBytes()
        {
            return this.length - this.offset;
        }

        public ulong Count()
        {
            return this.length;
        }

        public bool Eof()
        {
            return this.offset >= this.length;
        }

        public void Seek(ulong offset)
        {
            this.offset = offset;
        }

        public ulong Tell()
        {
            return this.offset;
        }

        #endregion

        #region Binary Decoder

        /// <summary>
        /// Read a signed 32 bit integer from the stream
        /// </summary>
        public UInt32 ReadUInt32()
        {
            UInt32 value;

            byte[] tmp = new byte[4];

            Array.Copy(this.data, (long)this.offset, tmp, 0, 4); // 64 bit addressing

            UInt32ArrayBuffer bf_wia = new UInt32ArrayBuffer(tmp);

            value = bf_wia.Ints[0]; // implicit typecast combining 4 bytes into integer

            this.offset += sizeof(UInt32);

            return value;
        }

        /// <summary>
        /// Read a signed 32 bit integer from the stream
        /// </summary>
        public int ReadInt32()
        {
            int value;

            byte[] tmp = new byte[4];

            Array.Copy(this.data, (long)this.offset, tmp, 0, 4); // 64 bit addressing

            Int32ArrayBuffer bf_wia = new Int32ArrayBuffer(tmp);

            value = bf_wia.Ints[0]; // implicit typecast combining 4 bytes into long

            this.offset += sizeof(int);

            return value;
        }

        /// <summary>
        /// Read a signed byte from the stream
        /// </summary>
        public sbyte ReadByte()
        {
            sbyte value;

            value = (sbyte)((int)data[this.offset] & 0xff);

            value= (sbyte)((int)value - ((int)value & 0x80)); // signed

            this.offset += sizeof(sbyte);

            return value;
        }

        /// <summary>
        /// Read an unsigned byte from the stream
        /// </summary>
        public byte ReadUByte()
        {
            byte value;

            value = (byte)(data[this.offset] & 0xff);

            stream.Position = (long)offset;

            this.offset += sizeof(byte);

            return value;
        }

        /// <summary>
        /// Read a signed short (2 bytes) from the stream
        /// </summary>
        public Int16 ReadInt16()
        {
            short value;

            byte[] tmp = new byte[4];

            Array.Copy(this.data, (long)this.offset, tmp, 0, 4); // 64 bit addressing

            Int16ArrayBuffer bf_wia = new Int16ArrayBuffer(tmp);

            value = bf_wia.Shorts[0]; // implicit typecast combining 4 bytes into long

            this.offset += sizeof(short);

            return value;
        }

        /// <summary>
        /// Read an unsigned short (2 bytes) from the stream
        /// </summary>
        public UInt16 ReadUInt16()
        {
            ushort value;

            byte[] tmp = new byte[4];

            Array.Copy(this.data, (long)this.offset, tmp, 0, 4); // 64 bit addressing

            UInt16ArrayBuffer bf_wia = new UInt16ArrayBuffer(tmp);

            value = bf_wia.Shorts[0]; // implicit typecast combining 4 bytes into long

            this.offset += sizeof(ushort);

            return value;
        }

        /// <summary>
        /// Read a signed long (4 bytes) from the stream
        /// </summary>
        public Int64 ReadInt64()
        {
            if (this.offset > (ulong)this.data.Length) return -1;

            long value;

            byte[] tmp = new byte[4];

            Array.Copy(this.data, (long)this.offset, tmp, 0, 4); // 64 bit addressing

            Int64ArrayBuffer bf_wia = new Int64ArrayBuffer(tmp);

            value = bf_wia.Longs[0]; // implicit typecast combining 4 bytes into integer

            this.offset += sizeof(Int64);

            return value;
        }

        /// <summary>
        /// Read an unsigned long (4 bytes) from the stream
        /// </summary>
        public UInt64 ReadUInt64()
        {
            UInt64 value;

            byte[] tmp = new byte[4];

            Array.Copy(this.data, (long)this.offset, tmp, 0, tmp.Length); // 64 bit addressing

            UInt64ArrayBuffer bf_wia = new UInt64ArrayBuffer(tmp);

            value = bf_wia.Longs[0]; // implicit typecast combining 4 bytes into integer

            this.offset += sizeof(ulong);

            return value;
        }

        /// <summary>
        /// Read a float (4 bytes) from the stream
        /// </summary>
        public float ReadFloat()
        {
            float value;
            
            byte[] tmp = new byte[4];

            Array.Copy(this.data, (int)this.offset, tmp, 0, 4);

            FloatArrayBuffer bf_wfa = new FloatArrayBuffer(tmp);

            value = bf_wfa.Floats[0]; // implicit typecast combining 4 bytes into float

            this.offset += sizeof(float);

            return value;
        }


        public int ExpandHalf(ushort h)
        {
            int s = (h & 0x8000) >> 15;
            int e = (h & 0x7C00) >> 10;
            int f = h & 0x03FF;

            if (e == 0)
            {
                return (s == 0 ? -1 : 1) * (int)Math.Pow(2, -14) * (f / (int)Math.Pow(2, 10));
            }
            else if (e == 0x1F)
            {
                return (f != 0) ? int.MinValue : (((s != 0) ? -1 : 1) * int.MaxValue);
            }

            return (s == 0 ? -1 : 1) * (int)Math.Pow(2, e - 15) * (1 + (f / (int)Math.Pow(2, 10)));
        }

        public int ReadHalf()
        {
            ushort h = this.ReadUInt16();
            return this.ExpandHalf(h);
        }

        public string ReadString(ulong offset, ulong length)
        {
            string result;
            byte[] chrset;
            int i;

            this.offset += offset;

            ulong number_of_bytes = length; 

            chrset = new byte[number_of_bytes];

            Array.Copy(this.data, (long)this.offset, chrset, 0, (int)number_of_bytes); 

            result = UTF8Encoding.UTF8.GetString(chrset);

            i = result.IndexOf("\0");

            result = result.Contains("\0") ? i == 0 ? "" : result.Substring(0, i) : result;

            this.offset += number_of_bytes;

            return result;
        }

        #endregion
    }
}
