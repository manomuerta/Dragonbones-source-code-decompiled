package _1088
{
   import _1045._1085;
   import _1177.UIEvent;
   import egret.core._1117;
   import egret.core._1141;
   import egret.core.ns_egret;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   use namespace ns_egret;
   
   public class _1087 extends _1085
   {
      private var _8371:Boolean = false;
      
      private var _8372:Timer;
      
      public var labelDisplay:_1117;
      
      private var _8378:Boolean = false;
      
      private var _8377:Number = 35;
      
      private var _8373:Number = 35;
      
      private var _7918:Boolean = false;
      
      private var _8382:Boolean = false;
      
      private var _2541:String = "";
      
      private var _8375:Boolean = false;
      
      private var _8369:Boolean = false;
      
      public function _1087()
      {
         super();
         mouseChildren = false;
         _2576 = true;
         _6675 = false;
         this._8379();
      }
      
      public function get _8380() : Boolean
      {
         return this._8378;
      }
      
      public function set _8380(param1:Boolean) : void
      {
         if(param1 == this._8378)
         {
            return;
         }
         this._8378 = param1;
         this._8362(this._2554());
      }
      
      public function get repeatDelay() : Number
      {
         return this._8377;
      }
      
      public function set repeatDelay(param1:Number) : void
      {
         this._8377 = param1;
      }
      
      public function get _8374() : Number
      {
         return this._8373;
      }
      
      public function set _8374(param1:Number) : void
      {
         this._8373 = param1;
      }
      
      protected function get _7854() : Boolean
      {
         return this._7918;
      }
      
      protected function set _7854(param1:Boolean) : void
      {
         if(param1 == this._7918)
         {
            return;
         }
         this._7918 = param1;
         _2570();
         this._8364();
      }
      
      ns_egret function _8383(param1:Boolean) : void
      {
         if(this._8382 == param1)
         {
            return;
         }
         this._8382 = param1;
         _2570();
      }
      
      public function set label(param1:String) : void
      {
         this._2541 = param1;
         if(this.labelDisplay)
         {
            this.labelDisplay.text = param1;
         }
      }
      
      public function get label() : String
      {
         if(this.labelDisplay)
         {
            return this.labelDisplay.text;
         }
         return this._2541;
      }
      
      protected function get _8376() : Boolean
      {
         return this._8375;
      }
      
      protected function set _8376(param1:Boolean) : void
      {
         if(param1 == this._8375)
         {
            return;
         }
         this._8375 = param1;
         _2570();
         if(!param1)
         {
            this._8365();
         }
         this._8364();
      }
      
      public function get _8370() : Boolean
      {
         return this._8369;
      }
      
      public function set _8370(param1:Boolean) : void
      {
         if(param1 == this._8369)
         {
            return;
         }
         this._8369 = param1;
         _2570();
         this._8364();
      }
      
      private function _8364() : void
      {
         var _loc1_:Boolean = this._2554();
         if(this._8371 != _loc1_)
         {
            if(_loc1_)
            {
               dispatchEvent(new UIEvent(UIEvent.BUTTON_DOWN));
            }
            this._8371 = _loc1_;
            this._8362(_loc1_);
         }
      }
      
      protected function _8379() : void
      {
         addEventListener(MouseEvent.ROLL_OVER,this._2456);
         addEventListener(MouseEvent.ROLL_OUT,this._2456);
         addEventListener(MouseEvent.MOUSE_DOWN,this._2456);
         addEventListener(MouseEvent.MOUSE_UP,this._2456);
         addEventListener(MouseEvent.CLICK,this._2456);
      }
      
      private function _8367() : void
      {
         if(stage)
         {
            stage.addEventListener(MouseEvent.MOUSE_UP,this._8097,false,0,true);
            stage.addEventListener(Event.MOUSE_LEAVE,this._8097,false,0,true);
         }
      }
      
      private function _8365() : void
      {
         if(stage)
         {
            stage.removeEventListener(MouseEvent.MOUSE_UP,this._8097);
            stage.removeEventListener(Event.MOUSE_LEAVE,this._8097);
         }
      }
      
      private function _2554() : Boolean
      {
         if(!enabled)
         {
            return false;
         }
         if(this._8376 && (this._7854 || this._8370))
         {
            return true;
         }
         return false;
      }
      
      private function _8362(param1:Boolean) : void
      {
         var _loc2_:Boolean = this._8380 && param1;
         var _loc3_:* = this._8372 != null;
         if(_loc2_ == _loc3_)
         {
            return;
         }
         if(_loc2_)
         {
            this.startTimer();
         }
         else
         {
            this._8381();
         }
      }
      
      private function startTimer() : void
      {
         this._8372 = new Timer(1);
         this._8372.delay = this._8377;
         this._8372.addEventListener(TimerEvent.TIMER,this._8363);
         this._8372.start();
      }
      
      private function _8381() : void
      {
         this._8372.stop();
         this._8372 = null;
      }
      
      protected function _2456(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.ROLL_OVER:
               if(param1.buttonDown && !this._8376)
               {
                  return;
               }
               this._7854 = true;
               break;
            case MouseEvent.ROLL_OUT:
               this._7854 = false;
               break;
            case MouseEvent.MOUSE_DOWN:
               this._8367();
               this._8376 = true;
               break;
            case MouseEvent.MOUSE_UP:
               if(param1.target == this)
               {
                  this._7854 = true;
                  if(this._8376)
                  {
                     this._8239();
                     this._8376 = false;
                  }
               }
               break;
            case MouseEvent.CLICK:
               if(!enabled)
               {
                  param1.stopImmediatePropagation();
               }
               else
               {
                  this._7234(MouseEvent(param1));
               }
               return;
         }
         if(_1141._8368)
         {
            param1.updateAfterEvent();
         }
      }
      
      protected function _8239() : void
      {
      }
      
      protected function _7234(param1:MouseEvent) : void
      {
      }
      
      private function _8097(param1:Event) : void
      {
         if(param1.target == this)
         {
            return;
         }
         this._8376 = false;
      }
      
      private function _8363(param1:TimerEvent) : void
      {
         this._8372.reset();
         this._8372.removeEventListener(TimerEvent.TIMER,this._8363);
         this._8372.delay = this._8373;
         this._8372.addEventListener(TimerEvent.TIMER,this._8366);
         this._8372.start();
      }
      
      private function _8366(param1:TimerEvent) : void
      {
         dispatchEvent(new UIEvent(UIEvent.BUTTON_DOWN));
      }
      
      override protected function _6231() : String
      {
         if(!enabled)
         {
            return super._6231();
         }
         if(this._2554() || this._8382)
         {
            return "down";
         }
         if(this._7854 || this._8376)
         {
            return "over";
         }
         return "up";
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.labelDisplay)
         {
            this.labelDisplay.text = this._2541;
         }
      }
   }
}

