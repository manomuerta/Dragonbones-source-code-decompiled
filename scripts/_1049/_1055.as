package _1049
{
   import _1038._1039;
   import _1177.CollectionEvent;
   import _1177._1178;
   import _1177._1181;
   import flash.geom.Rectangle;
   
   public class _1055
   {
      private var _7904:_1060;
      
      private var _7883:Vector.<Number>;
      
      private var _1617:Number = 0;
      
      private var _7894:_1061 = null;
      
      private var _7905:Number = 0;
      
      private var _7890:_1061 = null;
      
      private var _7871:Vector.<Number>;
      
      private var _7866:Vector.<Number>;
      
      private var _7860:Number = NaN;
      
      private var _7857:Boolean = true;
      
      private var _7762:int = 0;
      
      private var _7761:int = 0;
      
      private var _7906:Number = 0;
      
      private var _7893:Number = 0;
      
      private var _7870:Number = NaN;
      
      public var _7867:Number = 150;
      
      public var variableRowHeight:Boolean = false;
      
      private var _7882:Number = 0;
      
      private var _7881:Number = 10000;
      
      public function _1055()
      {
         this._7904 = new _1060();
         this._7883 = new Vector.<Number>();
         this._7871 = new Vector.<Number>();
         this._7866 = new Vector.<Number>();
         super();
      }
      
      public static function _7859(param1:Vector.<Number>, param2:int, param3:Vector.<Number>) : void
      {
         var _loc7_:int = 0;
         var _loc4_:int = int(param1.length);
         var _loc5_:int = int(param3.length);
         param1.length += _loc5_;
         var _loc6_:int = int(param1.length);
         _loc7_ = _loc4_ - 1;
         while(_loc7_ >= param2)
         {
            param1[_loc7_ + _loc5_] = param1[_loc7_];
            _loc7_--;
         }
         var _loc8_:int = param2 + param3.length;
         var _loc9_:int = 0;
         _loc7_ = param2;
         while(_loc7_ < _loc8_)
         {
            param1[_loc7_] = param3[_loc9_++];
            _loc7_++;
         }
      }
      
      public static function _7865(param1:Vector.<Number>, param2:int, param3:int, param4:Number) : void
      {
         var _loc5_:int = int(param1.length);
         param1.length += param3;
         var _loc6_:int = int(param1.length);
         var _loc7_:int = _loc5_ - 1;
         while(_loc7_ >= param2)
         {
            param1[_loc7_ + param3] = param1[_loc7_];
            _loc7_--;
         }
         _7891(param1,param4,param2,param3);
      }
      
      public static function _7891(param1:Vector.<Number>, param2:Number, param3:int = 0, param4:int = -1) : void
      {
         var _loc5_:int = param4 == -1 ? int(param1.length) : param3 + param4;
         var _loc6_:int = param3;
         while(_loc6_ < _loc5_)
         {
            param1[_loc6_] = param2;
            _loc6_++;
         }
      }
      
      private static function bound(param1:Number, param2:Number, param3:Number) : Number
      {
         if(param1 < param2)
         {
            param1 = param2;
         }
         else if(param1 > param3)
         {
            param1 = param3;
         }
         return param1;
      }
      
      public function get _7573() : int
      {
         return this._7762;
      }
      
      public function set _7573(param1:int) : void
      {
         if(param1 == this._7762)
         {
            return;
         }
         if(param1 < this._7762)
         {
            this._7887(param1,param1 - this._7762);
         }
         this._7762 = param1;
      }
      
      public function get _7560() : int
      {
         return this._7761;
      }
      
      public function set _7560(param1:int) : void
      {
         this._7745();
         this._7761 = param1;
         this._7883.length = param1;
         this._7866.length = param1;
         this._7871.length = param1;
         this._7904._7899 = param1;
         this._7665();
         _7891(this._7883,NaN,0,this._7761);
      }
      
      public function get _7907() : Number
      {
         return this._7906;
      }
      
      public function set _7907(param1:Number) : void
      {
         if(param1 == this._7906)
         {
            return;
         }
         this._7906 = param1;
         this._7894 = null;
         this._7890 = null;
      }
      
      public function get _7901() : Number
      {
         return this._7893;
      }
      
      public function set _7901(param1:Number) : void
      {
         if(param1 == this._7893)
         {
            return;
         }
         this._7893 = param1;
         this._7894 = null;
         this._7890 = null;
      }
      
      public function get _7718() : Number
      {
         return this._7857 ? this._7860 : this._7870;
      }
      
      public function set _7718(param1:Number) : void
      {
         if(param1 == this._7870)
         {
            return;
         }
         this._7870 = bound(param1,this._7882,this._7881);
         this._7857 = isNaN(this._7870);
         this._7894 = null;
         this._7890 = null;
      }
      
      public function get _7886() : Number
      {
         return this._7882;
      }
      
      public function set _7886(param1:Number) : void
      {
         if(param1 == this._7882)
         {
            return;
         }
         this._7882 = param1;
         this._7870 = Math.max(this._7870,this._7882);
      }
      
      public function get _7889() : Number
      {
         return this._7881;
      }
      
      public function set _7889(param1:Number) : void
      {
         if(param1 == this._7881)
         {
            return;
         }
         this._7881 = param1;
         this._7870 = Math.min(this._7870,this._7881);
      }
      
      public function _7746(param1:int) : Number
      {
         var _loc3_:_1061 = null;
         var _loc2_:Number = this._7718;
         if(this.variableRowHeight)
         {
            _loc3_ = this._7904.find(param1);
            if(_loc3_)
            {
               if(_loc3_.fixedHeight >= 0)
               {
                  _loc2_ = _loc3_.fixedHeight;
               }
               else if(_loc3_._7876 >= 0)
               {
                  _loc2_ = _loc3_._7876;
               }
            }
         }
         return !isNaN(_loc2_) ? bound(_loc2_,this._7886,this._7889) : _loc2_;
      }
      
      public function _7885(param1:int, param2:Number) : void
      {
         if(!this.variableRowHeight)
         {
            return;
         }
         var _loc3_:_1061 = this._7904.find(param1);
         if(_loc3_)
         {
            _loc3_.fixedHeight = bound(param2,this._7886,this._7889);
         }
         else
         {
            _loc3_ = this._7904.insert(param1);
            if(_loc3_)
            {
               _loc3_.fixedHeight = bound(param2,this._7886,this._7889);
            }
         }
      }
      
      public function _7539(param1:int) : Number
      {
         var _loc2_:Number = NaN;
         _loc2_ = this._7883[param1];
         if(isNaN(_loc2_))
         {
            _loc2_ = this._7871[param1];
         }
         if(isNaN(_loc2_))
         {
            _loc2_ = this._7867;
         }
         return _loc2_;
      }
      
      public function _7875(param1:int, param2:Number) : void
      {
         this._7883[param1] = param2;
      }
      
      public function _7880(param1:int, param2:int) : Number
      {
         var _loc3_:_1061 = this._7904.find(param1);
         if(_loc3_)
         {
            return _loc3_._7880(param2);
         }
         return NaN;
      }
      
      public function _7879(param1:int, param2:int, param3:Number) : void
      {
         if(!this.variableRowHeight)
         {
            return;
         }
         var _loc4_:_1061 = this._7904.find(param1);
         var _loc5_:Number = this._7718;
         if(_loc4_ == null)
         {
            _loc4_ = this._7904.insert(param1);
         }
         else
         {
            _loc5_ = _loc4_._7876;
         }
         if(Boolean(_loc4_) && _loc4_._7879(param2,param3))
         {
            if(Boolean(this._7894) && _loc4_._6589 < this._7894._6589)
            {
               this._1617 += _loc4_._7876 - _loc5_;
            }
            if(Boolean(this._7890) && _loc4_._6589 < this._7890._6589)
            {
               this._7905 += _loc4_._7876 - _loc5_;
            }
         }
      }
      
      public function _7738(param1:int, param2:int) : Rectangle
      {
         if(param1 < 0 || param1 >= this._7573 || param2 < 0 || param2 >= this._7560)
         {
            return null;
         }
         var _loc3_:Number = this._7756(param1,param2);
         var _loc4_:Number = this._7757(param1,param2);
         var _loc5_:Number = this._7539(param2);
         var _loc6_:Number = this._7746(param1);
         return new Rectangle(_loc3_,_loc4_,_loc5_,_loc6_);
      }
      
      public function _7756(param1:int, param2:int) : Number
      {
         var _loc3_:Number = 0;
         var _loc4_:int = 0;
         while(_loc4_ < param2)
         {
            _loc3_ += this._7539(_loc4_) + this._7901;
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function _7757(param1:int, param2:int) : Number
      {
         var _loc3_:Number = NaN;
         if(!this.variableRowHeight || this._7904.length == 0)
         {
            return param1 * (this._7718 + this._7907);
         }
         if(param1 == 0)
         {
            return 0;
         }
         if(!this._7890)
         {
            this._7890 = this._7904.first;
            this._7905 = this._7890._6589 * (this._7718 + this._7907);
         }
         var _loc4_:int = this._7890._6589;
         if(param1 == _loc4_)
         {
            _loc3_ = this._7905;
         }
         else if(param1 < _loc4_)
         {
            _loc3_ = this._7895(param1,this._7890,this._7905);
         }
         else
         {
            _loc3_ = this._7896(param1,this._7890,this._7905);
         }
         return _loc3_;
      }
      
      private function _7895(param1:int, param2:_1061, param3:Number) : Number
      {
         var _loc6_:_1061 = null;
         var _loc8_:int = 0;
         var _loc4_:_1061 = param2;
         var _loc5_:Number = param3;
         var _loc7_:Number = param3;
         while(_loc4_)
         {
            if(_loc4_._6589 == param1)
            {
               break;
            }
            _loc6_ = _loc4_.prev;
            if(!_loc6_ || param1 < _loc4_._6589 && param1 > _loc6_._6589)
            {
               _loc8_ = _loc4_._6589 - param1;
               _loc7_ -= _loc8_ * (this._7718 + this._7907);
               break;
            }
            _loc8_ = _loc4_._6589 - _loc6_._6589 - 1;
            _loc5_ = _loc7_ = _loc7_ - _loc8_ * (this._7718 + this._7907) - (_loc6_._7876 + this._7907);
            _loc4_ = _loc6_;
         }
         this._7890 = _loc4_;
         this._7905 = _loc5_;
         return _loc7_;
      }
      
      private function _7896(param1:int, param2:_1061, param3:Number) : Number
      {
         var _loc6_:_1061 = null;
         var _loc8_:int = 0;
         var _loc4_:_1061 = param2;
         var _loc5_:Number = param3;
         var _loc7_:Number = param3;
         while(_loc4_)
         {
            if(_loc4_._6589 == param1)
            {
               break;
            }
            _loc7_ += _loc4_._7876;
            if(_loc4_._6589 < this._7762 - 1)
            {
               _loc7_ += this._7907;
            }
            _loc6_ = _loc4_.next;
            if(!_loc6_ || param1 > _loc4_._6589 && param1 < _loc6_._6589)
            {
               _loc8_ = param1 - _loc4_._6589 - 1;
               _loc7_ += _loc8_ * (this._7718 + this._7907);
               break;
            }
            _loc8_ = _loc6_._6589 - _loc4_._6589 - 1;
            _loc5_ = _loc7_ += _loc8_ * (this._7718 + this._7907);
            _loc4_ = _loc6_;
         }
         this._7890 = _loc4_;
         this._7905 = _loc5_;
         return _loc7_;
      }
      
      public function _7558(param1:int) : Rectangle
      {
         if(param1 < 0 || param1 >= this._7762)
         {
            return null;
         }
         if(this._7761 == 0 || this._7762 == 0)
         {
            return new Rectangle(0,0,0,0);
         }
         var _loc2_:Number = this._7756(param1,0);
         var _loc3_:Number = this._7757(param1,0);
         var _loc4_:Number = this._7756(param1,this._7761 - 1) + this._7539(this._7761 - 1) - _loc2_;
         var _loc5_:Number = this._7746(param1);
         return new Rectangle(_loc2_,_loc3_,_loc4_,_loc5_);
      }
      
      public function _7873(param1:int) : Rectangle
      {
         if(param1 < 0)
         {
            return null;
         }
         if(param1 < this._7573)
         {
            return this._7558(param1);
         }
         var _loc2_:int = this._7573 - 1;
         var _loc3_:int = this._7560 - 1;
         var _loc4_:Number = _loc2_ >= 0 ? this._7756(_loc2_,0) : 0;
         var _loc5_:Number = _loc2_ >= 0 ? this._7757(_loc2_,0) + this._7746(_loc2_) : 0;
         var _loc6_:int = param1 - this._7573;
         var _loc7_:Number = _loc6_ > 0 ? (_loc6_ - 1) * this._7907 : 0;
         var _loc8_:Number = _loc5_ + _loc6_ * this._7718 + _loc7_;
         var _loc9_:Number = 0;
         if(_loc3_ >= 0 && _loc2_ >= 0)
         {
            _loc9_ = this._7756(_loc2_,_loc3_) + this._7539(_loc3_) - _loc4_;
         }
         else if(_loc3_ >= 0)
         {
            _loc9_ = this._7756(0,_loc3_) + this._7539(_loc3_) - _loc4_;
         }
         else if(_loc2_ >= 0)
         {
            _loc9_ = this._7756(_loc2_,0) + this._7539(0) - _loc4_;
         }
         return new Rectangle(_loc4_,_loc8_,_loc9_,this._7718);
      }
      
      public function _7720(param1:int) : Rectangle
      {
         if(param1 < 0 || param1 >= this._7761)
         {
            return null;
         }
         if(this._7761 == 0 || this._7762 == 0)
         {
            return new Rectangle(0,0,0,0);
         }
         var _loc2_:Number = this._7756(0,param1);
         var _loc3_:Number = this._7757(0,param1);
         var _loc4_:Number = this._7539(param1);
         var _loc5_:Number = this._7757(this._7762 - 1,param1) + this._7746(this._7762 - 1) - _loc3_;
         return new Rectangle(_loc2_,_loc3_,_loc4_,_loc5_);
      }
      
      public function _7737(param1:Number, param2:Number) : int
      {
         var _loc3_:int = 0;
         if(param2 < 0)
         {
            return -1;
         }
         if(!this.variableRowHeight || this._7904.length == 0)
         {
            _loc3_ = param2 / (this._7718 + this._7907);
            return _loc3_ < this._7762 ? _loc3_ : -1;
         }
         if(param2 == 0)
         {
            return this._7762 > 0 ? 0 : -1;
         }
         if(!this._7894)
         {
            this._7894 = this._7904.first;
            this._1617 = this._7894._6589 * (this._7718 + this._7907);
         }
         if(this._7903(param2,this._1617,this._7894))
         {
            _loc3_ = this._7894._6589;
         }
         else if(param2 < this._1617)
         {
            _loc3_ = this._7869(param2,this._7894,this._1617);
         }
         else
         {
            _loc3_ = this._7868(param2,this._7894,this._1617);
         }
         return _loc3_ < this._7762 ? _loc3_ : -1;
      }
      
      private function _7903(param1:Number, param2:Number, param3:_1061) : Boolean
      {
         var _loc4_:Number = param2 + param3._7876;
         if(param3._6589 != this._7573 - 1)
         {
            _loc4_ += this._7907;
         }
         if(param1 >= param2 && param1 < _loc4_)
         {
            return true;
         }
         return false;
      }
      
      private function _7869(param1:Number, param2:_1061, param3:Number) : int
      {
         var _loc8_:Number = NaN;
         var _loc10_:int = 0;
         var _loc4_:_1061 = param2;
         var _loc5_:_1061 = null;
         var _loc6_:int = _loc4_._6589;
         var _loc7_:Number = param3;
         var _loc9_:Number = param1;
         while(_loc4_)
         {
            if(this._7903(_loc9_,_loc7_,_loc4_))
            {
               break;
            }
            _loc5_ = _loc4_.prev;
            if(!_loc5_)
            {
               _loc8_ = 0;
            }
            else
            {
               _loc8_ = _loc7_;
               _loc10_ = _loc4_._6589 - _loc5_._6589;
               if(_loc10_ > 1)
               {
                  _loc8_ -= (_loc10_ - 1) * (this._7718 + this._7907);
               }
            }
            if(_loc9_ < _loc7_ && _loc9_ >= _loc8_)
            {
               _loc6_ -= Math.ceil(Number(_loc7_ - _loc9_) / (this._7718 + this._7907));
               break;
            }
            _loc7_ = _loc8_ - _loc5_._7876 - this._7907;
            _loc4_ = _loc4_.prev;
            _loc6_ = _loc4_._6589;
         }
         this._7894 = _loc4_;
         this._1617 = _loc7_;
         return _loc6_;
      }
      
      private function _7868(param1:Number, param2:_1061, param3:Number) : int
      {
         var _loc9_:Number = NaN;
         var _loc11_:int = 0;
         var _loc4_:_1061 = param2;
         var _loc5_:_1061 = null;
         var _loc6_:int = _loc4_._6589;
         var _loc7_:Number = param3;
         var _loc8_:Number = param3;
         var _loc10_:Number = param1;
         while(_loc4_)
         {
            if(this._7903(_loc10_,_loc7_,_loc4_))
            {
               break;
            }
            _loc8_ += _loc4_._7876;
            if(_loc4_._6589 != this._7573 - 1)
            {
               _loc8_ += this._7907;
            }
            _loc5_ = _loc4_.next;
            _loc9_ = _loc8_;
            if(!_loc5_)
            {
               _loc11_ = this._7573 - 1 - _loc4_._6589;
               _loc9_ += _loc11_ * (this._7718 + this._7907) - this._7907 + 1;
            }
            else
            {
               _loc11_ = _loc5_._6589 - _loc4_._6589;
               _loc9_ += (_loc11_ - 1) * (this._7718 + this._7907);
            }
            if(_loc10_ >= _loc8_ && _loc10_ < _loc9_)
            {
               _loc6_ += Math.ceil(Number(_loc10_ - _loc8_) / (this._7718 + this._7907));
               break;
            }
            if(!_loc5_)
            {
               _loc6_ = -1;
               break;
            }
            _loc7_ = _loc8_ = _loc9_;
            _loc4_ = _loc4_.next;
            _loc6_ = _loc4_._6589;
         }
         this._7894 = _loc4_;
         this._1617 = _loc7_;
         return _loc6_;
      }
      
      public function _7719(param1:Number, param2:Number) : int
      {
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         var _loc3_:Number = param1;
         _loc4_ = 0;
         for(; _loc4_ < this._7761; _loc4_++)
         {
            _loc5_ = this._7883[_loc4_];
            if(isNaN(_loc5_))
            {
               _loc5_ = this._7871[_loc4_];
               if(_loc5_ == 0)
               {
                  continue;
               }
            }
            if(isNaN(_loc5_))
            {
               _loc5_ = this._7867;
            }
            _loc3_ -= _loc5_ + this._7901;
            if(_loc3_ <= 0)
            {
               return _loc4_;
            }
         }
         return -1;
      }
      
      public function _7872(param1:int = -1) : Number
      {
         var _loc4_:Number = NaN;
         var _loc2_:int = param1 == -1 ? this._7761 : param1;
         var _loc3_:Number = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         for(; _loc6_ < this._7761 && _loc5_ < _loc2_; _loc6_++)
         {
            if(_loc6_ >= this._7883.length)
            {
               _loc3_ += this._7867;
               _loc5_++;
            }
            else
            {
               _loc4_ = this._7883[_loc6_];
               if(isNaN(_loc4_))
               {
                  _loc4_ = this._7871[_loc6_];
                  if(_loc4_ == 0)
                  {
                     continue;
                  }
               }
               if(isNaN(_loc4_))
               {
                  _loc4_ = this._7867;
               }
               _loc3_ += _loc4_;
               _loc5_++;
            }
         }
         if(_loc2_ > 1)
         {
            _loc3_ += (_loc2_ - 1) * this._7901;
         }
         return _loc3_;
      }
      
      public function _7717(param1:int = -1) : Number
      {
         var _loc2_:int = param1 == -1 ? this._7573 : param1;
         var _loc3_:Number = 0;
         if(_loc2_ > 1)
         {
            _loc3_ += (_loc2_ - 1) * this._7907;
         }
         if(!this.variableRowHeight || this._7904.length == 0)
         {
            return _loc3_ + _loc2_ * this._7718;
         }
         var _loc4_:_1061 = this._7904.first;
         var _loc5_:int = 0;
         while(Boolean(_loc4_) && _loc4_._6589 < _loc2_)
         {
            _loc3_ += _loc4_._7876;
            _loc5_++;
            _loc4_ = _loc4_.next;
         }
         return _loc3_ + (_loc2_ - _loc5_) * this._7718;
      }
      
      public function _7858(param1:int = -1) : Number
      {
         var _loc6_:Number = NaN;
         var _loc2_:int = param1 == -1 ? this._7761 : param1;
         var _loc3_:Number = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < this._7761 && _loc4_ < _loc2_)
         {
            _loc6_ = _loc5_ < this._7761 ? this._7871[_loc5_] : NaN;
            if(_loc6_ != 0)
            {
               if(isNaN(_loc6_))
               {
                  _loc6_ = this._7867;
               }
               _loc3_ += _loc6_;
               _loc4_++;
            }
            _loc5_++;
         }
         if(_loc2_ > 1)
         {
            _loc3_ += (_loc4_ - 1) * this._7901;
         }
         return _loc3_;
      }
      
      public function _7856(param1:int = -1) : Number
      {
         var _loc2_:int = param1 == -1 ? this._7573 : param1;
         var _loc3_:Number = 0;
         if(_loc2_ > 1)
         {
            _loc3_ += (_loc2_ - 1) * this._7907;
         }
         if(!isNaN(this._7718))
         {
            return _loc3_ + _loc2_ * this._7718;
         }
         return 0;
      }
      
      public function _7864(param1:int) : Number
      {
         return this._7871[param1];
      }
      
      public function _7863(param1:int, param2:Number) : void
      {
         this._7871[param1] = param2;
      }
      
      public function _7861(param1:int) : Number
      {
         return this._7866[param1];
      }
      
      public function _7862(param1:int, param2:Number) : void
      {
         this._7866[param1] = param2;
         var _loc3_:Number = 0;
         var _loc4_:int = int(this._7866.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            if(!isNaN(this._7866[_loc5_]))
            {
               _loc3_ = Math.max(_loc3_,this._7866[_loc5_]);
            }
            _loc5_++;
         }
         this._7860 = _loc3_;
      }
      
      public function _7665() : void
      {
         _7891(this._7871,NaN);
         _7891(this._7866,NaN);
         this._7860 = NaN;
      }
      
      public function _7897(param1:int, param2:int) : void
      {
         this._7888(param1,param2);
      }
      
      public function _7878(param1:int, param2:int) : void
      {
         var _loc3_:int = this._7761;
         var _loc4_:int = this._7761 + param2;
         if(param1 < 0 || param1 > _loc3_)
         {
            return;
         }
         this._7904._7878(param1,param2);
         this._7761 = _loc4_;
         _7865(this._7883,param1,param2,NaN);
         _7865(this._7871,param1,param2,NaN);
         _7865(this._7866,param1,param2,NaN);
      }
      
      public function _7898(param1:int, param2:int) : void
      {
         this._7887(param1,param2);
      }
      
      public function _7877(param1:int, param2:int) : void
      {
         var _loc3_:int = this._7761;
         var _loc4_:int = this._7761 - param2;
         if(param1 < 0 || param1 >= _loc3_)
         {
            return;
         }
         if(_loc4_ <= 0)
         {
            this._7560 = 0;
            return;
         }
         this._7904._7877(param1,param2);
         this._7761 = _loc4_;
         this._7883.splice(param1,param2);
         this._7871.splice(param1,param2);
         this._7866.splice(param1,param2);
         this._7894 = null;
         this._7890 = null;
      }
      
      public function _7900(param1:int, param2:int) : void
      {
         var _loc5_:_1061 = null;
         if(param1 < 0 || param2 <= 0)
         {
            return;
         }
         var _loc3_:_1061 = this._7904._7874(param1);
         var _loc4_:int = param1 + param2;
         if(Boolean(_loc3_) && _loc3_._6589 < param1)
         {
            _loc3_ = _loc3_.next;
         }
         while(Boolean(_loc3_) && _loc3_._6589 < _loc4_)
         {
            _loc5_ = _loc3_;
            _loc3_ = _loc3_.next;
            this._7904.removeNode(_loc5_);
         }
         this._7894 = null;
         this._7890 = null;
      }
      
      public function _7884(param1:int, param2:int) : void
      {
         if(param1 < 0 || param1 >= this._7761)
         {
            return;
         }
         this._7904._7884(param1,param2);
         _7891(this._7871,NaN,param1,param2);
         _7891(this._7866,NaN,param1,param2);
         _7891(this._7883,NaN,param1,param2);
         this._7894 = null;
         this._7890 = null;
      }
      
      public function _7902(param1:int, param2:int, param3:int) : void
      {
         var _loc6_:_1061 = null;
         var _loc4_:Vector.<_1061> = this._7887(param1,param3);
         var _loc5_:int = param2 - param1;
         for each(_loc6_ in _loc4_)
         {
            _loc6_._6589 += _loc5_;
         }
         this._7888(param2,param3,_loc4_);
      }
      
      public function _7892(param1:int, param2:int, param3:int) : void
      {
         if(param1 < 0 || param1 >= this._7761 || param2 < 0 || param2 > this._7761)
         {
            return;
         }
         this._7904._7892(param1,param2,param3);
         _7859(this._7883,param2,this._7883.splice(param1,param3));
         _7859(this._7871,param2,this._7871.splice(param1,param3));
         _7859(this._7866,param2,this._7866.splice(param1,param3));
      }
      
      public function _7745() : void
      {
         this._7904._6162();
         this._7894 = null;
         this._7890 = null;
         this._1617 = 0;
         this._7905 = 0;
      }
      
      private function _7888(param1:int, param2:int, param3:Vector.<_1061> = null) : void
      {
         var _loc5_:_1061 = null;
         if(param1 < 0 || param2 <= 0)
         {
            return;
         }
         var _loc4_:_1061 = this._7904._7874(param1);
         if((Boolean(_loc4_)) && _loc4_._6589 < param1)
         {
            _loc4_ = _loc4_.next;
         }
         if(param3)
         {
            if(_loc4_)
            {
               for each(_loc5_ in param3)
               {
                  this._7904.insertBefore(_loc4_,_loc5_);
               }
            }
            else
            {
               for each(_loc5_ in param3)
               {
                  this._7904.push(_loc5_);
               }
            }
         }
         _loc5_ = _loc4_;
         while(_loc5_)
         {
            _loc5_._6589 += param2;
            _loc5_ = _loc5_.next;
         }
         this._7573 += param2;
         this._7894 = null;
         this._7890 = null;
      }
      
      private function _7887(param1:int, param2:int) : Vector.<_1061>
      {
         var _loc6_:_1061 = null;
         var _loc3_:Vector.<_1061> = new Vector.<_1061>();
         if(param1 < 0 || param2 <= 0)
         {
            return _loc3_;
         }
         var _loc4_:_1061 = this._7904._7874(param1);
         var _loc5_:int = param1 + param2;
         if(Boolean(_loc4_) && _loc4_._6589 < param1)
         {
            _loc4_ = _loc4_.next;
         }
         while(Boolean(_loc4_) && _loc4_._6589 < _loc5_)
         {
            _loc6_ = _loc4_;
            _loc3_.push(_loc6_);
            _loc4_ = _loc4_.next;
            this._7904.removeNode(_loc6_);
         }
         while(_loc4_)
         {
            _loc4_._6589 -= param2;
            _loc4_ = _loc4_.next;
         }
         this._7762 -= param2;
         this._7894 = null;
         this._7890 = null;
         return _loc3_;
      }
      
      public function _7670(param1:CollectionEvent) : void
      {
         switch(param1.kind)
         {
            case _1178.ADD:
               this._7897(param1.location,param1.items.length);
               break;
            case _1178.REMOVE:
               this._7898(param1.location,param1.items.length);
               break;
            case _1178.MOVE:
               this._7902(param1.oldLocation,param1.location,param1.items.length);
               break;
            case _1178.REFRESH:
               this._7745();
               break;
            case _1178.RESET:
               this._7745();
               this._7665();
               break;
            case _1178.UPDATE:
               break;
            case _1178.REPLACE:
               this._7900(param1.location,param1.items.length);
         }
      }
      
      public function _7677(param1:CollectionEvent) : void
      {
         var _loc2_:_1181 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         switch(param1.kind)
         {
            case _1178.ADD:
               this._7878(param1.location,param1.items.length);
               break;
            case _1178.REMOVE:
               this._7877(param1.location,param1.items.length);
               break;
            case _1178.MOVE:
               this._7892(param1.oldLocation,param1.location,param1.items.length);
               break;
            case _1178.REFRESH:
            case _1178.RESET:
               this._7560 = _1039(param1.target).length;
               break;
            case _1178.UPDATE:
               _loc3_ = !!param1.items ? int(param1.items.length) : 0;
               _loc4_ = 0;
               while(_loc4_ < _loc3_)
               {
                  _loc2_ = param1.items[_loc4_] as _1181;
                  if(Boolean(_loc2_) && _loc2_.property == "visible")
                  {
                     this._7855(_loc2_);
                  }
                  _loc4_++;
               }
               break;
            case _1178.REPLACE:
               this._7884(param1.location,param1.items.length);
         }
      }
      
      private function _7855(param1:_1181) : void
      {
         var _loc2_:_1053 = param1.source as _1053;
         var _loc3_:int = _loc2_.columnIndex;
         if(!_loc2_ || _loc3_ < 0 || _loc3_ >= this._7761)
         {
            return;
         }
         this._7884(_loc3_,1);
         if(_loc2_.visible)
         {
            this._7863(_loc3_,NaN);
            this._7862(_loc3_,NaN);
            if(!isNaN(_loc2_.width))
            {
               this._7875(_loc3_,_loc2_.width);
            }
         }
         else
         {
            this._7863(_loc3_,0);
            this._7862(_loc3_,0);
            this._7875(_loc3_,NaN);
         }
      }
      
      public function toString() : String
      {
         return this._7904.toString();
      }
   }
}

