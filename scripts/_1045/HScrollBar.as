package _1045
{
   import _1088._1096;
   import _1177.ResizeEvent;
   import _1177._1181;
   import egret.core._1121;
   import egret.core._1131;
   import egret.core._1137;
   import egret.core.ns_egret;
   import flash.events.MouseEvent;
   import flash.events.TransformGestureEvent;
   import flash.geom.Point;
   
   use namespace ns_egret;
   
   public class HScrollBar extends _1096
   {
      public function HScrollBar()
      {
         super();
      }
      
      private function _8034() : void
      {
         var _loc1_:Number = viewport.horizontalScrollPosition;
         var _loc2_:Number = isNaN(viewport.width) ? 0 : Number(viewport.width);
         var _loc3_:Number = viewport.contentWidth;
         maximum = _loc3_ == 0 ? _loc1_ : _loc3_ - _loc2_;
         pageSize = _loc2_;
      }
      
      override public function set viewport(param1:_1131) : void
      {
         var _loc2_:_1131 = super.viewport;
         if(_loc2_ == param1)
         {
            return;
         }
         if(_loc2_)
         {
            _loc2_.removeEventListener(MouseEvent.MOUSE_WHEEL,this.ns_egret::_6837);
            _loc2_.removeEventListener(TransformGestureEvent.GESTURE_PAN,this._8040);
            removeEventListener(MouseEvent.MOUSE_WHEEL,this._8036,true);
         }
         super.viewport = param1;
         if(param1)
         {
            this._8034();
            value = param1.horizontalScrollPosition;
            param1.addEventListener(MouseEvent.MOUSE_WHEEL,this.ns_egret::_6837,false,-50);
            param1.addEventListener(TransformGestureEvent.GESTURE_PAN,this._8040,false,-50);
            addEventListener(MouseEvent.MOUSE_WHEEL,this._8036,true);
         }
      }
      
      override protected function _8045(param1:Number, param2:Number) : Number
      {
         if(!_2557 || !track)
         {
            return 0;
         }
         var _loc3_:Number = track.layoutBoundsWidth - _2557.layoutBoundsWidth;
         return minimum + (_loc3_ != 0 ? param1 / _loc3_ * (maximum - minimum) : 0);
      }
      
      override protected function _8035() : void
      {
         var _loc3_:Point = null;
         if(!_2557 || !track)
         {
            return;
         }
         var _loc1_:Number = track.layoutBoundsWidth;
         var _loc2_:Number = maximum - minimum;
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         var _loc6_:Number = _loc1_;
         if(_loc2_ > 0)
         {
            if(_8043 === false)
            {
               _loc6_ = Math.min(pageSize / (_loc2_ + pageSize) * _loc1_,_loc1_);
               _loc6_ = Math.max(_2557.minWidth,_loc6_);
            }
            else
            {
               _loc6_ = !!_2557 ? _2557.width : 0;
            }
            _loc4_ = (value - minimum) * ((_loc1_ - _loc6_) / _loc2_);
         }
         if(_8043 === false)
         {
            _2557._7599(Math.ceil(_loc6_),_2557.layoutBoundsHeight);
         }
         if(_8038 === true)
         {
            _2557.visible = _loc6_ < _loc1_;
         }
         ns_egret::_8046.setTo(_loc4_,0);
         _loc3_ = track.localToGlobal(ns_egret::_8046);
         _loc5_ = _2557.parent.globalToLocal(_loc3_).x;
         _2557._7777(Math.round(_loc5_),_2557.layoutBoundsY);
      }
      
      override protected function setValue(param1:Number) : void
      {
         super.setValue(param1);
         if(viewport)
         {
            viewport.horizontalScrollPosition = param1;
         }
      }
      
      override public function _8041(param1:Boolean = true) : void
      {
         var _loc2_:Number = NaN;
         if(viewport)
         {
            _loc2_ = pageSize;
            pageSize = Math.abs(viewport._7624(param1 ? _1137.PAGE_RIGHT : _1137.PAGE_LEFT));
         }
         super._8041(param1);
         if(viewport)
         {
            pageSize = _loc2_;
         }
      }
      
      override protected function _8044(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         if(viewport)
         {
            _loc3_ = Math.abs(viewport._7624(param1 > value ? _1137.PAGE_RIGHT : _1137.PAGE_LEFT));
            super._8044(param1,_loc3_);
            return;
         }
         super._8044(param1,param2);
      }
      
      override public function _8042(param1:Boolean = true) : void
      {
         var _loc2_:Number = NaN;
         if(viewport)
         {
            _loc2_ = _8047;
            _8047 = Math.abs(viewport._7624(param1 ? _1137.RIGHT : _1137.LEFT));
         }
         super._8042(param1);
         if(viewport)
         {
            _8047 = _loc2_;
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         if(param2 == _2557)
         {
            _2557.left = undefined;
            _2557.right = undefined;
            _2557.horizontalCenter = undefined;
         }
         super.partAdded(param1,param2);
      }
      
      override ns_egret function _8032(param1:_1181) : void
      {
         if(viewport)
         {
            value = viewport.horizontalScrollPosition;
         }
      }
      
      override ns_egret function _8037(param1:ResizeEvent) : void
      {
         if(viewport)
         {
            this._8034();
         }
      }
      
      override ns_egret function _8033(param1:_1181) : void
      {
         var _loc2_:Number = NaN;
         if(viewport)
         {
            _loc2_ = isNaN(viewport.width) ? 0 : Number(viewport.width);
            maximum = viewport.contentWidth - _loc2_;
         }
      }
      
      private function _8040(param1:TransformGestureEvent) : void
      {
         var _loc4_:uint = 0;
         var _loc6_:Number = NaN;
         var _loc2_:_1131 = viewport;
         if(param1.isDefaultPrevented() || !_loc2_ || !_loc2_.visible || !visible)
         {
            return;
         }
         var _loc3_:uint = !!ns_egret::_8039 ? uint(Math.abs(-param1.offsetX)) : 1;
         _loc4_ = -param1.offsetX < 0 ? _1137.RIGHT : _1137.LEFT;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = _loc2_._7624(_loc4_);
            if(!isNaN(_loc6_))
            {
               _loc2_.horizontalScrollPosition += _loc6_;
               if(_loc2_ is _1121)
               {
                  _1121(_loc2_)._2449();
               }
            }
            _loc5_++;
         }
         param1.preventDefault();
      }
      
      ns_egret function _6837(param1:MouseEvent) : void
      {
         var _loc4_:uint = 0;
         var _loc6_:Number = NaN;
         var _loc2_:_1131 = viewport;
         if(param1.isDefaultPrevented() || !_loc2_ || !_loc2_.visible || !visible)
         {
            return;
         }
         var _loc3_:uint = !!ns_egret::_8039 ? uint(Math.abs(param1.delta)) : 1;
         _loc4_ = param1.delta < 0 ? _1137.RIGHT : _1137.LEFT;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = _loc2_._7624(_loc4_);
            if(!isNaN(_loc6_))
            {
               _loc2_.horizontalScrollPosition += _loc6_;
               if(_loc2_ is _1121)
               {
                  _1121(_loc2_)._2449();
               }
            }
            _loc5_++;
         }
         param1.preventDefault();
      }
      
      private function _8036(param1:MouseEvent) : void
      {
         var _loc2_:_1131 = viewport;
         if(param1.isDefaultPrevented() || !_loc2_ || !_loc2_.visible)
         {
            return;
         }
         param1.stopImmediatePropagation();
         _loc2_.dispatchEvent(param1);
      }
   }
}

