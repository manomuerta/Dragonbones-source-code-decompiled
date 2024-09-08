package _1088
{
   import _1045.Button;
   import _1148.Animation;
   import _1148._1150;
   import _1148._1152;
   import _1155.Linear;
   import _1155._1158;
   import _1155._1159;
   import _1177.ResizeEvent;
   import _1177.UIEvent;
   import _1177._1181;
   import egret.core._1131;
   import egret.core.ns_egret;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   use namespace ns_egret;
   
   public class _1096 extends _1103
   {
      ns_egret static var _8046:Point = new Point();
      
      private static var _8479:_1158 = new Linear();
      
      private static var _8465:_1158 = new Linear(0.1);
      
      private static var _8459:_1158 = new _1159(0);
      
      public var _8471:Button;
      
      public var _8472:Button;
      
      private var _8193:Animation = null;
      
      ns_egret var _8039:Boolean;
      
      private var _8478:Boolean;
      
      private var _8480:Boolean;
      
      private var _8481:Boolean;
      
      private var _8477:Boolean;
      
      private var _8468:Boolean;
      
      private var _8466:Timer;
      
      private var _8476:Point;
      
      private var _8475:Boolean = false;
      
      private var _8482:Number = 20;
      
      private var _8470:Boolean = false;
      
      private var _8467:Boolean = true;
      
      private var _8373:Number = 35;
      
      private var _8469:Boolean = false;
      
      private var _8377:Number = 500;
      
      private var _8464:Boolean = true;
      
      private var _8195:_1131;
      
      public function _1096()
      {
         this._8476 = new Point();
         super();
      }
      
      private function get _8196() : Animation
      {
         if(this._8193)
         {
            return this._8193;
         }
         this._8193 = new Animation(this._8155);
         this._8193.endFunction = this._8158;
         return this._8193;
      }
      
      override public function set minimum(param1:Number) : void
      {
         if(param1 == super.minimum)
         {
            return;
         }
         super.minimum = param1;
         _2570();
      }
      
      override public function set maximum(param1:Number) : void
      {
         if(param1 == super.maximum)
         {
            return;
         }
         super.maximum = param1;
         _2570();
      }
      
      override public function set _8236(param1:Number) : void
      {
         super._8236 = param1;
         this._8470 = true;
      }
      
      public function get pageSize() : Number
      {
         return this._8482;
      }
      
      public function set pageSize(param1:Number) : void
      {
         if(param1 == this._8482)
         {
            return;
         }
         this._8482 = param1;
         this._8470 = true;
         _2466();
         invalidateDisplayList();
      }
      
      public function get _8473() : Boolean
      {
         return this._8467;
      }
      
      public function set _8473(param1:Boolean) : void
      {
         this._8467 = param1;
      }
      
      public function get _8374() : Number
      {
         return this._8373;
      }
      
      public function set _8374(param1:Number) : void
      {
         this._8373 = param1;
      }
      
      public function get _8043() : Boolean
      {
         return this._8469;
      }
      
      public function set _8043(param1:Boolean) : void
      {
         if(this._8469 == param1)
         {
            return;
         }
         this._8469 = param1;
         if(this._8469 && Boolean(_2557))
         {
            _2557.width = NaN;
            _2557.height = NaN;
            _2557.invalidateDisplayList();
         }
         invalidateDisplayList();
      }
      
      public function get repeatDelay() : Number
      {
         return this._8377;
      }
      
      public function set repeatDelay(param1:Number) : void
      {
         this._8377 = param1;
      }
      
      public function get _8038() : Boolean
      {
         return this._8464;
      }
      
      public function set _8038(param1:Boolean) : void
      {
         if(this._8464 == param1)
         {
            return;
         }
         this._8464 = param1;
         invalidateDisplayList();
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
         if(this._8195)
         {
            this._8195.removeEventListener(_1181.PROPERTY_CHANGE,this._8150);
            this._8195.removeEventListener(ResizeEvent.UI_RESIZE,this.ns_egret::_8037);
            this._8195.clipAndEnableScrolling = false;
         }
         this._8195 = param1;
         if(this._8195)
         {
            this._8195.addEventListener(_1181.PROPERTY_CHANGE,this._8150);
            this._8195.addEventListener(ResizeEvent.UI_RESIZE,this.ns_egret::_8037);
            this._8195.clipAndEnableScrolling = true;
         }
      }
      
      ns_egret function _8181(param1:Number, param2:Number, param3:_1158, param4:Number = 0) : void
      {
         this._8196.stop();
         this._8196.duration = param1;
         this._8196._3772 = param3;
         this._8196.motionPaths = new <_1150>[new _1152("value",value,param2)];
         this._8196.startDelay = param4;
         this._8196.play();
      }
      
      private function _8440(param1:Number) : Number
      {
         var _loc2_:Number = _8236;
         if(_loc2_ == 0)
         {
            return param1;
         }
         var _loc3_:Number = Math.round(param1 / _loc2_) * _loc2_;
         return Math.abs(_loc3_) < _loc2_ ? _loc2_ : _loc3_;
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this._8470)
         {
            this._8482 = this._8440(this._8482);
            this._8470 = false;
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this._8471)
         {
            this._8471.addEventListener(UIEvent.BUTTON_DOWN,this._8452);
            this._8471.addEventListener(MouseEvent.ROLL_OVER,this._8457);
            this._8471.addEventListener(MouseEvent.ROLL_OUT,this._8460);
            this._8471._8380 = true;
         }
         else if(param2 == this._8472)
         {
            this._8472.addEventListener(UIEvent.BUTTON_DOWN,this._8452);
            this._8472.addEventListener(MouseEvent.ROLL_OVER,this._8457);
            this._8472.addEventListener(MouseEvent.ROLL_OUT,this._8460);
            this._8472._8380 = true;
         }
         else if(param2 == track)
         {
            track.addEventListener(MouseEvent.ROLL_OVER,this._8461);
            track.addEventListener(MouseEvent.ROLL_OUT,this._8462);
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this._8471)
         {
            this._8471.removeEventListener(UIEvent.BUTTON_DOWN,this._8452);
            this._8471.removeEventListener(MouseEvent.ROLL_OVER,this._8457);
            this._8471.removeEventListener(MouseEvent.ROLL_OUT,this._8460);
         }
         else if(param2 == this._8472)
         {
            this._8472.removeEventListener(UIEvent.BUTTON_DOWN,this._8452);
            this._8472.removeEventListener(MouseEvent.ROLL_OVER,this._8457);
            this._8472.removeEventListener(MouseEvent.ROLL_OUT,this._8460);
         }
         else if(param2 == track)
         {
            track.removeEventListener(MouseEvent.ROLL_OVER,this._8461);
            track.removeEventListener(MouseEvent.ROLL_OUT,this._8462);
         }
      }
      
      public function _8041(param1:Boolean = true) : void
      {
         var _loc2_:Number = NaN;
         if(param1)
         {
            _loc2_ = Math.min(value + this.pageSize,maximum);
         }
         else
         {
            _loc2_ = Math.max(value - this.pageSize,minimum);
         }
         if(this._8467)
         {
            this.ns_egret::_8181(this._8373,_loc2_,_8479);
         }
         else
         {
            setValue(_loc2_);
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      private function _8150(param1:_1181) : void
      {
         switch(param1.property)
         {
            case "contentWidth":
               this.ns_egret::_8033(param1);
               break;
            case "contentHeight":
               this.ns_egret::_8451(param1);
               break;
            case "horizontalScrollPosition":
               this.ns_egret::_8032(param1);
               break;
            case "verticalScrollPosition":
               this.ns_egret::_8450(param1);
         }
      }
      
      ns_egret function _8037(param1:ResizeEvent) : void
      {
      }
      
      ns_egret function _8033(param1:_1181) : void
      {
      }
      
      ns_egret function _8451(param1:_1181) : void
      {
      }
      
      ns_egret function _8032(param1:_1181) : void
      {
      }
      
      ns_egret function _8450(param1:_1181) : void
      {
      }
      
      override protected function _8454(param1:MouseEvent) : void
      {
         this.ns_egret::_2855();
         super._8454(param1);
      }
      
      protected function _8452(param1:Event) : void
      {
         if(!this._8481)
         {
            this.ns_egret::_2855();
         }
         var _loc2_:* = param1.target == this._8472;
         if(!this._8481 && (_loc2_ && value < maximum || !_loc2_ && value > minimum))
         {
            dispatchEvent(new UIEvent(UIEvent.CHANGE_START));
            this._8481 = true;
            stage.addEventListener(MouseEvent.MOUSE_UP,this._8458,false,0,true);
            stage.addEventListener(Event.MOUSE_LEAVE,this._8458,false,0,true);
         }
         if(!this._8478 && !this._8480)
         {
            _8042(_loc2_);
            if(this._8467 && (_loc2_ && value < maximum || !_loc2_ && value > minimum))
            {
               this._8474(_loc2_ ? maximum : minimum,Math.max(this.pageSize / 10,_8047));
            }
            return;
         }
      }
      
      protected function _8458(param1:Event) : void
      {
         if(this._8478 || this._8480)
         {
            this.ns_egret::_2855();
            dispatchEvent(new UIEvent(UIEvent.CHANGE_END));
            this._8480 = this._8478 = false;
            this._8481 = false;
         }
         else if(this._8481)
         {
            dispatchEvent(new UIEvent(UIEvent.CHANGE_END));
            this._8481 = false;
         }
         stage.removeEventListener(MouseEvent.MOUSE_UP,this._8458);
         stage.removeEventListener(Event.MOUSE_LEAVE,this._8458);
      }
      
      override protected function _8455(param1:MouseEvent) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(!enabled)
         {
            return;
         }
         this.ns_egret::_2855();
         this._8476 = track.globalToLocal(new Point(param1.stageX,param1.stageY));
         if(param1.shiftKey)
         {
            _loc3_ = !!_2557 ? _2557.layoutBoundsWidth : 0;
            _loc4_ = !!_2557 ? _2557.layoutBoundsHeight : 0;
            this._8476.x -= _loc3_ / 2;
            this._8476.y -= _loc4_ / 2;
         }
         var _loc2_:Number = _8045(this._8476.x,this._8476.y);
         this._8468 = _loc2_ > value;
         if(param1.shiftKey)
         {
            _loc5_ = _8231(_loc2_,_8236);
            if(this._8467 && _8233 != 0 && maximum - minimum != 0)
            {
               dispatchEvent(new UIEvent(UIEvent.CHANGE_START));
               this.ns_egret::_8181(_8233 * (Math.abs(value - _loc2_) / (maximum - minimum)),_loc5_,_8459);
               this._8477 = true;
            }
            else
            {
               setValue(_loc5_);
               dispatchEvent(new Event(Event.CHANGE));
            }
            return;
         }
         dispatchEvent(new UIEvent(UIEvent.CHANGE_START));
         this._8477 = false;
         this._8041(this._8468);
         this._8475 = true;
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this._8456,false,0,true);
         stage.addEventListener(MouseEvent.MOUSE_UP,this._8463,false,0,true);
         stage.addEventListener(Event.MOUSE_LEAVE,this._8463,false,0,true);
         if(!this._8466)
         {
            this._8466 = new Timer(this._8377,1);
            this._8466.addEventListener(TimerEvent.TIMER,this._8453);
         }
         else
         {
            this._8466.delay = this._8377;
            this._8466.repeatCount = 1;
         }
         this._8466.start();
      }
      
      protected function _8044(param1:Number, param2:Number) : void
      {
         this._8477 = false;
         this.ns_egret::_8181(this._8373 * (Math.abs(param1 - value) / param2),param1,_8479);
      }
      
      protected function _8474(param1:Number, param2:Number) : void
      {
         var _loc5_:_1158 = null;
         this._8478 = param1 > value;
         this._8480 = !this._8478;
         var _loc3_:Number = param2 != 0 ? param2 : 1;
         var _loc4_:Number = this._8373 * (Math.abs(param1 - value) / _loc3_);
         if(_loc4_ > 5000)
         {
            _loc5_ = new Linear(500 / _loc4_);
         }
         else
         {
            _loc5_ = _8465;
         }
         this.ns_egret::_8181(_loc4_,param1,_loc5_,this._8377);
      }
      
      private function _8155(param1:Animation) : void
      {
         setValue(param1._2584["value"]);
      }
      
      private function _8158(param1:Animation) : void
      {
         if(this._8475)
         {
            this._8475 = false;
         }
         if(this._8478 || this._8480)
         {
            _8042(this._8478);
            this._8196.startDelay = 0;
            return;
         }
         setValue(_8231(this.value,_8236));
         dispatchEvent(new Event(Event.CHANGE));
         if(this._8477)
         {
            dispatchEvent(new UIEvent(UIEvent.CHANGE_END));
            this._8477 = false;
         }
      }
      
      ns_egret function _2855() : void
      {
         if(this._8196.isPlaying)
         {
            this._8158(this._8196);
         }
         this._8196.stop();
      }
      
      private function _8453(param1:Event) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc2_:Number = _8045(this._8476.x,this._8476.y);
         if(_loc2_ == value)
         {
            return;
         }
         var _loc3_:* = this._8469 !== false;
         if(this._8468)
         {
            _loc5_ = maximum - minimum;
            if(_loc5_ == 0)
            {
               return;
            }
            if(value + this.pageSize > _loc2_ && (!_loc3_ || _8231(_loc2_,this.pageSize) != maximum))
            {
               return;
            }
         }
         else if(_loc2_ > value)
         {
            return;
         }
         if(this._8467)
         {
            _loc6_ = Math.abs(value - _loc2_);
            if(_loc2_ > value)
            {
               _loc7_ = this.pageSize != 0 ? int(_loc6_ / this.pageSize) : int(_loc6_);
               if(_loc3_ && _8231(_loc2_,this.pageSize) == maximum)
               {
                  _loc8_ = maximum;
               }
               else
               {
                  _loc8_ = value + _loc7_ * this.pageSize;
               }
            }
            else
            {
               _loc7_ = this.pageSize != 0 ? int(Math.ceil(_loc6_ / this.pageSize)) : int(_loc6_);
               _loc8_ = Math.max(minimum,value - _loc7_ * this.pageSize);
            }
            this._8044(_loc8_,this.pageSize);
            return;
         }
         var _loc4_:Number = value;
         this._8041(this._8468);
         if(Boolean(this._8466) && this._8466.repeatCount == 1)
         {
            this._8466.delay = this._8373;
            this._8466.repeatCount = 0;
         }
      }
      
      private function _8456(param1:MouseEvent) : void
      {
         var _loc2_:Point = null;
         if(this._8475)
         {
            _loc2_ = new Point(param1.stageX,param1.stageY);
            this._8476 = track.globalToLocal(_loc2_);
         }
      }
      
      private function _8463(param1:Event) : void
      {
         this._8475 = false;
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._8456);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this._8463);
         stage.removeEventListener(Event.MOUSE_LEAVE,this._8463);
         if(this._8467)
         {
            if(!this._8477)
            {
               if(Boolean(this._8466) && this._8466.running)
               {
                  if(this._8196.isPlaying)
                  {
                     this._8477 = true;
                  }
                  else
                  {
                     dispatchEvent(new UIEvent(UIEvent.CHANGE_END));
                  }
               }
               else
               {
                  this.ns_egret::_2855();
                  dispatchEvent(new UIEvent(UIEvent.CHANGE_END));
               }
            }
         }
         else
         {
            dispatchEvent(new UIEvent(UIEvent.CHANGE_END));
         }
         if(this._8466)
         {
            this._8466.reset();
         }
      }
      
      private function _8461(param1:MouseEvent) : void
      {
         if(this._8475 && Boolean(this._8466))
         {
            this._8466.start();
         }
      }
      
      private function _8462(param1:MouseEvent) : void
      {
         if(this._8475 && Boolean(this._8466))
         {
            this._8466.stop();
         }
      }
      
      private function _8457(param1:MouseEvent) : void
      {
         if(this._8480 || this._8478)
         {
            this._8196.resume();
         }
      }
      
      private function _8460(param1:MouseEvent) : void
      {
         if(this._8480 || this._8478)
         {
            this._8196.pause();
         }
      }
   }
}

