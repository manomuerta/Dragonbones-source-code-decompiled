package com.lia.crypto
{
   public class AES
   {
      public static const BIT_KEY_128:int = 128;
      
      public static const BIT_KEY_192:int = 192;
      
      public static const BIT_KEY_256:int = 256;
      
      private static const SBOX:Array = [99,124,119,123,242,107,111,197,48,1,103,43,254,215,171,118,202,130,201,125,250,89,71,240,173,212,162,175,156,164,114,192,183,253,147,38,54,63,247,204,52,165,229,241,113,216,49,21,4,199,35,195,24,150,5,154,7,18,128,226,235,39,178,117,9,131,44,26,27,110,90,160,82,59,214,179,41,227,47,132,83,209,0,237,32,252,177,91,106,203,190,57,74,76,88,207,208,239,170,251,67,77,51,133,69,249,2,127,80,60,159,168,81,163,64,143,146,157,56,245,188,182,218,33,16,255,243,210,205,12,19,236,95,151,68,23,196,167,126,61,100,93,25,115,96,129,79,220,34,42,144,136,70,238,184,20,222,94,11,219,224,50,58,10,73,6,36,92,194,211,172,98,145,149,228,121,231,200,55,109,141,213,78,169,108,86,244,234,101,122,174,8,186,120,37,46,28,166,180,198,232,221,116,31,75,189,139,138,112,62,181,102,72,3,246,14,97,53,87,185,134,193,29,158,225,248,152,17,105,217,142,148,155,30,135,233,206,85,40,223,140,161,137,13,191,230,66,104,65,153,45,15,176,84,187,22];
      
      private static const RCON:Array = [[0,0,0,0],[1,0,0,0],[2,0,0,0],[4,0,0,0],[8,0,0,0],[16,0,0,0],[32,0,0,0],[64,0,0,0],[128,0,0,0],[27,0,0,0],[54,0,0,0]];
      
      public function AES()
      {
         super();
      }
      
      public static function encrypt(param1:String, param2:String, param3:int) : String
      {
         var _loc19_:int = 0;
         var _loc20_:Array = null;
         var _loc21_:int = 0;
         var _loc22_:Array = null;
         var _loc4_:int = 16;
         if(!(param3 == BIT_KEY_128 || param3 == BIT_KEY_192 || param3 == BIT_KEY_256))
         {
            throw new Error("Must be a key mode of either 128, 192, 256 bits");
         }
         param1 = Utf8.encode(param1);
         param2 = Utf8.encode(param2);
         var _loc5_:int = param3 / 8;
         var _loc6_:Array = new Array(_loc5_);
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            _loc6_[_loc7_] = isNaN(param2.charCodeAt(_loc7_)) ? 0 : param2.charCodeAt(_loc7_);
            _loc7_++;
         }
         var _loc8_:Array = cipher(_loc6_,keyExpansion(_loc6_));
         _loc8_ = _loc8_.concat(_loc8_.slice(0,_loc5_ - 16));
         var _loc9_:Array = new Array(_loc4_);
         var _loc10_:int = int(new Date().getTime());
         var _loc11_:int = Math.floor(_loc10_ / 1000);
         var _loc12_:int = _loc10_ % 1000;
         _loc7_ = 0;
         while(_loc7_ < 4)
         {
            _loc9_[_loc7_] = _loc11_ >>> _loc7_ * 8 & 0xFF;
            _loc7_++;
         }
         _loc7_ = 0;
         while(_loc7_ < 4)
         {
            _loc9_[_loc7_ + 4] = _loc12_ & 0xFF;
            _loc7_++;
         }
         var _loc13_:String = "";
         _loc7_ = 0;
         while(_loc7_ < 8)
         {
            _loc13_ += String.fromCharCode(_loc9_[_loc7_]);
            _loc7_++;
         }
         var _loc14_:Array = keyExpansion(_loc8_);
         var _loc15_:int = Math.ceil(param1.length / _loc4_);
         var _loc16_:Array = new Array(_loc15_);
         var _loc17_:int = 0;
         while(_loc17_ < _loc15_)
         {
            _loc19_ = 0;
            while(_loc19_ < 4)
            {
               _loc9_[15 - _loc19_] = _loc17_ >>> _loc19_ * 8 & 0xFF;
               _loc19_++;
            }
            _loc19_ = 0;
            while(_loc19_ < 4)
            {
               _loc9_[15 - _loc19_ - 4] = _loc17_ / 4294967296 >>> _loc19_ * 8;
               _loc19_++;
            }
            _loc20_ = cipher(_loc9_,_loc14_);
            _loc21_ = _loc17_ < _loc15_ - 1 ? _loc4_ : int((param1.length - 1) % _loc4_ + 1);
            _loc22_ = new Array(_loc21_);
            _loc7_ = 0;
            while(_loc7_ < _loc21_)
            {
               _loc22_[_loc7_] = _loc20_[_loc7_] ^ param1.charCodeAt(_loc17_ * _loc4_ + _loc7_);
               _loc22_[_loc7_] = String.fromCharCode(_loc22_[_loc7_]);
               _loc7_++;
            }
            _loc16_[_loc17_] = _loc22_.join("");
            _loc17_++;
         }
         var _loc18_:String = _loc13_ + _loc16_.join("");
         return Base64.encode(_loc18_);
      }
      
      public static function decrypt(param1:String, param2:String, param3:int) : String
      {
         var _loc16_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:Array = null;
         var _loc20_:Array = null;
         var _loc4_:int = 16;
         if(!(param3 == BIT_KEY_128 || param3 == BIT_KEY_192 || param3 == BIT_KEY_256))
         {
            throw new Error("Must be a key mode of either 128, 192, 256 bits");
         }
         param1 = Base64.decode(param1);
         param2 = Utf8.encode(param2);
         var _loc5_:int = param3 / 8;
         var _loc6_:Array = new Array(_loc5_);
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            _loc6_[_loc7_] = isNaN(param2.charCodeAt(_loc7_)) ? 0 : param2.charCodeAt(_loc7_);
            _loc7_++;
         }
         var _loc8_:Array = cipher(_loc6_,keyExpansion(_loc6_));
         _loc8_ = _loc8_.concat(_loc8_.slice(0,_loc5_ - 16));
         var _loc9_:Array = new Array(8);
         var _loc10_:String = param1.slice(0,8);
         _loc7_ = 0;
         while(_loc7_ < 8)
         {
            _loc9_[_loc7_] = _loc10_.charCodeAt(_loc7_);
            _loc7_++;
         }
         var _loc11_:Array = keyExpansion(_loc8_);
         var _loc12_:int = Math.ceil((param1.length - 8) / _loc4_);
         var _loc13_:Array = new Array(_loc12_);
         _loc16_ = 0;
         while(_loc16_ < _loc12_)
         {
            _loc13_[_loc16_] = param1.slice(8 + _loc16_ * _loc4_,8 + _loc16_ * _loc4_ + _loc4_);
            _loc16_++;
         }
         var _loc14_:Array = _loc13_;
         var _loc15_:Array = new Array(_loc14_.length);
         _loc16_ = 0;
         while(_loc16_ < _loc12_)
         {
            _loc18_ = 0;
            while(_loc18_ < 4)
            {
               _loc9_[15 - _loc18_] = _loc16_ >>> _loc18_ * 8 & 0xFF;
               _loc18_++;
            }
            _loc18_ = 0;
            while(_loc18_ < 4)
            {
               _loc9_[15 - _loc18_ - 4] = (_loc16_ + 1) / 4294967296 - 1 >>> _loc18_ * 8 & 0xFF;
               _loc18_++;
            }
            _loc19_ = cipher(_loc9_,_loc11_);
            _loc20_ = new Array(String(_loc14_[_loc16_]).length);
            _loc7_ = 0;
            while(_loc7_ < String(_loc14_[_loc16_]).length)
            {
               _loc20_[_loc7_] = _loc19_[_loc7_] ^ String(_loc14_[_loc16_]).charCodeAt(_loc7_);
               _loc20_[_loc7_] = String.fromCharCode(_loc20_[_loc7_]);
               _loc7_++;
            }
            _loc15_[_loc16_] = _loc20_.join("");
            _loc16_++;
         }
         var _loc17_:String = _loc15_.join("");
         return Utf8.decode(_loc17_);
      }
      
      private static function cipher(param1:Array, param2:Array) : Array
      {
         var _loc3_:int = 4;
         var _loc4_:int = param2.length / _loc3_ - 1;
         var _loc5_:Array = [[],[],[],[]];
         var _loc6_:int = 0;
         while(_loc6_ < 4 * _loc3_)
         {
            _loc5_[_loc6_ % 4][Math.floor(_loc6_ / 4)] = param1[_loc6_];
            _loc6_++;
         }
         _loc5_ = addRoundKey(_loc5_,param2,0,_loc3_);
         var _loc7_:int = 1;
         while(_loc7_ < _loc4_)
         {
            _loc5_ = subBytes(_loc5_,_loc3_);
            _loc5_ = shiftRows(_loc5_,_loc3_);
            _loc5_ = mixColumns(_loc5_);
            _loc5_ = addRoundKey(_loc5_,param2,_loc7_,_loc3_);
            _loc7_++;
         }
         _loc5_ = subBytes(_loc5_,_loc3_);
         _loc5_ = shiftRows(_loc5_,_loc3_);
         _loc5_ = addRoundKey(_loc5_,param2,_loc4_,_loc3_);
         var _loc8_:Array = new Array(4 * _loc3_);
         _loc6_ = 0;
         while(_loc6_ < 4 * _loc3_)
         {
            _loc8_[_loc6_] = _loc5_[_loc6_ % 4][Math.floor(_loc6_ / 4)];
            _loc6_++;
         }
         return _loc8_;
      }
      
      private static function keyExpansion(param1:Array) : Array
      {
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc2_:int = 4;
         var _loc3_:int = param1.length / 4;
         var _loc4_:int = _loc3_ + 6;
         var _loc5_:Array = new Array(_loc2_ * (_loc4_ + 1));
         var _loc6_:Array = new Array(4);
         var _loc7_:int = 0;
         while(_loc7_ < _loc3_)
         {
            _loc8_ = [param1[4 * _loc7_],param1[4 * _loc7_ + 1],param1[4 * _loc7_ + 2],param1[4 * _loc7_ + 3]];
            _loc5_[_loc7_] = _loc8_;
            _loc7_++;
         }
         _loc7_ = _loc3_;
         while(_loc7_ < _loc2_ * (_loc4_ + 1))
         {
            _loc5_[_loc7_] = new Array(4);
            _loc9_ = 0;
            while(_loc9_ < 4)
            {
               _loc6_[_loc9_] = _loc5_[_loc7_ - 1][_loc9_];
               _loc9_++;
            }
            if(_loc7_ % _loc3_ == 0)
            {
               _loc6_ = subWord(rotWord(_loc6_));
               _loc9_ = 0;
               while(_loc9_ < 4)
               {
                  _loc6_[_loc9_] ^= RCON[_loc7_ / _loc3_][_loc9_];
                  _loc9_++;
               }
            }
            else if(_loc3_ > 6 && _loc7_ % _loc3_ == 4)
            {
               _loc6_ = subWord(_loc6_);
            }
            _loc9_ = 0;
            while(_loc9_ < 4)
            {
               _loc5_[_loc7_][_loc9_] = _loc5_[_loc7_ - _loc3_][_loc9_] ^ _loc6_[_loc9_];
               _loc9_++;
            }
            _loc7_++;
         }
         return _loc5_;
      }
      
      private static function subBytes(param1:Array, param2:int) : Array
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < 4)
         {
            _loc4_ = 0;
            while(_loc4_ < param2)
            {
               param1[_loc3_][_loc4_] = SBOX[param1[_loc3_][_loc4_]];
               _loc4_++;
            }
            _loc3_++;
         }
         return param1;
      }
      
      private static function shiftRows(param1:Array, param2:int) : Array
      {
         var _loc5_:int = 0;
         var _loc3_:Array = new Array(4);
         var _loc4_:int = 1;
         while(_loc4_ < 4)
         {
            _loc5_ = 0;
            while(_loc5_ < 4)
            {
               _loc3_[_loc5_] = param1[_loc4_][(_loc5_ + _loc4_) % param2];
               _loc5_++;
            }
            _loc5_ = 0;
            while(_loc5_ < 4)
            {
               param1[_loc4_][_loc5_] = _loc3_[_loc5_];
               _loc5_++;
            }
            _loc4_++;
         }
         return param1;
      }
      
      private static function mixColumns(param1:Array) : Array
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < 4)
         {
            _loc3_ = new Array(4);
            _loc4_ = new Array(4);
            _loc5_ = 0;
            while(_loc5_ < 4)
            {
               _loc3_[_loc5_] = param1[_loc5_][_loc2_];
               _loc4_[_loc5_] = !!(param1[_loc5_][_loc2_] & 0x80) ? param1[_loc5_][_loc2_] << 1 ^ 0x011B : param1[_loc5_][_loc2_] << 1;
               _loc5_++;
            }
            param1[0][_loc2_] = _loc4_[0] ^ _loc3_[1] ^ _loc4_[1] ^ _loc3_[2] ^ _loc3_[3];
            param1[1][_loc2_] = _loc3_[0] ^ _loc4_[1] ^ _loc3_[2] ^ _loc4_[2] ^ _loc3_[3];
            param1[2][_loc2_] = _loc3_[0] ^ _loc3_[1] ^ _loc4_[2] ^ _loc3_[3] ^ _loc4_[3];
            param1[3][_loc2_] = _loc3_[0] ^ _loc4_[0] ^ _loc3_[1] ^ _loc3_[2] ^ _loc4_[3];
            _loc2_++;
         }
         return param1;
      }
      
      private static function addRoundKey(param1:Array, param2:Array, param3:int, param4:int) : Array
      {
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < 4)
         {
            _loc6_ = 0;
            while(_loc6_ < param4)
            {
               param1[_loc5_][_loc6_] ^= param2[param3 * 4 + _loc6_][_loc5_];
               _loc6_++;
            }
            _loc5_++;
         }
         return param1;
      }
      
      private static function subWord(param1:Array) : Array
      {
         var _loc2_:int = 0;
         while(_loc2_ < 4)
         {
            param1[_loc2_] = SBOX[param1[_loc2_]];
            _loc2_++;
         }
         return param1;
      }
      
      private static function rotWord(param1:Array) : Array
      {
         var _loc2_:int = int(param1[0]);
         var _loc3_:int = 0;
         while(_loc3_ < 3)
         {
            param1[_loc3_] = param1[_loc3_ + 1];
            _loc3_++;
         }
         param1[3] = _loc2_;
         return param1;
      }
   }
}

