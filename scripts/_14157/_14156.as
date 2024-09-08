package _14157
{
   import _14151._14150;
   import _14151._14153;
   import _14151._14154;
   import _14151._14155;
   import flash.utils.ByteArray;
   
   public class _14156
   {
      public static var UNCOMPRESSED_NATIVE_ENDIAN:int = 0;
      
      public static var ADPCM:int = 1;
      
      public static var MP3:int = 2;
      
      public static var UNCOMPRESSED_LITTLE_ENDIAN:int = 3;
      
      public static var NELLYMOSER_16_KHZ:int = 4;
      
      public static var NELLYMOSER_8_KHZ:int = 5;
      
      public static var NELLYMOSER:int = 6;
      
      public static var SPEEX:int = 11;
      
      public static const EXPORT_FORMAT_WAV:String = "WAV";
      
      public static const EXPORT_FORMAT_MP3:String = "MP3";
      
      public static const EXPORT_FORMAT_FLV:String = "FLV";
      
      public var _15142:int;
      
      public var _15137:int;
      
      public var stereo:Boolean;
      
      public function _14156(param1:int, param2:int, param3:Boolean)
      {
         super();
         this._15142 = param1;
         this._15137 = param2;
         this.stereo = param3;
         this._15138();
      }
      
      private function _15138() : void
      {
         switch(this._15142)
         {
            case NELLYMOSER_16_KHZ:
               this._15137 = 16000;
               break;
            case NELLYMOSER_8_KHZ:
               this._15137 = 8000;
               break;
            case NELLYMOSER:
               this._15137 = 22050;
         }
      }
      
      public function _15140() : _14153
      {
         this._15138();
         switch(this._15142)
         {
            case UNCOMPRESSED_NATIVE_ENDIAN:
            case UNCOMPRESSED_LITTLE_ENDIAN:
               return new _14155(this);
            case ADPCM:
               return new _14150(this);
            case NELLYMOSER_16_KHZ:
               return new _14154(this);
            case NELLYMOSER_8_KHZ:
               return new _14154(this);
            case NELLYMOSER:
               return new _14154(this);
            case SPEEX:
               return null;
            default:
               return null;
         }
      }
      
      public function decode(param1:ByteArray) : ByteArray
      {
         var _loc2_:_14153 = this._15140();
         return _loc2_.decode(param1);
      }
      
      public function _15136(param1:Array) : ByteArray
      {
         var _loc2_:ByteArray = new ByteArray();
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_.writeBytes(this.decode(param1[_loc3_]));
            _loc3_++;
         }
         return this._15134(this._15137,true,this.stereo,_loc2_);
      }
      
      public function _15141(param1:ByteArray) : ByteArray
      {
         var _loc3_:ByteArray = null;
         this._15138();
         var _loc2_:ByteArray = this.decode(param1);
         return this._15134(this._15137,true,this.stereo,_loc2_);
      }
      
      private function _15134(param1:int, param2:Boolean, param3:Boolean, param4:ByteArray) : ByteArray
      {
         var _loc5_:ByteArray = new ByteArray();
         var _loc6_:int = 1;
         this._15143(_loc5_,_loc6_,2);
         var _loc7_:int = param3 ? 2 : 1;
         this._15143(_loc5_,_loc7_,2);
         var _loc8_:int = param1;
         this._15143(_loc5_,_loc8_,4);
         var _loc9_:int = param2 ? 16 : 8;
         var _loc10_:int = _loc8_ * _loc7_ * _loc9_ / 8;
         this._15143(_loc5_,_loc10_,4);
         var _loc11_:int = _loc7_ * _loc9_ / 8;
         this._15143(_loc5_,_loc11_,2);
         this._15143(_loc5_,_loc9_,2);
         var _loc12_:ByteArray = new ByteArray();
         _loc12_.writeUTFBytes("fmt ");
         this._15143(_loc12_,_loc5_.length,4);
         _loc12_.writeBytes(_loc5_);
         _loc12_.writeUTFBytes("data");
         this._15143(_loc12_,param4.length,4);
         _loc12_.writeBytes(param4);
         var _loc13_:ByteArray = new ByteArray();
         _loc13_.writeUTFBytes("RIFF");
         this._15143(_loc13_,4 + _loc12_.length,4);
         _loc13_.writeUTFBytes("WAVE");
         _loc13_.writeBytes(_loc12_);
         return _loc13_;
      }
      
      private function _15143(param1:ByteArray, param2:Number, param3:int) : void
      {
         var _loc4_:int = 0;
         while(_loc4_ < param3)
         {
            param1.writeByte(param2 & 0xFF);
            param2 >>= 8;
            _loc4_++;
         }
      }
      
      public function _15133() : String
      {
         switch(this._15142)
         {
            case UNCOMPRESSED_NATIVE_ENDIAN:
            case UNCOMPRESSED_LITTLE_ENDIAN:
            case ADPCM:
            case NELLYMOSER_16_KHZ:
            case NELLYMOSER_16_KHZ:
            case NELLYMOSER:
               return EXPORT_FORMAT_WAV;
            case MP3:
               return EXPORT_FORMAT_MP3;
            case SPEEX:
               return EXPORT_FORMAT_FLV;
            default:
               return EXPORT_FORMAT_FLV;
         }
      }
      
      public function _15135() : String
      {
         var _loc1_:String = this._15133();
         var _loc2_:String = "";
         switch(_loc1_)
         {
            case EXPORT_FORMAT_MP3:
               _loc2_ = ".mp3";
               break;
            case EXPORT_FORMAT_WAV:
               _loc2_ = ".wav";
               break;
            case EXPORT_FORMAT_FLV:
               _loc2_ = ".flv";
         }
         return _loc2_;
      }
   }
}

