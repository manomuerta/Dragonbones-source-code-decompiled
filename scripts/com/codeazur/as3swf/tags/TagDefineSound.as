package com.codeazur.as3swf.tags
{
   import _14157._14156;
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.consts.SoundCompression;
   import com.codeazur.as3swf.data.consts.SoundRate;
   import com.codeazur.as3swf.data.consts.SoundSize;
   import com.codeazur.as3swf.data.consts.SoundType;
   import com.codeazur.as3swf.data.etc.MPEGFrame;
   import flash.utils.ByteArray;
   
   public class TagDefineSound implements IDefinitionTag
   {
      public static const TYPE:uint = 14;
      
      public var soundFormat:uint;
      
      public var soundRate:uint;
      
      public var soundSize:uint;
      
      public var soundType:uint;
      
      public var soundSampleCount:uint;
      
      protected var _characterId:uint;
      
      protected var _soundData:ByteArray;
      
      public function TagDefineSound()
      {
         super();
         this._soundData = new ByteArray();
      }
      
      public static function create(param1:uint, param2:uint = 2, param3:uint = 3, param4:uint = 1, param5:uint = 1, param6:uint = 0, param7:ByteArray = null) : TagDefineSound
      {
         var _loc8_:TagDefineSound;
         (_loc8_ = new TagDefineSound())._characterId = param1;
         _loc8_.soundFormat = param2;
         _loc8_.soundRate = param3;
         _loc8_.soundSize = param4;
         _loc8_.soundType = param5;
         _loc8_.soundSampleCount = param6;
         if(param7 != null && param7.length > 0)
         {
            _loc8_.soundData.writeBytes(param7);
         }
         return _loc8_;
      }
      
      public static function createWithMP3(param1:uint, param2:ByteArray) : TagDefineSound
      {
         var _loc3_:TagDefineSound = null;
         if(param2 != null && param2.length > 0)
         {
            _loc3_ = new TagDefineSound();
            _loc3_._characterId = param1;
            _loc3_.processMP3(param2);
            return _loc3_;
         }
         throw new Error("No MP3 data.");
      }
      
      public function get characterId() : uint
      {
         return this._characterId;
      }
      
      public function set characterId(param1:uint) : void
      {
         this._characterId = param1;
      }
      
      public function get soundData() : ByteArray
      {
         return this._soundData;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         this._characterId = param1.readUI16();
         this.soundFormat = param1.readUB(4);
         this.soundRate = param1.readUB(2);
         this.soundSize = param1.readUB(1);
         this.soundType = param1.readUB(1);
         this.soundSampleCount = param1.readUI32();
         param1.readBytes(this._soundData,0,param2 - 7);
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeUI16(this.characterId);
         _loc3_.writeUB(4,this.soundFormat);
         _loc3_.writeUB(2,this.soundRate);
         _loc3_.writeUB(1,this.soundSize);
         _loc3_.writeUB(1,this.soundType);
         _loc3_.writeUI32(this.soundSampleCount);
         if(this._soundData.length > 0)
         {
            _loc3_.writeBytes(this._soundData);
         }
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      public function clone() : IDefinitionTag
      {
         var _loc1_:TagDefineSound = new TagDefineSound();
         _loc1_.characterId = this.characterId;
         _loc1_.soundFormat = this.soundFormat;
         _loc1_.soundRate = this.soundRate;
         _loc1_.soundSize = this.soundSize;
         _loc1_.soundType = this.soundType;
         _loc1_.soundSampleCount = this.soundSampleCount;
         if(this._soundData.length > 0)
         {
            _loc1_.soundData.writeBytes(this._soundData);
         }
         return _loc1_;
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "DefineSound";
      }
      
      public function get version() : uint
      {
         return 1;
      }
      
      public function get level() : uint
      {
         return 1;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         return Tag.toStringCommon(this.type,this.name,param1) + "SoundID: " + this.characterId + ", " + "Format: " + SoundCompression.toString(this.soundFormat) + ", " + "Rate: " + SoundRate.toString(this.soundRate) + ", " + "Size: " + SoundSize.toString(this.soundSize) + ", " + "Type: " + SoundType.toString(this.soundType) + ", " + "Samples: " + this.soundSampleCount;
      }
      
      internal function processMP3(param1:ByteArray) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = param1.length;
         var _loc5_:uint = 0;
         var _loc6_:Boolean = true;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:MPEGFrame = new MPEGFrame();
         var _loc10_:String = "id3v2";
         while(_loc2_ < param1.length)
         {
            switch(_loc10_)
            {
               case "id3v2":
                  if(param1[_loc2_] == 73 && param1[_loc2_ + 1] == 68 && param1[_loc2_ + 2] == 51)
                  {
                     _loc2_ += 10 + (param1[_loc2_ + 6] << 21 | param1[_loc2_ + 7] << 14 | param1[_loc2_ + 8] << 7 | param1[_loc2_ + 9]);
                  }
                  _loc3_ = _loc2_;
                  _loc10_ = "sync";
                  break;
               case "sync":
                  if(param1[_loc2_] == 255 && (param1[_loc2_ + 1] & 0xE0) == 224)
                  {
                     _loc10_ = "frame";
                  }
                  else if(param1[_loc2_] == 84 && param1[_loc2_ + 1] == 65 && param1[_loc2_ + 2] == 71)
                  {
                     _loc4_ = _loc2_;
                     _loc2_ = param1.length;
                  }
                  else
                  {
                     _loc2_++;
                  }
                  break;
               case "frame":
                  _loc9_.setHeaderByteAt(0,param1[_loc2_++]);
                  _loc9_.setHeaderByteAt(1,param1[_loc2_++]);
                  _loc9_.setHeaderByteAt(2,param1[_loc2_++]);
                  _loc9_.setHeaderByteAt(3,param1[_loc2_++]);
                  if(_loc9_.hasCRC)
                  {
                     _loc9_.setCRCByteAt(0,param1[_loc2_++]);
                     _loc9_.setCRCByteAt(1,param1[_loc2_++]);
                  }
                  if(_loc6_)
                  {
                     _loc6_ = false;
                     _loc7_ = _loc9_.samplingrate;
                     _loc8_ = _loc9_.channelMode;
                  }
                  _loc5_ += _loc9_.samples;
                  _loc2_ += _loc9_.size;
                  _loc10_ = "sync";
                  break;
            }
         }
         this.soundSampleCount = _loc5_;
         this.soundFormat = SoundCompression.MP3;
         this.soundSize = SoundSize.BIT_16;
         this.soundType = _loc8_ == MPEGFrame.CHANNEL_MODE_MONO ? SoundType.MONO : SoundType.STEREO;
         switch(_loc7_)
         {
            case 44100:
               this.soundRate = SoundRate.KHZ_44;
               break;
            case 22050:
               this.soundRate = SoundRate.KHZ_22;
               break;
            case 11025:
               this.soundRate = SoundRate.KHZ_11;
               break;
            default:
               throw new Error("Unsupported sampling rate: " + _loc7_ + " Hz");
         }
         this.soundData.length = 0;
         this.soundData.writeShort(0);
         this.soundData.writeBytes(param1,_loc3_,_loc4_ - _loc3_);
      }
      
      public function _15084() : _14156
      {
         var _loc1_:Array = [5512,11025,22050,44100];
         return new _14156(this.soundFormat,_loc1_[this.soundRate],Boolean(this.soundType));
      }
   }
}

