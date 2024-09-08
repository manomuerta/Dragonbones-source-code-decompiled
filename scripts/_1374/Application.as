package _1374
{
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1045._1105;
   import _1045._1108;
   import _1404._1405;
   import _1467._1469;
   import _1491._1493;
   import egret.core.ns_egret;
   import egret.managers._1198;
   import egret.utils.SystemInfo;
   import egret.utils._1296;
   import egret.utils._1547;
   import egret.utils._99;
   import flash.desktop.NotificationType;
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.display.NativeWindow;
   import flash.display.NativeWindowDisplayState;
   import flash.display.NativeWindowResize;
   import flash.display.Screen;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.NativeWindowDisplayStateEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.system.Capabilities;
   import locales._1555;
   
   use namespace ns_egret;
   
   public class Application extends _1108
   {
      ns_egret static var _9530:Application;
      
      private var appID:String;
      
      private var _9561:Boolean = false;
      
      private var _9538:String = "";
      
      private var _9540:String = "";
      
      public var _2522:Label;
      
      public var _2527:Group;
      
      public var _9567:_1105;
      
      public var _8746:_1105;
      
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
      
      public var _3746:Group;
      
      public var _9547:Group;
      
      ns_egret var _9551:Vector.<Window>;
      
      private var _9560:Window;
      
      private var _9553:Boolean = true;
      
      private var _9564:*;
      
      private var _9549:Boolean = false;
      
      public function Application()
      {
         this.appID = nativeApplication.applicationID;
         this.ns_egret::_9551 = new Vector.<Window>();
         super();
         _1555.init();
         _1405._9558();
         ns_egret::_9530 = this;
         if(SystemInfo.isMacOS)
         {
            this.skinName = _1469;
         }
         else
         {
            this.skinName = _1493;
         }
         this.addEventListener(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGE,this._9535);
         if(!SystemInfo.isMacOS)
         {
            this.addEventListener(Event.ENTER_FRAME,this._9532);
         }
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
      
      override protected function _5996(param1:Event) : void
      {
         var _loc2_:NativeWindow = this.stage.nativeWindow;
         _loc2_.addEventListener(Event.CLOSE,this._9550);
         var _loc3_:Number = _1296.read(this.appID,"windowWidth");
         var _loc4_:Number = _1296.read(this.appID,"windowHeight");
         var _loc5_:Rectangle = new Rectangle();
         if(!isNaN(_loc3_) && !isNaN(_loc4_))
         {
            _loc5_.width = _loc3_;
            _loc5_.height = _loc4_;
         }
         else if(!isNaN(this.width) && !isNaN(this.height))
         {
            _loc5_.width = this.width;
            _loc5_.height = this.height;
         }
         else
         {
            _loc5_.width = Capabilities.screenResolutionX - 400;
            _loc5_.height = Capabilities.screenResolutionY - 200;
         }
         var _loc6_:Number = _1296.read(this.appID,"windowX");
         var _loc7_:Number = _1296.read(this.appID,"windowY");
         if(!isNaN(_loc6_) && !isNaN(_loc7_))
         {
            _loc5_.x = _loc6_;
            _loc5_.y = _loc7_;
         }
         else
         {
            _loc5_.x = Capabilities.screenResolutionX / 2 - _loc5_.width / 2;
            _loc5_.y = Capabilities.screenResolutionY / 2 - _loc5_.height / 2;
         }
         _loc5_ = _1547._9546(_loc5_,new Rectangle(0,0,100,100));
         this.stage.nativeWindow.x = _loc5_.x;
         this.stage.nativeWindow.y = _loc5_.y;
         this.stage.nativeWindow.width = _loc5_.width;
         this.stage.nativeWindow.height = _loc5_.height;
         this.width = _loc5_.width;
         this.height = _loc5_.height;
         this.x = _loc5_.x;
         this.y = _loc5_.y;
         var _loc8_:String = _1296.read(this.appID,"windowDisplayState");
         if(_loc8_ == NativeWindowDisplayState.MAXIMIZED)
         {
            _loc2_.maximize();
         }
         super._5996(param1);
      }
      
      private function _9535(param1:NativeWindowDisplayStateEvent) : void
      {
         var _loc2_:NativeWindow = nativeWindow;
         if(_loc2_.closed)
         {
            return;
         }
         _2570();
         _1296.write(this.appID,"windowDisplayState",param1.afterDisplayState);
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
      
      ns_egret function get openedWindows() : Vector.<Window>
      {
         return this.ns_egret::_9551.concat();
      }
      
      private function _9539() : void
      {
         var _loc3_:Window = null;
         var _loc1_:int = -1;
         var _loc2_:int = int(this.ns_egret::_9551.length - 1);
         while(_loc2_ >= 0)
         {
            if(this.ns_egret::_9551[_loc2_]._2507)
            {
               _loc1_ = _loc2_;
               break;
            }
            _loc2_--;
         }
         this._9560 = _loc1_ == -1 ? null : this.ns_egret::_9551[_loc1_];
         this._8746.visible = Boolean(_loc1_ != -1);
         if(this._9560)
         {
            nativeWindow.addEventListener(Event.ACTIVATE,this._9541);
         }
         else
         {
            nativeWindow.removeEventListener(Event.ACTIVATE,this._9541);
         }
         _loc2_ = int(this.ns_egret::_9551.length - 1);
         while(_loc2_ >= 0)
         {
            _loc3_ = this.ns_egret::_9551[_loc2_];
            if(_loc2_ >= _loc1_)
            {
               _loc3_.ns_egret::_9555 = false;
               _loc3_.nativeWindow.removeEventListener(Event.ACTIVATE,this._9541);
            }
            else
            {
               _loc3_.ns_egret::_9555 = this._8746.visible;
               _loc3_.nativeWindow.addEventListener(Event.ACTIVATE,this._9541);
            }
            _loc2_--;
         }
      }
      
      ns_egret function _9562(param1:Window) : void
      {
         if(this.ns_egret::_9551.indexOf(param1) == -1)
         {
            this.ns_egret::_9551.push(param1);
            this._9539();
         }
      }
      
      ns_egret function _9557(param1:Window) : void
      {
         var _loc2_:int = int(this.ns_egret::_9551.indexOf(param1));
         if(_loc2_ != -1)
         {
            this.ns_egret::_9551.splice(_loc2_,1);
            this._9539();
         }
      }
      
      public function get _3539() : Boolean
      {
         return this._9553;
      }
      
      public function set _3539(param1:Boolean) : void
      {
         this._9553 = param1;
         if(this._2522)
         {
            this._2522.visible = this._9553;
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
            this._2631.addEventListener(MouseEvent.CLICK,this._9534);
            this._2631.enabled = this.stage.nativeWindow.minimizable;
         }
         else if(param2 == this._2630)
         {
            this._2630.addEventListener(MouseEvent.CLICK,this._9531);
            this._2630.enabled = Boolean(this.stage.nativeWindow.maximizable) && Boolean(this.stage.nativeWindow.resizable);
         }
         else if(param2 == this.closeButton)
         {
            this.closeButton.addEventListener(MouseEvent.CLICK,this._2517);
         }
         else if(param2 == this._8746)
         {
            this._8746.visible = Boolean(this._9560);
         }
         else if(param2 == this._9554 || param2 == this._9552 || param2 == this._9543 || param2 == this._9545 || param2 == this._9563 || param2 == this._9559 || param2 == this._9556 || param2 == this._9565)
         {
            (param2 as InteractiveObject).addEventListener(MouseEvent.MOUSE_DOWN,this._9542);
            (param2 as InteractiveObject).addEventListener(MouseEvent.ROLL_OVER,this._9544);
            (param2 as InteractiveObject).addEventListener(MouseEvent.ROLL_OUT,this._9548);
         }
         if(param2 == this._9567)
         {
            this._9567.source = this._9564;
         }
         if(param2 == this._2522)
         {
            this._2522.text = title;
            this._2522.visible = this._9553;
         }
      }
      
      private function _9541(param1:Event) : void
      {
         var _loc2_:int = 0;
         if(this._9560)
         {
            _loc2_ = 0;
            while(_loc2_ < this.ns_egret::openedWindows.length)
            {
               if(!this.ns_egret::openedWindows[_loc2_].closed && this.ns_egret::openedWindows[_loc2_]._2507)
               {
                  this.ns_egret::openedWindows[_loc2_].nativeWindow.orderToFront();
               }
               _loc2_++;
            }
            this._9560.activate();
            if(this._9560.nativeWindow)
            {
               this._9560.nativeWindow.notifyUser(NotificationType.INFORMATIONAL);
            }
            this._9560.ns_egret::_9566();
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
      
      public function set titleIcon(param1:*) : void
      {
         this._9564 = param1;
         if(this._9567)
         {
            this._9567.source = param1;
         }
      }
      
      private function _9544(param1:MouseEvent) : void
      {
         if(!resizable)
         {
            return;
         }
         if(param1.buttonDown)
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
      
      private function _9548(param1:MouseEvent) : void
      {
         if(param1.buttonDown)
         {
            return;
         }
         if(!this._9549)
         {
            _1198.setCursor(_1405.AUTO);
         }
      }
      
      private function _9542(param1:MouseEvent) : void
      {
         if(!this.stage.nativeWindow.resizable)
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
         var sm:DisplayObject;
         var window:NativeWindow;
         var event:Event = param1;
         this._9549 = false;
         mouseChildren = true;
         sm = _1558 as DisplayObject;
         sm.removeEventListener(MouseEvent.MOUSE_UP,this._6869);
         sm.removeEventListener(Event.MOUSE_LEAVE,this._6869);
         sm.removeEventListener(MouseEvent.RIGHT_MOUSE_UP,this._6869);
         _99(function():void
         {
            _1198.setCursor(_1405.AUTO);
         });
         window = nativeWindow;
         if(window.closed)
         {
            return;
         }
         _1296.write(this.appID,"windowX",window.x);
         _1296.write(this.appID,"windowY",window.y);
         _1296.write(this.appID,"windowWidth",window.width);
         _1296.write(this.appID,"windowHeight",window.height);
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
         var _loc3_:NativeWindow = nativeWindow;
         if(_loc3_.closed)
         {
            return;
         }
         _1296.write(this.appID,"windowX",_loc3_.x);
         _1296.write(this.appID,"windowY",_loc3_.y);
      }
      
      private function _9533(param1:MouseEvent) : void
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
      
      private function _9534(param1:MouseEvent) : void
      {
         minimize();
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
      
      private function _2517(param1:Event) : void
      {
         var _loc2_:Event = new Event(Event.CLOSING,false,true);
         if(nativeWindow.dispatchEvent(_loc2_))
         {
            if(Boolean(nativeWindow) && !nativeWindow.closed)
            {
               nativeWindow.close();
            }
         }
      }
      
      protected function _9550(param1:Event) : void
      {
         this.removeEventListener(Event.ENTER_FRAME,this._9532);
      }
   }
}

