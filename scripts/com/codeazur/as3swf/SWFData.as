package com.codeazur.as3swf
{
   import com.codeazur.as3swf.data.SWFActionValue;
   import com.codeazur.as3swf.data.SWFButtonCondAction;
   import com.codeazur.as3swf.data.SWFButtonRecord;
   import com.codeazur.as3swf.data.SWFClipActionRecord;
   import com.codeazur.as3swf.data.SWFClipActions;
   import com.codeazur.as3swf.data.SWFClipEventFlags;
   import com.codeazur.as3swf.data.SWFColorTransform;
   import com.codeazur.as3swf.data.SWFColorTransformWithAlpha;
   import com.codeazur.as3swf.data.SWFFillStyle;
   import com.codeazur.as3swf.data.SWFFocalGradient;
   import com.codeazur.as3swf.data.SWFGlyphEntry;
   import com.codeazur.as3swf.data.SWFGradient;
   import com.codeazur.as3swf.data.SWFGradientRecord;
   import com.codeazur.as3swf.data.SWFKerningRecord;
   import com.codeazur.as3swf.data.SWFLineStyle;
   import com.codeazur.as3swf.data.SWFLineStyle2;
   import com.codeazur.as3swf.data.SWFMatrix;
   import com.codeazur.as3swf.data.SWFMorphFillStyle;
   import com.codeazur.as3swf.data.SWFMorphFocalGradient;
   import com.codeazur.as3swf.data.SWFMorphGradient;
   import com.codeazur.as3swf.data.SWFMorphGradientRecord;
   import com.codeazur.as3swf.data.SWFMorphLineStyle;
   import com.codeazur.as3swf.data.SWFMorphLineStyle2;
   import com.codeazur.as3swf.data.SWFRawTag;
   import com.codeazur.as3swf.data.SWFRecordHeader;
   import com.codeazur.as3swf.data.SWFRectangle;
   import com.codeazur.as3swf.data.SWFRegisterParam;
   import com.codeazur.as3swf.data.SWFShape;
   import com.codeazur.as3swf.data.SWFShapeRecordCurvedEdge;
   import com.codeazur.as3swf.data.SWFShapeRecordStraightEdge;
   import com.codeazur.as3swf.data.SWFShapeRecordStyleChange;
   import com.codeazur.as3swf.data.SWFShapeWithStyle;
   import com.codeazur.as3swf.data.SWFSoundEnvelope;
   import com.codeazur.as3swf.data.SWFSoundInfo;
   import com.codeazur.as3swf.data.SWFSymbol;
   import com.codeazur.as3swf.data.SWFTextRecord;
   import com.codeazur.as3swf.data.SWFZoneData;
   import com.codeazur.as3swf.data.SWFZoneRecord;
   import com.codeazur.as3swf.data.actions.IAction;
   import com.codeazur.as3swf.data.filters.IFilter;
   import com.codeazur.as3swf.factories.SWFActionFactory;
   import com.codeazur.as3swf.factories.SWFFilterFactory;
   import com.codeazur.utils.BitArray;
   import com.codeazur.utils.HalfPrecisionWriter;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   
   public class SWFData extends BitArray
   {
      public static const FLOAT16_EXPONENT_BASE:Number = 15;
      
      public function SWFData()
      {
         super();
         endian = Endian.LITTLE_ENDIAN;
      }
      
      public static function dump(param1:ByteArray, param2:uint, param3:int = 0) : void
      {
         var _loc8_:* = null;
         var _loc9_:String = null;
         var _loc4_:uint = param1.position;
         var _loc5_:uint = param1.position = Math.min(Math.max(_loc4_ + param3,0),param1.length - param2);
         var _loc6_:String = "[Dump] total length: " + param1.length + ", original position: " + _loc4_;
         var _loc7_:uint = 0;
         while(_loc7_ < param2)
         {
            _loc8_ = param1.readUnsignedByte().toString(16);
            if(_loc8_.length == 1)
            {
               _loc8_ = "0" + _loc8_;
            }
            if(_loc7_ % 16 == 0)
            {
               _loc9_ = (_loc5_ + _loc7_).toString(16);
               _loc9_ = "00000000".substr(0,8 - _loc9_.length) + _loc9_;
               _loc6_ += "\r" + _loc9_ + ": ";
            }
            _loc8_ += " ";
            _loc6_ += _loc8_;
            _loc7_++;
         }
         param1.position = _loc4_;
      }
      
      public function readSI8() : int
      {
         resetBitsPending();
         return readByte();
      }
      
      public function writeSI8(param1:int) : void
      {
         resetBitsPending();
         writeByte(param1);
      }
      
      public function readSI16() : int
      {
         resetBitsPending();
         return readShort();
      }
      
      public function writeSI16(param1:int) : void
      {
         resetBitsPending();
         writeShort(param1);
      }
      
      public function readSI32() : int
      {
         resetBitsPending();
         return readInt();
      }
      
      public function writeSI32(param1:int) : void
      {
         resetBitsPending();
         writeInt(param1);
      }
      
      public function readUI8() : uint
      {
         resetBitsPending();
         return readUnsignedByte();
      }
      
      public function writeUI8(param1:uint) : void
      {
         resetBitsPending();
         writeByte(param1);
      }
      
      public function readUI16() : uint
      {
         resetBitsPending();
         return readUnsignedShort();
      }
      
      public function writeUI16(param1:uint) : void
      {
         resetBitsPending();
         writeShort(param1);
      }
      
      public function readUI24() : uint
      {
         resetBitsPending();
         var _loc1_:uint = readUnsignedShort();
         var _loc2_:uint = readUnsignedByte();
         return _loc2_ << 16 | _loc1_;
      }
      
      public function writeUI24(param1:uint) : void
      {
         resetBitsPending();
         writeShort(param1 & 0xFFFF);
         writeByte(param1 >> 16);
      }
      
      public function _15059(param1:uint) : void
      {
         writeByte(int(param1 >> 16 & 0xFF));
         writeByte(int(param1 >> 8 & 0xFF));
         writeByte(int(param1 & 0xFF));
      }
      
      public function readUI32() : uint
      {
         resetBitsPending();
         return readUnsignedInt();
      }
      
      public function writeUI32(param1:uint) : void
      {
         resetBitsPending();
         writeUnsignedInt(param1);
      }
      
      public function readFIXED() : Number
      {
         resetBitsPending();
         return readInt() / 65536;
      }
      
      public function _15006() : Array
      {
         resetBitsPending();
         var _loc1_:int = readInt();
         return [_loc1_,_loc1_ / 65536];
      }
      
      public function writeFIXED(param1:Number) : void
      {
         resetBitsPending();
         writeInt(int(param1 * 65536));
      }
      
      public function readFIXED8() : Number
      {
         resetBitsPending();
         return readShort() / 256;
      }
      
      public function _15005() : Array
      {
         resetBitsPending();
         var _loc1_:int = readShort();
         return [_loc1_,_loc1_ / 256];
      }
      
      public function writeFIXED8(param1:Number) : void
      {
         resetBitsPending();
         writeShort(int(param1 * 256));
      }
      
      public function readFLOAT() : Number
      {
         resetBitsPending();
         return readFloat();
      }
      
      public function writeFLOAT(param1:Number) : void
      {
         resetBitsPending();
         writeFloat(param1);
      }
      
      public function readDOUBLE() : Number
      {
         resetBitsPending();
         return readDouble();
      }
      
      public function writeDOUBLE(param1:Number) : void
      {
         resetBitsPending();
         writeDouble(param1);
      }
      
      public function readFLOAT16() : Number
      {
         resetBitsPending();
         var _loc1_:uint = readUnsignedShort();
         var _loc2_:int = (_loc1_ & 0x8000) != 0 ? -1 : 1;
         var _loc3_:uint = uint(_loc1_ >> 10 & 0x1F);
         var _loc4_:uint = uint(_loc1_ & 0x03FF);
         if(_loc3_ == 0)
         {
            if(_loc4_ == 0)
            {
               return 0;
            }
            return _loc2_ * Math.pow(2,1 - FLOAT16_EXPONENT_BASE) * (_loc4_ / 1024);
         }
         if(_loc3_ == 31)
         {
            if(_loc4_ == 0)
            {
               return _loc2_ < 0 ? Number.NEGATIVE_INFINITY : Number.POSITIVE_INFINITY;
            }
            return Number.NaN;
         }
         return _loc2_ * Math.pow(2,_loc3_ - FLOAT16_EXPONENT_BASE) * (1 + _loc4_ / 1024);
      }
      
      public function writeFLOAT16(param1:Number) : void
      {
         HalfPrecisionWriter.write(param1,this);
      }
      
      public function readEncodedU32() : uint
      {
         resetBitsPending();
         var _loc1_:uint = readUnsignedByte();
         if(_loc1_ & 0x80)
         {
            _loc1_ = uint(_loc1_ & 0x7F | readUnsignedByte() << 7);
            if(_loc1_ & 0x4000)
            {
               _loc1_ = uint(_loc1_ & 0x3FFF | readUnsignedByte() << 14);
               if(_loc1_ & 0x200000)
               {
                  _loc1_ = uint(_loc1_ & 0x1FFFFF | readUnsignedByte() << 21);
                  if(_loc1_ & 0x10000000)
                  {
                     _loc1_ = uint(_loc1_ & 0x0FFFFFFF | readUnsignedByte() << 28);
                  }
               }
            }
         }
         return _loc1_;
      }
      
      public function writeEncodedU32(param1:uint) : void
      {
         var _loc2_:uint = 0;
         while(true)
         {
            _loc2_ = uint(param1 & 0x7F);
            param1 = uint(param1 >> 7);
            if(param1 == 0)
            {
               break;
            }
            this.writeUI8(_loc2_ | 0x80);
         }
         this.writeUI8(_loc2_);
      }
      
      public function readUB(param1:uint) : uint
      {
         return readBits(param1);
      }
      
      public function writeUB(param1:uint, param2:uint) : void
      {
         writeBits(param1,param2);
      }
      
      public function readSB(param1:uint) : int
      {
         var _loc2_:uint = uint(32 - param1);
         return int(readBits(param1) << _loc2_) >> _loc2_;
      }
      
      public function writeSB(param1:uint, param2:int) : void
      {
         writeBits(param1,param2);
      }
      
      public function readFB(param1:uint) : Number
      {
         return Number(this.readSB(param1)) / 65536;
      }
      
      public function _15025(param1:uint) : Array
      {
         var _loc2_:int = Number(this.readSB(param1));
         return [_loc2_,_loc2_ / 65536];
      }
      
      public function writeFB(param1:uint, param2:Number) : void
      {
         this.writeSB(param1,param2 * 65536);
      }
      
      public function readString() : String
      {
         var _loc1_:uint = position;
         while(this[_loc1_++])
         {
         }
         resetBitsPending();
         return readUTFBytes(_loc1_ - position);
      }
      
      public function writeString(param1:String) : void
      {
         if(Boolean(param1) && param1.length > 0)
         {
            writeUTFBytes(param1);
         }
         writeByte(0);
      }
      
      public function readLANGCODE() : uint
      {
         resetBitsPending();
         return readUnsignedByte();
      }
      
      public function writeLANGCODE(param1:uint) : void
      {
         resetBitsPending();
         writeByte(param1);
      }
      
      public function readRGB() : uint
      {
         resetBitsPending();
         var _loc1_:uint = readUnsignedByte();
         var _loc2_:uint = readUnsignedByte();
         var _loc3_:uint = readUnsignedByte();
         return 4278190080 | _loc1_ << 16 | _loc2_ << 8 | _loc3_;
      }
      
      public function writeRGB(param1:uint) : void
      {
         resetBitsPending();
         writeByte(param1 >> 16 & 0xFF);
         writeByte(param1 >> 8 & 0xFF);
         writeByte(param1 & 0xFF);
      }
      
      public function readRGBA() : uint
      {
         resetBitsPending();
         var _loc1_:uint = uint(this.readRGB() & 0xFFFFFF);
         var _loc2_:uint = readUnsignedByte();
         return _loc2_ << 24 | _loc1_;
      }
      
      public function writeRGBA(param1:uint) : void
      {
         resetBitsPending();
         this.writeRGB(param1);
         writeByte(param1 >> 24 & 0xFF);
      }
      
      public function readARGB() : uint
      {
         resetBitsPending();
         var _loc1_:uint = readUnsignedByte();
         var _loc2_:uint = uint(this.readRGB() & 0xFFFFFF);
         return _loc1_ << 24 | _loc2_;
      }
      
      public function writeARGB(param1:uint) : void
      {
         resetBitsPending();
         writeByte(param1 >> 24 & 0xFF);
         this.writeRGB(param1);
      }
      
      public function readRECT() : SWFRectangle
      {
         return new SWFRectangle(this);
      }
      
      public function writeRECT(param1:SWFRectangle) : void
      {
         param1.publish(this);
      }
      
      public function readMATRIX() : SWFMatrix
      {
         return new SWFMatrix(this);
      }
      
      public function writeMATRIX(param1:SWFMatrix) : void
      {
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         this.resetBitsPending();
         var _loc2_:Boolean = param1.scaleX != 1 || param1.scaleY != 1;
         var _loc3_:Boolean = param1.rotateSkew0 != 0 || param1.rotateSkew1 != 0;
         writeBits(1,_loc2_ ? 1 : 0);
         if(_loc2_)
         {
            if(param1.scaleX == 0 && param1.scaleY == 0)
            {
               _loc5_ = 1;
            }
            else
            {
               _loc5_ = calculateMaxBits(true,[param1.scaleX * 65536,param1.scaleY * 65536]);
            }
            this.writeUB(5,_loc5_);
            this.writeFB(_loc5_,param1.scaleX);
            this.writeFB(_loc5_,param1.scaleY);
         }
         writeBits(1,_loc3_ ? 1 : 0);
         if(_loc3_)
         {
            _loc6_ = calculateMaxBits(true,[param1.rotateSkew0 * 65536,param1.rotateSkew1 * 65536]);
            this.writeUB(5,_loc6_);
            this.writeFB(_loc6_,param1.rotateSkew0);
            this.writeFB(_loc6_,param1.rotateSkew1);
         }
         var _loc4_:uint = calculateMaxBits(true,[param1.translateX,param1.translateY]);
         this.writeUB(5,_loc4_);
         this.writeSB(_loc4_,param1.translateX);
         this.writeSB(_loc4_,param1.translateY);
      }
      
      public function readCXFORM() : SWFColorTransform
      {
         return new SWFColorTransform(this);
      }
      
      public function writeCXFORM(param1:SWFColorTransform) : void
      {
         param1.publish(this);
      }
      
      public function readCXFORMWITHALPHA() : SWFColorTransformWithAlpha
      {
         return new SWFColorTransformWithAlpha(this);
      }
      
      public function writeCXFORMWITHALPHA(param1:SWFColorTransformWithAlpha) : void
      {
         param1.publish(this);
      }
      
      public function readSHAPE(param1:Number = 20) : SWFShape
      {
         return new SWFShape(this,1,param1);
      }
      
      public function writeSHAPE(param1:SWFShape) : void
      {
         param1.publish(this);
      }
      
      public function readSHAPEWITHSTYLE(param1:uint = 1, param2:Number = 20) : SWFShapeWithStyle
      {
         return new SWFShapeWithStyle(this,param1,param2);
      }
      
      public function writeSHAPEWITHSTYLE(param1:SWFShapeWithStyle, param2:uint = 1) : void
      {
         param1.publish(this,param2);
      }
      
      public function readSTRAIGHTEDGERECORD(param1:uint) : SWFShapeRecordStraightEdge
      {
         return new SWFShapeRecordStraightEdge(this,param1);
      }
      
      public function writeSTRAIGHTEDGERECORD(param1:SWFShapeRecordStraightEdge) : void
      {
         param1.publish(this);
      }
      
      public function readCURVEDEDGERECORD(param1:uint) : SWFShapeRecordCurvedEdge
      {
         return new SWFShapeRecordCurvedEdge(this,param1);
      }
      
      public function writeCURVEDEDGERECORD(param1:SWFShapeRecordCurvedEdge) : void
      {
         param1.publish(this);
      }
      
      public function readSTYLECHANGERECORD(param1:uint, param2:uint, param3:uint, param4:uint = 1) : SWFShapeRecordStyleChange
      {
         return new SWFShapeRecordStyleChange(this,param1,param2,param3,param4);
      }
      
      public function writeSTYLECHANGERECORD(param1:SWFShapeRecordStyleChange, param2:uint, param3:uint, param4:uint = 1) : void
      {
         param1.numFillBits = param2;
         param1.numLineBits = param3;
         param1.publish(this,param4);
      }
      
      public function readFILLSTYLE(param1:uint = 1) : SWFFillStyle
      {
         return new SWFFillStyle(this,param1);
      }
      
      public function writeFILLSTYLE(param1:SWFFillStyle, param2:uint = 1) : void
      {
         param1.publish(this,param2);
      }
      
      public function readLINESTYLE(param1:uint = 1) : SWFLineStyle
      {
         return new SWFLineStyle(this,param1);
      }
      
      public function writeLINESTYLE(param1:SWFLineStyle, param2:uint = 1) : void
      {
         param1.publish(this,param2);
      }
      
      public function readLINESTYLE2(param1:uint = 1) : SWFLineStyle2
      {
         return new SWFLineStyle2(this,param1);
      }
      
      public function writeLINESTYLE2(param1:SWFLineStyle2, param2:uint = 1) : void
      {
         param1.publish(this,param2);
      }
      
      public function readBUTTONRECORD(param1:uint = 1) : SWFButtonRecord
      {
         if(this.readUI8() == 0)
         {
            return null;
         }
         --position;
         return new SWFButtonRecord(this,param1);
      }
      
      public function writeBUTTONRECORD(param1:SWFButtonRecord, param2:uint = 1) : void
      {
         param1.publish(this,param2);
      }
      
      public function readBUTTONCONDACTION() : SWFButtonCondAction
      {
         return new SWFButtonCondAction(this);
      }
      
      public function writeBUTTONCONDACTION(param1:SWFButtonCondAction) : void
      {
         param1.publish(this);
      }
      
      public function readFILTER() : IFilter
      {
         var _loc1_:uint = this.readUI8();
         var _loc2_:IFilter = SWFFilterFactory.create(_loc1_);
         _loc2_.parse(this);
         return _loc2_;
      }
      
      public function writeFILTER(param1:IFilter) : void
      {
         this.writeUI8(param1.id);
         param1.publish(this);
      }
      
      public function readTEXTRECORD(param1:uint, param2:uint, param3:SWFTextRecord = null, param4:uint = 1) : SWFTextRecord
      {
         if(this.readUI8() == 0)
         {
            return null;
         }
         --position;
         return new SWFTextRecord(this,param1,param2,param3,param4);
      }
      
      public function writeTEXTRECORD(param1:SWFTextRecord, param2:uint, param3:uint, param4:SWFTextRecord = null, param5:uint = 1) : void
      {
         param1.publish(this,param2,param3,param4,param5);
      }
      
      public function readGLYPHENTRY(param1:uint, param2:uint) : SWFGlyphEntry
      {
         return new SWFGlyphEntry(this,param1,param2);
      }
      
      public function writeGLYPHENTRY(param1:SWFGlyphEntry, param2:uint, param3:uint) : void
      {
         param1.publish(this,param2,param3);
      }
      
      public function readZONERECORD() : SWFZoneRecord
      {
         return new SWFZoneRecord(this);
      }
      
      public function writeZONERECORD(param1:SWFZoneRecord) : void
      {
         param1.publish(this);
      }
      
      public function readZONEDATA() : SWFZoneData
      {
         return new SWFZoneData(this);
      }
      
      public function writeZONEDATA(param1:SWFZoneData) : void
      {
         param1.publish(this);
      }
      
      public function readKERNINGRECORD(param1:Boolean) : SWFKerningRecord
      {
         return new SWFKerningRecord(this,param1);
      }
      
      public function writeKERNINGRECORD(param1:SWFKerningRecord, param2:Boolean) : void
      {
         param1.publish(this,param2);
      }
      
      public function readGRADIENT(param1:uint = 1) : SWFGradient
      {
         return new SWFGradient(this,param1);
      }
      
      public function writeGRADIENT(param1:SWFGradient, param2:uint = 1) : void
      {
         param1.publish(this,param2);
      }
      
      public function readFOCALGRADIENT(param1:uint = 1) : SWFFocalGradient
      {
         return new SWFFocalGradient(this,param1);
      }
      
      public function writeFOCALGRADIENT(param1:SWFFocalGradient, param2:uint = 1) : void
      {
         param1.publish(this,param2);
      }
      
      public function readGRADIENTRECORD(param1:uint = 1) : SWFGradientRecord
      {
         return new SWFGradientRecord(this,param1);
      }
      
      public function writeGRADIENTRECORD(param1:SWFGradientRecord, param2:uint = 1) : void
      {
         param1.publish(this,param2);
      }
      
      public function readMORPHFILLSTYLE(param1:uint = 1) : SWFMorphFillStyle
      {
         return new SWFMorphFillStyle(this,param1);
      }
      
      public function writeMORPHFILLSTYLE(param1:SWFMorphFillStyle, param2:uint = 1) : void
      {
         param1.publish(this,param2);
      }
      
      public function readMORPHLINESTYLE(param1:uint = 1) : SWFMorphLineStyle
      {
         return new SWFMorphLineStyle(this,param1);
      }
      
      public function writeMORPHLINESTYLE(param1:SWFMorphLineStyle, param2:uint = 1) : void
      {
         param1.publish(this,param2);
      }
      
      public function readMORPHLINESTYLE2(param1:uint = 1) : SWFMorphLineStyle2
      {
         return new SWFMorphLineStyle2(this,param1);
      }
      
      public function writeMORPHLINESTYLE2(param1:SWFMorphLineStyle2, param2:uint = 1) : void
      {
         param1.publish(this,param2);
      }
      
      public function readMORPHGRADIENT(param1:uint = 1) : SWFMorphGradient
      {
         return new SWFMorphGradient(this,param1);
      }
      
      public function writeMORPHGRADIENT(param1:SWFMorphGradient, param2:uint = 1) : void
      {
         param1.publish(this,param2);
      }
      
      public function readMORPHFOCALGRADIENT(param1:uint = 1) : SWFMorphFocalGradient
      {
         return new SWFMorphFocalGradient(this,param1);
      }
      
      public function writeMORPHFOCALGRADIENT(param1:SWFMorphFocalGradient, param2:uint = 1) : void
      {
         param1.publish(this,param2);
      }
      
      public function readMORPHGRADIENTRECORD() : SWFMorphGradientRecord
      {
         return new SWFMorphGradientRecord(this);
      }
      
      public function writeMORPHGRADIENTRECORD(param1:SWFMorphGradientRecord) : void
      {
         param1.publish(this);
      }
      
      public function readACTIONRECORD() : IAction
      {
         var _loc2_:IAction = null;
         var _loc4_:uint = 0;
         var _loc1_:uint = position;
         var _loc3_:uint = this.readUI8();
         if(_loc3_ != 0)
         {
            _loc4_ = _loc3_ >= 128 ? this.readUI16() : 0;
            _loc2_ = SWFActionFactory.create(_loc3_,_loc4_,_loc1_);
            _loc2_.parse(this);
         }
         return _loc2_;
      }
      
      public function writeACTIONRECORD(param1:IAction) : void
      {
         param1.publish(this);
      }
      
      public function readACTIONVALUE() : SWFActionValue
      {
         return new SWFActionValue(this);
      }
      
      public function writeACTIONVALUE(param1:SWFActionValue) : void
      {
         param1.publish(this);
      }
      
      public function readREGISTERPARAM() : SWFRegisterParam
      {
         return new SWFRegisterParam(this);
      }
      
      public function writeREGISTERPARAM(param1:SWFRegisterParam) : void
      {
         param1.publish(this);
      }
      
      public function readSYMBOL() : SWFSymbol
      {
         return new SWFSymbol(this);
      }
      
      public function writeSYMBOL(param1:SWFSymbol) : void
      {
         param1.publish(this);
      }
      
      public function readSOUNDINFO() : SWFSoundInfo
      {
         return new SWFSoundInfo(this);
      }
      
      public function writeSOUNDINFO(param1:SWFSoundInfo) : void
      {
         param1.publish(this);
      }
      
      public function readSOUNDENVELOPE() : SWFSoundEnvelope
      {
         return new SWFSoundEnvelope(this);
      }
      
      public function writeSOUNDENVELOPE(param1:SWFSoundEnvelope) : void
      {
         param1.publish(this);
      }
      
      public function readCLIPACTIONS(param1:uint) : SWFClipActions
      {
         return new SWFClipActions(this,param1);
      }
      
      public function writeCLIPACTIONS(param1:SWFClipActions, param2:uint) : void
      {
         param1.publish(this,param2);
      }
      
      public function readCLIPACTIONRECORD(param1:uint) : SWFClipActionRecord
      {
         var _loc2_:uint = position;
         var _loc3_:uint = param1 >= 6 ? this.readUI32() : this.readUI16();
         if(_loc3_ == 0)
         {
            return null;
         }
         position = _loc2_;
         return new SWFClipActionRecord(this,param1);
      }
      
      public function writeCLIPACTIONRECORD(param1:SWFClipActionRecord, param2:uint) : void
      {
         param1.publish(this,param2);
      }
      
      public function readCLIPEVENTFLAGS(param1:uint) : SWFClipEventFlags
      {
         return new SWFClipEventFlags(this,param1);
      }
      
      public function writeCLIPEVENTFLAGS(param1:SWFClipEventFlags, param2:uint) : void
      {
         param1.publish(this,param2);
      }
      
      public function readTagHeader() : SWFRecordHeader
      {
         var _loc1_:uint = position;
         var _loc2_:uint = this.readUI16();
         var _loc3_:uint = uint(_loc2_ & 0x3F);
         if(_loc3_ == 63)
         {
            _loc3_ = uint(this.readSI32());
         }
         return new SWFRecordHeader(_loc2_ >> 6,_loc3_,position - _loc1_);
      }
      
      public function writeTagHeader(param1:uint, param2:uint, param3:Boolean = false) : void
      {
         if(param2 < 63 && !param3)
         {
            this.writeUI16(param1 << 6 | param2);
         }
         else
         {
            this.writeUI16(param1 << 6 | 0x3F);
            this.writeSI32(param2);
         }
      }
      
      public function swfUncompress(param1:String, param2:uint = 0) : void
      {
         var _loc5_:uint = 0;
         var _loc3_:uint = position;
         var _loc4_:ByteArray = new ByteArray();
         if(param1 == SWF.COMPRESSION_METHOD_ZLIB)
         {
            readBytes(_loc4_);
            _loc4_.position = 0;
            _loc4_.uncompress();
         }
         else
         {
            if(param1 != SWF.COMPRESSION_METHOD_LZMA)
            {
               throw new Error("Unknown compression method: " + param1);
            }
            _loc5_ = 0;
            while(_loc5_ < 5)
            {
               _loc4_.writeByte(this[_loc5_ + 12]);
               _loc5_++;
            }
            _loc4_.endian = Endian.LITTLE_ENDIAN;
            _loc4_.writeUnsignedInt(param2 - 8);
            _loc4_.writeUnsignedInt(0);
            position = 17;
            readBytes(_loc4_,13);
            _loc4_.position = 0;
            _loc4_.uncompress(param1);
         }
         length = position = _loc3_;
         writeBytes(_loc4_);
         position = _loc3_;
      }
      
      public function swfCompress(param1:String) : void
      {
         var _loc3_:ByteArray = null;
         var _loc4_:ByteArray = null;
         var _loc5_:uint = 0;
         var _loc2_:uint = position;
         _loc3_ = new ByteArray();
         if(param1 == SWF.COMPRESSION_METHOD_ZLIB)
         {
            readBytes(_loc3_);
            _loc3_.position = 0;
            _loc3_.compress();
            length = position = _loc2_;
            writeBytes(_loc3_);
            return;
         }
         if(param1 == SWF.COMPRESSION_METHOD_LZMA)
         {
            throw new Error("Can\'t publish LZMA compressed SWFs");
         }
         throw new Error("Unknown compression method: " + param1);
      }
      
      public function readRawTag() : SWFRawTag
      {
         return new SWFRawTag(this);
      }
      
      public function skipBytes(param1:uint) : void
      {
         position += param1;
      }
      
      public function _15058() : uint
      {
         if(bitsPending > 0)
         {
            return this.bytesAvailable * 8 + (8 - bitsPending);
         }
         return this.bytesAvailable * 8;
      }
   }
}

