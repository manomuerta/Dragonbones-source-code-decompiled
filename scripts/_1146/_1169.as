package _1146
{
   import _1177.EffectEvent;
   import egret.core.ns_egret;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   use namespace ns_egret;
   
   public class _1169 extends EventDispatcher implements _1172
   {
      ns_egret var _8815:Timer;
      
      private var _8892:Number = 0;
      
      private var _8891:Number = 0;
      
      ns_egret var _8830:Boolean = false;
      
      ns_egret var _8870:_1169;
      
      protected var _8883:int = 0;
      
      ns_egret var _8893:Boolean = false;
      
      private var _1892:Number = 500;
      
      private var _8894:_1171;
      
      private var _8800:Boolean;
      
      private var _8804:int = 0;
      
      private var _8377:int = 0;
      
      private var _8809:int = 0;
      
      private var _target:Object;
      
      public function _1169(param1:Object)
      {
         super();
         this.target = param1;
      }
      
      ns_egret function get _8875() : Number
      {
         var _loc1_:Number = NaN;
         if(this.repeatCount > 0)
         {
            _loc1_ = this.duration * this.repeatCount + this.repeatDelay * (this.repeatCount - 1) + this.startDelay;
         }
         return _loc1_;
      }
      
      public function get duration() : Number
      {
         if(!this.ns_egret::_8830 && Boolean(this.ns_egret::_8870))
         {
            return this.ns_egret::_8870.duration;
         }
         return this._1892;
      }
      
      public function set duration(param1:Number) : void
      {
         this.ns_egret::_8830 = true;
         this._1892 = param1;
      }
      
      public function get effect() : _1171
      {
         return this._8894;
      }
      
      public function set effect(param1:_1171) : void
      {
         this._8894 = param1;
      }
      
      public function get _8324() : Number
      {
         return Math.max(this._8883 - 1,0) * (this.duration + this.repeatDelay) + (this.ns_egret::_8807 ? 0 : this.startDelay);
      }
      
      public function set _8324(param1:Number) : void
      {
         if(Boolean(this.ns_egret::_8815) && this.ns_egret::_8815.running)
         {
            this.ns_egret::_8815.reset();
            if(param1 < this.startDelay)
            {
               this.ns_egret::_8815 = new Timer(this.startDelay - param1,1);
               this._8892 = getTimer();
               this.ns_egret::_8815.addEventListener(TimerEvent.TIMER,this._8890);
               this.ns_egret::_8815.start();
            }
            else
            {
               this._8883 = 0;
               this.play();
            }
         }
      }
      
      ns_egret function get _8807() : Boolean
      {
         return this._8800;
      }
      
      ns_egret function set _8807(param1:Boolean) : void
      {
         this._8800 = param1;
      }
      
      public function get repeatCount() : int
      {
         return this._8804;
      }
      
      public function set repeatCount(param1:int) : void
      {
         this._8804 = param1;
      }
      
      public function get repeatDelay() : int
      {
         return this._8377;
      }
      
      public function set repeatDelay(param1:int) : void
      {
         this._8377 = param1;
      }
      
      public function get startDelay() : int
      {
         return this._8809;
      }
      
      public function set startDelay(param1:int) : void
      {
         this._8809 = param1;
      }
      
      public function get target() : Object
      {
         return this._target;
      }
      
      public function set target(param1:Object) : void
      {
         this._target = param1;
      }
      
      public function _8837() : void
      {
         if(this.startDelay > 0 && !this.ns_egret::_8807)
         {
            this.ns_egret::_8815 = new Timer(this.startDelay,1);
            this._8892 = getTimer();
            this.ns_egret::_8815.addEventListener(TimerEvent.TIMER,this._8890);
            this.ns_egret::_8815.start();
         }
         else
         {
            this.play();
         }
      }
      
      public function play() : void
      {
         ++this._8883;
         dispatchEvent(new EffectEvent(EffectEvent.EFFECT_START,false,false,this));
         if(Boolean(this.target) && this.target is IEventDispatcher)
         {
            this.target.dispatchEvent(new EffectEvent(EffectEvent.EFFECT_START,false,false,this));
         }
      }
      
      public function pause() : void
      {
         if(this.ns_egret::_8815 && this.ns_egret::_8815.running && !isNaN(this._8892))
         {
            this.ns_egret::_8815.stop();
            this._8891 = getTimer() - this._8892;
         }
      }
      
      public function stop() : void
      {
         if(this.ns_egret::_8815)
         {
            this.ns_egret::_8815.reset();
         }
         this.ns_egret::_8893 = true;
         dispatchEvent(new EffectEvent(EffectEvent.EFFECT_STOP,false,false,this));
         if(Boolean(this.target) && this.target is IEventDispatcher)
         {
            this.target.dispatchEvent(new EffectEvent(EffectEvent.EFFECT_STOP,false,false,this));
         }
         this._8859();
      }
      
      public function resume() : void
      {
         if(this.ns_egret::_8815 && !this.ns_egret::_8815.running && !isNaN(this._8891))
         {
            this.ns_egret::_8815.delay = !this.ns_egret::_8807 ? this.ns_egret::_8815.delay - this._8891 : this._8891;
            this._8892 = getTimer();
            this.ns_egret::_8815.start();
         }
      }
      
      public function reverse() : void
      {
         if(this.repeatCount > 0)
         {
            this._8883 = this.repeatCount - this._8883 + 1;
         }
      }
      
      public function end() : void
      {
         if(this.ns_egret::_8815)
         {
            this.ns_egret::_8815.reset();
         }
         this.ns_egret::_8893 = true;
         this._8859();
      }
      
      public function _8859() : void
      {
         this._8883 = 0;
         dispatchEvent(new EffectEvent(EffectEvent.EFFECT_END,false,false,this));
         if(Boolean(this.target) && this.target is IEventDispatcher)
         {
            this.target.dispatchEvent(new EffectEvent(EffectEvent.EFFECT_END,false,false,this));
         }
      }
      
      public function _8881() : void
      {
         if(!this.ns_egret::_8893 && this._8883 != 0 && (this._8883 < this.repeatCount || this.repeatCount == 0))
         {
            if(this.repeatDelay > 0)
            {
               this.ns_egret::_8815 = new Timer(this.repeatDelay,1);
               this._8892 = getTimer();
               this.ns_egret::_8815.addEventListener(TimerEvent.TIMER,this._8890);
               this.ns_egret::_8815.start();
            }
            else
            {
               this.play();
            }
         }
         else
         {
            this._8859();
         }
      }
      
      ns_egret function _8872() : void
      {
         this.duration = 0;
         this.repeatCount = 1;
         this.repeatDelay = 0;
         this.startDelay = 0;
         this._8837();
      }
      
      private function _8890(param1:TimerEvent) : void
      {
         this.ns_egret::_8815.reset();
         this._8892 = NaN;
         this._8891 = NaN;
         this.play();
      }
   }
}

