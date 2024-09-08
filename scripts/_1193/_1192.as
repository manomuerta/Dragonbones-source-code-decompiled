package _1193
{
   import _1088._1093;
   import _1177._1181;
   import egret.core._1122;
   import egret.core._1137;
   import egret.core.ns_egret;
   import egret.utils._1293;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   use namespace ns_egret;
   
   public class _1192 extends _1293
   {
      private var _target:_1093;
      
      private var _7629:Number = 0;
      
      private var _6805:Number = 0;
      
      private var _7634:Boolean = false;
      
      private var _8435:Boolean = false;
      
      private var _8933:Rectangle;
      
      public function _1192()
      {
         super();
      }
      
      public function get target() : _1093
      {
         return this._target;
      }
      
      public function set target(param1:_1093) : void
      {
         if(this._target == param1)
         {
            return;
         }
         this._target = param1;
         this._7479();
      }
      
      public function get horizontalScrollPosition() : Number
      {
         return this._7629;
      }
      
      public function set horizontalScrollPosition(param1:Number) : void
      {
         if(param1 == this._7629)
         {
            return;
         }
         var _loc2_:Number = this._7629;
         this._7629 = param1;
         this._7839();
         dispatchEvent(_1181._7812(this,"horizontalScrollPosition",_loc2_,param1));
      }
      
      public function get verticalScrollPosition() : Number
      {
         return this._6805;
      }
      
      public function set verticalScrollPosition(param1:Number) : void
      {
         if(param1 == this._6805)
         {
            return;
         }
         var _loc2_:Number = this._6805;
         this._6805 = param1;
         this._7839();
         dispatchEvent(_1181._7812(this,"verticalScrollPosition",_loc2_,param1));
      }
      
      public function get clipAndEnableScrolling() : Boolean
      {
         return this._7634;
      }
      
      public function set clipAndEnableScrolling(param1:Boolean) : void
      {
         if(param1 == this._7634)
         {
            return;
         }
         this._7634 = param1;
         if(this.target != null)
         {
            this._8427(this.target.width,this.target.height);
         }
      }
      
      public function _7624(param1:uint) : Number
      {
         var _loc6_:Rectangle = null;
         var _loc2_:_1093 = this.target;
         if(!_loc2_)
         {
            return 0;
         }
         var _loc3_:Rectangle = this._8929();
         if(!_loc3_)
         {
            return 0;
         }
         if(_loc3_.x == 0 && _loc3_.width >= _loc2_.contentWidth)
         {
            return 0;
         }
         var _loc4_:Number = _loc2_.contentWidth - _loc3_.right;
         var _loc5_:Number = -_loc3_.left;
         switch(param1)
         {
            case _1137.LEFT:
            case _1137.PAGE_LEFT:
               _loc6_ = this._7923(_loc3_);
               break;
            case _1137.RIGHT:
            case _1137.PAGE_RIGHT:
               _loc6_ = this._7922(_loc3_);
               break;
            case _1137.HOME:
               return _loc5_;
            case _1137.END:
               return _loc4_;
            default:
               return 0;
         }
         if(!_loc6_)
         {
            return 0;
         }
         var _loc7_:Number = 0;
         switch(param1)
         {
            case _1137.LEFT:
               _loc7_ = Math.max(_loc6_.left - _loc3_.left,-_loc3_.width);
               break;
            case _1137.RIGHT:
               _loc7_ = Math.min(_loc6_.right - _loc3_.right,_loc3_.width);
               break;
            case _1137.PAGE_LEFT:
               _loc7_ = _loc6_.right - _loc3_.right;
               if(_loc7_ >= 0)
               {
                  _loc7_ = Math.max(_loc6_.left - _loc3_.left,-_loc3_.width);
               }
               break;
            case _1137.PAGE_RIGHT:
               _loc7_ = _loc6_.left - _loc3_.left;
               if(_loc7_ <= 0)
               {
                  _loc7_ = Math.min(_loc6_.right - _loc3_.right,_loc3_.width);
               }
         }
         return Math.min(_loc4_,Math.max(_loc5_,_loc7_ * 4));
      }
      
      public function _7625(param1:uint) : Number
      {
         var _loc6_:Rectangle = null;
         var _loc2_:_1093 = this.target;
         if(!_loc2_)
         {
            return 0;
         }
         var _loc3_:Rectangle = this._8929();
         if(!_loc3_)
         {
            return 0;
         }
         if(_loc3_.y == 0 && _loc3_.height >= _loc2_.contentHeight)
         {
            return 0;
         }
         var _loc4_:Number = _loc2_.contentHeight - _loc3_.bottom;
         var _loc5_:Number = -_loc3_.top;
         switch(param1)
         {
            case _1137.UP:
            case _1137.PAGE_UP:
               _loc6_ = this._7926(_loc3_);
               break;
            case _1137.DOWN:
            case _1137.PAGE_DOWN:
               _loc6_ = this._7925(_loc3_);
               break;
            case _1137.HOME:
               return _loc5_;
            case _1137.END:
               return _loc4_;
            default:
               return 0;
         }
         if(!_loc6_)
         {
            return 0;
         }
         var _loc7_:Number = 0;
         switch(param1)
         {
            case _1137.UP:
               _loc7_ = Math.max(_loc6_.top - _loc3_.top,-_loc3_.height);
               break;
            case _1137.DOWN:
               _loc7_ = Math.min(_loc6_.bottom - _loc3_.bottom,_loc3_.height);
               break;
            case _1137.PAGE_UP:
               _loc7_ = _loc6_.bottom - _loc3_.bottom;
               if(_loc7_ >= 0)
               {
                  _loc7_ = Math.max(_loc6_.top - _loc3_.top,-_loc3_.height);
               }
               break;
            case _1137.PAGE_DOWN:
               _loc7_ = _loc6_.top - _loc3_.top;
               if(_loc7_ <= 0)
               {
                  _loc7_ = Math.min(_loc6_.bottom - _loc3_.bottom,_loc3_.height);
               }
         }
         return Math.min(_loc4_,Math.max(_loc5_,_loc7_));
      }
      
      public function _7666(param1:int) : Point
      {
         var _loc2_:Rectangle = this._7988(param1);
         if(!_loc2_)
         {
            return null;
         }
         var _loc3_:Rectangle = this._8929();
         if(!_loc3_ || !this.target.clipAndEnableScrolling)
         {
            return null;
         }
         if(_loc3_.containsRect(_loc2_) || _loc2_.containsRect(_loc3_))
         {
            return null;
         }
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         var _loc6_:Number = _loc2_.left - _loc3_.left;
         var _loc7_:Number = _loc2_.right - _loc3_.right;
         var _loc8_:Number = _loc2_.top - _loc3_.top;
         var _loc9_:Number = _loc2_.bottom - _loc3_.bottom;
         _loc4_ = Math.abs(_loc6_) < Math.abs(_loc7_) ? _loc6_ : _loc7_;
         _loc5_ = Math.abs(_loc8_) < Math.abs(_loc9_) ? _loc8_ : _loc9_;
         if(_loc2_.left >= _loc3_.left && _loc2_.right <= _loc3_.right)
         {
            _loc4_ = 0;
         }
         else if(_loc2_.bottom <= _loc3_.bottom && _loc2_.top >= _loc3_.top)
         {
            _loc5_ = 0;
         }
         if(_loc2_.left <= _loc3_.left && _loc2_.right >= _loc3_.right)
         {
            _loc4_ = 0;
         }
         else if(_loc2_.bottom >= _loc3_.bottom && _loc2_.top <= _loc3_.top)
         {
            _loc5_ = 0;
         }
         return new Point(_loc4_,_loc5_);
      }
      
      public function _7988(param1:int) : Rectangle
      {
         var _loc2_:_1093 = this.target;
         if(!_loc2_)
         {
            return null;
         }
         var _loc3_:int = _loc2_._2249;
         if(param1 < 0 || param1 >= _loc3_)
         {
            return null;
         }
         var _loc4_:_1122 = _loc2_.getElementAt(param1) as _1122;
         if(!_loc4_ || !_loc4_.includeInLayout)
         {
            return null;
         }
         var _loc5_:Number = _loc4_.layoutBoundsX;
         var _loc6_:Number = _loc4_.layoutBoundsY;
         var _loc7_:Number = _loc4_.layoutBoundsWidth;
         var _loc8_:Number = _loc4_.layoutBoundsHeight;
         return new Rectangle(_loc5_,_loc6_,_loc7_,_loc8_);
      }
      
      protected function _8929() : Rectangle
      {
         var _loc1_:_1093 = this.target;
         if(!_loc1_ || !_loc1_.clipAndEnableScrolling)
         {
            return null;
         }
         var _loc2_:Number = _loc1_.verticalScrollPosition;
         var _loc3_:Number = _loc1_.horizontalScrollPosition;
         return new Rectangle(_loc3_,_loc2_,_loc1_.width,_loc1_.height);
      }
      
      protected function _7923(param1:Rectangle) : Rectangle
      {
         var _loc2_:Rectangle = new Rectangle();
         _loc2_.left = param1.left - 1;
         _loc2_.right = param1.left;
         return _loc2_;
      }
      
      protected function _7922(param1:Rectangle) : Rectangle
      {
         var _loc2_:Rectangle = new Rectangle();
         _loc2_.left = param1.right;
         _loc2_.right = param1.right + 1;
         return _loc2_;
      }
      
      protected function _7926(param1:Rectangle) : Rectangle
      {
         var _loc2_:Rectangle = new Rectangle();
         _loc2_.top = param1.top - 1;
         _loc2_.bottom = param1.top;
         return _loc2_;
      }
      
      protected function _7925(param1:Rectangle) : Rectangle
      {
         var _loc2_:Rectangle = new Rectangle();
         _loc2_.top = param1.bottom;
         _loc2_.bottom = param1.bottom + 1;
         return _loc2_;
      }
      
      protected function _7839() : void
      {
         if(this.target == null)
         {
            return;
         }
         this._8427(this.target.width,this.target.height);
         this.target.ns_egret::_8025();
      }
      
      public function _8427(param1:Number, param2:Number) : void
      {
         if(this.target == null)
         {
            return;
         }
         if(this._7634)
         {
            this.target.scrollRect = new Rectangle(this._7629,this._6805,param1,param2);
         }
         else
         {
            this.target.scrollRect = null;
         }
      }
      
      public function _8090(param1:int, param2:uint) : int
      {
         if(!this.target || this.target._2249 < 1)
         {
            return -1;
         }
         switch(param2)
         {
            case _1137.HOME:
               return 0;
            case _1137.END:
               return this.target._2249 - 1;
            default:
               return -1;
         }
      }
      
      public function get _6056() : Boolean
      {
         return this._8435;
      }
      
      public function set _6056(param1:Boolean) : void
      {
         if(this._8435 == param1)
         {
            return;
         }
         this._8435 = param1;
         dispatchEvent(new Event("useVirtualLayoutChanged"));
         if(this._8435 && !param1)
         {
            this._7479();
         }
         if(this.target)
         {
            this.target.invalidateDisplayList();
         }
      }
      
      public function get _7607() : Rectangle
      {
         return this._8933;
      }
      
      public function set _7607(param1:Rectangle) : void
      {
         if(this._8933 == param1)
         {
            return;
         }
         this._8933 = param1;
         if(this.target)
         {
            this.target.invalidateSize();
         }
      }
      
      public function _7479() : void
      {
      }
      
      public function elementAdded(param1:int) : void
      {
      }
      
      public function elementRemoved(param1:int) : void
      {
      }
      
      public function _7028() : void
      {
      }
      
      public function _5823(param1:Number, param2:Number) : void
      {
      }
   }
}

