package _1185
{
   import _1193._1192;
   import egret.core._1122;
   import egret.core._1141;
   import flash.geom.Rectangle;
   
   public class _1186 extends _1192
   {
      private var _8909:uint = 20;
      
      public function _1186()
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
      
      override public function set _6056(param1:Boolean) : void
      {
      }
      
      public function get _8910() : uint
      {
         return this._8909;
      }
      
      public function set _8910(param1:uint) : void
      {
         if(param1 == 0)
         {
            param1 = 1;
         }
         this._8909 = param1;
      }
      
      override protected function _7923(param1:Rectangle) : Rectangle
      {
         var _loc2_:Rectangle = new Rectangle();
         _loc2_.left = param1.left - this._8909;
         _loc2_.right = param1.left;
         return _loc2_;
      }
      
      override protected function _7922(param1:Rectangle) : Rectangle
      {
         var _loc2_:Rectangle = new Rectangle();
         _loc2_.left = param1.right;
         _loc2_.right = param1.right + this._8909;
         return _loc2_;
      }
      
      override protected function _7926(param1:Rectangle) : Rectangle
      {
         var _loc2_:Rectangle = new Rectangle();
         _loc2_.top = param1.top - this._8909;
         _loc2_.bottom = param1.top;
         return _loc2_;
      }
      
      override protected function _7925(param1:Rectangle) : Rectangle
      {
         var _loc2_:Rectangle = new Rectangle();
         _loc2_.top = param1.bottom;
         _loc2_.bottom = param1.bottom + this._8909;
         return _loc2_;
      }
      
      override public function _7028() : void
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
         super._7028();
         if(target == null)
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
         var _loc3_:int = target._2249;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc7_ = target.getElementAt(_loc4_) as _1122;
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
            target.measuredWidth = _loc1_;
            target.measuredHeight = _loc2_;
         }
         else
         {
            target.measuredWidth = Math.ceil(Math.max(_loc1_,_loc5_));
            target.measuredHeight = Math.ceil(Math.max(_loc2_,_loc6_));
            target._7983 = Math.ceil(_loc5_);
            target._7980 = Math.ceil(_loc6_);
         }
      }
      
      override public function _5823(param1:Number, param2:Number) : void
      {
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
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         super._5823(param1,param2);
         if(target == null)
         {
            return;
         }
         var _loc3_:int = target._2249;
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_)
         {
            _loc7_ = target.getElementAt(_loc6_) as _1122;
            if(!(_loc7_ == null || !_loc7_.includeInLayout))
            {
               _loc8_ = _loc7_.horizontalCenter;
               _loc9_ = _loc7_.verticalCenter;
               _loc10_ = _loc7_.left;
               _loc11_ = _loc7_.right;
               _loc12_ = _loc7_.top;
               _loc13_ = _loc7_.bottom;
               _loc14_ = _loc7_.percentWidth;
               _loc15_ = _loc7_.percentHeight;
               if(!_1141._8325(this))
               {
                  _loc22_ = NaN;
                  _loc23_ = NaN;
               }
               _loc16_ = NaN;
               _loc17_ = NaN;
               if(!isNaN(_loc10_) && !isNaN(_loc11_))
               {
                  _loc16_ = param1 - _loc11_ - _loc10_;
               }
               else if(!isNaN(_loc14_))
               {
                  _loc16_ = Math.round(param1 * Math.min(_loc14_ * 0.01,1));
                  if(!_1141._8325(this))
                  {
                     _loc22_ = Math.min(_loc7_._8506(),_8507(param1,_loc8_,_loc10_,_loc11_,_loc7_.layoutBoundsX));
                  }
               }
               if(!isNaN(_loc12_) && !isNaN(_loc13_))
               {
                  _loc17_ = param2 - _loc13_ - _loc12_;
               }
               else if(!isNaN(_loc15_))
               {
                  _loc17_ = Math.round(param2 * Math.min(_loc15_ * 0.01,1));
                  if(!_1141._8325(this))
                  {
                     _loc23_ = Math.min(_loc7_._8505(),_8507(param2,_loc9_,_loc12_,_loc13_,_loc7_.layoutBoundsY));
                  }
               }
               if(!_1141._8325(this))
               {
                  if(!isNaN(_loc16_))
                  {
                     if(isNaN(_loc22_))
                     {
                        _loc22_ = _loc7_._8506();
                     }
                     _loc16_ = Math.max(_loc7_._8490(),Math.min(_loc22_,_loc16_));
                  }
                  if(!isNaN(_loc17_))
                  {
                     if(isNaN(_loc23_))
                     {
                        _loc23_ = _loc7_._8505();
                     }
                     _loc17_ = Math.max(_loc7_._8487(),Math.min(_loc23_,_loc17_));
                  }
               }
               _loc7_._7599(_loc16_,_loc17_);
               _loc18_ = _loc7_.layoutBoundsWidth;
               _loc19_ = _loc7_.layoutBoundsHeight;
               _loc20_ = NaN;
               _loc21_ = NaN;
               if(!isNaN(_loc8_))
               {
                  _loc20_ = Math.round((param1 - _loc18_) / 2 + _loc8_);
               }
               else if(!isNaN(_loc10_))
               {
                  _loc20_ = _loc10_;
               }
               else if(!isNaN(_loc11_))
               {
                  _loc20_ = param1 - _loc18_ - _loc11_;
               }
               else
               {
                  _loc20_ = _loc7_.layoutBoundsX;
               }
               if(!isNaN(_loc9_))
               {
                  _loc21_ = Math.round((param2 - _loc19_) / 2 + _loc9_);
               }
               else if(!isNaN(_loc12_))
               {
                  _loc21_ = _loc12_;
               }
               else if(!isNaN(_loc13_))
               {
                  _loc21_ = param2 - _loc19_ - _loc13_;
               }
               else
               {
                  _loc21_ = _loc7_.layoutBoundsY;
               }
               _loc7_._7777(_loc20_,_loc21_);
               _loc4_ = Math.max(_loc4_,_loc20_ + _loc18_);
               _loc5_ = Math.max(_loc5_,_loc21_ + _loc19_);
            }
            _loc6_++;
         }
         if(_1141._8325(this))
         {
            target._7729(_loc4_,_loc5_);
         }
         else
         {
            target._7729(Math.ceil(_loc4_),Math.ceil(_loc5_));
         }
      }
   }
}

