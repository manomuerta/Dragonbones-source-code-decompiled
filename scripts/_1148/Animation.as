package _1148
{
   import _1155._1158;
   import _1155._1159;
   import _1174._1173;
   import egret.core.ns_egret;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   use namespace ns_egret;
   
   public final class Animation
   {
      private static const TIMER_RESOLUTION:Number = 1000 / 60;
      
      private static var _8803:Number = NaN;
      
      private static var _8789:Vector.<Animation> = new Vector.<Animation>();
      
      private static var timer:Timer = null;
      
      private static var _8787:Vector.<Animation> = new Vector.<Animation>();
      
      private static var _8805:_1158 = new _1159(0.5);
      
      private static var startTime:int = -1;
      
      private static var _currentTime:int = -1;
      
      public var startFunction:Function = null;
      
      public var endFunction:Function = null;
      
      public var updateFunction:Function = null;
      
      public var stopFunction:Function = null;
      
      public var repeatFunction:Function = null;
      
      private var id:int = -1;
      
      private var _8819:Boolean = false;
      
      private var _8811:Boolean = false;
      
      private var _8812:Boolean = false;
      
      private var _8798:Boolean = false;
      
      private var startTime:Number;
      
      private var _8818:Boolean = false;
      
      private var _8795:Number;
      
      private var _8817:Number = -1;
      
      private var _8790:Number = -1;
      
      public var _2584:Object;
      
      public var motionPaths:Vector.<_1150>;
      
      private var _8799:Number = 0;
      
      public var duration:Number = 500;
      
      private var _8752:String = "loop";
      
      private var _8804:int = 1;
      
      private var _8377:Number = 0;
      
      private var _8809:Number = 0;
      
      public var _8759:_1173 = null;
      
      private var _8813:Number = 0;
      
      private var _8794:Number;
      
      private var _8761:_1158;
      
      private var _8800:Boolean;
      
      public function Animation(param1:Function)
      {
         this._8761 = _8805;
         super();
         this.updateFunction = param1;
      }
      
      private static function addAnimation(param1:Animation) : void
      {
         var _loc2_:int = 0;
         if(param1.motionPaths && param1.motionPaths.length > 0 && param1.motionPaths[0] && (param1.motionPaths[0].property == "width" || param1.motionPaths[0].property == "height"))
         {
            _8789.splice(0,0,param1);
            param1.id = 0;
            _loc2_ = 1;
            while(_loc2_ < _8789.length)
            {
               Animation(_8789[_loc2_]).id = _loc2_;
               _loc2_++;
            }
         }
         else
         {
            param1.id = _8789.length;
            _8789.push(param1);
         }
         if(!timer)
         {
            _8820();
            timer = new Timer(TIMER_RESOLUTION);
            timer.addEventListener(TimerEvent.TIMER,_2619);
            timer.start();
         }
         _8803 = currentTime;
         param1._8795 = _8803;
      }
      
      private static function _8788(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Animation = null;
         if(param1 >= 0 && param1 < _8789.length)
         {
            _8789.splice(param1,1);
            _loc2_ = int(_8789.length);
            _loc3_ = param1;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = Animation(_8789[_loc3_]);
               --_loc4_.id;
               _loc3_++;
            }
         }
         _8791();
      }
      
      private static function _8793(param1:Animation) : void
      {
         _8788(param1.id);
      }
      
      private static function _2619(param1:TimerEvent) : void
      {
         var _loc3_:* = false;
         var _loc4_:Animation = null;
         var _loc5_:Animation = null;
         var _loc6_:Number = NaN;
         _8803 = _8820();
         var _loc2_:int = 0;
         while(_loc2_ < _8789.length)
         {
            _loc3_ = true;
            _loc4_ = Animation(_8789[_loc2_]);
            if(_loc4_)
            {
               _loc3_ = !_loc4_._8814();
            }
            if(_loc3_)
            {
               _loc2_++;
            }
         }
         while(_8787.length > 0)
         {
            _loc5_ = Animation(_8787[0]);
            if((_loc6_ = _loc5_._8790) >= currentTime)
            {
               break;
            }
            if(_loc5_._8807)
            {
               _loc5_.end();
            }
            else
            {
               _loc5_.start();
            }
         }
         param1.updateAfterEvent();
      }
      
      private static function _8791() : void
      {
         if(timer && _8789.length == 0 && _8787.length == 0)
         {
            _8803 = NaN;
            timer.reset();
            timer = null;
         }
      }
      
      private static function _8820() : int
      {
         if(startTime < 0)
         {
            startTime = getTimer();
            _currentTime = 0;
            return _currentTime;
         }
         _currentTime = getTimer() - startTime;
         return _currentTime;
      }
      
      private static function get currentTime() : int
      {
         if(_currentTime < 0)
         {
            return _8820();
         }
         return _currentTime;
      }
      
      public function get _8324() : Number
      {
         return this._8799 + this.startDelay;
      }
      
      public function set _8324(param1:Number) : void
      {
         this._8798 = false;
         this.seek(param1,true);
      }
      
      public function get isPlaying() : Boolean
      {
         return this._8811;
      }
      
      public function get _8753() : String
      {
         return this._8752;
      }
      
      public function set _8753(param1:String) : void
      {
         this._8752 = param1;
      }
      
      public function set repeatCount(param1:int) : void
      {
         this._8804 = param1;
      }
      
      public function get repeatCount() : int
      {
         return this._8804;
      }
      
      public function set repeatDelay(param1:Number) : void
      {
         this._8377 = param1;
      }
      
      public function get repeatDelay() : Number
      {
         return this._8377;
      }
      
      public function set startDelay(param1:Number) : void
      {
         this._8809 = param1;
      }
      
      public function get startDelay() : Number
      {
         return this._8809;
      }
      
      public function get _8816() : Number
      {
         return this._8813;
      }
      
      public function get _8801() : Number
      {
         return this._8794;
      }
      
      public function get _3772() : _1158
      {
         return this._8761;
      }
      
      public function set _3772(param1:_1158) : void
      {
         if(!param1)
         {
            param1 = _8805;
         }
         this._8761 = param1;
      }
      
      public function get _8807() : Boolean
      {
         return this._8800;
      }
      
      public function set _8807(param1:Boolean) : void
      {
         if(this._8811)
         {
            if(this._8798 != param1)
            {
               this._8798 = param1;
               this.seek(this.duration - this._8813,true);
            }
         }
         this._8812 = param1;
         this._8800 = param1;
      }
      
      private function _8814() : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:Timer = null;
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         if(this._8811 || this._8819)
         {
            _loc3_ = _8803 - this._8795;
            this._8799 = _8803 - this.startTime;
            if(_loc3_ >= this.duration)
            {
               _loc4_ = 2;
               if(this.duration + this.repeatDelay > 0)
               {
                  _loc4_ += Math.floor((this._8799 - this.duration) / (this.duration + this.repeatDelay));
               }
               if(this.repeatCount == 0 || _loc4_ <= this.repeatCount)
               {
                  if(this.repeatDelay != 0)
                  {
                     if(this._8819)
                     {
                        this._8813 = _loc3_ % (this.duration + this.repeatDelay);
                        if(this._8813 > this.duration)
                        {
                           this._8813 = this.duration;
                        }
                        this._8797(this._8813);
                        this._8792();
                        return false;
                     }
                     this._8813 = this.duration;
                     this._8797(this._8813);
                     this._8792();
                     _8793(this);
                     _loc5_ = new Timer(this.repeatDelay,1);
                     _loc5_.addEventListener(TimerEvent.TIMER,this.repeat);
                     _loc5_.start();
                     return false;
                  }
                  this._8813 = _loc3_ % this.duration;
                  this._8795 = _8803 - this._8813;
                  _loc3_ = this._8813;
                  if(this._8753 == _1151.REVERSE)
                  {
                     if(this.repeatCount > 1)
                     {
                        this._8798 = !(_loc4_ % 2);
                     }
                     else
                     {
                        this._8798 = !this._8798;
                     }
                  }
                  _loc2_ = true;
               }
               else if(_loc3_ > this.duration)
               {
                  _loc3_ = this.duration;
                  this._8799 = this.duration;
               }
            }
            this._8813 = _loc3_;
            this._8797(_loc3_);
            if(_loc3_ >= this.duration && !this._8819)
            {
               if(!this._8807 || this.startDelay == 0)
               {
                  this.end();
                  _loc1_ = true;
               }
               else
               {
                  this._2855();
                  this._8784(this.startDelay);
               }
            }
            else
            {
               if(_loc2_)
               {
                  this._8785("repeatFunction");
               }
               this._8792();
            }
         }
         return _loc1_;
      }
      
      private function _8792() : void
      {
         this._8785("updateFunction");
      }
      
      private function _8785(param1:String) : void
      {
         if(this[param1] != null)
         {
            this[param1](this);
         }
      }
      
      private function _8797(param1:Number) : void
      {
         var _loc2_:int = 0;
         this._2584 = {};
         if(this.duration == 0)
         {
            _loc2_ = 0;
            while(_loc2_ < this.motionPaths.length)
            {
               this._2584[this.motionPaths[_loc2_].property] = this._8798 ? this.motionPaths[_loc2_]._8781[0].value : this.motionPaths[_loc2_]._8781[this.motionPaths[_loc2_]._8781.length - 1].value;
               _loc2_++;
            }
            return;
         }
         if(this._8798)
         {
            param1 = this.duration - param1;
         }
         this._8794 = this._3772.ease(param1 / this.duration);
         if(this.motionPaths)
         {
            _loc2_ = 0;
            while(_loc2_ < this.motionPaths.length)
            {
               this._2584[this.motionPaths[_loc2_].property] = this.motionPaths[_loc2_].getValue(this._8794);
               _loc2_++;
            }
         }
      }
      
      private function _8783() : void
      {
         var _loc1_:int = 0;
         if(this._8790 >= 0)
         {
            _loc1_ = 0;
            while(_loc1_ < _8787.length)
            {
               if(_8787[_loc1_] == this)
               {
                  _8787.splice(_loc1_,1);
                  break;
               }
               _loc1_++;
            }
            this._8790 = -1;
         }
      }
      
      public function end() : void
      {
         if(this.startDelay > 0 && _8787.length > 0)
         {
            this._8783();
         }
         if(!this._8818)
         {
            this._8785("startFunction");
         }
         if(this.repeatCount > 1 && this._8753 == "reverse" && this.repeatCount % 2 == 0)
         {
            this._8798 = true;
         }
         if(!(this._8812 && this.startDelay > 0))
         {
            this._8797(this.duration);
            this._8792();
         }
         this._8785("endFunction");
         if(this.isPlaying)
         {
            this._2855();
         }
         else
         {
            _8791();
         }
      }
      
      private function _8784(param1:Number) : void
      {
         var _loc5_:int = 0;
         if(!timer)
         {
            _8820();
            timer = new Timer(TIMER_RESOLUTION);
            timer.addEventListener(TimerEvent.TIMER,_2619);
            timer.start();
         }
         var _loc2_:int = currentTime + param1;
         var _loc3_:int = -1;
         var _loc4_:int = 0;
         while(_loc4_ < _8787.length)
         {
            _loc5_ = _8787[_loc4_]._8790;
            if(_loc2_ < _loc5_)
            {
               _loc3_ = _loc4_;
               break;
            }
            _loc4_++;
         }
         if(_loc3_ >= 0)
         {
            _8787.splice(_loc3_,0,this);
         }
         else
         {
            _8787.push(this);
         }
         this._8790 = _loc2_;
      }
      
      public function play() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Vector.<_1149> = null;
         var _loc4_:Number = NaN;
         this._2855();
         _loc1_ = 0;
         while(_loc1_ < this.motionPaths.length)
         {
            _loc3_ = this.motionPaths[_loc1_]._8781;
            if(isNaN(_loc3_[0].time))
            {
               _loc3_[0].time = 0;
            }
            else if(_loc3_[0].time > 0)
            {
               _loc4_ = _loc3_[0].time;
               _loc3_.splice(0,0,new _1149(0,null));
               _loc3_.splice(1,0,new _1149(_loc4_ - 1,null));
               if(this._8807)
               {
                  _loc3_[0].value = _loc3_[2].value;
                  _loc3_[1].value = _loc3_[2].value;
               }
            }
            _loc2_ = 1;
            while(_loc2_ < _loc3_.length)
            {
               if(isNaN(_loc3_[_loc2_].time))
               {
                  _loc3_[_loc2_].time = this.duration;
               }
               _loc2_++;
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.motionPaths.length)
         {
            this.motionPaths[_loc1_].ns_egret::_8796(this.duration);
            _loc1_++;
         }
         if(this._8812)
         {
            this._8798 = true;
         }
         if(this.startDelay > 0 && !this._8807)
         {
            this._8784(this.startDelay);
         }
         else
         {
            this.start();
         }
      }
      
      private function seek(param1:Number, param2:Boolean = false) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:Number = NaN;
         this.startTime = this._8795 = _8803 - param1;
         this._8819 = true;
         if(!this._8811 || this._8807)
         {
            _loc3_ = this._8811;
            _8803 = currentTime;
            if(param2 && this.startDelay > 0)
            {
               if(this._8790 >= 0)
               {
                  this._8783();
                  _loc4_ = param1 - this.startDelay;
                  if(this._8807)
                  {
                     _loc4_ -= this.duration;
                  }
                  if(_loc4_ < 0)
                  {
                     this._8784(this.startDelay - param1);
                     return;
                  }
                  param1 -= this.startDelay;
                  if(!this.isPlaying)
                  {
                     this.start();
                  }
                  this.startTime = this._8795 = _8803 - param1;
                  this._8814();
                  this._8819 = false;
                  return;
               }
            }
            if(!_loc3_)
            {
               this._8785("startFunction");
               this._8786();
            }
            this.startTime = this._8795 = _8803 - param1;
         }
         this._8814();
         this._8819 = false;
      }
      
      private function _8786() : void
      {
         var _loc1_:int = 0;
         if(Boolean(this._8759) && Boolean(this.motionPaths))
         {
            _loc1_ = 0;
            while(_loc1_ < this.motionPaths.length)
            {
               this.motionPaths[_loc1_]._8759 = this._8759;
               _loc1_++;
            }
         }
      }
      
      ns_egret function reverse() : void
      {
         if(this._8811)
         {
            this._8812 = false;
            this.seek(this.duration - this._8813);
            this._8798 = !this._8798;
         }
         else
         {
            this._8812 = !this._8812;
         }
      }
      
      public function pause() : void
      {
         if(this._8790 >= 0)
         {
            this._8817 = this._8790 - currentTime;
            this._8783();
         }
         this._8811 = false;
      }
      
      private function _2855() : void
      {
         this._8783();
         if(this.id >= 0)
         {
            Animation._8788(this.id);
            this.id = -1;
            this._8798 = false;
            this._8811 = false;
         }
      }
      
      public function stop() : void
      {
         this._2855();
         this._8785("stopFunction");
      }
      
      public function resume() : void
      {
         this._8811 = true;
         if(this._8817 >= 0)
         {
            this._8784(this._8817);
         }
         else
         {
            this._8795 = _8803 - this._8813;
            this.startTime = _8803 - this._8799;
            if(this._8812)
            {
               this.ns_egret::reverse();
               this._8812 = false;
            }
         }
      }
      
      private function repeat(param1:TimerEvent = null) : void
      {
         if(this._8753 == _1151.REVERSE)
         {
            this._8798 = !this._8798;
         }
         this._8797(0);
         this._8785("repeatFunction");
         this._8792();
         Animation.addAnimation(this);
      }
      
      private function start(param1:TimerEvent = null) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         if(!this._8807 && this._8790 >= 0)
         {
            _loc3_ = currentTime - this._8790;
            if(_loc3_ > 0)
            {
               _loc2_ = Math.min(_loc3_,this.duration);
            }
            this._8783();
         }
         this._8785("startFunction");
         this._8786();
         this._8797(0);
         this._8792();
         Animation.addAnimation(this);
         this.startTime = this._8795;
         this._8811 = true;
         if(_loc2_ > 0)
         {
            this.seek(_loc2_);
         }
         this._8818 = true;
      }
   }
}

