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

        public BinaryStreamReader forward(ulong offset)
        {
            this.offset += offset;
            return this;
        }
        public BinaryStreamReader backward(ulong offset)
        {
            this.offset -= offset;
            return this;
        }

        public ulong available()
        {
            return this.length - this.offset;
        }

        public ulong totalSize()
        {
            return this.length;
        }


        public ulong getPos()
        {
            return this.offset;
        }

        public void setPos(ulong newpos)
        {
            this.offset = newpos;
        }

        public bool eof()
        {
            return this.offset >= this.length;
        }

        // Seek to the given byt offset within the stream
        public void seek(ulong offset)
        {
            this.offset = offset;
        }

        public ulong tell()
        {
            return this.offset;
        }

        #endregion

        #region Binary Decoder

        private const int INT32_BYTES_PER_ELEMENT = 4;

        /// <summary>
        /// Read a signed 32 bit integer from the stream
        /// </summary>
        public UInt32 ReadUInt32()
        {
            UInt32 value;

            //fixed (byte* p = &data[0])
            //{
            //    value = Marshal.ReadInt32(new IntPtr(p), (int)this.offset);
            //}

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

            //fixed (byte* p = &data[0])
            //{
            //    value = Marshal.ReadInt32(new IntPtr(p), (int)this.offset);
            //}

            byte[] tmp = new byte[4];

            Array.Copy(this.data, (long)this.offset, tmp, 0, 4); // 64 bit addressing

            Int32ArrayBuffer bf_wia = new Int32ArrayBuffer(tmp);

            value = bf_wia.Ints[0]; // implicit typecast combining 4 bytes into long


            //TODO: use 64bit addressing
            //value = BitConverter.ToInt32(this.data, (int)this.offset);

            //Int32List values = this.bytes.asInt32List(this.offset, 1);
            //int number_of_bytes = INT32_BYTES_PER_ELEMENT * 1;

            //stream.Position = (long)offset;

            //value = reader.ReadInt32();

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
            ////byte @byte = data.getInt8(this.offset) & 0xff;

            //this.offset += 1;

            value= (sbyte)((int)value - ((int)value & 0x80)); // signed


            //stream.Position = (long)offset;

            //value = reader.ReadSByte();

            this.offset += sizeof(sbyte);

            return value;
        }

        /// <summary>
        /// Read an unsigned byte from the stream
        /// </summary>
        public byte ReadUByte()
        {
            byte value;

            ////byte @byte = data.getUint8(this.offset) & 0xff;
            value = (byte)(data[this.offset] & 0xff);

            //return @byte;

            

            stream.Position = (long)offset;

            //value = reader.ReadByte();


            this.offset += sizeof(byte);

            return value;
        }

        /// <summary>
        /// Read a signed short (2 bytes) from the stream
        /// </summary>
        public Int16 ReadInt16()
        {
            short value;

            //fixed (byte* p = &data[0])
            //{
            //    value = Marshal.ReadInt16(new IntPtr(p), (int)this.offset);
            //}

            byte[] tmp = new byte[4];

            Array.Copy(this.data, (long)this.offset, tmp, 0, 4); // 64 bit addressing

            Int16ArrayBuffer bf_wia = new Int16ArrayBuffer(tmp);

            value = bf_wia.Shorts[0]; // implicit typecast combining 4 bytes into long


            //value = BitConverter.ToInt16(data, (int)this.offset); // TODO: use 64bit addressing

            ////var i = this.offset;
            ////bf_wuba[0] = data.getUint8(i) & 0xff;
            ////bf_wuba[1] = data.getUint8(i + 1) & 0xff;
            //this.offset += 2;
            ////int s;
            ////s = bf_wsa[0];
            //return s; // typecast combining 2 bytes into a short



            //stream.Position = (long)offset;

            //value = reader.ReadInt16();


            this.offset += sizeof(short);

            return value;
        }

        /// <summary>
        /// Read an unsigned short (2 bytes) from the stream
        /// </summary>
        public UInt16 ReadUInt16()
        {
            ushort value;

            //fixed (byte* p = &data[0])
            //{
            //    value = (UInt16)Marshal.ReadInt16(new IntPtr(p), (int)this.offset);
            //}

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

            value = bf_wia.Longs[0]; // implicit typecast combining 4 bytes into long

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

            value = bf_wia.Longs[0]; // implicit typecast combining 4 bytes into long

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

            value = bf_wfa.Floats[0]; // implicit typecast combining 4 bytes into long

            this.offset += sizeof(float);

            return value;
        }


        public int expandHalf(ushort h)
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

        public int readHalf()
        {
            ushort h = this.ReadUInt16();
            return this.expandHalf(h);
        }

        public string ReadString(ulong offset, ulong length)
        {
            string result;
            byte[] chrset;
            int i;

            this.offset += offset; // TODO: use 64bit addressing

            ulong number_of_bytes = length; //Uint8List.BYTES_PER_ELEMENT*length;

            chrset = new byte[number_of_bytes];

            Buffer.BlockCopy(this.data, (int)this.offset, chrset, 0, (int)number_of_bytes); // TODO: use 64bit addressing
                                                                                            //Uint8List chrset = this.bytes.asUint8List(this.offset, number_of_bytes);

            result = UTF8Encoding.UTF8.GetString(chrset);

            i = result.IndexOf("\0");

            result = result.Contains("\0") ? i == 0 ? "" : result.Substring(0, i) : result;

            this.offset += number_of_bytes;

            return result;
        }

        #endregion
    }
}
