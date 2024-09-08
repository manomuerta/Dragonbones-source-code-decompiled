package com.codeazur.utils
{
   import com.codeazur.as3swf.SWFData;
   
   public class HalfPrecisionWriter
   {
      public function HalfPrecisionWriter()
      {
         super();
      }
      
      public static function write(param1:Number, param2:SWFData) : void
      {
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:int = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         param2.resetBitsPending();
         _loc10_ = param2.position;
         param2.writeDouble(param1);
         param2.position -= 4;
         _loc3_ = param2.readUnsignedInt();
         param2.position = _loc10_;
         if((_loc3_ & 0x7FFFFFFF) == 0)
         {
            _loc9_ = uint(_loc3_ >> 16);
         }
         else
         {
            _loc4_ = uint(_loc3_ & 2147483648);
            _loc5_ = uint(_loc3_ & 0x7FF00000);
            _loc6_ = uint(_loc3_ & 0x0FFFFF);
            if(_loc5_ == 0)
            {
               _loc9_ = uint(_loc4_ >> 16);
            }
            else if(_loc5_ == 2146435072)
            {
               if(_loc6_ == 0)
               {
                  _loc9_ = uint(_loc4_ >> 16 | 0x7C00);
               }
               else
               {
                  _loc9_ = 65024;
               }
            }
            else
            {
               _loc4_ >>= 16;
               _loc8_ = (_loc5_ >> 20) - 1023 + 15;
               if(_loc8_ >= 31)
               {
                  _loc9_ = uint(_loc6_ >> 16 | 0x7C00);
               }
               else if(_loc8_ <= 0)
               {
                  if(10 - _loc8_ > 21)
                  {
                     _loc7_ = 0;
                  }
                  else
                  {
                     _loc6_ |= 1048576;
                     _loc7_ = uint(_loc6_ |= 1048576 >> 11 - _loc8_);
                     if(_loc6_ >> 10 - _loc8_ & 1)
                     {
                        _loc7_ += 1;
                     }
                  }
                  _loc9_ = uint(_loc4_ | _loc7_);
               }
               else
               {
                  _loc5_ = uint(_loc8_ << 10);
                  _loc7_ = uint(_loc6_ >> 10);
                  if(_loc6_ & 0x0200)
                  {
                     _loc9_ = uint((_loc4_ | _loc5_ | _loc7_) + 1);
                  }
                  else
                  {
                     _loc9_ = uint(_loc4_ | _loc5_ | _loc7_);
                  }
               }
            }
         }
         param2.writeShort(_loc9_);
         param2.length = _loc10_ + 2;
      }
   }
}

