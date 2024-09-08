package com.codeazur.utils
{
   import flash.utils.ByteArray;
   
   public class BitArray extends ByteArray
   {
      protected var bitsPending:uint = 0;
      
      public function BitArray()
      {
         super();
      }
      
      public function readBits(param1:uint, param2:uint = 0) : uint
      {
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         if(param1 == 0)
         {
            return param2;
         }
         if(this.bitsPending > 0)
         {
            _loc5_ = uint(this[position - 1] & 255 >> 8 - this.bitsPending);
            _loc4_ = Math.min(this.bitsPending,param1);
            this.bitsPending -= _loc4_;
            _loc3_ = uint(_loc5_ >> this.bitsPending);
         }
         else
         {
            _loc4_ = Math.min(8,param1);
            this.bitsPending = 8 - _loc4_;
            _loc3_ = uint(readUnsignedByte() >> this.bitsPending);
         }
         param1 -= _loc4_;
         param2 = uint(param2 << _loc4_ | _loc3_);
         return param1 > 0 ? this.readBits(param1,param2) : param2;
      }
      
      public function writeBits(param1:uint, param2:uint) : void
      {
         var _loc3_:uint = 0;
         if(param1 == 0)
         {
            return;
         }
         param2 &= 4294967295 >>> 32 - param1;
         if(this.bitsPending > 0)
         {
            if(this.bitsPending > param1)
            {
               this[position - 1] |= param2 << this.bitsPending - param1;
               _loc3_ = param1;
               this.bitsPending -= param1;
            }
            else if(this.bitsPending == param1)
            {
               this[position - 1] |= param2;
               _loc3_ = param1;
               this.bitsPending = 0;
            }
            else
            {
               this[position - 1] |= param2 >> param1 - this.bitsPending;
               _loc3_ = this.bitsPending;
               this.bitsPending = 0;
            }
         }
         else
         {
            _loc3_ = Math.min(8,param1);
            this.bitsPending = 8 - _loc3_;
            writeByte(param2 >> param1 - _loc3_ << this.bitsPending);
         }
         param1 -= _loc3_;
         if(param1 > 0)
         {
            this.writeBits(param1,param2);
         }
      }
      
      public function resetBitsPending() : void
      {
         this.bitsPending = 0;
      }
      
      public function calculateMaxBits(param1:Boolean, param2:Array) : uint
      {
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:int = 0;
         var _loc3_:uint = 0;
         var _loc4_:int = int.MIN_VALUE;
         if(!param1)
         {
            for each(_loc6_ in param2)
            {
               _loc3_ |= _loc6_;
            }
         }
         else
         {
            for each(_loc7_ in param2)
            {
               if(_loc7_ >= 0)
               {
                  _loc3_ |= _loc7_;
               }
               else
               {
                  _loc3_ |= ~_loc7_ << 1;
               }
               if(_loc4_ < _loc7_)
               {
                  _loc4_ = _loc7_;
               }
            }
         }
         _loc5_ = 0;
         if(_loc3_ > 0)
         {
            _loc5_ = uint(_loc3_.toString(2).length);
            if(param1 && _loc4_ > 0 && _loc4_.toString(2).length >= _loc5_)
            {
               _loc5_++;
            }
         }
         return _loc5_;
      }
   }
}

