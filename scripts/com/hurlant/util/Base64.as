package com.hurlant.util
{
   import flash.utils.ByteArray;
   
   public class Base64
   {
      private static const _encodeChars:Vector.<int> = InitEncoreChar();
      
      private static const _decodeChars:Vector.<int> = InitDecodeChar();
      
      public function Base64()
      {
         super();
      }
      
      public static function encodeByteArray(param1:ByteArray) : String
      {
         var _loc6_:* = 0;
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.length = (2 + param1.length - (param1.length + 2) % 3) * 4 / 3;
         var _loc3_:int = 0;
         var _loc4_:int = param1.length % 3;
         var _loc5_:int = param1.length - _loc4_;
         while(_loc3_ < _loc5_)
         {
            _loc6_ = param1[_loc3_++] << 16 | param1[_loc3_++] << 8 | param1[_loc3_++];
            _loc6_ = _encodeChars[_loc6_ >>> 18] << 24 | _encodeChars[_loc6_ >>> 12 & 0x3F] << 16 | _encodeChars[_loc6_ >>> 6 & 0x3F] << 8 | _encodeChars[_loc6_ & 0x3F];
            _loc2_.writeInt(_loc6_);
         }
         if(_loc4_ == 1)
         {
            _loc6_ = int(param1[_loc3_]);
            _loc6_ = _encodeChars[_loc6_ >>> 2] << 24 | _encodeChars[(_loc6_ & 3) << 4] << 16 | 61 << 8 | 0x3D;
            _loc2_.writeInt(_loc6_);
         }
         else if(_loc4_ == 2)
         {
            _loc6_ = param1[_loc3_++] << 8 | param1[_loc3_];
            _loc6_ = _encodeChars[_loc6_ >>> 10] << 24 | _encodeChars[_loc6_ >>> 4 & 0x3F] << 16 | _encodeChars[(_loc6_ & 0x0F) << 2] << 8 | 0x3D;
            _loc2_.writeInt(_loc6_);
         }
         _loc2_.position = 0;
         return _loc2_.readUTFBytes(_loc2_.length);
      }
      
      public static function decodeToByteArray(param1:String) : ByteArray
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:ByteArray = null;
         _loc7_ = param1.length;
         _loc6_ = 0;
         _loc8_ = new ByteArray();
         var _loc9_:ByteArray = new ByteArray();
         _loc9_.writeUTFBytes(param1);
         loop0:
         while(_loc6_ < _loc7_)
         {
            do
            {
               _loc2_ = _decodeChars[_loc9_[_loc6_++]];
            }
            while(_loc6_ < _loc7_ && _loc2_ == -1);
            
            if(_loc2_ == -1)
            {
               break;
            }
            do
            {
               _loc3_ = _decodeChars[_loc9_[_loc6_++]];
            }
            while(_loc6_ < _loc7_ && _loc3_ == -1);
            
            if(_loc3_ == -1)
            {
               break;
            }
            _loc8_.writeByte(_loc2_ << 2 | (_loc3_ & 0x30) >> 4);
            while(_loc4_ = int(_loc9_[_loc6_++]), _loc4_ != 61)
            {
               _loc4_ = _decodeChars[_loc4_];
               if(!(_loc6_ < _loc7_ && _loc4_ == -1))
               {
                  if(_loc4_ == -1)
                  {
                     break loop0;
                  }
                  _loc8_.writeByte((_loc3_ & 0x0F) << 4 | (_loc4_ & 0x3C) >> 2);
                  while(_loc5_ = int(_loc9_[_loc6_++]), _loc5_ != 61)
                  {
                     _loc5_ = _decodeChars[_loc5_];
                     if(!(_loc6_ < _loc7_ && _loc5_ == -1))
                     {
                        if(_loc5_ == -1)
                        {
                           break loop0;
                        }
                        _loc8_.writeByte((_loc4_ & 3) << 6 | _loc5_);
                        continue loop0;
                     }
                  }
                  return _loc8_;
               }
            }
            return _loc8_;
         }
         _loc8_.position = 0;
         return _loc8_;
      }
      
      public static function encode(param1:String) : String
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTFBytes(param1);
         return encodeByteArray(_loc2_);
      }
      
      public static function decode(param1:String) : String
      {
         var _loc2_:ByteArray = decodeToByteArray(param1);
         return _loc2_.readUTFBytes(_loc2_.length);
      }
      
      public static function InitEncoreChar() : Vector.<int>
      {
         var _loc1_:Vector.<int> = new Vector.<int>();
         var _loc2_:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
         var _loc3_:int = 0;
         while(_loc3_ < 64)
         {
            _loc1_.push(_loc2_.charCodeAt(_loc3_));
            _loc3_++;
         }
         return _loc1_;
      }
      
      public static function InitDecodeChar() : Vector.<int>
      {
         var _loc1_:Vector.<int> = new Vector.<int>();
         _loc1_.push(-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,62,-1,-1,-1,63,52,53,54,55,56,57,58,59,60,61,-1,-1,-1,-1,-1,-1,-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,-1,-1,-1,-1,-1,-1,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,-1,-1,-1,-1,-1 - 1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1);
         return _loc1_;
      }
   }
}

