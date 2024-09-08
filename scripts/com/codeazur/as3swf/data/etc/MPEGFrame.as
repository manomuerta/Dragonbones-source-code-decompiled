package com.codeazur.as3swf.data.etc
{
   import flash.utils.ByteArray;
   
   public class MPEGFrame
   {
      public static const MPEG_VERSION_1_0:uint = 0;
      
      public static const MPEG_VERSION_2_0:uint = 1;
      
      public static const MPEG_VERSION_2_5:uint = 2;
      
      public static const MPEG_LAYER_I:uint = 0;
      
      public static const MPEG_LAYER_II:uint = 1;
      
      public static const MPEG_LAYER_III:uint = 2;
      
      public static const CHANNEL_MODE_STEREO:uint = 0;
      
      public static const CHANNEL_MODE_JOINT_STEREO:uint = 1;
      
      public static const CHANNEL_MODE_DUAL:uint = 2;
      
      public static const CHANNEL_MODE_MONO:uint = 3;
      
      protected static var mpegBitrates:Array = [[[0,32,96,128,160,192,224,256,288,320,352,384,416,448,-1],[0,32,48,56,64,80,96,112,128,160,192,224,256,320,384,-1],[0,32,40,48,56,64,80,96,112,128,160,192,224,256,320,-1]],[[0,32,48,56,64,80,96,112,128,144,160,176,192,224,256,-1],[0,8,16,24,32,40,48,56,64,80,96,112,128,144,160,-1],[0,8,16,24,32,40,48,56,64,80,96,112,128,144,160,-1]]];
      
      protected static var mpegSamplingRates:Array = [[44100,48000,32000],[22050,24000,16000],[11025,12000,8000]];
      
      protected var _version:uint;
      
      protected var _layer:uint;
      
      protected var _bitrate:uint;
      
      protected var _samplingRate:uint;
      
      protected var _padding:Boolean;
      
      protected var _channelMode:uint;
      
      protected var _channelModeExt:uint;
      
      protected var _copyright:Boolean;
      
      protected var _original:Boolean;
      
      protected var _emphasis:uint;
      
      protected var _header:ByteArray;
      
      protected var _data:ByteArray;
      
      protected var _crc:ByteArray;
      
      protected var _hasCRC:Boolean;
      
      protected var _samples:uint = 1152;
      
      public function MPEGFrame()
      {
         super();
         this.init();
      }
      
      public function get version() : uint
      {
         return this._version;
      }
      
      public function get layer() : uint
      {
         return this._layer;
      }
      
      public function get bitrate() : uint
      {
         return this._bitrate;
      }
      
      public function get samplingrate() : uint
      {
         return this._samplingRate;
      }
      
      public function get padding() : Boolean
      {
         return this._padding;
      }
      
      public function get channelMode() : uint
      {
         return this._channelMode;
      }
      
      public function get channelModeExt() : uint
      {
         return this._channelModeExt;
      }
      
      public function get copyright() : Boolean
      {
         return this._copyright;
      }
      
      public function get original() : Boolean
      {
         return this._original;
      }
      
      public function get emphasis() : uint
      {
         return this._emphasis;
      }
      
      public function get hasCRC() : Boolean
      {
         return this._hasCRC;
      }
      
      public function get crc() : uint
      {
         this._crc.position = 0;
         return this._crc.readUnsignedShort();
      }
      
      public function get samples() : uint
      {
         return this._samples;
      }
      
      public function get data() : ByteArray
      {
         return this._data;
      }
      
      public function set data(param1:ByteArray) : void
      {
         this._data = param1;
      }
      
      public function get size() : uint
      {
         var _loc1_:uint = 0;
         if(this.layer == MPEG_LAYER_I)
         {
            _loc1_ = Math.floor(12000 * this.bitrate / this.samplingrate);
            if(this.padding)
            {
               _loc1_++;
            }
            _loc1_ <<= 2;
         }
         else
         {
            _loc1_ = Math.floor((this.version == MPEG_VERSION_1_0 ? 144000 : 72000) * this.bitrate / this.samplingrate);
            if(this.padding)
            {
               _loc1_++;
            }
         }
         return _loc1_ - 4 - (this.hasCRC ? 2 : 0);
      }
      
      public function setHeaderByteAt(param1:uint, param2:uint) : void
      {
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         loop0:
         switch(param1)
         {
            case 0:
               if(param2 != 255)
               {
                  throw new Error("Not a MPEG header.");
               }
               break;
            case 1:
               if((param2 & 0xE0) != 224)
               {
                  throw new Error("Not a MPEG header.");
               }
               _loc3_ = uint((param2 & 0x18) >> 3);
               switch(_loc3_)
               {
                  case 3:
                     this._version = MPEG_VERSION_1_0;
                     break;
                  case 2:
                     this._version = MPEG_VERSION_2_0;
                     break;
                  default:
                     throw new Error("Unsupported MPEG version.");
               }
               _loc4_ = uint((param2 & 6) >> 1);
               switch(_loc4_)
               {
                  case 1:
                     this._layer = MPEG_LAYER_III;
                     this._hasCRC = (param2 & 1) == 0;
                     break loop0;
                  default:
                     throw new Error("Unsupported MPEG layer.");
               }
               break;
            case 2:
               _loc5_ = uint((param2 & 0xF0) >> 4);
               if(_loc5_ == 0 || _loc5_ == 15)
               {
                  throw new Error("Unsupported bitrate index.");
               }
               this._bitrate = mpegBitrates[this._version][this._layer][_loc5_];
               _loc6_ = uint((param2 & 0x0C) >> 2);
               if(_loc6_ == 3)
               {
                  throw new Error("Unsupported samplingrate index.");
               }
               this._samplingRate = mpegSamplingRates[this._version][_loc6_];
               this._padding = (param2 & 2) == 2;
               break;
            case 3:
               this._channelMode = (param2 & 0xC0) >> 6;
               this._channelModeExt = (param2 & 0x30) >> 4;
               this._copyright = (param2 & 8) == 8;
               this._original = (param2 & 4) == 4;
               this._emphasis = param2 & 2;
               break;
            default:
               throw new Error("Index out of bounds.");
         }
         this._header[param1] = param2;
      }
      
      public function setCRCByteAt(param1:uint, param2:uint) : void
      {
         if(param1 > 1)
         {
            throw new Error("Index out of bounds.");
         }
         this._crc[param1] = param2;
      }
      
      protected function init() : void
      {
         this._header = new ByteArray();
         this._header.writeByte(0);
         this._header.writeByte(0);
         this._header.writeByte(0);
         this._header.writeByte(0);
         this._crc = new ByteArray();
         this._crc.writeByte(0);
         this._crc.writeByte(0);
      }
      
      public function getFrame() : ByteArray
      {
         var _loc1_:ByteArray = new ByteArray();
         _loc1_.writeBytes(this._header,0,4);
         if(this.hasCRC)
         {
            _loc1_.writeBytes(this._crc,0,2);
         }
         _loc1_.writeBytes(this._data);
         return _loc1_;
      }
      
      public function toString() : String
      {
         var _loc1_:* = "MPEG ";
         switch(this.version)
         {
            case MPEGFrame.MPEG_VERSION_1_0:
               _loc1_ += "1.0 ";
               break;
            case MPEGFrame.MPEG_VERSION_2_0:
               _loc1_ += "2.0 ";
               break;
            case MPEGFrame.MPEG_VERSION_2_5:
               _loc1_ += "2.5 ";
               break;
            default:
               _loc1_ += "?.? ";
         }
         switch(this.layer)
         {
            case MPEGFrame.MPEG_LAYER_I:
               _loc1_ += "Layer I";
               break;
            case MPEGFrame.MPEG_LAYER_II:
               _loc1_ += "Layer II";
               break;
            case MPEGFrame.MPEG_LAYER_III:
               _loc1_ += "Layer III";
               break;
            default:
               _loc1_ += "Layer ?";
         }
         var _loc2_:String = "unknown";
         switch(this.channelMode)
         {
            case 0:
               _loc2_ = "Stereo";
               break;
            case 1:
               _loc2_ = "Joint stereo";
               break;
            case 2:
               _loc2_ = "Dual channel";
               break;
            case 3:
               _loc2_ = "Mono";
         }
         return _loc1_ + ", " + this.bitrate + " kbit/s, " + this.samplingrate + " Hz, " + _loc2_ + ", " + this.size + " bytes";
      }
   }
}

