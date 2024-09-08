package _1045
{
   import _1177.ResizeEvent;
   import egret.core._1135;
   import flash.desktop.NativeApplication;
   import flash.display.NativeWindow;
   import flash.display.NativeWindowDisplayState;
   import flash.display.NativeWindowSystemChrome;
   import flash.display.NativeWindowType;
   import flash.events.Event;
   import flash.events.NativeWindowBoundsEvent;
   import flash.events.NativeWindowDisplayStateEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class _1108 extends Application implements _1135
   {
      private var _nativeWindow:NativeWindow;
      
      private var _bounds:Rectangle;
      
      private var _8643:Boolean = false;
      
      private var _2348:Number = 2880;
      
      private var maxWidthChanged:Boolean = false;
      
      private var _5955:Number = 0;
      
      private var minWidthChanged:Boolean = false;
      
      private var _2343:Number = 2880;
      
      private var maxHeightChanged:Boolean = false;
      
      private var _5954:Number = 0;
      
      private var minHeightChanged:Boolean = false;
      
      private var _8630:Boolean = true;
      
      private var _8633:Boolean = false;
      
      private var _systemChrome:String = "standard";
      
      private var _title:String = "";
      
      private var titleChanged:Boolean = false;
      
      private var _8641:Boolean = false;
      
      public function _1108()
      {
         this._bounds = new Rectangle(NaN,NaN,NaN,NaN);
         super();
         this.addEventListener(Event.ADDED_TO_STAGE,this._5996);
      }
      
      protected function _5996(param1:Event) : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this._5996);
         this._nativeWindow = this.stage.nativeWindow;
         this._systemChrome = this._nativeWindow.systemChrome;
         this._8643 = true;
         this._nativeWindow.addEventListener(Event.ACTIVATE,this._8626,false,0,true);
         this._nativeWindow.addEventListener(Event.DEACTIVATE,this._8625,false,0,true);
         this._nativeWindow.addEventListener(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGING,dispatchEvent);
         this._nativeWindow.addEventListener(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGE,dispatchEvent);
         this._nativeWindow.addEventListener(Event.CLOSING,this._8629);
         this._nativeWindow.addEventListener(Event.CLOSE,this._8631,false,0,true);
         this._nativeWindow.addEventListener(NativeWindowBoundsEvent.MOVING,dispatchEvent);
         this._nativeWindow.addEventListener(NativeWindowBoundsEvent.MOVE,dispatchEvent);
         this._nativeWindow.addEventListener(NativeWindowBoundsEvent.RESIZING,dispatchEvent);
         this._nativeWindow.addEventListener(NativeWindowBoundsEvent.RESIZE,this._8642);
         _2466();
         invalidateSize();
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
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:NativeWindow = null;
         if(this.nativeApplication.autoExit)
         {
            _loc2_ = this.nativeApplication.openedWindows;
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               _loc4_ = _loc2_[_loc3_];
               _loc4_.close();
               _loc3_++;
            }
         }
         dispatchEvent(new Event(Event.CLOSE));
      }
      
      override public function get width() : Number
      {
         return this._bounds.width;
      }
      
      override public function set width(param1:Number) : void
      {
         if(param1 < this.minWidth)
         {
            param1 = this.minWidth;
         }
         else if(param1 > this.maxWidth)
         {
            param1 = this.maxWidth;
         }
         this._bounds.width = param1;
         this._8643 = true;
         _2466();
         invalidateSize();
         dispatchEvent(new Event("widthChanged"));
      }
      
      override public function get maxWidth() : Number
      {
         var _loc1_:Number = NaN;
         if(Boolean(this.nativeWindow) && !this.maxWidthChanged)
         {
            _loc1_ = 0;
            try
            {
               _loc1_ = this.nativeWindow.maxSize.x - this._8638();
            }
            catch(e:*)
            {
            }
            return _loc1_;
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
         var _loc1_:Number = NaN;
         if(Boolean(this.nativeWindow) && !this.minWidthChanged)
         {
            _loc1_ = 0;
            try
            {
               _loc1_ = this.nativeWindow.minSize.x - this._8638();
            }
            catch(e:*)
            {
            }
            return _loc1_;
         }
         return this._5955;
      }
      
      override public function set minWidth(param1:Number) : void
      {
         this._5955 = param1;
         this.minWidthChanged = true;
         _2466();
      }
      
      override public function get height() : Number
      {
         return this._bounds.height;
      }
      
      override public function set height(param1:Number) : void
      {
         if(param1 < this.minHeight)
         {
            param1 = this.minHeight;
         }
         else if(param1 > this.maxHeight)
         {
            param1 = this.maxHeight;
         }
         this._bounds.height = param1;
         this._8643 = true;
         _2466();
         invalidateSize();
         dispatchEvent(new Event("heightChanged"));
      }
      
      override public function get maxHeight() : Number
      {
         var _loc1_:Number = NaN;
         if(Boolean(this.nativeWindow) && !this.maxHeightChanged)
         {
            _loc1_ = 0;
            try
            {
               _loc1_ = this.nativeWindow.maxSize.y - this._8634();
            }
            catch(e:*)
            {
            }
            return _loc1_;
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
         var _loc1_:Number = NaN;
         if(Boolean(this.nativeWindow) && !this.minHeightChanged)
         {
            _loc1_ = 0;
            try
            {
               _loc1_ = this.nativeWindow.minSize.y - this._8634();
            }
            catch(e:*)
            {
            }
            return _loc1_;
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
         if(Boolean(this.nativeWindow) && Boolean(this.nativeWindow.closed))
         {
            return false;
         }
         if(this.nativeWindow)
         {
            return this.nativeWindow.visible;
         }
         return this._8630;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         if(!this.nativeWindow)
         {
            this._8630 = param1;
            _2466();
         }
         else if(!this.nativeWindow.closed)
         {
            this.nativeWindow.visible = param1;
         }
      }
      
      public function get applicationID() : String
      {
         return this.nativeApplication.applicationID;
      }
      
      public function get nativeApplication() : NativeApplication
      {
         return NativeApplication.nativeApplication;
      }
      
      public function get alwaysInFront() : Boolean
      {
         if(Boolean(this.nativeWindow) && !this.nativeWindow.closed)
         {
            return this.nativeWindow.alwaysInFront;
         }
         return this._8633;
      }
      
      public function set alwaysInFront(param1:Boolean) : void
      {
         this._8633 = param1;
         if(Boolean(this.nativeWindow) && !this.nativeWindow.closed)
         {
            this.nativeWindow.alwaysInFront = param1;
         }
      }
      
      public function get autoExit() : Boolean
      {
         return this.nativeApplication.autoExit;
      }
      
      public function set autoExit(param1:Boolean) : void
      {
         this.nativeApplication.autoExit = param1;
      }
      
      protected function get bounds() : Rectangle
      {
         return this.nativeWindow.bounds;
      }
      
      protected function set bounds(param1:Rectangle) : void
      {
         this.nativeWindow.bounds = param1;
         this._8643 = true;
         _2466();
         invalidateSize();
      }
      
      public function get closed() : Boolean
      {
         return this.nativeWindow.closed;
      }
      
      public function get maximizable() : Boolean
      {
         if(!this.nativeWindow.closed)
         {
            return this.nativeWindow.maximizable;
         }
         return false;
      }
      
      public function get minimizable() : Boolean
      {
         if(!this.nativeWindow.closed)
         {
            return this.nativeWindow.minimizable;
         }
         return false;
      }
      
      public function get nativeWindow() : NativeWindow
      {
         if(_1558 != null && _1558.stage != null)
         {
            return _1558.stage.nativeWindow;
         }
         return this._nativeWindow;
      }
      
      public function get resizable() : Boolean
      {
         if(this.nativeWindow.closed)
         {
            return false;
         }
         return this.nativeWindow.resizable;
      }
      
      public function get systemChrome() : String
      {
         return this._systemChrome;
      }
      
      public function get title() : String
      {
         if(this.titleChanged || !this.nativeWindow)
         {
            return this._title;
         }
         return this.nativeWindow.title;
      }
      
      public function set title(param1:String) : void
      {
         this.titleChanged = true;
         this._title = param1;
         _2466();
         invalidateSize();
         invalidateDisplayList();
         dispatchEvent(new Event("titleChanged"));
      }
      
      public function get transparent() : Boolean
      {
         if(this.nativeWindow.closed)
         {
            return false;
         }
         return this.nativeWindow.transparent;
      }
      
      public function get type() : String
      {
         return NativeWindowType.NORMAL;
      }
      
      public function move(param1:Number, param2:Number) : void
      {
         var _loc3_:Rectangle = null;
         if(Boolean(this.nativeWindow) && !this.nativeWindow.closed)
         {
            _loc3_ = this.nativeWindow.bounds;
            _loc3_.x = param1;
            _loc3_.y = param2;
            this.nativeWindow.bounds = _loc3_;
         }
      }
      
      public function activate() : void
      {
         if(!this.nativeWindow.closed)
         {
            this.nativeWindow.activate();
            this.visible = true;
         }
      }
      
      public function close() : void
      {
         var _loc1_:Event = null;
         if(Boolean(this.nativeWindow) && !this.nativeWindow.closed)
         {
            _loc1_ = new Event("closing",false,true);
            stage.nativeWindow.dispatchEvent(_loc1_);
            if(!_loc1_.isDefaultPrevented())
            {
               stage.nativeWindow.close();
            }
         }
      }
      
      public function exit() : void
      {
         this.nativeApplication.exit();
      }
      
      public function maximize() : void
      {
         var _loc1_:NativeWindowDisplayStateEvent = null;
         if(!this.nativeWindow || !this.nativeWindow.maximizable || Boolean(this.nativeWindow.closed))
         {
            return;
         }
         if(stage.nativeWindow.displayState != NativeWindowDisplayState.MAXIMIZED)
         {
            _loc1_ = new NativeWindowDisplayStateEvent(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGING,false,true,stage.nativeWindow.displayState,NativeWindowDisplayState.MAXIMIZED);
            stage.nativeWindow.dispatchEvent(_loc1_);
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
         if(!this.nativeWindow.closed)
         {
            _loc1_ = new NativeWindowDisplayStateEvent(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGING,false,true,this.nativeWindow.displayState,NativeWindowDisplayState.MINIMIZED);
            stage.nativeWindow.dispatchEvent(_loc1_);
            if(!_loc1_.isDefaultPrevented())
            {
               stage.nativeWindow.minimize();
            }
         }
      }
      
      public function restore() : void
      {
         var _loc1_:NativeWindowDisplayStateEvent = null;
         if(!this.nativeWindow.closed)
         {
            if(stage.nativeWindow.displayState == NativeWindowDisplayState.MAXIMIZED)
            {
               _loc1_ = new NativeWindowDisplayStateEvent(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGING,false,true,NativeWindowDisplayState.MAXIMIZED,NativeWindowDisplayState.NORMAL);
               stage.nativeWindow.dispatchEvent(_loc1_);
               if(!_loc1_.isDefaultPrevented())
               {
                  this.nativeWindow.restore();
               }
            }
            else if(stage.nativeWindow.displayState == NativeWindowDisplayState.MINIMIZED)
            {
               _loc1_ = new NativeWindowDisplayStateEvent(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGING,false,true,NativeWindowDisplayState.MINIMIZED,NativeWindowDisplayState.NORMAL);
               stage.nativeWindow.dispatchEvent(_loc1_);
               if(!_loc1_.isDefaultPrevented())
               {
                  this.nativeWindow.restore();
               }
            }
         }
      }
      
      public function orderInBackOf(param1:_1135) : Boolean
      {
         if(Boolean(this.nativeWindow) && !this.nativeWindow.closed)
         {
            return this.nativeWindow.orderInBackOf(param1.nativeWindow);
         }
         return false;
      }
      
      public function orderInFrontOf(param1:_1135) : Boolean
      {
         if(Boolean(this.nativeWindow) && !this.nativeWindow.closed)
         {
            return this.nativeWindow.orderInFrontOf(param1.nativeWindow);
         }
         return false;
      }
      
      public function orderToBack() : Boolean
      {
         if(Boolean(this.nativeWindow) && !this.nativeWindow.closed)
         {
            return this.nativeWindow.orderToBack();
         }
         return false;
      }
      
      public function orderToFront() : Boolean
      {
         if(Boolean(this.nativeWindow) && !this.nativeWindow.closed)
         {
            return this.nativeWindow.orderToFront();
         }
         return false;
      }
      
      override protected function _6231() : String
      {
         if(this.nativeWindow.closed)
         {
            return "disabled";
         }
         if(this.nativeWindow.active)
         {
            return enabled ? "normal" : "disabled";
         }
         return enabled ? "normalAndInactive" : "disabledAndInactive";
      }
      
      private function _8642(param1:NativeWindowBoundsEvent) : void
      {
         if(stage == null)
         {
            return;
         }
         invalidateDisplayList();
         var _loc2_:* = this.bounds.width != stage.stageWidth;
         var _loc3_:* = this.bounds.height != stage.stageHeight;
         this.bounds.x = stage.x;
         this.bounds.y = stage.y;
         this.bounds.width = stage.stageWidth;
         this.bounds.height = stage.stageHeight;
         _2449();
         dispatchEvent(new ResizeEvent(ResizeEvent.UI_RESIZE));
         if(_loc2_)
         {
            dispatchEvent(new Event("widthChanged"));
         }
         if(_loc3_)
         {
            dispatchEvent(new Event("heightChanged"));
         }
      }
      
      override protected function _2476() : void
      {
         var _loc1_:Point = null;
         var _loc2_:Point = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         super._2476();
         if(this.nativeWindow == null)
         {
            return;
         }
         if(this.minWidthChanged || this.minHeightChanged || this.maxWidthChanged || this.maxHeightChanged)
         {
            _loc1_ = this.nativeWindow.minSize;
            _loc2_ = this.nativeWindow.maxSize;
            _loc3_ = this.minWidthChanged ? this._5955 + this._8638() : _loc1_.x;
            _loc4_ = this.minHeightChanged ? this._5954 + this._8634() : _loc1_.y;
            _loc5_ = this.maxWidthChanged ? this._2348 + this._8638() : _loc2_.x;
            _loc6_ = this.maxHeightChanged ? this._2343 + this._8634() : _loc2_.y;
            if(this.minWidthChanged || this.minHeightChanged)
            {
               if(this.maxWidthChanged && _loc3_ > _loc1_.x || this.maxHeightChanged && _loc4_ > _loc1_.y)
               {
                  this.nativeWindow.maxSize = new Point(_loc5_,_loc6_);
               }
               this.nativeWindow.minSize = new Point(_loc3_,_loc4_);
            }
            if(_loc5_ != _loc2_.x || _loc6_ != _loc2_.y)
            {
               this.nativeWindow.maxSize = new Point(_loc5_,_loc6_);
            }
         }
         if(this.minWidthChanged || this.minHeightChanged)
         {
            if(this.minWidthChanged)
            {
               this.minWidthChanged = false;
               if(this.width < this.minWidth)
               {
                  this.width = this.minWidth;
               }
               dispatchEvent(new Event("minWidthChanged"));
            }
            if(this.minHeightChanged)
            {
               this.minHeightChanged = false;
               if(this.height < this.minHeight)
               {
                  this.height = this.minHeight;
               }
               dispatchEvent(new Event("minHeightChanged"));
            }
         }
         if(this.maxWidthChanged || this.maxHeightChanged)
         {
            if(this.maxWidthChanged)
            {
               this.maxWidthChanged = false;
               if(this.width > this.maxWidth)
               {
                  this.width = this.maxWidth;
               }
               dispatchEvent(new Event("maxWidthChanged"));
            }
            if(this.maxHeightChanged)
            {
               this.maxHeightChanged = false;
               if(this.height > this.maxHeight)
               {
                  this.height = this.maxHeight;
               }
               dispatchEvent(new Event("maxHeightChanged"));
            }
         }
         if(this._8643)
         {
            if(this._bounds.height == 0 && this.nativeWindow.displayState != NativeWindowDisplayState.MINIMIZED && this.systemChrome == NativeWindowSystemChrome.STANDARD)
            {
               this.nativeWindow.height = this._8634() + this._bounds.height;
            }
            setActualSize(this._bounds.width,this._bounds.height);
            _loc7_ = this._bounds.width;
            _loc8_ = this._bounds.height;
            _1558.stage.stageWidth = _loc7_;
            _1558.stage.stageHeight = _loc8_;
            this._8643 = false;
         }
         if(this.titleChanged)
         {
            if(!this.nativeWindow.closed)
            {
               _1558.stage.nativeWindow.title = this._title;
            }
            this.titleChanged = false;
         }
         if(this._8641)
         {
            this._8641 = false;
            if(!this.nativeWindow.closed)
            {
               this.nativeWindow.maximize();
            }
         }
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
      
      private function _8638() : Number
      {
         return 0;
      }
      
      private function _8634() : Number
      {
         return 0;
      }
   }
}