class Base64
{
   private static const code:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
   
   public function Base64()
   {
      super();
   }
   
   public static function encode(param1:String, param2:Boolean = false) : String
   {
      var _loc3_:int = 0;
      var _loc4_:int = 0;
      var _loc5_:int = 0;
      var _loc6_:* = 0;
      var _loc7_:* = 0;
      var _loc8_:* = 0;
      var _loc9_:* = 0;
      var _loc10_:* = 0;
      var _loc13_:int = 0;
      var _loc14_:* = null;
      var _loc15_:String = null;
      var _loc11_:Array = [];
      var _loc12_:* = "";
      var _loc16_:String = Base64.code;
      _loc14_ = param2 ? Utf8.encode(param1) : param1;
      if((_loc13_ = _loc14_.length % 3) > 0)
      {
         while(_loc13_++ < 3)
         {
            _loc12_ += "=";
            _loc14_ += "0";
         }
      }
      _loc13_ = 0;
      while(_loc13_ < _loc14_.length)
      {
         _loc3_ = int(_loc14_.charCodeAt(_loc13_));
         _loc4_ = int(_loc14_.charCodeAt(_loc13_ + 1));
         _loc5_ = int(_loc14_.charCodeAt(_loc13_ + 2));
         _loc6_ = _loc3_ << 16 | _loc4_ << 8 | _loc5_;
         _loc7_ = _loc6_ >> 18 & 0x3F;
         _loc8_ = _loc6_ >> 12 & 0x3F;
         _loc9_ = _loc6_ >> 6 & 0x3F;
         _loc10_ = _loc6_ & 0x3F;
         _loc11_[_loc13_ / 3] = _loc16_.charAt(_loc7_) + _loc16_.charAt(_loc8_) + _loc16_.charAt(_loc9_) + _loc16_.charAt(_loc10_);
         _loc13_ += 3;
      }
      _loc15_ = _loc11_.join("");
      return _loc15_.slice(0,_loc15_.length - _loc12_.length) + _loc12_;
   }
   
