package _1088
{
   import _1045._1084;
   import egret.core._1122;
   import egret.core._1141;
   
   public class _1098
   {
      private var _target:_1084;
      
      public function _1098()
      {
         super();
      }
      
      private static function _8504(param1:_1122) : Boolean
      {
         return !isNaN(param1.percentWidth) || !isNaN(param1.left) && !isNaN(param1.right);
      }
      
      private static function _8503(param1:_1122) : Boolean
      {
         return !isNaN(param1.percentHeight) || !isNaN(param1.top) && !isNaN(param1.bottom);
      }
      
      private static function _8507(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Number
      {
         if(!isNaN(param2))
         {
            return param1 - 2 * Math.abs(param2);
         }
         if(!isNaN(param3))
         {
            return param1 - param3;
         }
         if(!isNaN(param4))
         {
            return param1 - param4;
         }
         return param1 - param5;
      }
      
      public function get target() : _1084
      {
         return this._target;
      }
      
      public function set target(param1:_1084) : void
      {
         this._target = param1;
      }
      
      public function _7028() : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:_1122 = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         if(this.target == null)
         {
            return;
         }
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         if(!_1141._8325(this))
         {
            _loc5_ = 0;
            _loc6_ = 0;
         }
         var _loc3_:int = this.target._2249;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc7_ = this.target.getElementAt(_loc4_) as _1122;
            if(!(!_loc7_ || !_loc7_.includeInLayout))
            {
               _loc8_ = _loc7_.horizontalCenter;
               _loc9_ = _loc7_.verticalCenter;
               _loc10_ = _loc7_.left;
               _loc11_ = _loc7_.right;
               _loc12_ = _loc7_.top;
               _loc13_ = _loc7_.bottom;
               if(!isNaN(_loc10_) && !isNaN(_loc11_))
               {
                  _loc14_ = _loc10_ + _loc11_;
               }
               else if(!isNaN(_loc8_))
               {
                  _loc14_ = Math.abs(_loc8_) * 2;
               }
               else if(!isNaN(_loc10_) || !isNaN(_loc11_))
               {
                  _loc14_ = isNaN(_loc10_) ? 0 : _loc10_;
                  _loc14_ = _loc14_ + (isNaN(_loc11_) ? 0 : _loc11_);
               }
               else
               {
                  _loc14_ = _loc7_.preferredX;
               }
               if(!isNaN(_loc12_) && !isNaN(_loc13_))
               {
                  _loc15_ = _loc12_ + _loc13_;
               }
               else if(!isNaN(_loc9_))
               {
                  _loc15_ = Math.abs(_loc9_) * 2;
               }
               else if(!isNaN(_loc12_) || !isNaN(_loc13_))
               {
                  _loc15_ = isNaN(_loc12_) ? 0 : _loc12_;
                  _loc15_ = _loc15_ + (isNaN(_loc13_) ? 0 : _loc13_);
               }
               else
               {
                  _loc15_ = _loc7_.preferredY;
               }
               _loc16_ = _loc7_.preferredWidth;
               _loc17_ = _loc7_.preferredHeight;
               if(_1141._8325(this))
               {
                  _loc1_ = Math.ceil(Math.max(_loc1_,_loc14_ + _loc16_));
                  _loc2_ = Math.ceil(Math.max(_loc2_,_loc15_ + _loc17_));
               }
               else
               {
                  _loc1_ = Math.max(_loc1_,_loc14_ + _loc16_);
                  _loc2_ = Math.max(_loc2_,_loc15_ + _loc17_);
                  _loc18_ = _8504(_loc7_) ? _loc7_._8490() : _loc16_;
                  _loc19_ = _8503(_loc7_) ? _loc7_._8487() : _loc17_;
                  _loc5_ = Math.max(_loc5_,_loc14_ + _loc18_);
                  _loc6_ = Math.max(_loc6_,_loc15_ + _loc19_);
               }
            }
            _loc4_++;
         }
         if(_1141._8325(this))
         {
            this.target.measuredWidth = _loc1_;
            this.target.measuredHeight = _loc2_;
         }
         else
         {
            this.target.measuredWidth = Math.ceil(_loc1_);
            this.target.measuredHeight = Math.ceil(_loc2_);
            this.target._7983 = Math.ceil(_loc5_);
            this.target._7980 = Math.ceil(_loc6_);
         }
      }
      
      public function _5823(param1:Number, param2:Number) : void
      {
         var _loc5_:_1122 = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         if(this.target == null)
         {
            return;
         }
         var _loc3_:int = this.target._2249;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = this.target.getElementAt(_loc4_) as _1122;
            if(!(_loc5_ == null || !_loc5_.includeInLayout))
            {
               _loc6_ = _loc5_.horizontalCenter;
               _loc7_ = _loc5_.verticalCenter;
               _loc8_ = _loc5_.left;
               _loc9_ = _loc5_.right;
               _loc10_ = _loc5_.top;
               _loc11_ = _loc5_.bottom;
               _loc12_ = _loc5_.percentWidth;
               _loc13_ = _loc5_.percentHeight;
               if(!_1141._8325(this))
               {
                  _loc20_ = NaN;
                  _loc21_ = NaN;
               }
               _loc14_ = NaN;
               _loc15_ = NaN;
               if(!isNaN(_loc8_) && !isNaN(_loc9_))
               {
                  _loc14_ = param1 - _loc9_ - _loc8_;
               }
               else if(!isNaN(_loc12_))
               {
                  _loc14_ = Math.round(param1 * Math.min(_loc12_ * 0.01,1));
                  if(!_1141._8325(this))
                  {
                     _loc20_ = Math.min(_loc5_._8506(),_8507(param1,_loc6_,_loc8_,_loc9_,_loc5_.layoutBoundsX));
                  }
               }
               if(!isNaN(_loc10_) && !isNaN(_loc11_))
               {
                  _loc15_ = param2 - _loc11_ - _loc10_;
               }
               else if(!isNaN(_loc13_))
               {
                  _loc15_ = Math.round(param2 * Math.min(_loc13_ * 0.01,1));
                  if(!_1141._8325(this))
                  {
                     _loc21_ = Math.min(_loc5_._8505(),_8507(param2,_loc7_,_loc10_,_loc11_,_loc5_.layoutBoundsY));
                  }
               }
               if(!_1141._8325(this))
               {
                  if(!isNaN(_loc14_))
                  {
                     if(isNaN(_loc20_))
                     {
                        _loc20_ = _loc5_._8506();
                     }
                     _loc14_ = Math.max(_loc5_._8490(),Math.min(_loc20_,_loc14_));
                  }
                  if(!isNaN(_loc15_))
                  {
                     if(isNaN(_loc21_))
                     {
                        _loc21_ = _loc5_._8505();
                     }
                     _loc15_ = Math.max(_loc5_._8487(),Math.min(_loc21_,_loc15_));
                  }
               }
               _loc5_._7599(_loc14_,_loc15_);
               _loc16_ = _loc5_.layoutBoundsWidth;
               _loc17_ = _loc5_.layoutBoundsHeight;
               _loc18_ = NaN;
               _loc19_ = NaN;
               if(!isNaN(_loc6_))
               {
                  _loc18_ = Math.round((param1 - _loc16_) / 2 + _loc6_);
               }
               else if(!isNaN(_loc8_))
               {
                  _loc18_ = _loc8_;
               }
               else if(!isNaN(_loc9_))
               {
                  _loc18_ = param1 - _loc16_ - _loc9_;
               }
               else
               {
                  _loc18_ = _loc5_.layoutBoundsX;
               }
               if(!isNaN(_loc7_))
               {
                  _loc19_ = Math.round((param2 - _loc17_) / 2 + _loc7_);
               }
               else if(!isNaN(_loc10_))
               {
                  _loc19_ = _loc10_;
               }
               else if(!isNaN(_loc11_))
               {
                  _loc19_ = param2 - _loc17_ - _loc11_;
               }
               else
               {
                  _loc19_ = _loc5_.layoutBoundsY;
               }
               _loc5_._7777(_loc18_,_loc19_);
            }
            _loc4_++;
         }
      }
   }
}

