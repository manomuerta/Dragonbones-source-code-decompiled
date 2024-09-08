package _12936
{
   import _12920._12919;
   import _12939._12941;
   import flash.utils.ByteArray;
   
   public class _12937
   {
      public static const QRSPEC_VERSION_MAX:int = 40;
      
      public static const QRSPEC_WIDTH_MAX:int = 177;
      
      public static var frames:Array = [];
      
      public static const lengthTableBits:Array = [[10,12,14],[9,11,13],[8,16,16],[8,10,12]];
      
      public static const eccTable:Array = [[[0,0],[0,0],[0,0],[0,0]],[[1,0],[1,0],[1,0],[1,0]],[[1,0],[1,0],[1,0],[1,0]],[[1,0],[1,0],[2,0],[2,0]],[[1,0],[2,0],[2,0],[4,0]],[[1,0],[2,0],[2,2],[2,2]],[[2,0],[4,0],[4,0],[4,0]],[[2,0],[4,0],[2,4],[4,1]],[[2,0],[2,2],[4,2],[4,2]],[[2,0],[3,2],[4,4],[4,4]],[[2,2],[4,1],[6,2],[6,2]],[[4,0],[1,4],[4,4],[3,8]],[[2,2],[6,2],[4,6],[7,4]],[[4,0],[8,1],[8,4],[12,4]],[[3,1],[4,5],[11,5],[11,5]],[[5,1],[5,5],[5,7],[11,7]],[[5,1],[7,3],[15,2],[3,13]],[[1,5],[10,1],[1,15],[2,17]],[[5,1],[9,4],[17,1],[2,19]],[[3,4],[3,11],[17,4],[9,16]],[[3,5],[3,13],[15,5],[15,10]],[[4,4],[17,0],[17,6],[19,6]],[[2,7],[17,0],[7,16],[34,0]],[[4,5],[4,14],[11,14],[16,14]],[[6,4],[6,14],[11,16],[30,2]],[[8,4],[8,13],[7,22],[22,13]],[[10,2],[19,4],[28,6],[33,4]],[[8,4],[22,3],[8,26],[12,28]],[[3,10],[3,23],[4,31],[11,31]],[[7,7],[21,7],[1,37],[19,26]],[[5,10],[19,10],[15,25],[23,25]],[[13,3],[2,29],[42,1],[23,28]],[[17,0],[10,23],[10,35],[19,35]],[[17,1],[14,21],[29,19],[11,46]],[[13,6],[14,23],[44,7],[59,1]],[[12,7],[12,26],[39,14],[22,41]],[[6,14],[6,34],[46,10],[2,64]],[[17,4],[29,14],[49,10],[24,46]],[[4,18],[13,32],[48,14],[42,32]],[[20,4],[40,7],[43,22],[10,67]],[[19,6],[18,31],[34,34],[20,61]]];
      
      public static const alignmentPattern:Array = [[0,0],[0,0],[18,0],[22,0],[26,0],[30,0],[34,0],[22,38],[24,42],[26,46],[28,50],[30,54],[32,58],[34,62],[26,46],[26,48],[26,50],[30,54],[30,56],[30,58],[34,62],[28,50],[26,50],[30,54],[28,54],[32,58],[30,58],[34,62],[26,50],[30,54],[26,52],[30,56],[34,60],[30,58],[34,62],[30,54],[24,50],[28,54],[32,58],[26,54],[30,58]];
      
      public static const versionPattern:Array = [31892,34236,39577,42195,48118,51042,55367,58893,63784,68472,70749,76311,79154,84390,87683,92361,96236,102084,102881,110507,110734,117786,119615,126325,127568,133589,136944,141498,145311,150283,152622,158308,161089,167017];
      
      public static const formatInfo:Array = [[30660,29427,32170,30877,26159,25368,27713,26998],[21522,20773,24188,23371,17913,16590,20375,19104],[13663,12392,16177,14854,9396,8579,11994,11245],[5769,5054,7399,6608,1890,597,3340,2107]];
      
      public function _12937()
      {
         super();
      }
      
      public static function _13159(param1:int) : _12935
      {
         return new _12935(param1);
      }
      
      public static function _13094(param1:int, param2:int) : int
      {
         var _loc3_:_12935 = _13159(param1);
         return _loc3_.words - _loc3_.ec[param2];
      }
      
      public static function _13158(param1:int, param2:int) : int
      {
         return _13159(param1).ec[param2];
      }
      
      public static function _13123(param1:int) : int
      {
         return _13159(param1).width;
      }
      
      public static function _13118(param1:int) : Number
      {
         return _13159(param1).remainder;
      }
      
      public static function _13086(param1:int, param2:int) : int
      {
         var _loc4_:_12935 = null;
         var _loc5_:int = 0;
         var _loc3_:int = 1;
         while(_loc3_ <= QRSPEC_VERSION_MAX)
         {
            _loc4_ = _13159(_loc3_);
            if((_loc5_ = _loc4_.words - _loc4_.ec[param2]) >= param1)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      public static function _13088(param1:int, param2:int) : int
      {
         var _loc3_:int = 0;
         if(param1 == _12919.QRCODE_ENCODE_STRUCTURE)
         {
            return 0;
         }
         if(param2 <= 9)
         {
            _loc3_ = 0;
         }
         else if(param2 <= 26)
         {
            _loc3_ = 1;
         }
         else
         {
            _loc3_ = 2;
         }
         return lengthTableBits[param1][_loc3_];
      }
      
      public static function _13098(param1:int, param2:int) : int
      {
         var _loc3_:int = 0;
         if(param1 == _12919.QRCODE_ENCODE_STRUCTURE)
         {
            return 3;
         }
         if(param2 <= 9)
         {
            _loc3_ = 0;
         }
         else if(param2 <= 26)
         {
            _loc3_ = 1;
         }
         else
         {
            _loc3_ = 2;
         }
         var _loc4_:int = int(lengthTableBits[param1][_loc3_]);
         var _loc5_:int = (1 << _loc4_) - 1;
         if(param1 == _12919.QRCODE_ENCODE_KANJI)
         {
            _loc5_ *= 2;
         }
         return _loc5_;
      }
      
      public static function _13071(param1:int, param2:int, param3:Array = null) : Array
      {
         if(param3 == null || param3.length < 5)
         {
            param3 = [0,0,0,0,0];
         }
         var _loc4_:int = int(eccTable[param1][param2][0]);
         var _loc5_:int = int(eccTable[param1][param2][1]);
         var _loc6_:int = _13094(param1,param2);
         var _loc7_:int = _13158(param1,param2);
         if(_loc5_ == 0)
         {
            param3[0] = _loc4_;
            param3[1] = _loc6_ / _loc4_ as int;
            param3[2] = _loc7_ / _loc4_ as int;
            param3[3] = 0;
            param3[4] = 0;
         }
         else
         {
            param3[0] = _loc4_;
            param3[1] = int(_loc6_ / (_loc4_ + _loc5_));
            param3[2] = int(_loc7_ / (_loc4_ + _loc5_));
            param3[3] = _loc5_;
            param3[4] = param3[1] + 1;
         }
         return param3;
      }
      
      public static function _13155(param1:Array, param2:int, param3:int) : Array
      {
         var _loc7_:int = 0;
         var _loc4_:Vector.<uint> = new Vector.<uint>();
         _loc4_.push(161,161,161,161,161,161,160,160,160,161,161,160,161,160,161,161,160,160,160,161,161,161,161,161,161);
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         while(_loc6_ < 5)
         {
            _loc7_ = 0;
            while(_loc7_ < 5)
            {
               (param1[param2 + _loc6_ - 2] as Array)[param3 + _loc7_ - 2] = _loc4_[_loc5_ + _loc7_];
               _loc7_++;
            }
            _loc5_ += 5;
            _loc6_++;
         }
         return param1;
      }
      
      public static function _13154(param1:int, param2:Array, param3:int) : Array
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param1 < 2)
         {
            return param2;
         }
         var _loc4_:int = alignmentPattern[param1][1] - alignmentPattern[param1][0];
         if(_loc4_ < 0)
         {
            _loc5_ = 2;
         }
         else
         {
            _loc5_ = int((param3 - alignmentPattern[param1][0]) / _loc4_ + 2);
         }
         if(_loc5_ * _loc5_ - 3 == 1)
         {
            _loc6_ = int(alignmentPattern[param1][0]);
            _loc7_ = int(alignmentPattern[param1][0]);
            return _13155(param2,_loc6_,_loc7_);
         }
         var _loc8_:int = int(alignmentPattern[param1][0]);
         _loc6_ = 1;
         while(_loc6_ < _loc5_ - 1)
         {
            param2 = _13155(param2,6,_loc8_);
            param2 = _13155(param2,_loc8_,6);
            _loc8_ += _loc4_;
            _loc6_++;
         }
         var _loc9_:int = int(alignmentPattern[param1][0]);
         _loc7_ = 0;
         while(_loc7_ < _loc5_ - 1)
         {
            _loc8_ = int(alignmentPattern[param1][0]);
            _loc6_ = 0;
            while(_loc6_ < _loc5_ - 1)
            {
               param2 = _13155(param2,_loc8_,_loc9_);
               _loc8_ += _loc4_;
               _loc6_++;
            }
            _loc9_ += _loc4_;
            _loc7_++;
         }
         return param2;
      }
      
      public static function _13156(param1:int) : uint
      {
         if(param1 < 7 || param1 > QRSPEC_VERSION_MAX)
         {
            return 0;
         }
         return versionPattern[param1 - 7];
      }
      
      public static function _13128(param1:int, param2:int) : uint
      {
         if(param1 < 0 || param1 > 7)
         {
            return 0;
         }
         if(param2 < 0 || param2 > 3)
         {
            return 0;
         }
         return formatInfo[param2][param1];
      }
      
      public static function _13157(param1:Array, param2:int, param3:int) : Array
      {
         var _loc7_:int = 0;
         var _loc4_:Array = [193,193,193,193,193,193,193,193,192,192,192,192,192,193,193,192,193,193,193,192,193,193,192,193,193,193,192,193,193,192,193,193,193,192,193,193,192,192,192,192,192,193,193,193,193,193,193,193,193];
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         while(_loc6_ < 7)
         {
            _loc7_ = 0;
            while(_loc7_ < 7)
            {
               (param1[param2 + _loc6_] as Array)[param3 + _loc7_] = _loc4_[_loc5_ + _loc7_];
               _loc7_++;
            }
            _loc5_ += 7;
            _loc6_++;
         }
         return param1;
      }
      
      public static function _13160(param1:int) : Array
      {
         var _loc11_:int = 0;
         var _loc12_:* = 0;
         var _loc13_:int = 0;
         var _loc2_:int = _13159(param1).width;
         var _loc3_:Array = _12941._13069(0,_loc2_,0);
         var _loc4_:Array = _12941._13069(0,_loc2_,_loc3_);
         _loc4_ = _13157(_loc4_,0,0);
         _loc4_ = _13157(_loc4_,_loc2_ - 7,0);
         _loc4_ = _13157(_loc4_,0,_loc2_ - 7);
         var _loc5_:int = _loc2_ - 7;
         var _loc6_:int = 0;
         while(_loc6_ < 7)
         {
            _loc4_[_loc6_][7] = 192;
            _loc4_[_loc6_][_loc2_ - 8] = 192;
            _loc4_[_loc5_][7] = 192;
            _loc6_++;
            _loc5_++;
         }
         var _loc7_:Array = _12941._13069(0,8,192);
         var _loc8_:int = 0;
         var _loc9_:int = _loc2_ - 7;
         _loc6_ = 0;
         while(_loc6_ < 7)
         {
            _loc4_[_loc8_][7] = 192;
            _loc4_[_loc8_][_loc2_ - 8] = 192;
            _loc4_[_loc9_][7] = 192;
            _loc6_++;
            _loc9_++;
            _loc8_++;
         }
         _loc4_ = _12941._12945(_loc4_,7,0,192,8);
         _loc4_ = _12941._12945(_loc4_,7,_loc2_ - 8,192,_loc2_ - 8);
         _loc4_ = _12941._12945(_loc4_,_loc2_ - 8,0,192,8);
         _loc5_ = _loc2_ - 8;
         _loc4_ = _12941._12945(_loc4_,8,0,132,9);
         _loc4_ = _12941._12945(_loc4_,8,_loc2_ - 8,132,8);
         _loc6_ = 0;
         while(_loc6_ < 8)
         {
            _loc4_[_loc6_][8] = 132;
            _loc4_[_loc5_][8] = 132;
            _loc6_++;
            _loc5_++;
         }
         var _loc10_:int = 1;
         while(_loc10_ < _loc2_ - 15)
         {
            _loc4_[6][7 + _loc10_] = 0x90 | _loc10_ & 1;
            _loc4_[7 + _loc10_][6] = 0x90 | _loc10_ & 1;
            _loc10_++;
         }
         _loc4_ = _13154(param1,_loc4_,_loc2_);
         if(param1 >= 7)
         {
            _loc12_ = _loc11_ = int(_13156(param1));
            _loc13_ = 0;
            while(_loc13_ < 6)
            {
               _loc6_ = 0;
               while(_loc6_ < 3)
               {
                  _loc4_[_loc2_ - 11 + _loc6_][_loc13_] = 0x88 | _loc12_ & 1;
                  _loc12_ >>= 1;
                  _loc6_++;
               }
               _loc13_++;
            }
            _loc12_ = _loc11_;
            _loc6_ = 0;
            while(_loc6_ < 6)
            {
               _loc13_ = 0;
               while(_loc13_ < 3)
               {
                  _loc4_[_loc6_][_loc13_ + (_loc2_ - 11)] = 0x88 | _loc12_ & 1;
                  _loc12_ >>= 1;
                  _loc13_++;
               }
               _loc6_++;
            }
         }
         _loc4_[_loc2_ - 8][8] = 129;
         return _loc4_;
      }
      
      public static function _13162(param1:Array) : ByteArray
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeObject(param1);
         _loc2_.compress();
         return _loc2_;
      }
      
      public static function _13161(param1:ByteArray) : Array
      {
         param1.uncompress();
         return param1.readObject() as Array;
      }
      
      public static function _12971(param1:int) : Array
      {
         if(param1 < 1 || param1 > QRSPEC_VERSION_MAX)
         {
            return null;
         }
         if(frames[param1] == null)
         {
            frames[param1] = _13160(param1);
         }
         if(frames[param1] == null)
         {
            return [];
         }
         return frames[param1];
      }
      
      public static function _13070(param1:Array) : int
      {
         return param1[0] + param1[3];
      }
      
      public static function _13063(param1:Array) : int
      {
         return param1[0];
      }
      
      public static function _13060(param1:Array) : int
      {
         return param1[1];
      }
      
      public static function _13064(param1:Array) : int
      {
         return param1[2];
      }
      
      public static function _13065(param1:Array) : int
      {
         return param1[3];
      }
      
      public static function _13061(param1:Array) : int
      {
         return param1[4];
      }
      
      public static function _13066(param1:Array) : int
      {
         return param1[2];
      }
      
      public static function _13062(param1:Array) : int
      {
         return param1[0] * param1[1] + param1[3] * param1[4];
      }
      
      public static function _13067(param1:Array) : int
      {
         return (param1[0] + param1[3]) * param1[2];
      }
   }
}

