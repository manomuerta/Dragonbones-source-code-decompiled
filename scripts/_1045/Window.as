package _1045
{
   import egret.core._1135;
   import egret.core._1141;
   import egret.core.ns_egret;
   import egret.managers._1220;
   import egret.utils._1288;
   import flash.display.NativeWindow;
   import flash.display.NativeWindowDisplayState;
   import flash.display.NativeWindowInitOptions;
   import flash.display.NativeWindowSystemChrome;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.NativeWindowBoundsEvent;
   import flash.events.NativeWindowDisplayStateEvent;
   import flash.geom.Point;
   
   use namespace ns_egret;
   
   public class Window extends SkinnableContainer implements _1135
   {
      private var _maximizable:Boolean = true;
      
      private var _minimizable:Boolean = true;
      
      private var _resizable:Boolean = true;
      
      private var _8636:NativeWindow = null;
      
      private var _systemChrome:String = "standard";
      
      private var _transparent:Boolean = false;
      
      private var _type:String = "utility";
      
      private var _nativeWindow:NativeWindow;
      
      private var _8639:Boolean = true;
      
      private var _8635:int = 0;
      
      private var _7695:Boolean = false;
      
      private var _8640:Boolean = false;
      
      private var _8633:Boolean = false;
      
      private var _2348:Number = 2880;
      
      private var maxWidthChanged:Boolean = false;
      
      private var _5955:Number = 0;
      
      private var minWidthChanged:Boolean = false;
      
      private var _2343:Number = 2880;
      
      private var maxHeightChanged:Boolean = false;
      
      private var _5954:Number = 0;
      
      private var minHeightChanged:Boolean = false;
      
      private var _8630:Boolean = true;
      
      private var _title:String = "";
      
      private var titleChanged:Boolean = false;
      
      private var _8641:Boolean = false;
      
      public function Window()
      {
         super();
         super.includeInLayout = false;
      }
      
      public function get maximizable() : Boolean
      {
         return this._maximizable;
      }
      
      public function set maximizable(param1:Boolean) : void
      {
         if(!this._nativeWindow)
         {
            this._maximizable = param1;
         }
      }
      
      public function get minimizable() : Boolean
      {
         return this._minimizable;
      }
      
      public function set minimizable(param1:Boolean) : void
      {
         if(!this._nativeWindow)
         {
            this._minimizable = param1;
         }
      }
      
      public function get resizable() : Boolean
      {
         return this._resizable;
      }
      
      public function set resizable(param1:Boolean) : void
      {
         if(!this._nativeWindow)
         {
            this._resizable = param1;
         }
      }
      
      public function get ownerWindow() : NativeWindow
      {
         return this._8636;
      }
      
      public function set ownerWindow(param1:NativeWindow) : void
      {
         if(!this._nativeWindow)
         {
            this._8636 = param1;
         }
      }
      
      public function get systemChrome() : String
      {
         return this._systemChrome;
      }
      
      public function set systemChrome(param1:String) : void
      {
         if(!this._nativeWindow)
         {
            this._systemChrome = param1;
         }
      }
      
      public function get transparent() : Boolean
      {
         return this._transparent;
      }
      
      public function set transparent(param1:Boolean) : void
      {
         if(!this._nativeWindow)
         {
            this._transparent = param1;
         }
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set type(param1:String) : void
      {
         if(!this._nativeWindow)
         {
            this._type = param1;
         }
      }
      
      protected function _8627() : NativeWindowInitOptions
      {
         var _loc1_:NativeWindowInitOptions = new NativeWindowInitOptions();
         _loc1_.maximizable = this._maximizable;
         _loc1_.minimizable = this._minimizable;
         _loc1_.resizable = this._resizable;
         _loc1_.type = this._type;
         _loc1_.owner = this._8636;
         if(_1288.renderMode)
         {
            _loc1_.renderMode = _1288.renderMode;
         }
         _loc1_.systemChrome = this._systemChrome;
         if(this._systemChrome == NativeWindowSystemChrome.NONE)
         {
            _loc1_.transparent = this._transparent;
         }
         return _loc1_;
      }
      
      public function get nativeWindow() : NativeWindow
      {
         return this._nativeWindow;
      }
      
      public function open(param1:Boolean = true) : void
      {
         var _loc2_:_1220 = null;
         if(!this._nativeWindow)
         {
            this._nativeWindow = new NativeWindow(this._8627());
            _loc2_ = new _1220();
            this.stage.addChild(_loc2_);
            _1558 = _loc2_;
            _loc2_.addElement(this);
            this._nativeWindow.alwaysInFront = this._8633;
         }
         this._8639 = param1;
         this._nativeWindow.addEventListener(Event.ACTIVATE,this._8626,false,0,true);
         this._nativeWindow.addEventListener(Event.DEACTIVATE,this._8625,false,0,true);
         this._nativeWindow.addEventListener(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGING,dispatchEvent);
         this._nativeWindow.addEventListener(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGE,dispatchEvent);
         this._nativeWindow.addEventListener(Event.CLOSING,this._8629);
         this._nativeWindow.addEventListener(Event.CLOSE,this._8631,false,0,true);
         this._nativeWindow.addEventListener(NativeWindowBoundsEvent.MOVING,dispatchEvent);
         this._nativeWindow.addEventListener(NativeWindowBoundsEvent.MOVE,dispatchEvent);
         this._nativeWindow.addEventListener(NativeWindowBoundsEvent.RESIZING,dispatchEvent);
         this._nativeWindow.addEventListener(NativeWindowBoundsEvent.RESIZE,this._8628);
         addEventListener(Event.ENTER_FRAME,this._8632);
         _2570();
         invalidateDisplayList();
         this.minWidthChanged = true;
         this.minHeightChanged = true;
         this.maxWidthChanged = true;
         this.maxHeightChanged = true;
         this.titleChanged = true;
         _6040();
      }
      
      private function _8629(param1:Event) : void
      {
         var _loc2_:Event = new Event(Event.CLOSING,true,true);
         dispatchEvent(_loc2_);
         if(_loc2_.isDefaultPrevented())
         {
            param1.preventDefault();
         }
      }
      
      protected function _8631(param1:Event) : void
      {
         dispatchEvent(new Event(Event.CLOSE));
      }
      
      private function _8632(param1:Event) : void
      {
         if(this._8635 == 2)
         {
            removeEventListener(Event.ENTER_FRAME,this._8632);
            if(Boolean(this._nativeWindow) && !this.closed)
            {
               this._nativeWindow.visible = this._8630;
               if(Boolean(this._nativeWindow.visible) && this._8639)
               {
                  this._nativeWindow.activate();
               }
            }
         }
         ++this._8635;
      }
      
      private function _8626(param1:Event) : void
      {
         dispatchEvent(new Event(Event.ACTIVATE));
         _2570();
      }
      
      private function _8625(param1:Event) : void
      {
         dispatchEvent(new Event(Event.DEACTIVATE));
         _2570();
      }
      
      private function _8628(param1:NativeWindowBoundsEvent) : void
      {
         if(this._7695 || !this.stage)
         {
            return;
         }
         width = this.stage.stageWidth;
         height = this.stage.stageHeight;
         _2449();
         dispatchEvent(param1);
      }
      
      public function close() : void
      {
         var _loc1_:Event = null;
         var _loc2_:_1220 = null;
         if(Boolean(this._nativeWindow) && !this.closed)
         {
            _loc1_ = new Event(Event.CLOSING,false,true);
            this._nativeWindow.dispatchEvent(_loc1_);
            if(!_loc1_.isDefaultPrevented())
            {
               this._8640 = true;
               _loc2_ = _1558 as _1220;
               this.stage.removeChild(_loc2_);
               _1141.ns_egret::_8637(this.stage);
               this._nativeWindow.close();
               this._nativeWindow.removeEventListener(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGING,dispatchEvent);
               this._nativeWindow.removeEventListener(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGE,dispatchEvent);
               this._nativeWindow.removeEventListener(Event.CLOSING,this._8629);
               this._nativeWindow.removeEventListener(NativeWindowBoundsEvent.MOVING,dispatchEvent);
               this._nativeWindow.removeEventListener(NativeWindowBoundsEvent.MOVE,dispatchEvent);
               this._nativeWindow.removeEventListener(NativeWindowBoundsEvent.RESIZING,dispatchEvent);
               this._nativeWindow.removeEventListener(NativeWindowBoundsEvent.RESIZE,this._8628);
               _loc2_.removeElement(this);
               _1558 = null;
            }
         }
      }
      
      public function get closed() : Boolean
      {
         if(Boolean(this.nativeWindow) && Boolean(this.nativeWindow.closed))
         {
            return true;
         }
         return this._8640;
      }
      
      public function get alwaysInFront() : Boolean
      {
         if(Boolean(this._nativeWindow) && !this._nativeWindow.closed)
         {
            return this._nativeWindow.alwaysInFront;
         }
         return this._8633;
      }
      
      public function set alwaysInFront(param1:Boolean) : void
      {
         this._8633 = param1;
         if(Boolean(this._nativeWindow) && !this._nativeWindow.closed)
         {
            this._nativeWindow.alwaysInFront = param1;
         }
      }
      
      override public function get maxWidth() : Number
      {
         if(Boolean(this._nativeWindow) && !this.maxHeightChanged)
         {
            return this._nativeWindow.maxSize.x - this._8638();
         }
         return this._2348;
      }
      
      override public function set maxWidth(param1:Number) : void
      {
         this._2348 = param1;
         this.maxWidthChanged = true;
         _2466();
      }
      
      override public function get minWidth() : Number
      {
         if(Boolean(this._nativeWindow) && !this.minWidthChanged)
         {
            return this._nativeWindow.minSize.x - this._8638();
         }
         return this._5955;
      }
      
      override public function set minWidth(param1:Number) : void
      {
         this._5955 = param1;
         this.minWidthChanged = true;
         _2466();
      }
      
      override public function get maxHeight() : Number
      {
         if(Boolean(this._nativeWindow) && !this.maxHeightChanged)
         {
            return this._nativeWindow.maxSize.y - this._8634();
         }
         return this._2343;
      }
      
      override public function set maxHeight(param1:Number) : void
      {
         this._2343 = param1;
         this.maxHeightChanged = true;
         _2466();
      }
      
      override public function get minHeight() : Number
      {
         if(Boolean(this._nativeWindow) && !this.minHeightChanged)
         {
            return this._nativeWindow.minSize.y - this._8634();
         }
         return this._5954;
      }
      
      override public function set minHeight(param1:Number) : void
      {
         this._5954 = param1;
         this.minHeightChanged = true;
         _2466();
      }
      
      override public function get visible() : Boolean
      {
         if(Boolean(this._nativeWindow) && Boolean(this._nativeWindow.closed))
         {
            return false;
         }
         if(this._nativeWindow)
         {
            return this._nativeWindow.visible;
         }
         return this._8630;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         if(!this._nativeWindow)
         {
            this._8630 = param1;
            _2466();
         }
         else if(!this._nativeWindow.closed)
         {
            this._nativeWindow.visible = param1;
         }
      }
      
      public function get title() : String
      {
         return this._title;
      }
      
      public function set title(param1:String) : void
      {
         this.titleChanged = true;
         this._title = param1;
         _2466();
         invalidateSize();
         invalidateDisplayList();
      }
      
      public function maximize() : void
      {
         var _loc1_:NativeWindowDisplayStateEvent = null;
         if(!this._nativeWindow || !this._nativeWindow.maximizable || Boolean(this._nativeWindow.closed))
         {
            return;
         }
         if(this._nativeWindow.displayState != NativeWindowDisplayState.MAXIMIZED)
         {
            _loc1_ = new NativeWindowDisplayStateEvent(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGING,false,true,this._nativeWindow.displayState,NativeWindowDisplayState.MAXIMIZED);
            this._nativeWindow.dispatchEvent(_loc1_);
            if(!_loc1_.isDefaultPrevented())
            {
               this._8641 = true;
               _2466();
            }
         }
      }
      
      public function minimize() : void
      {
         var _loc1_:NativeWindowDisplayStateEvent = null;
         if(!this.minimizable)
         {
            return;
         }
         if(Boolean(this._nativeWindow) && !this._nativeWindow.closed)
         {
            _loc1_ = new NativeWindowDisplayStateEvent(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGING,false,true,this._nativeWindow.displayState,NativeWindowDisplayState.MINIMIZED);
            this._nativeWindow.dispatchEvent(_loc1_);
            if(!_loc1_.isDefaultPrevented())
            {
               this._nativeWindow.minimize();
            }
         }
      }
      
      public function restore() : void
      {
         var _loc1_:NativeWindowDisplayStateEvent = null;
         if(Boolean(this._nativeWindow) && !this._nativeWindow.closed)
         {
            if(this._nativeWindow.displayState == NativeWindowDisplayState.MAXIMIZED)
            {
               _loc1_ = new NativeWindowDisplayStateEvent(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGING,false,true,NativeWindowDisplayState.MAXIMIZED,NativeWindowDisplayState.NORMAL);
               this._nativeWindow.dispatchEvent(_loc1_);
               if(!_loc1_.isDefaultPrevented())
               {
                  this._nativeWindow.restore();
               }
            }
            else if(this._nativeWindow.displayState == NativeWindowDisplayState.MINIMIZED)
            {
               _loc1_ = new NativeWindowDisplayStateEvent(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGING,false,true,NativeWindowDisplayState.MINIMIZED,NativeWindowDisplayState.NORMAL);
               this._nativeWindow.dispatchEvent(_loc1_);
               if(!_loc1_.isDefaultPrevented())
               {
                  this._nativeWindow.restore();
               }
            }
         }
      }
      
      public function activate() : void
      {
         if(Boolean(this._nativeWindow) && !this._nativeWindow.closed)
         {
            this._nativeWindow.activate();
            this.visible = true;
         }
      }
      
      public function orderInBackOf(param1:_1135) : Boolean
      {
         if(Boolean(this._nativeWindow) && !this._nativeWindow.closed)
         {
            return this._nativeWindow.orderInBackOf(param1.nativeWindow);
         }
         return false;
      }
      
      public function orderInFrontOf(param1:_1135) : Boolean
      {
         if(Boolean(this._nativeWindow) && !this._nativeWindow.closed)
         {
            return this._nativeWindow.orderInFrontOf(param1.nativeWindow);
         }
         return false;
      }
      
      public function orderToBack() : Boolean
      {
         if(Boolean(this._nativeWindow) && !this._nativeWindow.closed)
         {
            return this._nativeWindow.orderToBack();
         }
         return false;
      }
      
      public function orderToFront() : Boolean
      {
         if(Boolean(this._nativeWindow) && !this._nativeWindow.closed)
         {
            return this._nativeWindow.orderToFront();
         }
         return false;
      }
      
      override protected function _2476() : void
      {
         var _loc1_:Point = null;
         var _loc2_:Point = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         super._2476();
         if(!this._nativeWindow || Boolean(this._nativeWindow.closed))
         {
            return;
         }
         if(this.minWidthChanged || this.minHeightChanged || this.maxWidthChanged || this.maxHeightChanged)
         {
            _loc1_ = this._nativeWindow.minSize;
            _loc2_ = this._nativeWindow.maxSize;
            _loc3_ = this.minWidthChanged ? this._5955 + this._8638() : _loc1_.x;
            _loc4_ = this.minHeightChanged ? this._5954 + this._8634() : _loc1_.y;
            _loc5_ = this.maxWidthChanged ? this._2348 + this._8638() : _loc2_.x;
            _loc6_ = this.maxHeightChanged ? this._2343 + this._8634() : _loc2_.y;
            if(this.minWidthChanged || this.minHeightChanged)
            {
               if(this.maxWidthChanged && _loc3_ > _loc1_.x || this.maxHeightChanged && _loc4_ > _loc1_.y)
               {
                  this._nativeWindow.maxSize = new Point(_loc5_,_loc6_);
               }
               this._nativeWindow.minSize = new Point(_loc3_,_loc4_);
            }
            if(_loc5_ != _loc2_.x || _loc6_ != _loc2_.y)
            {
               this._nativeWindow.maxSize = new Point(_loc5_,_loc6_);
            }
            this.minWidthChanged = false;
            this.minHeightChanged = false;
            this.maxWidthChanged = false;
            this.maxHeightChanged = false;
         }
         if(this.titleChanged)
         {
            this._nativeWindow.title = this._title;
            this.titleChanged = false;
         }
         if(this._8641)
         {
            this._8641 = false;
            this._nativeWindow.maximize();
         }
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         this._7695 = true;
         super._5823(param1,param2);
         if(Boolean(this._nativeWindow) && !this._nativeWindow.closed)
         {
            this._nativeWindow.width = param1 + this._8638();
            this._nativeWindow.height = param2 + this._8634();
         }
         this._7695 = false;
      }
      
      private function _8638() : Number
      {
         return this._nativeWindow.width - this.stage.stageWidth;
      }
      
      private function _8634() : Number
      {
         return this._nativeWindow.height - this.stage.stageHeight;
      }
      
      override protected function _6231() : String
      {
         if(!this._nativeWindow || Boolean(this._nativeWindow.closed))
         {
            return "disabled";
         }
         if(this._nativeWindow.active)
         {
            return enabled ? "normal" : "disabled";
         }
         return enabled ? "normalAndInactive" : "disabledAndInactive";
      }
      
      override public function get stage() : Stage
      {
         if(this._nativeWindow)
         {
            return this._nativeWindow.stage;
         }
         return null;
      }
      
      override public function set includeInLayout(param1:Boolean) : void
      {
      }
      
      override public function _7599(param1:Number, param2:Number) : void
      {
      }
   }
}