   public static function decode(param1:String, param2:Boolean = false) : String
   {
      var _loc3_:* = 0;
      var _loc4_:* = 0;
      var _loc5_:* = 0;
      var _loc6_:int = 0;
      var _loc7_:int = 0;
      var _loc8_:int = 0;
      var _loc9_:int = 0;
      var _loc10_:* = 0;
      var _loc12_:String = null;
      var _loc13_:String = null;
      var _loc11_:Array = [];
      var _loc14_:String = Base64.code;
      _loc13_ = param2 ? Utf8.decode(param1) : param1;
      var _loc15_:int = 0;
      while(_loc15_ < _loc13_.length)
      {
         _loc6_ = int(_loc14_.indexOf(_loc13_.charAt(_loc15_)));
         _loc7_ = int(_loc14_.indexOf(_loc13_.charAt(_loc15_ + 1)));
         _loc8_ = int(_loc14_.indexOf(_loc13_.charAt(_loc15_ + 2)));
         _loc9_ = int(_loc14_.indexOf(_loc13_.charAt(_loc15_ + 3)));
         _loc10_ = _loc6_ << 18 | _loc7_ << 12 | _loc8_ << 6 | _loc9_;
         _loc3_ = _loc10_ >>> 16 & 0xFF;
         _loc4_ = _loc10_ >>> 8 & 0xFF;
         _loc5_ = _loc10_ & 0xFF;
         _loc11_[_loc15_ / 4] = String.fromCharCode(_loc3_,_loc4_,_loc5_) + "";
         if(_loc9_ == 64)
         {
            _loc11_[_loc15_ / 4] = String.fromCharCode(_loc3_,_loc4_);
         }
         if(_loc8_ == 64)
         {
            _loc11_[_loc15_ / 4] = String.fromCharCode(_loc3_);
         }
         _loc15_ += 4;
      }
      _loc12_ = _loc11_.join("");
      return param2 ? Utf8.decode(_loc12_) : _loc12_;
   }
}

