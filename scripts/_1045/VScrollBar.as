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
   import flash.geom.Point;
   
   use namespace ns_egret;
   
   public class VScrollBar extends _1096
   {
      public function VScrollBar()
      {
         super();
      }
      
      private function _8034() : void
      {
         var _loc1_:Number = viewport.verticalScrollPosition;
         var _loc2_:Number = isNaN(viewport.height) ? 0 : Number(viewport.height);
         var _loc3_:Number = viewport.contentHeight;
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
            removeEventListener(MouseEvent.MOUSE_WHEEL,this.ns_egret::_6837);
         }
         super.viewport = param1;
         if(param1)
         {
            this._8034();
            value = param1.verticalScrollPosition;
            param1.addEventListener(MouseEvent.MOUSE_WHEEL,this.ns_egret::_6837);
            addEventListener(MouseEvent.MOUSE_WHEEL,this.ns_egret::_6837);
         }
      }
      
      override protected function _8045(param1:Number, param2:Number) : Number
      {
         if(!_2557 || !track)
         {
            return 0;
         }
         var _loc3_:Number = track.layoutBoundsHeight - _2557.layoutBoundsHeight;
         return minimum + (_loc3_ != 0 ? param2 / _loc3_ * (maximum - minimum) : 0);
      }
      
      override protected function _8035() : void
      {
         var _loc3_:Point = null;
         if(!_2557 || !track)
         {
            return;
         }
         var _loc1_:Number = track.layoutBoundsHeight;
         var _loc2_:Number = maximum - minimum;
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         var _loc6_:Number = _loc1_;
         if(_loc2_ > 0)
         {
            if(_8043 === false)
            {
               _loc6_ = Math.min(pageSize / (_loc2_ + pageSize) * _loc1_,_loc1_);
               _loc6_ = Math.max(_2557.minHeight,_loc6_);
            }
            else
            {
               _loc6_ = !!_2557 ? _2557.height : 0;
            }
            _loc4_ = (value - minimum) * ((_loc1_ - _loc6_) / _loc2_);
         }
         if(_8043 === false)
         {
            _2557._7599(_2557.layoutBoundsWidth,Math.ceil(_loc6_));
         }
         if(_8038 === true)
         {
            _2557.visible = _loc6_ < _loc1_;
         }
         ns_egret::_8046.setTo(0,_loc4_);
         _loc3_ = track.localToGlobal(ns_egret::_8046);
         _loc5_ = _2557.parent.globalToLocal(_loc3_).y;
         _2557._7777(_2557.layoutBoundsX,Math.round(_loc5_));
      }
      
      override protected function setValue(param1:Number) : void
      {
         super.setValue(param1);
         if(viewport)
         {
            viewport.verticalScrollPosition = param1;
         }
      }
      
      override public function _8041(param1:Boolean = true) : void
      {
         var _loc2_:Number = NaN;
         if(viewport)
         {
            _loc2_ = pageSize;
            pageSize = Math.abs(viewport._7625(param1 ? _1137.PAGE_DOWN : _1137.PAGE_UP));
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
            _loc3_ = Math.abs(viewport._7625(param1 > value ? _1137.PAGE_DOWN : _1137.PAGE_UP));
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
            _8047 = Math.abs(viewport._7625(param1 ? _1137.DOWN : _1137.UP));
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
            _2557.top = undefined;
            _2557.bottom = undefined;
            _2557.verticalCenter = undefined;
         }
         super.partAdded(param1,param2);
      }
      
      override ns_egret function _8450(param1:_1181) : void
      {
         if(viewport)
         {
            value = viewport.verticalScrollPosition;
         }
      }
      
      override ns_egret function _8037(param1:ResizeEvent) : void
      {
         if(viewport)
         {
            this._8034();
         }
      }
      
      override ns_egret function _8451(param1:_1181) : void
      {
         var _loc2_:Number = NaN;
         if(viewport)
         {
            _loc2_ = isNaN(viewport.height) ? 0 : Number(viewport.height);
            maximum = viewport.contentHeight - viewport.height;
         }
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
         _loc4_ = param1.delta < 0 ? _1137.DOWN : _1137.UP;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = _loc2_._7625(_loc4_);
            if(!isNaN(_loc6_))
            {
               _loc2_.verticalScrollPosition += _loc6_;
               if(_loc2_ is _1121)
               {
                  _1121(_loc2_)._2449();
               }
            }
            _loc5_++;
         }
         param1.preventDefault();
      }
   }
}

