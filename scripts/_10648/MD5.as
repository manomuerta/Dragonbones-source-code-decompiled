package _10648
{
   public class MD5
   {
      public function MD5()
      {
         super();
         throw new Error("Static class.");
      }
      
      private static function _11086(param1:int, param2:int) : int
      {
         return param1 << param2 | param1 >>> 32 - param2;
      }
      
      private static function _11085(param1:int, param2:int) : int
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:int = 0;
         _loc5_ = param1 & 2147483648;
         _loc6_ = param2 & 2147483648;
         _loc3_ = param1 & 0x40000000;
         _loc4_ = param2 & 0x40000000;
         _loc7_ = (param1 & 0x3FFFFFFF) + (param2 & 0x3FFFFFFF);
         if(_loc3_ & _loc4_)
         {
            return _loc7_ ^ 2147483648 ^ _loc5_ ^ _loc6_;
         }
         if(_loc3_ | _loc4_)
         {
            if(_loc7_ & 0x40000000)
            {
               return _loc7_ ^ 3221225472 ^ _loc5_ ^ _loc6_;
            }
            return _loc7_ ^ 0x40000000 ^ _loc5_ ^ _loc6_;
         }
         return _loc7_ ^ _loc5_ ^ _loc6_;
      }
      
      private static function f(param1:int, param2:int, param3:int) : int
      {
         return param1 & param2 | ~param1 & param3;
      }
      
      private static function g(param1:int, param2:int, param3:int) : int
      {
         return param1 & param3 | param2 & ~param3;
      }
      
      private static function h(param1:int, param2:int, param3:int) : int
      {
         return param1 ^ param2 ^ param3;
      }
      
      private static function _11088(param1:int, param2:int, param3:int) : int
      {
         return param2 ^ (param1 | ~param3);
      }
      
      private static function ff(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : int
      {
         param1 = _11085(param1,_11085(_11085(f(param2,param3,param4),param5),param7));
         return _11085(_11086(param1,param6),param2);
      }
      
      private static function gg(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : int
      {
         param1 = _11085(param1,_11085(_11085(g(param2,param3,param4),param5),param7));
         return _11085(_11086(param1,param6),param2);
      }
      
      private static function hh(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : int
      {
         param1 = _11085(param1,_11085(_11085(h(param2,param3,param4),param5),param7));
         return _11085(_11086(param1,param6),param2);
      }
      
      private static function ii(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : int
      {
         param1 = _11085(param1,_11085(_11085(_11088(param2,param3,param4),param5),param7));
         return _11085(_11086(param1,param6),param2);
      }
      
      private static function _11084(param1:Array) : Array
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(param1.length);
         var _loc4_:int = _loc3_ + 8;
         var _loc5_:int = (_loc4_ - _loc4_ % 64) / 64;
         var _loc6_:int = (_loc5_ + 1) * 16;
         var _loc7_:Array = new Array();
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         while(_loc9_ < _loc3_)
         {
            _loc2_ = (_loc9_ - _loc9_ % 4) / 4;
            _loc8_ = _loc9_ % 4 * 8;
            _loc7_[_loc2_] |= param1[_loc9_] << _loc8_;
            _loc9_++;
         }
         _loc2_ = (_loc9_ - _loc9_ % 4) / 4;
         _loc8_ = _loc9_ % 4 * 8;
         _loc7_[_loc2_] |= 128 << _loc8_;
         _loc7_[_loc6_ - 2] = _loc3_ << 3;
         _loc7_[_loc6_ - 1] = _loc3_ >>> 29;
         return _loc7_;
      }
      
      private static function _11087(param1:int) : Array
      {
         var _loc2_:* = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = new Array();
         _loc3_ = 0;
         while(_loc3_ <= 3)
         {
            _loc2_ = param1 >>> _loc3_ * 8 & 0xFF;
            _loc4_ = _loc4_.concat(_loc2_);
            _loc3_++;
         }
         return _loc4_;
      }
      
      public static function encode(param1:Array) : Array
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc2_:Array = new Array();
         var _loc12_:Array = _10650._11071("67452301efcdab8998badcfe10325476d76aa478e8c7b756242070dbc1bdceeef57c0faf4787c62aa8304613fd469501698098d88b44f7afffff5bb1895cd7be6b901122fd987193a679438e49b40821f61e2562c040b340265e5a51e9b6c7aad62f105d02441453d8a1e681e7d3fbc821e1cde6c33707d6f4d50d87455a14eda9e3e905fcefa3f8676f02d98d2a4c8afffa39428771f6816d9d6122fde5380ca4beea444bdecfa9f6bb4b60bebfbc70289b7ec6eaa127fad4ef308504881d05d9d4d039e6db99e51fa27cf8c4ac5665f4292244432aff97ab9423a7fc93a039655b59c38f0ccc92ffeff47d85845dd16fa87e4ffe2ce6e0a30143144e0811a1f7537e82bd3af2352ad7d2bbeb86d391",8);
         _loc2_ = _11084(param1);
         _loc8_ = int(_loc12_[0]);
         _loc9_ = int(_loc12_[1]);
         _loc10_ = int(_loc12_[2]);
         _loc11_ = int(_loc12_[3]);
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc8_;
            _loc5_ = _loc9_;
            _loc6_ = _loc10_;
            _loc7_ = _loc11_;
            _loc8_ = ff(_loc8_,_loc9_,_loc10_,_loc11_,_loc2_[_loc3_ + 0],7,_loc12_[4]);
            _loc11_ = ff(_loc11_,_loc8_,_loc9_,_loc10_,_loc2_[_loc3_ + 1],12,_loc12_[5]);
            _loc10_ = ff(_loc10_,_loc11_,_loc8_,_loc9_,_loc2_[_loc3_ + 2],17,_loc12_[6]);
            _loc9_ = ff(_loc9_,_loc10_,_loc11_,_loc8_,_loc2_[_loc3_ + 3],22,_loc12_[7]);
            _loc8_ = ff(_loc8_,_loc9_,_loc10_,_loc11_,_loc2_[_loc3_ + 4],7,_loc12_[8]);
            _loc11_ = ff(_loc11_,_loc8_,_loc9_,_loc10_,_loc2_[_loc3_ + 5],12,_loc12_[9]);
            _loc10_ = ff(_loc10_,_loc11_,_loc8_,_loc9_,_loc2_[_loc3_ + 6],17,_loc12_[10]);
            _loc9_ = ff(_loc9_,_loc10_,_loc11_,_loc8_,_loc2_[_loc3_ + 7],22,_loc12_[11]);
            _loc8_ = ff(_loc8_,_loc9_,_loc10_,_loc11_,_loc2_[_loc3_ + 8],7,_loc12_[12]);
            _loc11_ = ff(_loc11_,_loc8_,_loc9_,_loc10_,_loc2_[_loc3_ + 9],12,_loc12_[13]);
            _loc10_ = ff(_loc10_,_loc11_,_loc8_,_loc9_,_loc2_[_loc3_ + 10],17,_loc12_[14]);
            _loc9_ = ff(_loc9_,_loc10_,_loc11_,_loc8_,_loc2_[_loc3_ + 11],22,_loc12_[15]);
            _loc8_ = ff(_loc8_,_loc9_,_loc10_,_loc11_,_loc2_[_loc3_ + 12],7,_loc12_[16]);
            _loc11_ = ff(_loc11_,_loc8_,_loc9_,_loc10_,_loc2_[_loc3_ + 13],12,_loc12_[17]);
            _loc10_ = ff(_loc10_,_loc11_,_loc8_,_loc9_,_loc2_[_loc3_ + 14],17,_loc12_[18]);
            _loc9_ = ff(_loc9_,_loc10_,_loc11_,_loc8_,_loc2_[_loc3_ + 15],22,_loc12_[19]);
            _loc8_ = gg(_loc8_,_loc9_,_loc10_,_loc11_,_loc2_[_loc3_ + 1],5,_loc12_[20]);
            _loc11_ = gg(_loc11_,_loc8_,_loc9_,_loc10_,_loc2_[_loc3_ + 6],9,_loc12_[21]);
            _loc10_ = gg(_loc10_,_loc11_,_loc8_,_loc9_,_loc2_[_loc3_ + 11],14,_loc12_[22]);
            _loc9_ = gg(_loc9_,_loc10_,_loc11_,_loc8_,_loc2_[_loc3_ + 0],20,_loc12_[23]);
            _loc8_ = gg(_loc8_,_loc9_,_loc10_,_loc11_,_loc2_[_loc3_ + 5],5,_loc12_[24]);
            _loc11_ = gg(_loc11_,_loc8_,_loc9_,_loc10_,_loc2_[_loc3_ + 10],9,_loc12_[25]);
            _loc10_ = gg(_loc10_,_loc11_,_loc8_,_loc9_,_loc2_[_loc3_ + 15],14,_loc12_[26]);
            _loc9_ = gg(_loc9_,_loc10_,_loc11_,_loc8_,_loc2_[_loc3_ + 4],20,_loc12_[27]);
            _loc8_ = gg(_loc8_,_loc9_,_loc10_,_loc11_,_loc2_[_loc3_ + 9],5,_loc12_[28]);
            _loc11_ = gg(_loc11_,_loc8_,_loc9_,_loc10_,_loc2_[_loc3_ + 14],9,_loc12_[29]);
            _loc10_ = gg(_loc10_,_loc11_,_loc8_,_loc9_,_loc2_[_loc3_ + 3],14,_loc12_[30]);
            _loc9_ = gg(_loc9_,_loc10_,_loc11_,_loc8_,_loc2_[_loc3_ + 8],20,_loc12_[31]);
            _loc8_ = gg(_loc8_,_loc9_,_loc10_,_loc11_,_loc2_[_loc3_ + 13],5,_loc12_[32]);
            _loc11_ = gg(_loc11_,_loc8_,_loc9_,_loc10_,_loc2_[_loc3_ + 2],9,_loc12_[33]);
            _loc10_ = gg(_loc10_,_loc11_,_loc8_,_loc9_,_loc2_[_loc3_ + 7],14,_loc12_[34]);
            _loc9_ = gg(_loc9_,_loc10_,_loc11_,_loc8_,_loc2_[_loc3_ + 12],20,_loc12_[35]);
            _loc8_ = hh(_loc8_,_loc9_,_loc10_,_loc11_,_loc2_[_loc3_ + 5],4,_loc12_[36]);
            _loc11_ = hh(_loc11_,_loc8_,_loc9_,_loc10_,_loc2_[_loc3_ + 8],11,_loc12_[37]);
            _loc10_ = hh(_loc10_,_loc11_,_loc8_,_loc9_,_loc2_[_loc3_ + 11],16,_loc12_[38]);
            _loc9_ = hh(_loc9_,_loc10_,_loc11_,_loc8_,_loc2_[_loc3_ + 14],23,_loc12_[39]);
            _loc8_ = hh(_loc8_,_loc9_,_loc10_,_loc11_,_loc2_[_loc3_ + 1],4,_loc12_[40]);
            _loc11_ = hh(_loc11_,_loc8_,_loc9_,_loc10_,_loc2_[_loc3_ + 4],11,_loc12_[41]);
            _loc10_ = hh(_loc10_,_loc11_,_loc8_,_loc9_,_loc2_[_loc3_ + 7],16,_loc12_[42]);
            _loc9_ = hh(_loc9_,_loc10_,_loc11_,_loc8_,_loc2_[_loc3_ + 10],23,_loc12_[43]);
            _loc8_ = hh(_loc8_,_loc9_,_loc10_,_loc11_,_loc2_[_loc3_ + 13],4,_loc12_[44]);
            _loc11_ = hh(_loc11_,_loc8_,_loc9_,_loc10_,_loc2_[_loc3_ + 0],11,_loc12_[45]);
            _loc10_ = hh(_loc10_,_loc11_,_loc8_,_loc9_,_loc2_[_loc3_ + 3],16,_loc12_[46]);
            _loc9_ = hh(_loc9_,_loc10_,_loc11_,_loc8_,_loc2_[_loc3_ + 6],23,_loc12_[47]);
            _loc8_ = hh(_loc8_,_loc9_,_loc10_,_loc11_,_loc2_[_loc3_ + 9],4,_loc12_[48]);
            _loc11_ = hh(_loc11_,_loc8_,_loc9_,_loc10_,_loc2_[_loc3_ + 12],11,_loc12_[49]);
            _loc10_ = hh(_loc10_,_loc11_,_loc8_,_loc9_,_loc2_[_loc3_ + 15],16,_loc12_[50]);
            _loc9_ = hh(_loc9_,_loc10_,_loc11_,_loc8_,_loc2_[_loc3_ + 2],23,_loc12_[51]);
            _loc8_ = ii(_loc8_,_loc9_,_loc10_,_loc11_,_loc2_[_loc3_ + 0],6,_loc12_[52]);
            _loc11_ = ii(_loc11_,_loc8_,_loc9_,_loc10_,_loc2_[_loc3_ + 7],10,_loc12_[53]);
            _loc10_ = ii(_loc10_,_loc11_,_loc8_,_loc9_,_loc2_[_loc3_ + 14],15,_loc12_[54]);
            _loc9_ = ii(_loc9_,_loc10_,_loc11_,_loc8_,_loc2_[_loc3_ + 5],21,_loc12_[55]);
            _loc8_ = ii(_loc8_,_loc9_,_loc10_,_loc11_,_loc2_[_loc3_ + 12],6,_loc12_[56]);
            _loc11_ = ii(_loc11_,_loc8_,_loc9_,_loc10_,_loc2_[_loc3_ + 3],10,_loc12_[57]);
            _loc10_ = ii(_loc10_,_loc11_,_loc8_,_loc9_,_loc2_[_loc3_ + 10],15,_loc12_[58]);
            _loc9_ = ii(_loc9_,_loc10_,_loc11_,_loc8_,_loc2_[_loc3_ + 1],21,_loc12_[59]);
            _loc8_ = ii(_loc8_,_loc9_,_loc10_,_loc11_,_loc2_[_loc3_ + 8],6,_loc12_[60]);
            _loc11_ = ii(_loc11_,_loc8_,_loc9_,_loc10_,_loc2_[_loc3_ + 15],10,_loc12_[61]);
            _loc10_ = ii(_loc10_,_loc11_,_loc8_,_loc9_,_loc2_[_loc3_ + 6],15,_loc12_[62]);
            _loc9_ = ii(_loc9_,_loc10_,_loc11_,_loc8_,_loc2_[_loc3_ + 13],21,_loc12_[63]);
            _loc8_ = ii(_loc8_,_loc9_,_loc10_,_loc11_,_loc2_[_loc3_ + 4],6,_loc12_[64]);
            _loc11_ = ii(_loc11_,_loc8_,_loc9_,_loc10_,_loc2_[_loc3_ + 11],10,_loc12_[65]);
            _loc10_ = ii(_loc10_,_loc11_,_loc8_,_loc9_,_loc2_[_loc3_ + 2],15,_loc12_[66]);
            _loc9_ = ii(_loc9_,_loc10_,_loc11_,_loc8_,_loc2_[_loc3_ + 9],21,_loc12_[67]);
            _loc8_ = _11085(_loc8_,_loc4_);
            _loc9_ = _11085(_loc9_,_loc5_);
            _loc10_ = _11085(_loc10_,_loc6_);
            _loc11_ = _11085(_loc11_,_loc7_);
            _loc3_ += 16;
         }
         return _11087(_loc8_).concat(_11087(_loc9_),_11087(_loc10_),_11087(_loc11_));
      }
   }
}

