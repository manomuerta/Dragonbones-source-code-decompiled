package _1088
{
   import _1177.UIEvent;
   import egret.core.ns_egret;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   use namespace ns_egret;
   
   public class _1091 extends EventDispatcher
   {
      private var _8408:Boolean;
      
      private var _8409:_1087;
      
      public var _8404:Vector.<DisplayObject>;
      
      private var _8411:DisplayObject;
      
      private var _isOpen:Boolean = false;
      
      private var _8406:Boolean = true;
      
      private var _8399:Number = NaN;
      
      private var _8396:Timer;
      
      public function _1091()
      {
         super();
      }
      
      public function get _8410() : _1087
      {
         return this._8409;
      }
      
      public function set _8410(param1:_1087) : void
      {
         if(this._8409 === param1)
         {
            return;
         }
         this._8400();
         this._8409 = param1;
         this._8405();
      }
      
      private function _8413() : Stage
      {
         return !!this._8409 ? this._8409.stage : null;
      }
      
      public function get _8412() : DisplayObject
      {
         return this._8411;
      }
      
      public function set _8412(param1:DisplayObject) : void
      {
         if(this._8411 === param1)
         {
            return;
         }
         this._8411 = param1;
      }
      
      public function get _1643() : Boolean
      {
         return this._isOpen;
      }
      
      public function get _8407() : Boolean
      {
         return this._8406;
      }
      
      public function set _8407(param1:Boolean) : void
      {
         if(this._8406 == param1)
         {
            return;
         }
         if(this._1643)
         {
            this._8390();
         }
         this._8406 = param1;
         this._8392();
      }
      
      public function get _8402() : Number
      {
         return this._8399;
      }
      
      public function set _8402(param1:Number) : void
      {
         if(this._8399 == param1)
         {
            return;
         }
         this._8400();
         this._8399 = param1;
         this._8405();
      }
      
      private function _8405() : void
      {
         if(this._8410)
         {
            if(isNaN(this._8402))
            {
               this._8410.addEventListener(UIEvent.BUTTON_DOWN,this.ns_egret::_8388);
            }
            else
            {
               this._8410.addEventListener(MouseEvent.ROLL_OVER,this.ns_egret::_8389);
            }
         }
      }
      
      private function _8400() : void
      {
         if(this._8410)
         {
            if(isNaN(this._8402))
            {
               this._8410.removeEventListener(UIEvent.BUTTON_DOWN,this.ns_egret::_8388);
            }
            else
            {
               this._8410.removeEventListener(MouseEvent.ROLL_OVER,this.ns_egret::_8389);
            }
         }
      }
      
      private function _8403() : void
      {
         var _loc1_:Stage = this._8413();
         if(_loc1_)
         {
            if(isNaN(this._8402))
            {
               _loc1_.addEventListener(MouseEvent.MOUSE_DOWN,this.ns_egret::_8394);
               _loc1_.addEventListener(MouseEvent.MOUSE_UP,this.ns_egret::_8385);
            }
            else
            {
               _loc1_.addEventListener(MouseEvent.MOUSE_MOVE,this.ns_egret::_8395);
            }
            this._8392();
            _loc1_.addEventListener(MouseEvent.MOUSE_WHEEL,this._8393);
         }
      }
      
      private function _8398() : void
      {
         var _loc1_:Stage = this._8413();
         if(_loc1_)
         {
            if(isNaN(this._8402))
            {
               _loc1_.removeEventListener(MouseEvent.MOUSE_DOWN,this.ns_egret::_8394);
               _loc1_.removeEventListener(MouseEvent.MOUSE_UP,this.ns_egret::_8385);
            }
            else
            {
               _loc1_.removeEventListener(MouseEvent.MOUSE_MOVE,this.ns_egret::_8395);
               _loc1_.removeEventListener(MouseEvent.MOUSE_UP,this.ns_egret::_8097);
               _loc1_.removeEventListener(Event.MOUSE_LEAVE,this.ns_egret::_8097);
            }
            this._8390();
            _loc1_.removeEventListener(MouseEvent.MOUSE_WHEEL,this._8393);
         }
      }
      
      private function _8392() : void
      {
         var _loc1_:Stage = this._8413();
         if(this._8407 && Boolean(_loc1_))
         {
            _loc1_.addEventListener(Event.RESIZE,this.ns_egret::_8397,false,0,true);
         }
      }
      
      private function _8390() : void
      {
         var _loc1_:Stage = this._8413();
         if(this._8407 && Boolean(_loc1_))
         {
            _loc1_.removeEventListener(Event.RESIZE,this.ns_egret::_8397);
         }
      }
      
      private function _8387(param1:DisplayObject) : Boolean
      {
         var _loc2_:int = 0;
         if(param1)
         {
            if(Boolean(this._8410) && this._8410.contains(param1))
            {
               return true;
            }
            if(this._8404 != null)
            {
               _loc2_ = 0;
               while(_loc2_ < this._8404.length)
               {
                  if(this._8404[_loc2_] == param1 || this._8404[_loc2_] is DisplayObjectContainer && DisplayObjectContainer(this._8404[_loc2_]).contains(param1 as DisplayObject))
                  {
                     return true;
                  }
                  _loc2_++;
               }
            }
            if(this._8412 is DisplayObjectContainer)
            {
               if(DisplayObjectContainer(this._8412).contains(param1))
               {
                  return true;
               }
            }
            else if(param1 == this._8412)
            {
               return true;
            }
         }
         return false;
      }
      
      public function _6629() : void
      {
         this._8401();
      }
      
      private function _8401() : void
      {
         if(!this._1643)
         {
            this._8403();
            this._isOpen = true;
            if(this._8410)
            {
               this._8410.ns_egret::_8383(true);
            }
            dispatchEvent(new UIEvent(UIEvent.OPEN));
         }
      }
      
      public function _7440(param1:Boolean) : void
      {
         var _loc2_:UIEvent = null;
         if(this._1643)
         {
            this._isOpen = false;
            if(this._8410)
            {
               this._8410.ns_egret::_8383(false);
            }
            _loc2_ = new UIEvent(UIEvent.CLOSE,false,true);
            if(!param1)
            {
               _loc2_.preventDefault();
            }
            dispatchEvent(_loc2_);
            this._8398();
         }
      }
      
      ns_egret function _8388(param1:Event) : void
      {
         if(this._1643)
         {
            this._7440(true);
         }
         else
         {
            this._8408 = true;
            this._8401();
         }
      }
      
      ns_egret function _8389(param1:MouseEvent) : void
      {
         if(this._8402 == 0)
         {
            this._8401();
         }
         else
         {
            this._8410.addEventListener(MouseEvent.ROLL_OUT,this._8391);
            this._8396 = new Timer(this._8402,1);
            this._8396.addEventListener(TimerEvent.TIMER_COMPLETE,this._8386);
            this._8396.start();
         }
      }
      
      private function _8391(param1:MouseEvent) : void
      {
         if(Boolean(this._8396) && this._8396.running)
         {
            this._8396.stop();
            this._8396 = null;
         }
         this._8410.removeEventListener(MouseEvent.ROLL_OUT,this._8391);
      }
      
      private function _8386(param1:TimerEvent) : void
      {
         this._8410.removeEventListener(MouseEvent.ROLL_OUT,this._8391);
         this._8396 = null;
         this._8401();
      }
      
      ns_egret function _8394(param1:Event) : void
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:int = 0;
         if(this._8408)
         {
            this._8408 = false;
            return;
         }
         if(!this._8412 || this._8412 && (param1.target == this._8412 || this._8412 is DisplayObjectContainer && !DisplayObjectContainer(this._8412).contains(DisplayObject(param1.target))))
         {
            _loc2_ = param1.target as DisplayObject;
            if(this._8410 && _loc2_ && this._8410.contains(_loc2_))
            {
               return;
            }
            if(this._8404 != null)
            {
               _loc3_ = 0;
               while(_loc3_ < this._8404.length)
               {
                  if(this._8404[_loc3_] == param1.target || this._8404[_loc3_] is DisplayObjectContainer && DisplayObjectContainer(this._8404[_loc3_]).contains(param1.target as DisplayObject))
                  {
                     return;
                  }
                  _loc3_++;
               }
            }
            this._7440(true);
         }
      }
      
      ns_egret function _8395(param1:Event) : void
      {
         var _loc4_:Stage = null;
         var _loc2_:DisplayObject = param1.target as DisplayObject;
         var _loc3_:Boolean = this._8387(_loc2_);
         if(_loc3_)
         {
            return;
         }
         if(param1 is MouseEvent && MouseEvent(param1).buttonDown)
         {
            _loc4_ = this._8413();
            _loc4_.addEventListener(MouseEvent.MOUSE_UP,this.ns_egret::_8097);
            _loc4_.addEventListener(Event.MOUSE_LEAVE,this.ns_egret::_8097);
            return;
         }
         this._7440(true);
      }
      
      ns_egret function _8385(param1:Event) : void
      {
         if(this._8408)
         {
            this._8408 = false;
            return;
         }
      }
      
      ns_egret function _8097(param1:Event) : void
      {
         var _loc4_:Stage = null;
         var _loc2_:DisplayObject = param1.target as DisplayObject;
         var _loc3_:Boolean = this._8387(_loc2_);
         if(_loc3_)
         {
            _loc4_ = this._8413();
            _loc4_.removeEventListener(MouseEvent.MOUSE_UP,this.ns_egret::_8097);
            _loc4_.removeEventListener(Event.MOUSE_LEAVE,this.ns_egret::_8097);
            return;
         }
         this._7440(true);
      }
      
      ns_egret function _8397(param1:Event) : void
      {
         this._7440(true);
      }
      
      private function _8393(param1:MouseEvent) : void
      {
         if(Boolean(this._8412) && !(DisplayObjectContainer(this._8412).contains(DisplayObject(param1.target)) && param1.isDefaultPrevented()))
         {
            this._7440(false);
         }
      }
   }
}