class Utf8
{
   public function Utf8()
   {
      super();
   }
   
   public static function encode(param1:String) : String
   {
      var _loc4_:int = 0;
      var _loc2_:String = "";
      var _loc3_:int = 0;
      while(_loc3_ < param1.length)
      {
         _loc4_ = int(param1.charCodeAt(_loc3_));
         if(_loc4_ < 128)
         {
            _loc2_ += String.fromCharCode(_loc4_);
         }
         else if(_loc4_ > 127 && _loc4_ < 2048)
         {
            _loc2_ += String.fromCharCode(_loc4_ >> 6 | 0xC0);
            _loc2_ += String.fromCharCode(_loc4_ & 0x3F | 0x80);
         }
         else
         {
            _loc2_ += String.fromCharCode(_loc4_ >> 12 | 0xE0);
            _loc2_ += String.fromCharCode(_loc4_ >> 6 & 0x3F | 0x80);
            _loc2_ += String.fromCharCode(_loc4_ & 0x3F | 0x80);
         }
         _loc3_++;
      }
      return _loc2_;
   }
   
   public static function decode(param1:String) : String
   {
      var _loc2_:String = "";
      var _loc3_:int = 0;
      var _loc4_:int = 0;
      var _loc5_:int = 0;
      var _loc6_:int = 0;
      while(_loc3_ < param1.length)
      {
         _loc4_ = int(param1.charCodeAt(_loc3_));
         if(_loc4_ < 128)
         {
            _loc2_ += String.fromCharCode(_loc4_);
            _loc3_++;
         }
         else if(_loc4_ > 191 && _loc4_ < 224)
         {
            _loc5_ = int(param1.charCodeAt(_loc3_ + 1));
            _loc2_ += String.fromCharCode((_loc4_ & 0x1F) << 6 | _loc5_ & 0x3F);
            _loc3_ += 2;
         }
         else
         {
            _loc5_ = int(param1.charCodeAt(_loc3_ + 1));
            _loc6_ = int(param1.charCodeAt(_loc3_ + 2));
            _loc2_ += String.fromCharCode((_loc4_ & 0x0F) << 12 | (_loc5_ & 0x3F) << 6 | _loc6_ & 0x3F);
            _loc3_ += 3;
         }
      }
      return _loc2_;
   }
}

