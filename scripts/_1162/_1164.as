package _1162
{
   import _1146._1169;
   import _1146._1172;
   import _1148.Animation;
   import _1148._1150;
   import _1148._1152;
   import _1177.EffectEvent;
   import egret.core.ns_egret;
   
   use namespace ns_egret;
   
   public class _1164 extends _1169
   {
      ns_egret var _8873:Array;
      
      private var _8799:Number = 0;
      
      ns_egret var _8878:Array;
      
      ns_egret var _8874:Boolean;
      
      ns_egret var _8876:Animation;
      
      public function _1164(param1:Object)
      {
         this.ns_egret::_8873 = [];
         this.ns_egret::_8878 = [];
         super(param1);
      }
      
      override ns_egret function get _8875() : Number
      {
         var _loc1_:Number = NaN;
         if(repeatCount > 0)
         {
            _loc1_ = this.ns_egret::_8871 * repeatCount + repeatDelay * (repeatCount - 1) + startDelay;
         }
         return _loc1_;
      }
      
      override public function get _8324() : Number
      {
         return this._8799;
      }
      
      override public function set _8324(param1:Number) : void
      {
         if(this.ns_egret::_8876)
         {
            this.ns_egret::_8876._8324 = param1;
         }
         else
         {
            this._8799 = param1;
         }
         super._8324 = param1;
      }
      
      ns_egret function get _8871() : Number
      {
         return 0;
      }
      
      override public function play() : void
      {
         this.ns_egret::_8876 = new Animation(this._8854);
         this.ns_egret::_8876.duration = this.ns_egret::_8871;
         this.ns_egret::_8876.motionPaths = new Vector.<_1150>([new _1152("timer",0,0)]);
         this.ns_egret::_8876.endFunction = this._8808;
         this.ns_egret::_8876.play();
         super.play();
      }
      
      override public function pause() : void
      {
         super.pause();
         if(this.ns_egret::_8876)
         {
            this.ns_egret::_8876.pause();
         }
      }
      
      override public function stop() : void
      {
         super.stop();
         if(this.ns_egret::_8876)
         {
            this.ns_egret::_8876.stop();
         }
      }
      
      override public function end() : void
      {
         super.end();
         if(this.ns_egret::_8876)
         {
            this.ns_egret::_8876.end();
         }
      }
      
      override public function resume() : void
      {
         super.resume();
         if(this.ns_egret::_8876)
         {
            this.ns_egret::_8876.resume();
         }
      }
      
      override public function reverse() : void
      {
         super.reverse();
         super.ns_egret::_8807 = !ns_egret::_8807;
         if(this.ns_egret::_8876)
         {
            this.ns_egret::_8876.ns_egret::reverse();
         }
      }
      
      override public function _8859() : void
      {
         this.ns_egret::_8873 = null;
         super._8859();
      }
      
      public function _8824(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1)
         {
            _loc2_ = int(param1.length);
            if(_loc2_ > 0)
            {
               if(!this.ns_egret::_8878)
               {
                  this.ns_egret::_8878 = [param1];
               }
               else
               {
                  this.ns_egret::_8878.push(param1);
               }
               _loc3_ = 0;
               while(_loc3_ < _loc2_)
               {
                  param1[_loc3_].addEventListener(EffectEvent.EFFECT_END,this.ns_egret::_8833);
                  param1[_loc3_]._8870 = this;
                  _loc3_++;
               }
            }
         }
      }
      
      override ns_egret function _8872() : void
      {
         super.ns_egret::_8872();
         this.end();
      }
      
      public function _8854(param1:Animation) : void
      {
         this._8799 = !!this.ns_egret::_8876 ? this.ns_egret::_8876._8324 : this._8799;
      }
      
      public function _8808(param1:Animation) : void
      {
         this._8799 = !!this.ns_egret::_8876 ? this.ns_egret::_8876._8324 : this._8799;
      }
      
      protected function _8877(param1:_1172) : void
      {
      }
      
      ns_egret function _8833(param1:EffectEvent) : void
      {
         this._8877(param1._8775);
      }
   }
}

