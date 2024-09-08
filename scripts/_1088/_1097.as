package _1088
{
   import _1045.Scroller;
   import _1193._1192;
   import egret.core._1122;
   import egret.core._1131;
   import egret.core._1139;
   import egret.core._1140;
   import egret.core._1141;
   import egret.core.ns_egret;
   import flash.geom.Point;
   
   use namespace ns_egret;
   
   public class _1097 extends _1192
   {
      private static const SDT:Number = 1;
      
      private static var _8491:Point = new Point();
      
      private var _8483:Boolean = false;
      
      private var _8497:Number = 1;
      
      private var _8498:Number = 1;
      
      private var _8499:Number = 1;
      
      private var _8500:Number = 1;
      
      private var _8489:int = 0;
      
      public function _1097()
      {
         super();
      }
      
      public function get _8484() : Boolean
      {
         return this._8483;
      }
      
      public function set _8484(param1:Boolean) : void
      {
         if(this._8483 == param1)
         {
            return;
         }
         this._8483 = param1;
         if(target)
         {
            target.invalidateDisplayList();
         }
      }
      
      private function _8494() : Scroller
      {
         return target.parent as Scroller;
      }
      
      private function _8485(param1:_1131) : Point
      {
         var _loc2_:_1093 = param1 as _1093;
         if(Boolean(_loc2_) && this._8483)
         {
            return this._8486(_loc2_);
         }
         var _loc3_:Number = param1.contentWidth;
         var _loc4_:Number = param1.contentHeight;
         if(_loc3_ == 0 && _loc4_ == 0 || (isNaN(_loc3_) || isNaN(_loc4_)))
         {
            _8491.setTo(0,0);
         }
         else
         {
            _8491.setTo(_loc3_,_loc4_);
         }
         return _8491;
      }
      
      private function _8486(param1:_1093) : Point
      {
         var _loc8_:_1122 = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         var _loc6_:int = param1._2249;
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc8_ = param1.getElementAt(_loc7_) as _1122;
            if(!(!_loc8_ || !_loc8_.includeInLayout))
            {
               _loc9_ = _loc8_.preferredX;
               _loc10_ = _loc8_.preferredY;
               _loc11_ = _loc8_.preferredWidth;
               _loc12_ = _loc8_.preferredHeight;
               _loc4_ = Math.floor(Math.min(_loc4_,_loc9_));
               _loc5_ = Math.floor(Math.min(_loc5_,_loc10_));
               _loc2_ = Math.ceil(Math.max(_loc2_,_loc9_ + _loc11_));
               _loc3_ = Math.ceil(Math.max(_loc3_,_loc10_ + _loc12_));
            }
            _loc7_++;
         }
         _8491.setTo(_loc2_ - _loc4_,_loc3_ - _loc5_);
         return _8491;
      }
      
      private function get _8495() : Boolean
      {
         var _loc1_:_1096 = this._8494()._8292;
         return Boolean(_loc1_) && _loc1_.visible;
      }
      
      private function set _8495(param1:Boolean) : void
      {
         var _loc2_:_1096 = null;
         _loc2_ = this._8494()._8292;
         if(!_loc2_)
         {
            return;
         }
         if(_loc2_.visible == param1)
         {
            return;
         }
         _loc2_.visible = param1;
         _loc2_.ns_egret::_8493 = param1;
      }
      
      private function _8488() : Number
      {
         var _loc1_:Scroller = this._8494();
         var _loc2_:Number = _loc1_._6243;
         var _loc3_:_1096 = _loc1_._8292;
         return Math.max(_loc2_,_loc3_.preferredHeight);
      }
      
      private function _8502(param1:Number, param2:Number, param3:Boolean = true) : Boolean
      {
         var _loc5_:_1096 = null;
         if(this._8496 && param3)
         {
            _loc5_ = this._8494()._8294;
            param1 -= _loc5_.preferredWidth;
            if(_1141._8325(this))
            {
               param2 -= _loc5_.minHeight;
            }
            else
            {
               param2 -= _loc5_._8487();
            }
         }
         var _loc4_:_1096 = this._8494()._8292;
         if(_1141._8325(this))
         {
            return param1 >= _loc4_.minWidth && param2 >= _loc4_.preferredHeight;
         }
         return param1 >= _loc4_._8490() && param2 >= _loc4_.preferredHeight;
      }
      
      private function get _8496() : Boolean
      {
         var _loc1_:_1096 = this._8494()._8294;
         return Boolean(_loc1_) && _loc1_.visible;
      }
      
      private function set _8496(param1:Boolean) : void
      {
         var _loc2_:_1096 = this._8494()._8294;
         if(!_loc2_)
         {
            return;
         }
         if(_loc2_.visible == param1)
         {
            return;
         }
         _loc2_.visible = param1;
         _loc2_.ns_egret::_8493 = param1;
      }
      
      private function _8492() : Number
      {
         var _loc1_:Scroller = this._8494();
         var _loc2_:Number = _loc1_._6243;
         var _loc3_:_1096 = _loc1_._8294;
         return Math.max(_loc2_,_loc3_.preferredWidth);
      }
      
      private function _8501(param1:Number, param2:Number, param3:Boolean = true) : Boolean
      {
         var _loc5_:_1096 = null;
         if(this._8495 && param3)
         {
            _loc5_ = this._8494()._8292;
            if(_1141._8325(this))
            {
               param1 -= _loc5_.minWidth;
            }
            else
            {
               param1 -= _loc5_._8490();
            }
            param2 -= _loc5_.preferredHeight;
         }
         var _loc4_:_1096 = this._8494()._8294;
         if(_1141._8325(this))
         {
            return param1 >= _loc4_.preferredWidth && param2 >= _loc4_.minHeight;
         }
         return param1 >= _loc4_.preferredWidth && param2 >= _loc4_._8487();
      }
      
      override public function _7028() : void
      {
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc1_:Scroller = this._8494();
         if(!_loc1_)
         {
            return;
         }
         var _loc2_:Number = _loc1_._6243;
         var _loc3_:Boolean = _loc1_._8287;
         var _loc4_:Number = _loc2_;
         var _loc5_:Number = _loc2_;
         var _loc6_:_1096 = _loc1_._8292;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         if(_loc3_)
         {
            switch(_loc1_._6052)
            {
               case _1139.ON:
                  if(_loc6_)
                  {
                     _loc7_ = true;
                  }
                  break;
               case _1139.AUTO:
                  if(_loc6_)
                  {
                     _loc7_ = _loc6_.visible;
                  }
                  _loc8_ = true;
            }
         }
         var _loc9_:_1096 = _loc1_._8294;
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = false;
         if(_loc3_)
         {
            switch(_loc1_._6182)
            {
               case _1139.ON:
                  if(_loc9_)
                  {
                     _loc10_ = true;
                  }
                  break;
               case _1139.AUTO:
                  if(_loc9_)
                  {
                     _loc10_ = _loc9_.visible;
                  }
                  _loc11_ = true;
            }
         }
         _loc5_ += _loc7_ ? this._8488() : _loc2_;
         _loc4_ += _loc10_ ? this._8492() : _loc2_;
         var _loc12_:_1131 = _loc1_.viewport;
         if(_loc12_)
         {
            if(_loc3_)
            {
               _loc19_ = Number(_loc12_.preferredWidth);
               if(_1141._8325(this))
               {
                  _loc4_ += Math.max(_loc19_,_loc7_ ? _loc6_.minWidth : 0);
               }
               else
               {
                  _loc4_ += Math.max(_loc19_,_loc7_ ? _loc6_._8490() : 0);
               }
               _loc20_ = Number(_loc12_.preferredHeight);
               if(_1141._8325(this))
               {
                  _loc5_ += Math.max(_loc20_,_loc10_ ? _loc9_.minHeight : 0);
               }
               else
               {
                  _loc5_ += Math.max(_loc20_,_loc10_ ? _loc9_._8487() : 0);
               }
            }
            else
            {
               _loc4_ += _loc12_.preferredWidth;
               _loc5_ += _loc12_.preferredHeight;
            }
         }
         var _loc13_:Number = _loc2_ * 2;
         var _loc14_:Number = _loc2_ * 2;
         var _loc15_:_1140 = _loc12_ as _1140;
         var _loc16_:Number = !!_loc15_ ? _loc15_.explicitWidth : NaN;
         var _loc17_:Number = !!_loc15_ ? _loc15_.explicitHeight : NaN;
         if(!isNaN(_loc16_))
         {
            _loc13_ += _loc16_;
         }
         if(!isNaN(_loc17_))
         {
            _loc14_ += _loc17_;
         }
         var _loc18_:_1093;
         (_loc18_ = target).measuredWidth = Math.ceil(_loc4_);
         _loc18_.measuredHeight = Math.ceil(_loc5_);
         if(!_1141._8325(this))
         {
            _loc18_._7983 = Math.ceil(_loc13_);
            _loc18_._7980 = Math.ceil(_loc14_);
         }
      }
      
      override public function _5823(param1:Number, param2:Number) : void
      {
         var _loc21_:Point = null;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:_1093 = null;
         var _loc3_:Scroller = this._8494();
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:_1131 = _loc3_.viewport;
         var _loc5_:_1096 = _loc3_._8292;
         var _loc6_:_1096 = _loc3_._8294;
         var _loc7_:Number = _loc3_._6243;
         var _loc8_:Number = 0;
         var _loc9_:Number = 0;
         if(_loc4_)
         {
            _loc21_ = this._8485(_loc4_);
            _loc8_ = _loc21_.x;
            _loc9_ = _loc21_.y;
         }
         var _loc10_:_1140 = _loc4_ as _1140;
         var _loc11_:Number = !!_loc10_ ? _loc10_.explicitWidth : NaN;
         var _loc12_:Number = !!_loc10_ ? _loc10_.explicitHeight : NaN;
         var _loc13_:Number = isNaN(_loc11_) ? param1 - _loc7_ * 2 : _loc11_;
         var _loc14_:Number = isNaN(_loc12_) ? param2 - _loc7_ * 2 : _loc12_;
         var _loc15_:Boolean = this._8495;
         var _loc16_:Boolean = this._8496;
         var _loc17_:Boolean = false;
         switch(_loc3_._6052)
         {
            case _1139.ON:
               this._8495 = true;
               break;
            case _1139.AUTO:
               if(Boolean(_loc5_) && Boolean(_loc4_))
               {
                  _loc17_ = true;
                  this._8495 = _loc8_ >= _loc13_ + SDT;
               }
               break;
            default:
               this._8495 = false;
         }
         var _loc18_:Boolean = false;
         switch(_loc3_._6182)
         {
            case _1139.ON:
               this._8496 = true;
               break;
            case _1139.AUTO:
               if(Boolean(_loc6_) && Boolean(_loc4_))
               {
                  _loc18_ = true;
                  this._8496 = _loc9_ >= _loc14_ + SDT;
               }
               break;
            default:
               this._8496 = false;
         }
         if(isNaN(_loc11_))
         {
            _loc13_ = param1 - (this._8496 ? _loc7_ + this._8492() : _loc7_ * 2);
         }
         else
         {
            _loc13_ = _loc11_;
         }
         if(isNaN(_loc12_))
         {
            _loc14_ = param2 - (this._8495 ? _loc7_ + this._8488() : _loc7_ * 2);
         }
         else
         {
            _loc14_ = _loc12_;
         }
         var _loc19_:Boolean = false;
         var _loc20_:Boolean = false;
         if(this._8496 && !this._8495 && _loc17_ && _loc8_ >= _loc13_ + SDT)
         {
            this._8495 = _loc19_ = true;
         }
         else if(!this._8496 && this._8495 && _loc18_ && _loc9_ >= _loc14_ + SDT)
         {
            this._8496 = _loc20_ = true;
         }
         if(this._8495 && this._8496)
         {
            if(!(this._8502(param1,param2) && this._8501(param1,param2)))
            {
               if(!this._8502(param1,param2,false) && !this._8501(param1,param2,false))
               {
                  this._8495 = false;
                  this._8496 = false;
               }
               else if(_loc19_)
               {
                  if(this._8501(param1,param2,false))
                  {
                     this._8495 = false;
                  }
                  else
                  {
                     this._8496 = this._8495 = false;
                  }
               }
               else if(_loc20_)
               {
                  if(this._8502(param1,param2,false))
                  {
                     this._8496 = false;
                  }
                  else
                  {
                     this._8495 = this._8496 = false;
                  }
               }
               else if(this._8501(param1,param2,false))
               {
                  this._8495 = false;
               }
               else
               {
                  this._8496 = false;
               }
            }
         }
         else if(this._8495 && !this._8502(param1,param2))
         {
            this._8495 = false;
         }
         else if(this._8496 && !this._8501(param1,param2))
         {
            this._8496 = false;
         }
         if(isNaN(_loc11_))
         {
            _loc13_ = param1 - (this._8496 ? _loc7_ + this._8492() : _loc7_ * 2);
         }
         else
         {
            _loc13_ = _loc11_;
         }
         if(isNaN(_loc12_))
         {
            _loc14_ = param2 - (this._8495 ? _loc7_ + this._8488() : _loc7_ * 2);
         }
         else
         {
            _loc14_ = _loc12_;
         }
         if(_loc4_)
         {
            _loc4_._7599(_loc13_,_loc14_);
            _loc4_._7777(_loc7_,_loc7_);
         }
         if(this._8495)
         {
            _loc22_ = this._8496 ? param1 - _loc6_.preferredWidth : param1;
            _loc23_ = _loc5_.preferredHeight;
            if(_1141._8325(this))
            {
               _loc5_._7599(Math.max(_loc5_.minWidth,_loc22_),_loc23_);
            }
            else
            {
               _loc5_._7599(Math.max(_loc5_._8490(),_loc22_),_loc23_);
            }
            _loc5_._7777(0,param2 - _loc23_);
         }
         if(this._8496)
         {
            _loc24_ = _loc6_.preferredWidth;
            _loc25_ = this._8495 ? param2 - _loc5_.preferredHeight : param2;
            if(_1141._8325(this))
            {
               _loc6_._7599(_loc24_,Math.max(_loc6_.minHeight,_loc25_));
            }
            else
            {
               _loc6_._7599(_loc24_,Math.max(_loc6_._8487(),_loc25_));
            }
            _loc6_._7777(param1 - _loc24_,0);
         }
         if(this._8489 < 2 && (this._8496 != _loc16_ && _loc18_ || this._8495 != _loc15_ && _loc17_))
         {
            target.invalidateSize();
            _loc26_ = _loc4_ as _1093;
            if((_loc26_) && _loc26_.layout && _loc26_.layout._6056)
            {
               _loc26_.invalidateSize();
            }
            this._8489 += 1;
         }
         else
         {
            this._8489 = 0;
         }
         target._7729(param1,param2);
      }
   }
}

