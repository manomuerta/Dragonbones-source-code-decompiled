package _14151
{
   import _14157._14156;
   import com.codeazur.as3swf.SWFData;
   import flash.utils.ByteArray;
   
   public class _14154 implements _14153
   {
      public static const NELLY_BLOCK_LEN:int = 64;
      
      public static const NELLY_BUF_LEN:int = 128;
      
      public static const NELLY_SAMPLES:int = 2 * NELLY_BUF_LEN;
      
      private var soundFormat:_14156;
      
      public function _14154(param1:_14156)
      {
         super();
         this.soundFormat = param1;
      }
      
      public function decode(param1:ByteArray) : SWFData
      {
         var _loc8_:int = 0;
         var _loc9_:ByteArray = null;
         var _loc10_:Array = null;
         var _loc11_:int = 0;
         var _loc12_:ByteArray = null;
         var _loc13_:int = 0;
         var _loc2_:SWFData = new SWFData();
         _loc2_.writeBytes(param1);
         _loc2_.position = 0;
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         var _loc5_:SWFData = new SWFData();
         var _loc6_:int = _loc2_.bytesAvailable / NELLY_BLOCK_LEN;
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc8_ = Math.min(_loc2_.bytesAvailable,NELLY_BLOCK_LEN);
            _loc9_ = new ByteArray();
            _loc2_.readBytes(_loc9_,0,_loc8_);
            _14152.decode(_loc4_,_loc9_,_loc3_);
            _loc10_ = [];
            _loc11_ = 0;
            while(_loc11_ < _loc3_.length)
            {
               _loc10_[_loc11_] = _loc3_[_loc11_];
               _loc11_++;
            }
            _loc12_ = new ByteArray();
            _loc11_ = 0;
            while(_loc11_ < _loc10_.length)
            {
               _loc13_ = int(_loc10_[_loc11_]);
               _loc12_[_loc11_ * 2] = _loc13_ & 0xFF;
               _loc12_[_loc11_ * 2 + 1] = _loc13_ >> 8 & 0xFF;
               _loc11_++;
            }
            _loc5_.writeBytes(_loc12_);
            _loc7_++;
         }
         return _loc5_;
      }
   }
}

