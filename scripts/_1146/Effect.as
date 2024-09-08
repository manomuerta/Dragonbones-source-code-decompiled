package _1146
{
   import _1177.EffectEvent;
   import egret.core.ns_egret;
   import flash.events.EventDispatcher;
   
   use namespace ns_egret;
   
   public class Effect extends EventDispatcher implements _1171
   {
      private var _8838:Array;
      
      private var _8839:Boolean = false;
      
      ns_egret var _8807:Boolean;
      
      private var _8836:Boolean;
      
      ns_egret var _8765:Effect;
      
      private var _1892:Number = 500;
      
      ns_egret var _8830:Boolean = false;
      
      public var _8757:Class;
      
      private var _8831:Number = 0;
      
      public var repeatCount:int = 1;
      
      public var repeatDelay:int = 0;
      
      public var startDelay:int = 0;
      
      private var _8841:Array;
      
      private var _8799:Number = 0;
      
      public function Effect(param1:Object = null)
      {
         this._8838 = [];
         this._8757 = _1172;
         this._8841 = [];
         super();
         this.target = param1;
      }
      
      public function get duration() : Number
      {
         if(!this.ns_egret::_8830 && Boolean(this.ns_egret::_8765))
         {
            return this.ns_egret::_8765.duration;
         }
         return this._1892;
      }
      
      public function set duration(param1:Number) : void
      {
         this.ns_egret::_8830 = true;
         this._1892 = param1;
      }
      
      public function get isPlaying() : Boolean
      {
         return Boolean(this._8838) && this._8838.length > 0;
      }
      
      public function get _8840() : Boolean
      {
         if(this.isPlaying)
         {
            return this._8839;
         }
         return false;
      }
      
      public function get _8834() : Number
      {
         return this._8831;
      }
      
      public function set _8834(param1:Number) : void
      {
         this._8831 = param1;
      }
      
      public function get target() : Object
      {
         if(this._8841.length > 0)
         {
            return this._8841[0];
         }
         return null;
      }
      
      public function set target(param1:Object) : void
      {
         this._8841.splice(0);
         if(param1)
         {
            this._8841[0] = param1;
         }
      }
      
      public function get targets() : Array
      {
         return this._8841;
      }
      
      public function set targets(param1:Array) : void
      {
         var _loc2_:int = int(param1.length);
         var _loc3_:int = _loc2_ - 1;
         while(_loc3_ >= 0)
         {
            if(param1[_loc3_] == null)
            {
               param1.splice(_loc3_,1);
            }
            _loc3_--;
         }
         this._8841 = param1;
      }
      
      public function get _8324() : Number
      {
         var _loc1_:int = 0;
         while(_loc1_ < this._8838.length)
         {
            if(this._8838[_loc1_])
            {
               return _1172(this._8838[_loc1_])._8324;
            }
            _loc1_++;
         }
         return this._8799;
      }
      
      public function set _8324(param1:Number) : void
      {
         var _loc2_:Boolean = false;
         if(this._8838.length == 0)
         {
            this.play();
            _loc2_ = true;
         }
         var _loc3_:int = 0;
         while(_loc3_ < this._8838.length)
         {
            if(this._8838[_loc3_])
            {
               _1172(this._8838[_loc3_])._8324 = param1;
            }
            _loc3_++;
         }
         if(_loc2_)
         {
            this.pause();
         }
         this._8799 = param1;
      }
      
      public function _8822(param1:Array = null) : Array
      {
         var _loc4_:Object = null;
         var _loc5_:_1172 = null;
         if(!param1)
         {
            param1 = this.targets;
         }
         var _loc2_:Array = [];
         var _loc3_:Number = 0;
         for each(_loc4_ in param1)
         {
            _loc5_ = this._8777(_loc4_);
            if(_loc5_)
            {
               _loc5_.startDelay += _loc3_;
               _loc3_ += this._8834;
               _loc2_.push(_loc5_);
            }
         }
         return _loc2_;
      }
      
      public function _8777(param1:Object = null) : _1172
      {
         if(!param1)
         {
            param1 = this.target;
         }
         var _loc2_:_1172 = _1172(new this._8757(param1));
         this._8760(_loc2_);
         EventDispatcher(_loc2_).addEventListener(EffectEvent.EFFECT_START,this._8771);
         EventDispatcher(_loc2_).addEventListener(EffectEvent.EFFECT_STOP,this._8832);
         EventDispatcher(_loc2_).addEventListener(EffectEvent.EFFECT_END,this._8833);
         this._8838.push(_loc2_);
         return _loc2_;
      }
      
      protected function _8760(param1:_1172) : void
      {
         param1.duration = this.duration;
         Object(param1)._8830 = this.ns_egret::_8830;
         param1.effect = this;
         param1.repeatCount = this.repeatCount;
         param1.repeatDelay = this.repeatDelay;
         param1.startDelay = this.startDelay;
      }
      
      public function _8835(param1:_1172) : void
      {
         EventDispatcher(param1).removeEventListener(EffectEvent.EFFECT_START,this._8771);
         EventDispatcher(param1).removeEventListener(EffectEvent.EFFECT_STOP,this._8832);
         EventDispatcher(param1).removeEventListener(EffectEvent.EFFECT_END,this._8833);
         var _loc2_:int = int(this._8838.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this._8838[_loc3_] === param1)
            {
               this._8838.splice(_loc3_,1);
            }
            _loc3_++;
         }
      }
      
      public function play(param1:Array = null, param2:Boolean = false) : Array
      {
         var _loc6_:_1172 = null;
         this._8836 = false;
         this._8839 = false;
         this.ns_egret::_8807 = param2;
         var _loc3_:Array = this._8822(param1);
         var _loc4_:int = int(_loc3_.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = _1172(_loc3_[_loc5_]);
            Object(_loc6_)._8807 = param2;
            _loc6_._8837();
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function pause() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.isPlaying && !this._8839)
         {
            this._8839 = true;
            _loc1_ = int(this._8838.length);
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _1172(this._8838[_loc2_]).pause();
               _loc2_++;
            }
         }
      }
      
      public function stop() : void
      {
         var _loc3_:_1172 = null;
         var _loc1_:int = int(this._8838.length - 1);
         var _loc2_:int = _loc1_;
         while(_loc2_ >= 0)
         {
            _loc3_ = _1172(this._8838[_loc2_]);
            if(_loc3_)
            {
               _loc3_.stop();
            }
            _loc2_--;
         }
      }
      
      public function resume() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.isPlaying && this._8839)
         {
            this._8839 = false;
            _loc1_ = int(this._8838.length);
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _1172(this._8838[_loc2_]).resume();
               _loc2_++;
            }
         }
      }
      
      public function reverse() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.isPlaying)
         {
            _loc1_ = int(this._8838.length);
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _1172(this._8838[_loc2_]).reverse();
               _loc2_++;
            }
         }
      }
      
      public function end(param1:_1172 = null) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_1172 = null;
         if(param1)
         {
            param1.end();
         }
         else
         {
            _loc2_ = int(this._8838.length);
            _loc3_ = _loc2_ - 1;
            while(_loc3_ >= 0)
            {
               _loc4_ = _1172(this._8838[_loc3_]);
               if(_loc4_)
               {
                  _loc4_.end();
               }
               _loc3_--;
            }
         }
      }
      
      protected function _8771(param1:EffectEvent) : void
      {
         dispatchEvent(param1);
      }
      
      protected function _8832(param1:EffectEvent) : void
      {
         dispatchEvent(param1);
         this._8836 = true;
      }
      
      protected function _8833(param1:EffectEvent) : void
      {
         var _loc2_:_1172 = _1172(param1._8775);
         this._8835(_loc2_);
         dispatchEvent(param1);
      }
   }
}

