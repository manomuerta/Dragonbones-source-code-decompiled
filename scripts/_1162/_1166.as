package _1162
{
   import _1146._1169;
   import _1146._1172;
   import _1146._1176;
   import egret.core.ns_egret;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   use namespace ns_egret;
   
   public class _1166 extends _1164
   {
      private var _8880:Array;
      
      private var _8879:Array;
      
      private var _8882:Boolean = false;
      
      private var timer:Timer;
      
      public function _1166(param1:Object)
      {
         super(param1);
      }
      
      override ns_egret function get _8871() : Number
      {
         var _loc4_:Array = null;
         var _loc1_:Number = 0;
         var _loc2_:int = int(ns_egret::_8878.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = ns_egret::_8878[_loc3_];
            _loc1_ = Math.max(_loc4_[0]._8875,_loc1_);
            _loc3_++;
         }
         return _loc1_;
      }
      
      override public function set _8324(param1:Number) : void
      {
         var _loc6_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Array = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:Number = NaN;
         var _loc13_:int = 0;
         var _loc14_:_1169 = null;
         super._8324 = param1;
         var _loc2_:Number = _1176(effect)._8310;
         var _loc3_:Number = _loc2_ + startDelay + repeatDelay;
         var _loc4_:Number = _loc2_ + repeatDelay;
         var _loc5_:Number = _loc3_ + _loc4_ * (repeatCount - 1);
         if(param1 <= _loc3_)
         {
            _loc6_ = Math.min(param1 - startDelay,_loc2_);
            _8883 = 1;
         }
         else if(param1 >= _loc5_ && repeatCount != 0)
         {
            _loc6_ = _loc2_;
            _8883 = repeatCount;
         }
         else
         {
            _loc8_ = param1 - _loc3_;
            _loc6_ = _loc8_ % _loc4_;
            _8883 = 1 + _loc8_ / _loc4_;
         }
         var _loc7_:int = 0;
         while(_loc7_ < ns_egret::_8878.length)
         {
            _loc9_ = ns_egret::_8878[_loc7_];
            _loc10_ = int(_loc9_.length);
            _loc11_ = 0;
            while(_loc11_ < _loc10_)
            {
               _loc9_[_loc11_]._8324 = !!ns_egret::_8807 ? Math.max(0,_loc6_ - (this.ns_egret::_8871 - _loc9_[_loc11_]._8875)) : _loc6_;
               _loc11_++;
            }
            _loc7_++;
         }
         if(Boolean(ns_egret::_8807) && this._8879 != null && this._8879.length > 0)
         {
            _loc12_ = this.ns_egret::_8871 - _8324;
            _loc13_ = int(this._8879.length);
            _loc7_ = _loc13_ - 1;
            while(_loc7_ >= 0)
            {
               _loc14_ = this._8879[_loc7_];
               if(_loc12_ <= _loc14_.ns_egret::_8875)
               {
                  if(ns_egret::_8873 == null)
                  {
                     ns_egret::_8873 = [];
                  }
                  ns_egret::_8873.push(_loc14_);
                  this._8879.splice(_loc7_,1);
                  _loc14_.ns_egret::_8807 = ns_egret::_8807;
                  _loc14_._8837();
               }
               _loc7_--;
            }
         }
      }
      
      override public function play() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:_1169 = null;
         var _loc7_:Array = null;
         this._8880 = [];
         ns_egret::_8873 = [];
         this._8879 = [];
         super.play();
         _loc1_ = int(ns_egret::_8878.length);
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = ns_egret::_8878[_loc2_];
            _loc4_ = int(_loc3_.length);
            _loc5_ = 0;
            while(_loc5_ < _loc4_ && ns_egret::_8873 != null)
            {
               _loc6_ = _loc3_[_loc5_];
               if(Boolean(ns_egret::_8807) && _loc6_.ns_egret::_8875 < this.ns_egret::_8871)
               {
                  this._8879.push(_loc6_);
                  this.startTimer();
               }
               else
               {
                  _loc6_.ns_egret::_8807 = ns_egret::_8807;
                  ns_egret::_8873.push(_loc6_);
               }
               _loc5_++;
            }
            _loc2_++;
         }
         if(ns_egret::_8873.length > 0)
         {
            _loc7_ = ns_egret::_8873.slice(0);
            _loc2_ = 0;
            while(_loc2_ < _loc7_.length)
            {
               _loc7_[_loc2_]._8837();
               _loc2_++;
            }
         }
      }
      
      override public function pause() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         super.pause();
         if(ns_egret::_8873)
         {
            _loc1_ = int(ns_egret::_8873.length);
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               ns_egret::_8873[_loc2_].pause();
               _loc2_++;
            }
         }
      }
      
      override public function stop() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         this._8381();
         if(ns_egret::_8873)
         {
            _loc1_ = ns_egret::_8873.concat();
            ns_egret::_8873 = null;
            _loc2_ = int(_loc1_.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               if(_loc1_[_loc3_])
               {
                  _loc1_[_loc3_].stop();
               }
               _loc3_++;
            }
         }
         super.stop();
      }
      
      override public function resume() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         super.resume();
         if(ns_egret::_8873)
         {
            _loc1_ = int(ns_egret::_8873.length);
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               ns_egret::_8873[_loc2_].resume();
               _loc2_++;
            }
         }
      }
      
      override public function reverse() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         super.reverse();
         if(this._8882)
         {
            _loc1_ = int(ns_egret::_8873.length);
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               ns_egret::_8873[_loc2_].reverse();
               _loc2_++;
            }
            this._8381();
         }
         else
         {
            this._8879 = this._8880.splice(0);
            _loc1_ = int(ns_egret::_8873.length);
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               ns_egret::_8873[_loc2_].reverse();
               _loc2_++;
            }
            this.startTimer();
         }
         this._8882 = !this._8882;
      }
      
      override public function end() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         ns_egret::_8874 = true;
         this._8381();
         if(ns_egret::_8873)
         {
            _loc1_ = ns_egret::_8873.concat();
            ns_egret::_8873 = null;
            _loc2_ = int(_loc1_.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               if(_loc1_[_loc3_])
               {
                  _loc1_[_loc3_].end();
               }
               _loc3_++;
            }
         }
         super.end();
      }
      
      override protected function _8877(param1:_1172) : void
      {
         if(Boolean(ns_egret::_8874) || ns_egret::_8873 == null)
         {
            return;
         }
         var _loc2_:int = int(ns_egret::_8873.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(param1 == ns_egret::_8873[_loc3_])
            {
               this._8880.push(param1);
               ns_egret::_8873.splice(_loc3_,1);
               break;
            }
            _loc3_++;
         }
         if(_loc2_ == 1)
         {
            _8881();
         }
      }
      
      private function startTimer() : void
      {
         if(!this.timer)
         {
            this.timer = new Timer(10);
            this.timer.addEventListener(TimerEvent.TIMER,this._2619);
         }
         this.timer.start();
      }
      
      private function _8381() : void
      {
         if(this.timer)
         {
            this.timer.reset();
         }
      }
      
      private function _2619(param1:TimerEvent) : void
      {
         var _loc5_:_1169 = null;
         var _loc2_:Number = this.ns_egret::_8871 - _8324;
         var _loc3_:int = int(this._8879.length);
         if(_loc3_ == 0)
         {
            this._8381();
            return;
         }
         var _loc4_:int = _loc3_ - 1;
         while(_loc4_ >= 0)
         {
            _loc5_ = this._8879[_loc4_];
            if(_loc2_ <= _loc5_.ns_egret::_8875)
            {
               if(ns_egret::_8873 == null)
               {
                  ns_egret::_8873 = [];
               }
               ns_egret::_8873.push(_loc5_);
               this._8879.splice(_loc4_,1);
               _loc5_.ns_egret::_8807 = ns_egret::_8807;
               _loc5_._8837();
            }
            _loc4_--;
         }
      }
   }
}

