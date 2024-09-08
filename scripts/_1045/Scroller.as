package _1045
{
   import _1088._1097;
   import _1177._1181;
   import _1193._1192;
   import egret.core._1121;
   import egret.core._1131;
   import egret.core._1133;
   import egret.core._1134;
   import egret.core._1137;
   import egret.core.ns_egret;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TransformGestureEvent;
   
   use namespace ns_egret;
   
   public class Scroller extends _1085 implements _1134
   {
      private var _7621:_1192;
      
      private var _2440:Group;
      
      private var _8290:String = "auto";
      
      private var _8289:String = "auto";
      
      public var _8292:HScrollBar;
      
      public var _8294:VScrollBar;
      
      private var _8195:_1131;
      
      private var _8291:Boolean = true;
      
      private var _8293:Number = 0;
      
      private var _8285:Boolean = true;
      
      public function Scroller()
      {
         super();
         _2576 = true;
      }
      
      public function get layout() : _1192
      {
         return this._7621;
      }
      
      public function set layout(param1:_1192) : void
      {
         if(this._7621 == param1)
         {
            return;
         }
         this._7621 = param1;
         if(this._2440)
         {
            this._2440.layout = this._7621;
         }
      }
      
      override protected function _2438() : void
      {
         this._2440 = new Group();
         if(!this._7621)
         {
            this._7621 = new _1097();
         }
         this._2440.layout = this._7621;
         ns_egret::_1607(this._2440);
         this._2440.addEventListener(MouseEvent.MOUSE_WHEEL,this._8286);
         this._2440.addEventListener(TransformGestureEvent.GESTURE_PAN,this._8288);
         super._2438();
      }
      
      override protected function _7028() : void
      {
         measuredWidth = this._2440.preferredWidth;
         measuredHeight = this._2440.preferredHeight;
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         this._2440._7599(param1,param2);
      }
      
      public function get _6182() : String
      {
         return this._8290;
      }
      
      public function set _6182(param1:String) : void
      {
         if(this._8290 == param1)
         {
            return;
         }
         this._8290 = param1;
         this._8295();
      }
      
      public function get _6052() : String
      {
         return this._8289;
      }
      
      public function set _6052(param1:String) : void
      {
         if(this._8289 == param1)
         {
            return;
         }
         this._8289 = param1;
         this._8295();
      }
      
      private function _8295() : void
      {
         if(this._2440)
         {
            this._2440.invalidateSize();
            this._2440.invalidateDisplayList();
         }
      }
      
      public function get viewport() : _1131
      {
         return this._8195;
      }
      
      public function set viewport(param1:_1131) : void
      {
         if(param1 == this._8195)
         {
            return;
         }
         this._8163();
         this._8195 = param1;
         this._8170();
         dispatchEvent(new Event("viewportChanged"));
      }
      
      public function get _8039() : Boolean
      {
         return this._8291;
      }
      
      public function set _8039(param1:Boolean) : void
      {
         if(this._8291 == param1)
         {
            return;
         }
         this._8291 = param1;
         if(this._8292)
         {
            this._8292.ns_egret::_8039 = this._8291;
         }
         if(this._8294)
         {
            this._8294.ns_egret::_8039 = this._8291;
         }
      }
      
      private function _8170() : void
      {
         if(Boolean(ns_egret::_2737) && Boolean(this.viewport))
         {
            this.viewport.clipAndEnableScrolling = true;
            this._2440.addElementAt(this.viewport,0);
            this.viewport.addEventListener(_1181.PROPERTY_CHANGE,this._8150);
         }
         if(this._8294)
         {
            this._8294.viewport = this.viewport;
         }
         if(this._8292)
         {
            this._8292.viewport = this.viewport;
         }
      }
      
      private function _8163() : void
      {
         if(this._8292)
         {
            this._8292.viewport = null;
         }
         if(this._8294)
         {
            this._8294.viewport = null;
         }
         if(Boolean(skin) && Boolean(this.viewport))
         {
            this.viewport.clipAndEnableScrolling = false;
            this._2440.removeElement(this.viewport);
            this.viewport.removeEventListener(_1181.PROPERTY_CHANGE,this._8150);
         }
      }
      
      public function get _6243() : Number
      {
         return this._8293;
      }
      
      public function set _6243(param1:Number) : void
      {
         if(param1 == this._8293)
         {
            return;
         }
         this._8293 = param1;
         this._8295();
      }
      
      public function get _8287() : Boolean
      {
         return this._8285;
      }
      
      public function set _8287(param1:Boolean) : void
      {
         if(param1 == this._8285)
         {
            return;
         }
         this._8285 = param1;
         this._8295();
      }
      
      private function _8150(param1:_1181) : void
      {
         switch(param1.property)
         {
            case "contentWidth":
            case "contentHeight":
               this._8295();
         }
      }
      
      public function get _2249() : int
      {
         return !!this.viewport ? 1 : 0;
      }
      
      private function _8177(param1:int) : void
      {
         throw new RangeError("索引:\"" + param1 + "\"超出可视元素索引范围");
      }
      
      public function getElementAt(param1:int) : _1133
      {
         if(Boolean(this.viewport) && param1 == 0)
         {
            return this.viewport;
         }
         this._8177(param1);
         return null;
      }
      
      public function getElementIndex(param1:_1133) : int
      {
         if(param1 != null && param1 == this.viewport)
         {
            return 0;
         }
         return -1;
      }
      
      public function _8171(param1:_1133) : Boolean
      {
         if(param1 != null && param1 == this.viewport)
         {
            return true;
         }
         return false;
      }
      
      private function _8154() : void
      {
         throw new Error("此方法在Scroller组件内不可用!");
      }
      
      public function addElement(param1:_1133) : _1133
      {
         this._8154();
         return null;
      }
      
      public function addElementAt(param1:_1133, param2:int) : _1133
      {
         this._8154();
         return null;
      }
      
      public function removeElement(param1:_1133) : _1133
      {
         this._8154();
         return null;
      }
      
      public function removeElementAt(param1:int) : _1133
      {
         this._8154();
         return null;
      }
      
      public function _2426() : void
      {
         this._8154();
      }
      
      public function setElementIndex(param1:_1133, param2:int) : void
      {
         this._8154();
      }
      
      public function swapElements(param1:_1133, param2:_1133) : void
      {
         this._8154();
      }
      
      public function swapElementsAt(param1:int, param2:int) : void
      {
         this._8154();
      }
      
      override protected function _8189(param1:Object) : void
      {
         super._8189(param1);
         this._8170();
      }
      
      override protected function _8190(param1:Object) : void
      {
         this._8163();
         super._8190(param1);
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this._8294)
         {
            this._8294.viewport = this.viewport;
            this._8294.ns_egret::_8039 = this._8291;
            this._2440.addElement(this._8294);
         }
         else if(param2 == this._8292)
         {
            this._8292.viewport = this.viewport;
            this._8292.ns_egret::_8039 = this._8291;
            this._2440.addElement(this._8292);
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this._8294)
         {
            this._8294.viewport = null;
            if(this._8294.parent == this._2440)
            {
               this._2440.removeElement(this._8294);
            }
         }
         else if(param2 == this._8292)
         {
            this._8292.viewport = null;
            if(this._8292.parent == this._2440)
            {
               this._2440.removeElement(this._8292);
            }
         }
      }
      
      protected function _8288(param1:TransformGestureEvent) : void
      {
         var _loc4_:uint = 0;
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc2_:_1131 = this.viewport;
         if(param1.isDefaultPrevented() || !_loc2_ || !_loc2_.visible)
         {
            return;
         }
         var _loc3_:uint = Math.abs(-param1.offsetX);
         if(Boolean(this._8292) && this._8292.visible)
         {
            _loc4_ = -param1.offsetX < 0 ? _1137.RIGHT : _1137.LEFT;
            _loc5_ = 0;
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
      }
      
      private function _8286(param1:MouseEvent) : void
      {
         var _loc4_:uint = 0;
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc2_:_1131 = this.viewport;
         if(param1.isDefaultPrevented() || !_loc2_ || !_loc2_.visible)
         {
            return;
         }
         var _loc3_:uint = Math.abs(param1.delta);
         if(Boolean(this._8294) && this._8294.visible)
         {
            _loc4_ = param1.delta < 0 ? _1137.DOWN : _1137.UP;
            _loc5_ = 0;
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
         else if(Boolean(this._8292) && this._8292.visible)
         {
            _loc4_ = param1.delta < 0 ? _1137.RIGHT : _1137.LEFT;
            _loc7_ = 0;
            while(_loc7_ < _loc3_)
            {
               _loc8_ = _loc2_._7624(_loc4_);
               if(!isNaN(_loc8_))
               {
                  _loc2_.horizontalScrollPosition += _loc8_;
                  if(_loc2_ is _1121)
                  {
                     _1121(_loc2_)._2449();
                  }
               }
               _loc7_++;
            }
            param1.preventDefault();
         }
      }
   }
}

