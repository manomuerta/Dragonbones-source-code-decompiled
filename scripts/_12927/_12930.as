package _12927
{
   import _12936._12937;
   import _12939._12941;
   
   public class _12930
   {
      public static const N1:int = 3;
      
      public static const N2:int = 3;
      
      public static const N3:int = 40;
      
      public static const N4:int = 10;
      
      public var frames:Array;
      
      public var _13131:Array;
      
      public function _12930(param1:Array)
      {
         super();
         this.frames = _12941.copyArray(param1);
      }
      
      public function _13125(param1:Array, param2:int, param3:int, param4:int) : int
      {
         var _loc7_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:* = int(_12937._13128(param3,param4));
         var _loc8_:int = 0;
         while(_loc8_ < 8)
         {
            if(_loc6_ & 1)
            {
               _loc5_ += 2;
               _loc7_ = 133;
            }
            else
            {
               _loc7_ = 132;
            }
            param1[8][param2 - 1 - _loc8_] = _loc7_;
            if(_loc8_ < 6)
            {
               param1[_loc8_][8] = _loc7_;
            }
            else
            {
               param1[_loc8_ + 1][8] = _loc7_;
            }
            _loc6_ >>= 1;
            _loc8_++;
         }
         _loc8_ = 0;
         while(_loc8_ < 7)
         {
            if(_loc6_ & 1)
            {
               _loc5_ += 2;
               _loc7_ = 133;
            }
            else
            {
               _loc7_ = 132;
            }
            param1[param2 - 7 + _loc8_][8] = _loc7_;
            if(_loc8_ == 0)
            {
               param1[8][7] = _loc7_;
            }
            else
            {
               param1[8][6 - _loc8_] = _loc7_;
            }
            _loc6_ >>= 1;
            _loc8_++;
         }
         return _loc5_;
      }
      
      public function mask0(param1:Number, param2:Number) : int
      {
         return int((param1 + param2 & 1) == 0);
      }
      
      public function mask1(param1:Number, param2:Number) : int
      {
         return int((param2 & 1) == 0);
      }
      
      public function mask2(param1:Number, param2:Number) : int
      {
         return int(param1 % 3 == 0);
      }
      
      public function mask3(param1:Number, param2:Number) : int
      {
         return int((param1 + param2) % 3 == 0);
      }
      
      public function mask4(param1:Number, param2:Number) : int
      {
         return int((int(param2 * 0.5) + int(param1 / 3) & 1) == 0);
      }
      
      public function mask5(param1:Number, param2:Number) : int
      {
         return int(param1 * param2 % 2 + param1 * param2 % 3 == 0);
      }
      
      public function mask6(param1:Number, param2:Number) : int
      {
         return int(((param1 * param2 & 1) + param1 * param2 % 3 & 1) == 0);
      }
      
      public function mask7(param1:Number, param2:Number) : int
      {
         return int(((param1 + param2 & 1) + param1 * param2 % 3 & 1) == 0);
      }
      
      private function _13126(param1:int, param2:int) : Array
      {
         var _loc5_:int = 0;
         var _loc3_:Array = _12941._13069(0,param2,_12941._13069(0,param2,0));
         var _loc4_:int = 0;
         while(_loc4_ < param2)
         {
            _loc5_ = 0;
            for(; _loc5_ < param2; _loc5_++)
            {
               if(this.frames[_loc4_][_loc5_] & 0x80)
               {
                  _loc3_[_loc4_][_loc5_] = 0;
                  continue;
               }
               switch(param1)
               {
                  case 0:
                     _loc3_[_loc4_][_loc5_] = this.mask0(_loc5_,_loc4_);
                     break;
                  case 1:
                     _loc3_[_loc4_][_loc5_] = this.mask1(_loc5_,_loc4_);
                     break;
                  case 2:
                     _loc3_[_loc4_][_loc5_] = this.mask2(_loc5_,_loc4_);
                     break;
                  case 3:
                     _loc3_[_loc4_][_loc5_] = this.mask3(_loc5_,_loc4_);
                     break;
                  case 4:
                     _loc3_[_loc4_][_loc5_] = this.mask4(_loc5_,_loc4_);
                     break;
                  case 5:
                     _loc3_[_loc4_][_loc5_] = this.mask5(_loc5_,_loc4_);
                     break;
                  case 6:
                     _loc3_[_loc4_][_loc5_] = this.mask6(_loc5_,_loc4_);
                     break;
                  case 7:
                     _loc3_[_loc4_][_loc5_] = this.mask7(_loc5_,_loc4_);
                     break;
               }
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function _13129(param1:int, param2:int, param3:Boolean = false) : Array
      {
         var _loc8_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Array = [];
         var _loc6_:Array = _12941._13130(this.frames);
         _loc5_ = this._13126(param1,param2);
         if(param3)
         {
            return null;
         }
         var _loc7_:int = 0;
         while(_loc7_ < param2)
         {
            _loc8_ = 0;
            while(_loc8_ < param2)
            {
               if(_loc5_[_loc7_][_loc8_] == 1)
               {
                  _loc6_[_loc7_][_loc8_] = this.frames[_loc7_][_loc8_] ^ 1;
               }
               _loc4_ += _loc6_[_loc7_][_loc8_] & 1;
               _loc8_++;
            }
            _loc7_++;
         }
         return [_loc6_,_loc4_];
      }
      
      public function _13122(param1:int, param2:int, param3:int) : Array
      {
         var _loc4_:Array = this._13129(param2,param1);
         this._13125(_loc4_[0],param1,param2,param3);
         return _loc4_[0];
      }
      
      public function _13132(param1:int, param2:Array) : int
      {
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < param1)
         {
            if(param2[_loc4_] >= 5)
            {
               _loc3_ += N1 + (param2[_loc4_] - 5);
            }
            if(_loc4_ & 1)
            {
               if(_loc4_ >= 3 && _loc4_ < param1 - 2 && param2[_loc4_] % 3 == 0)
               {
                  _loc5_ = param2[_loc4_] / 3;
                  if(param2[_loc4_ - 2] == _loc5_ && param2[_loc4_ - 1] == _loc5_ && param2[_loc4_ + 1] == _loc5_ && param2[_loc4_ + 2] == _loc5_)
                  {
                     if(param2[_loc4_ - 3] < 0 || param2[_loc4_ - 3] >= 4 * _loc5_)
                     {
                        _loc3_ += N3;
                     }
                     else if(_loc4_ + 3 >= param1 || param2[_loc4_ + 3] >= 4 * _loc5_)
                     {
                        _loc3_ += N3;
                     }
                  }
               }
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function _13127(param1:int, param2:Array) : int
      {
         var _loc6_:Array = null;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this._13131 = _12941._13069(0,_12937.QRSPEC_VERSION_MAX + 1,0);
         var _loc5_:int = 0;
         while(_loc5_ < param1)
         {
            _loc3_ = 0;
            this._13131[0] = 1;
            _loc6_ = param2[_loc5_];
            _loc7_ = [];
            if(_loc5_ > 0)
            {
               _loc7_ = param2[_loc5_ - 1];
            }
            _loc8_ = 0;
            while(_loc8_ < param1)
            {
               if(_loc8_ > 0 && _loc5_ > 0)
               {
                  _loc9_ = _loc6_[_loc8_] & _loc6_[_loc8_ - 1] & _loc7_[_loc8_] & _loc7_[_loc8_ - 1];
                  _loc10_ = _loc6_[_loc8_] | _loc6_[_loc8_ - 1] | _loc7_[_loc8_] | _loc7_[_loc8_ - 1];
                  if((_loc9_ | _loc10_ ^ 1) & 1)
                  {
                     _loc4_ += N2;
                  }
               }
               if(_loc8_ == 0 && Boolean(_loc6_[_loc8_] & 1))
               {
                  this._13131[0] = -1;
                  _loc3_ = 1;
                  this._13131[_loc3_] = 1;
               }
               else if(_loc8_ > 0)
               {
                  if((_loc6_[_loc8_] ^ _loc6_[_loc8_ - 1]) & 1)
                  {
                     _loc3_++;
                     this._13131[_loc3_] = 1;
                  }
                  else
                  {
                     ++this._13131[_loc3_];
                  }
               }
               _loc8_++;
            }
            _loc4_ += this._13132(_loc3_ + 1,this._13131);
            _loc5_++;
         }
         _loc8_ = 0;
         while(_loc8_ < param1)
         {
            _loc3_ = 0;
            this._13131[0] = 1;
            _loc5_ = 0;
            while(_loc5_ < param1)
            {
               if(_loc5_ == 0 && Boolean(param2[_loc5_][_loc8_] & 1))
               {
                  this._13131[0] = -1;
                  _loc3_ = 1;
                  this._13131[_loc3_] = 1;
               }
               else if(_loc5_ > 0)
               {
                  if((param2[_loc5_][_loc8_] ^ param2[_loc5_ - 1][_loc8_]) & 1)
                  {
                     _loc3_++;
                     this._13131[_loc3_] = 1;
                  }
                  else
                  {
                     ++this._13131[_loc3_];
                  }
               }
               _loc5_++;
            }
            _loc4_ += this._13132(_loc3_ + 1,this._13131);
            _loc8_++;
         }
         return _loc4_;
      }
      
      public function mask(param1:int, param2:int) : Array
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Array = null;
         var _loc11_:Array = null;
         var _loc3_:int = int.MAX_VALUE;
         var _loc4_:int = 0;
         var _loc5_:Array = [];
         var _loc6_:Array = [0,2,3,4,5,6,7];
         _loc5_ = _12941.copyArray(this.frames);
         for each(_loc7_ in _loc6_)
         {
            _loc8_ = 0;
            _loc9_ = 0;
            _loc10_ = this._13129(_loc7_,param1);
            _loc11_ = _loc10_[0];
            _loc9_ = int(_loc10_[1]);
            _loc9_ = _loc9_ + this._13125(_loc11_,param1,_loc7_,param2);
            _loc9_ = 100 * _loc9_ / (param1 * param1);
            _loc8_ = int(Math.abs(_loc9_ - 50) / 5) * N4;
            if((_loc8_ = _loc8_ + this._13127(param1,_loc11_)) < _loc3_)
            {
               _loc3_ = _loc8_;
               _loc5_ = _loc11_;
               _loc4_ = _loc7_;
            }
         }
         return _loc5_;
      }
   }
}

