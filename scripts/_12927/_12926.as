package _12927
{
   import _12939._12941;
   
   public class _12926
   {
      public var data:Array;
      
      public function _12926()
      {
         this.data = [];
         super();
      }
      
      public static function _13113(param1:Number, param2:Number) : _12926
      {
         var _loc3_:_12926 = new _12926();
         _loc3_._13056(param1);
         var _loc4_:* = 1 << param1 - 1;
         var _loc5_:int = 0;
         while(_loc5_ < param1)
         {
            if(param2 & _loc4_)
            {
               _loc3_.data[_loc5_] = 1;
            }
            else
            {
               _loc3_.data[_loc5_] = 0;
            }
            _loc4_ >>= 1;
            _loc5_++;
         }
         return _loc3_;
      }
      
      public static function _13112(param1:int, param2:Array) : _12926
      {
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc3_:_12926 = new _12926();
         _loc3_._13056(param1 * 8);
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < param1)
         {
            _loc6_ = 128;
            _loc7_ = 0;
            while(_loc7_ < 8)
            {
               if(param2[_loc5_] & _loc6_)
               {
                  _loc3_.data[_loc4_] = 1;
               }
               else
               {
                  _loc3_.data[_loc4_] = 0;
               }
               _loc4_++;
               _loc6_ >>= 1;
               _loc7_++;
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function get size() : int
      {
         return this.data.length;
      }
      
      public function _13056(param1:int) : void
      {
         this.data = _12941._13069(0,param1,0);
      }
      
      public function append(param1:_12926) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.size == 0)
         {
            return;
         }
         if(this.size == 0)
         {
            this.data = param1.data;
            return;
         }
         _12941._13068(this.data,param1.data);
      }
      
      public function _13104(param1:Number, param2:Number) : void
      {
         if(param1 == 0)
         {
            return;
         }
         var _loc3_:_12926 = _12926._13113(param1,param2);
         if(_loc3_ == null)
         {
            return;
         }
         this.append(_loc3_);
      }
      
      public function appendBytes(param1:int, param2:Array) : void
      {
         if(param1 == 0)
         {
            return;
         }
         var _loc3_:_12926 = _12926._13112(param1,param2);
         if(_loc3_ == null)
         {
            return;
         }
         this.append(_loc3_);
      }
      
      public function _13106() : Array
      {
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc1_:int = this.size;
         if(_loc1_ == 0)
         {
            return [];
         }
         var _loc2_:Array = _12941._13069(0,(_loc1_ + 7) / 8,0);
         var _loc3_:int = _loc1_ / 8;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = 0;
            _loc7_ = 0;
            while(_loc7_ < 8)
            {
               _loc6_ <<= 1;
               _loc6_ = _loc6_ <<= 1 | this.data[_loc4_];
               _loc4_++;
               _loc7_++;
            }
            _loc2_[_loc5_] = _loc6_;
            _loc5_++;
         }
         if(_loc1_ & 7)
         {
            _loc6_ = 0;
            _loc7_ = 0;
            while(_loc7_ < (_loc1_ & 7))
            {
               _loc6_ <<= 1;
               _loc6_ = _loc6_ <<= 1 | this.data[_loc4_];
               _loc4_++;
               _loc7_++;
            }
            _loc2_[_loc3_] = _loc6_;
         }
         return _loc2_;
      }
   }
}

