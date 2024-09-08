package _1374
{
   import _1045.Button;
   import _1045.Label;
   import _1045.Window;
   import _1045._1105;
   import _1148.Animation;
   import _1148._1150;
   import _1148._1152;
   import _1404._1405;
   import _1467._1469;
   import _1491._1493;
   import egret.core.ns_egret;
   import egret.managers._1198;
   import egret.utils.SystemInfo;
   import egret.utils._1547;
   import egret.utils._99;
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.display.NativeWindow;
   import flash.display.NativeWindowDisplayState;
   import flash.display.NativeWindowResize;
   import flash.display.Screen;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.NativeWindowDisplayStateEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.ui.Keyboard;
   
   use namespace ns_egret;
   
   public class Window extends _1045.Window
   {
      public static var _3526:Object;
      
      private var _stage:Stage;
      
      private var _9831:Object;
      
      private var _9832:Boolean = true;
      
      private var _9538:String = "";
      
      private var _9540:String = "";
      
      private var _8196:Animation;
      
      private var _9829:Boolean = false;
      
      public var _8746:_1105;
      
      public var shadow:_1105;
      
      public var _2522:Label;
      
      public var _9567:_1105;
      
      public var closeButton:Button;
      
      public var _2630:Button;
      
      public var _2631:Button;
      
      public var _2567:InteractiveObject;
      
      public var _9554:InteractiveObject;
      
      public var _9552:InteractiveObject;
      
      public var _9543:InteractiveObject;
      
      public var _9545:InteractiveObject;
      
      public var _9563:InteractiveObject;
      
      public var _9559:InteractiveObject;
      
      public var _9565:InteractiveObject;
      
      public var _9556:InteractiveObject;
      
      private var _9828:Boolean = true;
      
      private var _9564:*;
      
      private var _9549:Boolean = false;
      
      public function Window()
      {
         this._9831 = {
            "rightMouseDown":"mouseDown",
            "rightMouseUp":"mouseUp"
         };
         _1405._9558();
         super();
         if(SystemInfo.isMacOS)
         {
            this.skinName = _1469;
         }
         else
         {
            this.skinName = _1493;
         }
         transparent = true;
         systemChrome = "none";
         this.minimizable = false;
         super.measuredHeight;
         this._2576 = true;
         this.addEventListener(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGE,this._9535);
         this.addEventListener(Event.ADDED_TO_STAGE,this._5996);
         this.addEventListener(Event.ACTIVATE,this._4172);
      }
      
      private function _4172(param1:Event) : void
      {
         this.removeEventListener(Event.ACTIVATE,this._4172);
         this._7290();
      }
      
      protected function _7290() : void
      {
         var _loc1_:Rectangle = null;
         var _loc2_:Point = null;
         var _loc3_:Rectangle = null;
         var _loc4_:Point = null;
         var _loc5_:Screen = null;
         _2449();
         if(Application && Application.ns_egret::_9530 && !Application.ns_egret::_9530.nativeWindow.closed)
         {
            Application.ns_egret::_9530.ns_egret::_9562(this);
            _loc1_ = Application.ns_egret::_9530.nativeWindow.bounds;
         }
         else
         {
            _loc1_ = Screen.mainScreen.bounds;
         }
         if(!nativeWindow.closed)
         {
            nativeWindow.addEventListener(Event.CLOSE,this._9550,false,2048);
            _loc2_ = new Point();
            _loc2_.x = Math.round(_loc1_.x + _loc1_.width * 0.5 - nativeWindow.width * 0.5);
            _loc2_.y = Math.round(_loc1_.y + _loc1_.height * 0.5 - nativeWindow.height * 0.5);
            _loc3_ = new Rectangle(_loc2_.x,_loc2_.y,nativeWindow.width,nativeWindow.height);
            _loc4_ = new Point(_loc2_.x + nativeWindow.width / 2,_loc2_.y + nativeWindow.height / 2);
            _loc5_ = _1547._7289(_loc4_);
            if(!_loc5_)
            {
               _loc5_ = Screen.mainScreen;
            }
            _loc3_ = _1547._7288(_loc3_,new Rectangle(0,0,nativeWindow.width,nativeWindow.height),_loc5_);
            _loc2_.x = _loc3_.x;
            _loc2_.y = _loc3_.y;
            nativeWindow.x = _loc2_.x;
            nativeWindow.y = _loc2_.y;
            if(!SystemInfo.isMacOS)
            {
               this.addEventListener(Event.ENTER_FRAME,this._9532);
            }
         }
      }
      
      private function _5996(param1:Event) : void
      {
         if(this._stage != null)
         {
            this.stage.removeEventListener(MouseEvent.MOUSE_UP,this._9827);
            this.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         }
         this._stage = stage;
         this.stage.addEventListener(MouseEvent.MOUSE_UP,this._9827);
         this.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
      }
      
      override protected function _2438() : void
      {
         super._2438();
      }
      
      private function _9550(param1:Event) : void
      {
         if(Application.ns_egret::_9530)
         {
            Application.ns_egret::_9530.ns_egret::_9557(this);
         }
         this.removeEventListener(Event.ENTER_FRAME,this._9532);
      }
      
      protected function onKeyDown(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ESCAPE)
         {
            close();
         }
      }
      
      public function get _2507() : Boolean
      {
         return this._9832;
      }
      
      public function set _2507(param1:Boolean) : void
      {
         this._9832 = param1;
      }
      
      override public function open(param1:Boolean = true) : void
      {
         super.open(param1);
         this._7290();
      }
      
      protected function _9532(param1:Event) : void
      {
         var _loc2_:Point = null;
         var _loc3_:Screen = null;
         var _loc4_:Rectangle = null;
         if(Boolean(nativeWindow) && Boolean(stage))
         {
            _loc2_ = nativeWindow.globalToScreen(new Point(stage.mouseX,stage.mouseY));
            _loc3_ = _1547._9536(_loc2_);
            if(_loc3_)
            {
               _loc4_ = _loc3_.visibleBounds;
               if(nativeWindow.displayState == NativeWindowDisplayState.NORMAL && (nativeWindow.x + nativeWindow.width == _loc4_.x + _loc4_.width || nativeWindow.x == _loc4_.x) && nativeWindow.y == _loc4_.y && nativeWindow.height == _loc4_.height)
               {
                  this._9540 = "H";
               }
               else if(nativeWindow.displayState == NativeWindowDisplayState.NORMAL && nativeWindow.y == _loc4_.y && nativeWindow.height == _loc4_.height)
               {
                  this._9540 = "V";
               }
               else
               {
                  this._9540 = "";
               }
            }
            if(this._9540 != this._9538)
            {
               if(this._9540 == "H")
               {
                  nativeWindow.x -= 8;
                  nativeWindow.y -= 8;
                  nativeWindow.height += 16;
                  nativeWindow.width += 16;
               }
               else if(this._9540 == "V")
               {
                  nativeWindow.y -= 8;
                  nativeWindow.height += 16;
               }
            }
            this._9538 = this._9540;
         }
      }
      
      override public function activate() : void
      {
         if(Boolean(nativeWindow) && !nativeWindow.closed)
         {
            nativeWindow.activate();
            visible = true;
         }
      }
      
      ns_egret function _9566() : void
      {
         if(!this.shadow)
         {
            return;
         }
         if(!this._8196)
         {
            this._8196 = new Animation(this._8155);
            this._8196.repeatCount = 4;
         }
         if(this._8196.isPlaying)
         {
            this._8196.stop();
         }
         this._8196.duration = 200;
         this._8196.motionPaths = new <_1150>[new _1152("alpha",0,1)];
         this._8196.play();
      }
      
      private function _8155(param1:Animation) : void
      {
         this.shadow.alpha = param1._2584["alpha"];
      }
      
      ns_egret function get _9555() : Boolean
      {
         return this._9829;
      }
      
      ns_egret function set _9555(param1:Boolean) : void
      {
         if(this._9829 == param1)
         {
            return;
         }
         this._9829 = param1;
         if(this._8746)
         {
            this._8746.visible = param1;
         }
      }
      
      private function _9535(param1:NativeWindowDisplayStateEvent) : void
      {
         var _loc2_:NativeWindow = nativeWindow;
         if(_loc2_.closed)
         {
            return;
         }
         _2570();
      }
      
      override protected function _6231() : String
      {
         if(nativeWindow.closed)
         {
            return "disabled";
         }
         if(nativeWindow.displayState == NativeWindowDisplayState.MINIMIZED)
         {
            return "minimized";
         }
         if(nativeWindow.active)
         {
            return nativeWindow.displayState == NativeWindowDisplayState.MAXIMIZED ? "maximized" : "normal";
         }
         return nativeWindow.displayState == NativeWindowDisplayState.MAXIMIZED ? "maximizedAndInactive" : "normalAndInactive";
      }
      
      public function get _9830() : Boolean
      {
         return this._9828;
      }
      
      public function set _9830(param1:Boolean) : void
      {
         if(this._9828 == param1)
         {
            return;
         }
         this._9828 = param1;
         if(this._2631)
         {
            this._2631.visible = this._9828;
         }
         if(this._2630)
         {
            this._2630.visible = this._9828;
         }
      }
      
      override public function set maximizable(param1:Boolean) : void
      {
         super.maximizable = param1;
         if(this._2630)
         {
            this._2630.enabled = param1 && resizable;
         }
      }
      
      override public function set minimizable(param1:Boolean) : void
      {
         super.minimizable = param1;
         if(this._2631)
         {
            this._2631.enabled = param1;
         }
      }
      
      override public function set resizable(param1:Boolean) : void
      {
         super.resizable = param1;
         if(this._2630)
         {
            this._2630.enabled = param1 && maximizable;
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this._2567 || param2 == this._2522 || param2 == this._9567)
         {
            param2.addEventListener(MouseEvent.MOUSE_DOWN,this._9537);
            param2.doubleClickEnabled = true;
            param2.addEventListener(MouseEvent.DOUBLE_CLICK,this._9533);
         }
         else if(param2 == this._2631)
         {
            this._2631.enabled = minimizable && this._9828;
            this._2631.visible = this._9828;
            this._2631.addEventListener(MouseEvent.CLICK,this._9534);
         }
         else if(param2 == this._2630)
         {
            this._2630.enabled = maximizable && resizable && this._9828;
            this._2630.visible = this._9828;
            this._2630.addEventListener(MouseEvent.CLICK,this._9531);
         }
         else if(param2 == this.closeButton)
         {
            this.closeButton.addEventListener(MouseEvent.CLICK,this._2517);
         }
         else if(param2 == this._8746)
         {
            this._8746.visible = this._9829;
         }
         else if(param2 == this._9554 || param2 == this._9552 || param2 == this._9543 || param2 == this._9545 || param2 == this._9563 || param2 == this._9559 || param2 == this._9556 || param2 == this._9565)
         {
            (param2 as InteractiveObject).addEventListener(MouseEvent.MOUSE_DOWN,this._9542);
            (param2 as InteractiveObject).addEventListener(MouseEvent.ROLL_OVER,this._9544);
            (param2 as InteractiveObject).addEventListener(MouseEvent.ROLL_OUT,this._9548);
         }
         if(param2 == this._9567)
         {
            this._9567.source = !!this._9564 ? this._9564 : _3526;
         }
         if(param2 == this._2522)
         {
            this._2522.text = title;
         }
      }
      
      private function _9544(param1:MouseEvent) : void
      {
         if(!resizable || param1.buttonDown)
         {
            return;
         }
         if(this._9549)
         {
            return;
         }
         switch(param1.currentTarget)
         {
            case this._9554:
            case this._9543:
               _1198.setCursor(_1405.DESKTOP_RESIZE_NWSE);
               break;
            case this._9552:
            case this._9545:
               _1198.setCursor(_1405.DESKTOP_RESIZE_NESW);
               break;
            case this._9563:
            case this._9559:
               _1198.setCursor(_1405.DESKTOP_RESIZE_EW);
               break;
            case this._9565:
            case this._9556:
               _1198.setCursor(_1405.DESKTOP_RESIZE_NS);
         }
      }
      
      private function _9827(param1:MouseEvent) : void
      {
         if(_1198.cursor == _1405.DESKTOP_RESIZE_EW || _1198.cursor == _1405.DESKTOP_RESIZE_NESW || _1198.cursor == _1405.DESKTOP_RESIZE_NWSE || _1198.cursor == _1405.DESKTOP_RESIZE_NS)
         {
            _1198._1602(_1198.cursor);
         }
      }
      
      private function _9548(param1:MouseEvent) : void
      {
         if(!resizable || param1.buttonDown)
         {
            return;
         }
         if(!this._9549)
         {
            _1198.setCursor(_1405.AUTO);
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this._2567 || param2 == this._2522 || param2 == this._9567)
         {
            param2.removeEventListener(MouseEvent.MOUSE_DOWN,this._9537);
            param2.removeEventListener(MouseEvent.DOUBLE_CLICK,this._9533);
         }
         else if(param2 == this._2631)
         {
            this._2631.removeEventListener(MouseEvent.CLICK,this._9534);
         }
         else if(param2 == this._2630)
         {
            this._2630.removeEventListener(MouseEvent.CLICK,this._9531);
         }
         else if(param2 == this.closeButton)
         {
            this.closeButton.removeEventListener(MouseEvent.CLICK,this._2517);
         }
         else if(param2 == this._9554 || param2 == this._9552 || param2 == this._9543 || param2 == this._9545 || param2 == this._9563 || param2 == this._9559 || param2 == this._9556 || param2 == this._9565)
         {
            (param2 as InteractiveObject).removeEventListener(MouseEvent.MOUSE_DOWN,this._9542);
         }
      }
      
      override public function set title(param1:String) : void
      {
         super.title = param1;
         if(this._2522)
         {
            this._2522.text = param1;
         }
      }
      
      public function set titleIcon(param1:Object) : void
      {
         this._9564 = param1;
         if(this._9567)
         {
            this._9567.source = param1;
         }
      }
      
      private function _9542(param1:MouseEvent) : void
      {
         if(!resizable)
         {
            return;
         }
         this._9549 = true;
         mouseChildren = false;
         var _loc2_:DisplayObject = _1558 as DisplayObject;
         _loc2_.addEventListener(MouseEvent.MOUSE_UP,this._6869);
         _loc2_.addEventListener(Event.MOUSE_LEAVE,this._6869);
         _loc2_.addEventListener(MouseEvent.RIGHT_MOUSE_UP,this._6869);
         switch(param1.currentTarget)
         {
            case this._9554:
               nativeWindow.startResize(NativeWindowResize.TOP_LEFT);
               break;
            case this._9552:
               nativeWindow.startResize(NativeWindowResize.TOP_RIGHT);
               break;
            case this._9543:
               nativeWindow.startResize(NativeWindowResize.BOTTOM_RIGHT);
               break;
            case this._9545:
               nativeWindow.startResize(NativeWindowResize.BOTTOM_LEFT);
               break;
            case this._9563:
               nativeWindow.startResize(NativeWindowResize.LEFT);
               break;
            case this._9559:
               nativeWindow.startResize(NativeWindowResize.RIGHT);
               break;
            case this._9565:
               nativeWindow.startResize(NativeWindowResize.TOP);
               break;
            case this._9556:
               nativeWindow.startResize(NativeWindowResize.BOTTOM);
         }
      }
      
      private function _6869(param1:Event) : void
      {
         mouseChildren = true;
         this._9549 = false;
         var _loc2_:DisplayObject = _1558 as DisplayObject;
         _loc2_.removeEventListener(MouseEvent.MOUSE_UP,this._6869);
         _loc2_.removeEventListener(Event.MOUSE_LEAVE,this._6869);
         _loc2_.removeEventListener(MouseEvent.RIGHT_MOUSE_UP,this._6869);
      }
      
      private function _9537(param1:MouseEvent) : void
      {
         var _loc2_:DisplayObject = _1558 as DisplayObject;
         if(nativeWindow.displayState == NativeWindowDisplayState.MAXIMIZED)
         {
            if(SystemInfo.isMacOS)
            {
               nativeWindow.startMove();
            }
            else
            {
               _loc2_.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            }
         }
         else
         {
            nativeWindow.startMove();
         }
         _loc2_.addEventListener(MouseEvent.MOUSE_UP,this._4083);
         _loc2_.addEventListener(Event.MOUSE_LEAVE,this._4083);
         _loc2_.addEventListener(MouseEvent.RIGHT_MOUSE_UP,this._4083);
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         var globalPos:Point = null;
         var left:Boolean = false;
         var offsetX:int = 0;
         var offsetY:int = 0;
         var event:MouseEvent = param1;
         var sm:DisplayObject = _1558 as DisplayObject;
         sm.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         globalPos = nativeWindow.globalToScreen(new Point(nativeWindow.stage.mouseX,nativeWindow.stage.mouseY));
         left = nativeWindow.stage.mouseX < nativeWindow.stage.stageWidth / 2;
         offsetX = int(nativeWindow.stage.mouseX);
         offsetY = int(nativeWindow.stage.mouseY);
         if(!left)
         {
            offsetX = nativeWindow.stage.stageWidth - offsetX;
         }
         restore();
         _99(function():void
         {
            nativeWindow.y = globalPos.y - offsetY;
            if(left)
            {
               nativeWindow.x = globalPos.x - offsetX;
            }
            else
            {
               nativeWindow.x = globalPos.x + offsetX - nativeWindow.width;
            }
            nativeWindow.startMove();
         });
      }
      
      private function _4083(param1:Event) : void
      {
         var _loc2_:DisplayObject = _1558 as DisplayObject;
         _loc2_.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         _loc2_.removeEventListener(MouseEvent.MOUSE_UP,this._4083);
         _loc2_.removeEventListener(Event.MOUSE_LEAVE,this._4083);
         _loc2_.removeEventListener(MouseEvent.RIGHT_MOUSE_UP,this._4083);
      }
      
      private function _9533(param1:MouseEvent) : void
      {
         if(maximizable && resizable)
         {
            if(nativeWindow.displayState == NativeWindowDisplayState.MAXIMIZED)
            {
               restore();
            }
            else
            {
               maximize();
            }
         }
      }
      
      private function _9534(param1:MouseEvent) : void
      {
         if(minimizable)
         {
            minimize();
         }
      }
      
      private function _9531(param1:MouseEvent) : void
      {
         if(maximizable && resizable)
         {
            if(nativeWindow.displayState == NativeWindowDisplayState.MAXIMIZED)
            {
               restore();
            }
            else
            {
               maximize();
            }
         }
      }
      
      protected function _2517(param1:MouseEvent = null) : void
      {
         close();
      }
   }
}

