package _12933
{
   import _12939._12941;
   
   public class _12934
   {
      private static var A0:uint;
      
      private static var _13153:uint;
      
      public var mm:uint;
      
      public var nn:uint;
      
      public var _13144:Array;
      
      public var _13145:Array;
      
      public var _13146:Array;
      
      public var _13148:uint;
      
      public var _13152:uint;
      
      public var _13151:uint;
      
      public var _13149:uint;
      
      public var pad:uint;
      
      public var _13147:uint;
      
      public function _12934()
      {
         this._13144 = [];
         this._13145 = [];
         this._13146 = [];
         super();
      }
      
      public static function _13143(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : _12934
      {
         var _loc10_:uint = 0;
         var _loc11_:Number = NaN;
         var _loc12_:int = 0;
         var _loc7_:_12934 = null;
         if(param1 < 0 || param1 > 8)
         {
            return _loc7_;
         }
         if(param3 < 0 || param3 >= 1 << param1)
         {
            return _loc7_;
         }
         if(param4 <= 0 || param4 >= 1 << param1)
         {
            return _loc7_;
         }
         if(param5 < 0 || param5 >= 1 << param1)
         {
            return _loc7_;
         }
         if(param6 < 0 || param6 > (1 << param1) - 1 - param5)
         {
            return _loc7_;
         }
         (_loc7_ = new _12934()).mm = param1;
         _loc7_.nn = (1 << param1) - 1;
         _loc7_.pad = param6;
         _loc7_._13144 = _12941._13069(0,_loc7_.nn + 1,0);
         _loc7_._13145 = _12941._13069(0,_loc7_.nn + 1,0);
         _13153 = _loc7_.nn;
         A0 = _13153;
         _loc7_._13145[0] = A0;
         _loc7_._13144[A0] = 0;
         var _loc8_:* = 1;
         var _loc9_:int = 0;
         while(_loc9_ < _loc7_.nn)
         {
            _loc7_._13145[_loc8_] = _loc9_;
            _loc7_._13144[_loc9_] = _loc8_;
            _loc8_ <<= 1;
            if(_loc8_ <<= 1 & 1 << param1)
            {
               _loc8_ ^= param2;
            }
            _loc8_ &= _loc7_.nn;
            _loc9_++;
         }
         if(_loc8_ != 1)
         {
            return null;
         }
         _loc7_._13146 = _12941._13069(0,param5 + 1,0);
         _loc7_._13152 = param3;
         _loc7_._13151 = param4;
         _loc7_._13148 = param5;
         _loc7_._13147 = param2;
         _loc10_ = 1;
         while(_loc10_ % param4 != 0)
         {
            _loc10_ += _loc7_.nn;
         }
         _loc7_._13149 = int(_loc10_ / param4);
         _loc7_._13146[0] = 1;
         _loc9_ = 0;
         _loc11_ = param3 * param4;
         while(_loc9_ < param5)
         {
            _loc7_._13146[_loc9_ + 1] = 1;
            _loc12_ = _loc9_;
            while(_loc12_ > 0)
            {
               if(_loc7_._13146[_loc12_] != 0)
               {
                  _loc7_._13146[_loc12_] = _loc7_._13146[_loc12_ - 1] ^ _loc7_._13144[_loc7_._13150(_loc7_._13145[_loc7_._13146[_loc12_]] + _loc11_)];
               }
               else
               {
                  _loc7_._13146[_loc12_] = _loc7_._13146[_loc12_ - 1];
               }
               _loc12_--;
            }
            _loc7_._13146[0] = _loc7_._13144[_loc7_._13150(_loc7_._13145[_loc7_._13146[0]] + _loc11_)];
            _loc9_++;
            _loc11_ += param4;
         }
         _loc9_ = 0;
         while(_loc9_ <= param5)
         {
            _loc7_._13146[_loc9_] = _loc7_._13145[_loc7_._13146[_loc9_]];
            _loc9_++;
         }
         return _loc7_;
      }
      
      public function _13150(param1:int) : int
      {
         while(param1 >= this.nn)
         {
            param1 -= this.nn;
            param1 = (param1 >> this.mm) + (param1 & this.nn);
         }
         return param1;
      }
      
      public function _13058(param1:Array) : Array
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:_12934 = this;
         var _loc3_:Number = _loc2_.nn;
         var _loc4_:Array = _12941._13069(0,_loc2_._13148,0);
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_.nn - _loc2_._13148 - _loc2_.pad)
         {
            _loc6_ = int(_loc2_._13145[param1[_loc5_] ^ _loc4_[0]]);
            if(_loc6_ != _loc3_)
            {
               _loc6_ = this._13150(_loc2_.nn - _loc2_._13146[_loc2_._13148] + _loc6_);
               _loc7_ = 1;
               while(_loc7_ < _loc2_._13148)
               {
                  _loc4_[_loc7_] ^= _loc2_._13144[this._13150(_loc6_ + _loc2_._13146[_loc2_._13148 - _loc7_])];
                  _loc7_++;
               }
            }
            _loc4_.shift();
            if(_loc6_ != this.nn)
            {
               _loc4_.push(_loc2_._13144[this._13150(_loc6_ + _loc2_._13146[0])]);
            }
            else
            {
               _loc4_.push(0);
            }
            _loc5_++;
         }
         return _loc4_;
      }
   }
}

