package _10648
{
   public class Base64
   {
      private static const _chars:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
      
      private static var chars:Array = _chars.split("");
      
      public function Base64()
      {
         super();
         throw new Error("Static class.");
      }
      
      public static function encode(param1:Array, param2:Boolean = false) : String
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc3_:Array = new Array();
         var _loc4_:* = new String();
         var _loc7_:int = Math.floor(param1.length * 16 / 3);
         _loc5_ = 0;
         while(_loc5_ < param1.length * 16)
         {
            _loc3_.push(param1[Math.floor(_loc5_ / 16)][_loc5_ % 16]);
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc4_ += chars[_loc3_[_loc5_] >> 2];
            _loc4_ = _loc4_ += chars[_loc3_[_loc5_] >> 2] + chars[(_loc3_[_loc5_] & 3) << 4 | _loc3_[_loc5_ + 1] >> 4];
            if(_loc3_[_loc5_ + 1] !== undefined)
            {
               _loc4_ += chars[(_loc3_[_loc5_ + 1] & 0x0F) << 2 | _loc3_[_loc5_ + 2] >> 6];
            }
            else
            {
               _loc4_ += "=";
            }
            if(_loc3_[_loc5_ + 2] !== undefined)
            {
               _loc4_ += chars[_loc3_[_loc5_ + 2] & 0x3F];
            }
            else
            {
               _loc4_ += "=";
            }
            _loc5_ += 3;
         }
         _loc6_ = _loc4_.slice(0,64) + "\n";
         _loc5_ = 1;
         while(_loc5_ < Math.ceil(_loc4_.length / 64))
         {
            _loc6_ += _loc4_.slice(_loc5_ * 64,_loc5_ * 64 + 64) + (Math.ceil(_loc4_.length / 64) === _loc5_ + 1 ? "" : "\n");
            _loc5_++;
         }
         return _loc6_;
      }
      
      public static function decode(param1:String) : Array
      {
         var _loc5_:int = 0;
         param1 = param1.replace(/\n/g,"");
         var _loc2_:Array = new Array();
         var _loc3_:Array = new Array();
         var _loc4_:Array = new Array();
         _loc5_ = 0;
         while(_loc5_ < param1.length)
         {
            _loc3_[0] = _chars.indexOf(param1.charAt(_loc5_));
            _loc3_[1] = _chars.indexOf(param1.charAt(_loc5_ + 1));
            _loc3_[2] = _chars.indexOf(param1.charAt(_loc5_ + 2));
            _loc3_[3] = _chars.indexOf(param1.charAt(_loc5_ + 3));
            _loc4_[0] = _loc3_[0] << 2 | _loc3_[1] >> 4;
            _loc4_[1] = (_loc3_[1] & 0x0F) << 4 | _loc3_[2] >> 2;
            _loc4_[2] = (_loc3_[2] & 3) << 6 | _loc3_[3];
            _loc2_.push(_loc4_[0],_loc4_[1],_loc4_[2]);
            _loc5_ += 4;
         }
         return _loc2_.slice(0,_loc2_.length - _loc2_.length % 16);
      }
   }
}

