package _10648
{
   public class _10647
   {
      private static var Nr:int = 14;
      
      private static var Nk:int = 8;
      
      public static var _11067:Boolean = false;
      
      private static var _11072:Array = _10650._11071("637c777bf26b6fc53001672bfed7ab76ca82c97dfa5947f0add4a2af9ca472c0b7fd9326363ff7cc34a5e5f171d8311504c723c31896059a071280e2eb27b27509832c1a1b6e5aa0523bd6b329e32f8453d100ed20fcb15b6acbbe394a4c58cfd0efaafb434d338545f9027f503c9fa851a3408f929d38f5bcb6da2110fff3d2cd0c13ec5f974417c4a77e3d645d197360814fdc222a908846eeb814de5e0bdbe0323a0a4906245cc2d3ac629195e479e7c8376d8dd54ea96c56f4ea657aae08ba78252e1ca6b4c6e8dd741f4bbd8b8a703eb5664803f60e613557b986c11d9ee1f8981169d98e949b1e87e9ce5528df8ca1890dbfe6426841992d0fb054bb16",2);
      
      private static var _11070:Array = _11061(_11072);
      
      private static var Rcon:Array = _10650._11071("01020408102040801b366cd8ab4d9a2f5ebc63c697356ad4b37dfaefc591",2);
      
      private static var _11079:Array = _11083(2);
      
      private static var _11073:Array = _11083(3);
      
      private static var _11074:Array = _11083(9);
      
      private static var _11075:Array = _11083(11);
      
      private static var _11076:Array = _11083(13);
      
      private static var _11077:Array = _11083(14);
      
      public function _10647()
      {
         super();
         throw new Error("Static class.");
      }
      
      private static function _11066(param1:String) : String
      {
         var s:String = param1;
         try
         {
            return unescape(encodeURIComponent(s));
         }
         catch(e:Error)
         {
            throw "Error on UTF-8 encode";
         }
      }
      
      private static function _11064(param1:String) : String
      {
         var s:String = param1;
         try
         {
            return decodeURIComponent(escape(s));
         }
         catch(e:Error)
         {
            throw "Bad Key";
         }
      }
      
      private static function _11065(param1:Array) : Array
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1.length < 16)
         {
            _loc3_ = 16 - param1.length;
            _loc2_ = new Array(_loc3_,_loc3_,_loc3_,_loc3_,_loc3_,_loc3_,_loc3_,_loc3_,_loc3_,_loc3_,_loc3_,_loc3_,_loc3_,_loc3_,_loc3_,_loc3_);
         }
         else
         {
            _loc2_ = new Array();
         }
         _loc4_ = 0;
         while(_loc4_ < param1.length)
         {
            _loc2_[_loc4_] = param1[_loc4_];
            _loc4_++;
         }
         return _loc2_;
      }
      
      private static function _11069(param1:Array, param2:Boolean) : String
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:String = new String();
         if(param2)
         {
            _loc4_ = int(param1[15]);
            if(_loc4_ > 16)
            {
               throw "Decryption error: Maybe bad key";
            }
            if(_loc4_ === 16)
            {
               return "";
            }
            _loc5_ = 0;
            while(_loc5_ < 16 - _loc4_)
            {
               _loc3_ += String.fromCharCode(param1[_loc5_]);
               _loc5_++;
            }
         }
         else
         {
            _loc5_ = 0;
            while(_loc5_ < 16)
            {
               _loc3_ += String.fromCharCode(param1[_loc5_]);
               _loc5_++;
            }
         }
         return _loc3_;
      }
      
      public static function _11080(param1:Array) : String
      {
         var _loc3_:int = 0;
         var _loc2_:String = new String();
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ += (param1[_loc3_] < 16 ? "0" : "") + param1[_loc3_].toString(16);
            _loc3_++;
         }
         return _loc2_;
      }
      
      public static function _11081(param1:String) : Array
      {
         var result:Array = null;
         var s:String = param1;
         result = new Array();
         s.replace(/(..)/g,function(... rest):String
         {
            result.push(parseInt(rest[0],16));
            return rest[0];
         });
         return result;
      }
      
      public static function _11082(param1:String, param2:Boolean = false) : Array
      {
         var _loc4_:int = 0;
         var _loc3_:Array = new Array();
         if(!param2)
         {
            param1 = _11066(param1);
         }
         _loc4_ = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_[_loc4_] = param1.charCodeAt(_loc4_);
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function size(param1:int) : void
      {
         switch(param1)
         {
            case 128:
               Nr = 10;
               Nk = 4;
               break;
            case 192:
               Nr = 12;
               Nk = 6;
               break;
            case 256:
               Nr = 14;
               Nk = 8;
               break;
            default:
               throw "Invalid Key Size Specified:" + param1;
         }
      }
      
      private static function _11068(param1:int) : Array
      {
         var _loc3_:int = 0;
         var _loc2_:Array = new Array();
         _loc3_ = 0;
         while(_loc3_ < param1)
         {
            _loc2_.push(Math.floor(Math.random() * 256));
            _loc3_++;
         }
         return _loc2_;
      }
      
      public static function _11057(param1:Array, param2:Array) : Object
      {
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc7_:Array = null;
         var _loc9_:int = 0;
         var _loc3_:int = Nr >= 12 ? 3 : 2;
         var _loc6_:Array = new Array();
         var _loc8_:Array = param1.concat(param2);
         _loc6_[0] = MD5.encode(_loc8_);
         _loc7_ = _loc6_[0];
         _loc9_ = 1;
         while(_loc9_ < _loc3_)
         {
            _loc6_[_loc9_] = MD5.encode(_loc6_[_loc9_ - 1].concat(_loc8_));
            _loc7_ = _loc7_.concat(_loc6_[_loc9_]);
            _loc9_++;
         }
         _loc4_ = _loc7_.slice(0,4 * Nk);
         _loc5_ = _loc7_.slice(4 * Nk,4 * Nk + 16);
         var _loc10_:Object;
         (_loc10_ = new Object())["key"] = _loc4_;
         _loc10_["iv"] = _loc5_;
         return _loc10_;
      }
      
      public static function _11058(param1:Array, param2:Array, param3:Array) : Array
      {
         var _loc6_:int = 0;
         param2 = expandKey(param2);
         var _loc4_:int = Math.ceil(param1.length / 16);
         var _loc5_:Array = new Array();
         var _loc7_:Array = new Array();
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_[_loc6_] = _11065(param1.slice(_loc6_ * 16,_loc6_ * 16 + 16));
            _loc6_++;
         }
         if(param1.length % 16 === 0)
         {
            _loc5_.push(new Array(16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16));
            _loc4_++;
         }
         _loc6_ = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc5_[_loc6_] = _loc6_ === 0 ? _11060(_loc5_[_loc6_],param3) : _11060(_loc5_[_loc6_],_loc7_[_loc6_ - 1]);
            _loc7_[_loc6_] = encryptBlock(_loc5_[_loc6_],param2);
            _loc6_++;
         }
         return _loc7_;
      }
      
      public static function _11059(param1:Array, param2:Array, param3:Array, param4:Boolean = false) : String
      {
         var _loc7_:int = 0;
         param2 = expandKey(param2);
         var _loc5_:int = param1.length / 16;
         var _loc6_:Array = new Array();
         var _loc8_:Array = new Array();
         var _loc9_:String = new String();
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            _loc6_.push(param1.slice(_loc7_ * 16,(_loc7_ + 1) * 16));
            _loc7_++;
         }
         _loc7_ = int(_loc6_.length - 1);
         while(_loc7_ >= 0)
         {
            _loc8_[_loc7_] = decryptBlock(_loc6_[_loc7_],param2);
            _loc8_[_loc7_] = _loc7_ === 0 ? _11060(_loc8_[_loc7_],param3) : _11060(_loc8_[_loc7_],_loc6_[_loc7_ - 1]);
            _loc7_--;
         }
         _loc7_ = 0;
         while(_loc7_ < _loc5_ - 1)
         {
            _loc9_ += _11069(_loc8_[_loc7_],false);
            _loc7_++;
         }
         _loc9_ += _11069(_loc8_[_loc7_],true);
         return param4 ? _loc9_ : _11064(_loc9_);
      }
      
      public static function encryptBlock(param1:Array, param2:Array) : Array
      {
         var _loc4_:int = 0;
         _11067 = false;
         var _loc3_:Array = addRoundKey(param1,param2,0);
         _loc4_ = 1;
         while(_loc4_ < Nr + 1)
         {
            _loc3_ = subBytes(_loc3_);
            _loc3_ = shiftRows(_loc3_);
            if(_loc4_ < Nr)
            {
               _loc3_ = mixColumns(_loc3_);
            }
            _loc3_ = addRoundKey(_loc3_,param2,_loc4_);
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function decryptBlock(param1:Array, param2:Array) : Array
      {
         var _loc4_:int = 0;
         _11067 = true;
         var _loc3_:Array = addRoundKey(param1,param2,Nr);
         _loc4_ = Nr - 1;
         while(_loc4_ > -1)
         {
            _loc3_ = shiftRows(_loc3_);
            _loc3_ = subBytes(_loc3_);
            _loc3_ = addRoundKey(_loc3_,param2,_loc4_);
            if(_loc4_ > 0)
            {
               _loc3_ = mixColumns(_loc3_);
            }
            _loc4_--;
         }
         return _loc3_;
      }
      
      private static function subBytes(param1:Array) : Array
      {
         var _loc4_:int = 0;
         var _loc2_:Array = _11067 ? _11070 : _11072;
         var _loc3_:Array = new Array();
         _loc4_ = 0;
         while(_loc4_ < 16)
         {
            _loc3_[_loc4_] = _loc2_[param1[_loc4_]];
            _loc4_++;
         }
         return _loc3_;
      }
      
      private static function shiftRows(param1:Array) : Array
      {
         var _loc4_:int = 0;
         var _loc2_:Array = new Array();
         var _loc3_:Array = _11067 ? new Array(0,13,10,7,4,1,14,11,8,5,2,15,12,9,6,3) : new Array(0,5,10,15,4,9,14,3,8,13,2,7,12,1,6,11);
         _loc4_ = 0;
         while(_loc4_ < 16)
         {
            _loc2_[_loc4_] = param1[_loc3_[_loc4_]];
            _loc4_++;
         }
         return _loc2_;
      }
      
      private static function mixColumns(param1:Array) : Array
      {
         var _loc3_:int = 0;
         var _loc2_:Array = new Array();
         if(!_11067)
         {
            _loc3_ = 0;
            while(_loc3_ < 4)
            {
               _loc2_[_loc3_ * 4] = _11079[param1[_loc3_ * 4]] ^ _11073[param1[1 + _loc3_ * 4]] ^ param1[2 + _loc3_ * 4] ^ param1[3 + _loc3_ * 4];
               _loc2_[1 + _loc3_ * 4] = param1[_loc3_ * 4] ^ _11079[param1[1 + _loc3_ * 4]] ^ _11073[param1[2 + _loc3_ * 4]] ^ param1[3 + _loc3_ * 4];
               _loc2_[2 + _loc3_ * 4] = param1[_loc3_ * 4] ^ param1[1 + _loc3_ * 4] ^ _11079[param1[2 + _loc3_ * 4]] ^ _11073[param1[3 + _loc3_ * 4]];
               _loc2_[3 + _loc3_ * 4] = _11073[param1[_loc3_ * 4]] ^ param1[1 + _loc3_ * 4] ^ param1[2 + _loc3_ * 4] ^ _11079[param1[3 + _loc3_ * 4]];
               _loc3_++;
            }
         }
         else
         {
            _loc3_ = 0;
            while(_loc3_ < 4)
            {
               _loc2_[_loc3_ * 4] = _11077[param1[_loc3_ * 4]] ^ _11075[param1[1 + _loc3_ * 4]] ^ _11076[param1[2 + _loc3_ * 4]] ^ _11074[param1[3 + _loc3_ * 4]];
               _loc2_[1 + _loc3_ * 4] = _11074[param1[_loc3_ * 4]] ^ _11077[param1[1 + _loc3_ * 4]] ^ _11075[param1[2 + _loc3_ * 4]] ^ _11076[param1[3 + _loc3_ * 4]];
               _loc2_[2 + _loc3_ * 4] = _11076[param1[_loc3_ * 4]] ^ _11074[param1[1 + _loc3_ * 4]] ^ _11077[param1[2 + _loc3_ * 4]] ^ _11075[param1[3 + _loc3_ * 4]];
               _loc2_[3 + _loc3_ * 4] = _11075[param1[_loc3_ * 4]] ^ _11076[param1[1 + _loc3_ * 4]] ^ _11074[param1[2 + _loc3_ * 4]] ^ _11077[param1[3 + _loc3_ * 4]];
               _loc3_++;
            }
         }
         return _loc2_;
      }
      
      private static function addRoundKey(param1:Array, param2:Array, param3:int) : Array
      {
         var _loc5_:int = 0;
         var _loc4_:Array = new Array();
         _loc5_ = 0;
         while(_loc5_ < 16)
         {
            _loc4_[_loc5_] = param1[_loc5_] ^ param2[param3][_loc5_];
            _loc5_++;
         }
         return _loc4_;
      }
      
      private static function _11060(param1:Array, param2:Array) : Array
      {
         var _loc4_:int = 0;
         var _loc3_:Array = new Array();
         _loc4_ = 0;
         while(_loc4_ < 16)
         {
            _loc3_[_loc4_] = param1[_loc4_] ^ param2[_loc4_];
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function expandKey(param1:Array) : Array
      {
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:Array = new Array();
         var _loc3_:Array = new Array();
         var _loc7_:Array = new Array();
         _loc4_ = 0;
         while(_loc4_ < Nk)
         {
            _loc5_ = new Array(param1[4 * _loc4_],param1[4 * _loc4_ + 1],param1[4 * _loc4_ + 2],param1[4 * _loc4_ + 3]);
            _loc2_[_loc4_] = _loc5_;
            _loc4_++;
         }
         _loc4_ = Nk;
         while(_loc4_ < 4 * (Nr + 1))
         {
            _loc2_[_loc4_] = new Array();
            _loc6_ = 0;
            while(_loc6_ < 4)
            {
               _loc3_[_loc6_] = _loc2_[_loc4_ - 1][_loc6_];
               _loc6_++;
            }
            if(_loc4_ % Nk === 0)
            {
               _loc3_ = subWord(rotWord(_loc3_));
               _loc3_[0] ^= Rcon[_loc4_ / Nk - 1];
            }
            else if(Nk > 6 && _loc4_ % Nk === 4)
            {
               _loc3_ = subWord(_loc3_);
            }
            _loc6_ = 0;
            while(_loc6_ < 4)
            {
               _loc2_[_loc4_][_loc6_] = _loc2_[_loc4_ - Nk][_loc6_] ^ _loc3_[_loc6_];
               _loc6_++;
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < Nr + 1)
         {
            _loc7_[_loc4_] = new Array();
            _loc8_ = 0;
            while(_loc8_ < 4)
            {
               _loc7_[_loc4_].push(_loc2_[_loc4_ * 4 + _loc8_][0],_loc2_[_loc4_ * 4 + _loc8_][1],_loc2_[_loc4_ * 4 + _loc8_][2],_loc2_[_loc4_ * 4 + _loc8_][3]);
               _loc8_++;
            }
            _loc4_++;
         }
         return _loc7_;
      }
      
      private static function subWord(param1:Array) : Array
      {
         var _loc3_:int = 0;
         var _loc2_:Array = new Array();
         _loc3_ = 0;
         while(_loc3_ < 4)
         {
            _loc2_[_loc3_] = _11072[param1[_loc3_]];
            _loc3_++;
         }
         return _loc2_;
      }
      
      private static function rotWord(param1:Array) : Array
      {
         var _loc4_:int = 0;
         var _loc2_:int = int(param1[0]);
         var _loc3_:Array = new Array();
         _loc4_ = 0;
         while(_loc4_ < 3)
         {
            _loc3_[_loc4_] = param1[_loc4_ + 1];
            _loc4_++;
         }
         _loc3_[3] = _loc2_;
         return _loc3_;
      }
      
      private static function _11061(param1:Array) : Array
      {
         var _loc2_:int = 0;
         var _loc3_:Array = new Array();
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_[param1[_loc2_]] = _loc2_;
            _loc2_++;
         }
         return _loc3_;
      }
      
      private static function _11078(param1:int, param2:int) : int
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < 8)
         {
            _loc4_ = (param2 & 1) === 1 ? _loc4_ ^ param1 : _loc4_;
            param1 = param1 > 127 ? 0x011B ^ param1 << 1 : param1 << 1;
            param2 >>>= 1;
            _loc3_++;
         }
         return _loc4_;
      }
      
      private static function _11083(param1:int) : Array
      {
         var _loc2_:int = 0;
         var _loc3_:Array = new Array();
         _loc2_ = 0;
         while(_loc2_ < 256)
         {
            _loc3_[_loc2_] = _11078(param1,_loc2_);
            _loc2_++;
         }
         return _loc3_;
      }
      
      public static function enc(param1:String, param2:String, param3:Boolean = false) : String
      {
         var _loc8_:Array = null;
         var _loc4_:Array = _11068(8);
         var _loc5_:Object = _11057(_11082(param2,param3),_loc4_);
         var _loc6_:Array = _loc5_.key;
         var _loc7_:Array = _loc5_.iv;
         var _loc9_:Array = [[83,97,108,116,101,100,95,95].concat(_loc4_)];
         var _loc10_:Array = _11082(param1,param3);
         _loc8_ = _11058(_loc10_,_loc6_,_loc7_);
         _loc8_ = _loc9_.concat(_loc8_);
         return _10648.Base64.encode(_loc8_);
      }
      
      public static function dec(param1:String, param2:String, param3:Boolean = false) : String
      {
         var _loc4_:Array = _10648.Base64.decode(param1);
         var _loc5_:Array = _loc4_.slice(8,16);
         var _loc6_:Object = _11057(_11082(param2,param3),_loc5_);
         var _loc7_:Array = _loc6_["key"];
         var _loc8_:Array = _loc6_["iv"];
         _loc4_ = _loc4_.slice(16,_loc4_.length);
         return _11059(_loc4_,_loc7_,_loc8_,param3);
      }
      
      private static function _11062(param1:String, param2:String, param3:String) : String
      {
         var _loc4_:int = 0;
         var _loc7_:Array = null;
         var _loc5_:Array = _11082(param1,false);
         var _loc6_:Array = _11082(param2,false);
         _loc4_ = int(_loc6_.length);
         while(_loc4_ < 32)
         {
            _loc6_[_loc4_] = 0;
            _loc4_++;
         }
         if(param3 != null)
         {
            _loc7_ = _11082(param3,false);
            _loc4_ = int(_loc7_.length);
            while(_loc4_ < 16)
            {
               _loc7_[_loc4_] = 0;
               _loc4_++;
            }
         }
         var _loc8_:Array = _11058(_loc5_,_loc6_,_loc7_);
         var _loc9_:Array = _loc7_;
         _loc4_ = 0;
         while(_loc4_ < _loc8_.length)
         {
            _loc9_[_loc9_.length] = _loc8_[_loc4_];
            _loc4_++;
         }
         return _10648.Base64.encode(_loc9_);
      }
      
      private static function _11063(param1:String, param2:String) : String
      {
         var _loc6_:int = 0;
         var _loc3_:Array = _10648.Base64.decode(param1);
         var _loc4_:Array = _loc3_.slice(0,16);
         var _loc5_:Array = _loc3_.slice(16,_loc3_.length);
         var _loc7_:Array = _11082(param2,false);
         _loc6_ = int(_loc7_.length);
         while(_loc6_ < 32)
         {
            _loc7_[_loc6_] = 0;
            _loc6_++;
         }
         return _11059(_loc5_,_loc7_,_loc4_,false);
      }
   }
}

