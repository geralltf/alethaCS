using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace Aletha.bsp
{
    // Binary Stream Reader
    public class binary_stream
    {
        private Stream stream;
        private byte[] data;
        private ulong length;
        private ulong offset;

        public binary_stream(Stream stream)
        {
            this.stream = stream;
            this.length = (ulong)stream.Length;
            this.offset = 0;

            using (MemoryStream memoryStream = new MemoryStream())
            {
                stream.CopyTo(memoryStream);
                data = memoryStream.ToArray();
            }
        }

        #region Stream Movement

        public binary_stream forward(ulong offset)
        {
            this.offset += offset;
            return this;
        }
        public binary_stream backward(ulong offset)
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
        public int readInt32()
        {
            //TODO: use 64bit addressing
            int value = BitConverter.ToInt32(this.data, (int)this.offset);

            //Int32List values = this.bytes.asInt32List(this.offset, 1);
            int number_of_bytes = INT32_BYTES_PER_ELEMENT * 1;
            this.offset += (ulong)number_of_bytes;

            return value;
        }

        /// <summary>
        /// Read a signed byte from the stream
        /// </summary>
        public byte readByte()
        {
            byte @byte = (byte)((int)data[this.offset] & 0xff);
            //byte @byte = data.getInt8(this.offset) & 0xff;

            this.offset += 1;

            return (byte)((int)@byte - ((int)@byte & 0x80)); // signed
        }

        /// <summary>
        /// Read an unsigned byte from the stream
        /// </summary>
        public byte readUByte()
        {
            //byte @byte = data.getUint8(this.offset) & 0xff;
            byte @byte = (byte)(data[this.offset] & 0xff);
            this.offset += 1;
            return @byte;
        }

        /// <summary>
        /// Read a signed short (2 bytes) from the stream
        /// </summary>
        public short readShort()
        {
            short s = BitConverter.ToInt16(data, (int)this.offset); // TODO: use 64bit addressing

            //var i = this.offset;
            //bf_wuba[0] = data.getUint8(i) & 0xff;
            //bf_wuba[1] = data.getUint8(i + 1) & 0xff;
            this.offset += 2;
            //int s;
            //s = bf_wsa[0];
            return s; // typecast combining 2 bytes into a short
        }

        // Read an unsigned short (2 bytes) from the stream
        public UInt16 readUShort()
        {
            UInt16 s = BitConverter.ToUInt16(data, (int)this.offset); // TODO: use 64bit addressing

            //var i = this.offset;
            //bf_wuba[0] = data.getUint8(i) & 0xff;
            //bf_wuba[1] = data.getUint8(i + 1) & 0xff;
            this.offset += 2;
            //return bf_wusa[0]; // typecast combining 2 bytes into an unsigned short

            return s;
        }

        // Read a signed long (4 bytes) from the stream
        public long readLong()
        {
            long l = BitConverter.ToInt64(data, (int)this.offset); // TODO: use 64bit addressing
            //var i = this.offset;
            //bf_wuba[0] = data.getUint8(i) & 0xff;
            //bf_wuba[1] = data.getUint8(i + 1) & 0xff;
            //bf_wuba[2] = data.getUint8(i + 2) & 0xff;
            //bf_wuba[3] = data.getUint8(i + 3) & 0xff;
            this.offset += 4;
            //return bf_wia[0]; // typecast combining 4 bytes into long

            return l;
        }

        // Read an unsigned long (4 bytes) from the stream
        public UInt64 readULong()
        {
            UInt64 l;

            l = (UInt64)BitConverter.ToInt32(data, (int)this.offset);

            //UInt64 l = BitConverter.ToUInt64(data, (int)this.offset); // TODO: use 64bit addressing
            ////int i = this.offset;
            ////bf_wuba[0] = data.getUint8(i) & 0xff;
            ////bf_wuba[1] = data.getUint8(i + 1) & 0xff;
            ////bf_wuba[2] = data.getUint8(i + 2) & 0xff;
            ////bf_wuba[3] = data.getUint8(i + 3) & 0xff;
            this.offset += 4;
            ////return bf_wuia[0]; // typecast combining 4 bytes into an unsigned long

            return l;
        }

        // Read a float (4 bytes) from the stream
        public float readFloat()
        {
            float f = BitConverter.ToSingle(data, (int)this.offset); // TODO: use 64bit addressing
            //var i = this.offset;
            //bf_wuba[0] = data.getUint8(i) & 0xff;
            //bf_wuba[1] = data.getUint8(i + 1) & 0xff;
            //bf_wuba[2] = data.getUint8(i + 2) & 0xff;
            //bf_wuba[3] = data.getUint8(i + 3) & 0xff;
            this.offset += 4;
            //double f;
            //f = bf_wfa[0];
            return f; // typecast combining 4 bytes into a float
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
            ushort h = this.readUShort();
            return this.expandHalf(h);
        }

        //  // Read an ASCII string of the given length from the stream
        //  String readString (int length) 
        //  {    
        //    String str;
        //    Uint8List characters = getUint8Array(offset,length);
        //    
        //    offset+=Uint8List.BYTES_PER_ELEMENT*length;
        //    
        //    str = UTF8.decode(characters, allowMalformed: false);
        //
        //    str = str.replaceAll(new RegExp(r'\0+')  ,''); // /\0+$/
        //    
        //    /*
        //     * 
        //     if( lastchar ){
        //      var idx = str.indexOf("\0");
        //      if( idx >= 0){
        //        str = str.substring(0, idx);
        //      }
        //    }
        //     */
        //    
        //    return str;
        //  }

        public String readString(ulong offset, ulong length)
        {
            String result;
            byte[] chrset;

            this.offset += offset; // TODO: use 64bit addressing

            ulong number_of_bytes = length; //Uint8List.BYTES_PER_ELEMENT*length;

            chrset = new byte[number_of_bytes];
            Buffer.BlockCopy(this.data, (int)this.offset, chrset, 0, (int)number_of_bytes); // TODO: use 64bit addressing
                                                                                            //Uint8List chrset = this.bytes.asUint8List(this.offset, number_of_bytes);

            result = UTF8Encoding.UTF8.GetString(chrset);

            //List<byte> characters = new List<byte>();
            
            //for (int i = 0; i < chrset.Length; i++)
            //{
            //    byte @char = chrset[i];

            //    if (@char == 0)
            //    {
            //        break;
            //    }

            //    characters.Add(@char);
            //}
            //chrset = characters.ToArray();

            //result = UTF8Encoding.UTF8.GetString(chrset); // UTF8.decode(characters, allowMalformed: true);

            //    int idx = result.indexOf('\0');
            //    if( idx >= 0)
            //    {
            //      result = result.substring(0, idx);
            //    }

            //result = result.replaceAll(new RegExp(r'\0+')  ,''); // /\0+$/

            this.offset += number_of_bytes;

            return result;
        }

        #endregion
    }
}




// This is the result of an interesting trick that Google does in their
// GWT port of Quake 2. (For floats, anyway...) Rather than parse and 
// calculate the values manually they share the contents of a byte array
// between several types of buffers, which allows you to push into one and
// read out the other. The end result is, effectively, a typecast!

/* memory sharing behind lists not available in dart so js interop is used here */

//var bf_byteBuff = context['bf_byteBuff'];
//var bf_wba = context['bf_wba'];
//var bf_wuba = context['bf_wuba'];
//var bf_wsa = context['bf_wsa'];
//var bf_wusa = context['bf_wusa'];
//var bf_wia = context['bf_wia'];
//var bf_wuia = context['bf_wuia'];
//var bf_wfa = context['bf_wfa'];

//var bf_byteBuff = new ArrayBuffer(4);
//var bf_wba = new Int8Array(bf_byteBuff);
//var bf_wuba = new Uint8Array(bf_byteBuff);
//
//var bf_wsa = new Int16Array(bf_byteBuff);
//var bf_wusa = new Uint16Array(bf_byteBuff);
//
//var bf_wia = new Int32Array(bf_byteBuff);
//var bf_wuia = new Uint32Array(bf_byteBuff);
//
//var bf_wfa = new Float32Array(bf_byteBuff);
