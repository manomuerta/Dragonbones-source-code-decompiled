package _11846
{
   import flash.display.Shape;
   import flash.events.Event;
   import flash.utils.getTimer;
   
   public class Animation
   {
      public static var _12011:_11848;
      
      public static var _12008:_11848;
      
      public static const version:String = "12.1.1";
      
      public static var _12034:Shape = new Shape();
      
      protected static var _12022:Number = -1;
      
      protected static var _12019:Event = new Event("tick");
      
      protected static var _12028:Number = 1e-10;
      
      protected var _12023:Function;
      
      public var _11589:Number;
      
      public var _12015:Number;
      
      public var _active:Boolean;
      
      public var _12039:Boolean;
      
      public var _12029:Boolean;
      
      public var _12018:Number;
      
      public var _12035:Number;
      
      public var _6907:Number;
      
      public var _1892:Number;
      
      public var _12010:Number;
      
      public var _12021:Number;
      
      public var _12020:Number;
      
      public var _12025:Boolean;
      
      public var _12024:_11848;
      
      public var _12033:Boolean;
      
      public var _12030:Boolean;
      
      public var _next:Animation;
      
      public var _12036:Animation;
      
      public var vars:Object;
      
      public var timeline:_11848;
      
      public var data:*;
      
      public function Animation(param1:Number = 0, param2:Object = null)
      {
         super();
         this.vars = param2 || {};
         if(this.vars._12026)
         {
            this.vars = this.vars.vars;
         }
         this._1892 = this._12010 = param1 || 0;
         this._11589 = Number(this.vars.delay) || 0;
         this._12020 = 1;
         this._6907 = this._12035 = 0;
         this.data = this.vars.data;
         this._12015 = -1;
         if(_12011 == null)
         {
            if(_12022 != -1)
            {
               return;
            }
            _12022 = 0;
            _12008 = new _11848();
            _12011 = new _11848();
            _12011._12018 = getTimer() / 1000;
            _12008._12018 = 0;
            _12011._active = _12008._active = true;
            _12034.addEventListener("enterFrame",_12016,false,0,true);
         }
         var _loc3_:_11848 = !!this.vars.useFrames ? _12008 : _12011;
         _loc3_.add(this,_loc3_._12035);
         this._12025 = this.vars.reversed == true;
         if(this.vars.paused)
         {
            this.paused(true);
         }
      }
      
      public static function _12016(param1:Event = null) : void
      {
         ++_12022;
         _12011.render((getTimer() / 1000 - _12011._12018) * _12011._12020,false,false);
         _12008.render((_12022 - _12008._12018) * _12008._12020,false,false);
         _12034.dispatchEvent(_12019);
      }
      
      public function play(param1:* = null, param2:Boolean = true) : *
      {
         if(param1 != null)
         {
            this.seek(param1,param2);
         }
         this.reversed(false);
         return this.paused(false);
      }
      
      public function pause(param1:* = null, param2:Boolean = true) : *
      {
         if(param1 != null)
         {
            this.seek(param1,param2);
         }
         return this.paused(true);
      }
      
      public function resume(param1:* = null, param2:Boolean = true) : *
      {
         if(param1 != null)
         {
            this.seek(param1,param2);
         }
         return this.paused(false);
      }
      
      public function seek(param1:*, param2:Boolean = true) : *
      {
         return this.totalTime(Number(param1),param2);
      }
      
      public function restart(param1:Boolean = false, param2:Boolean = true) : *
      {
         this.reversed(false);
         this.paused(false);
         return this.totalTime(param1 ? -this._11589 : 0,param2,true);
      }
      
      public function reverse(param1:* = null, param2:Boolean = true) : *
      {
         if(param1 != null)
         {
            this.seek(param1 || this._11952(),param2);
         }
         this.reversed(true);
         return this.paused(false);
      }
      
      public function render(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
      {
      }
      
      public function invalidate() : *
      {
         return this;
      }
      
      public function isActive() : Boolean
      {
         var _loc2_:Number = NaN;
         var _loc1_:_11848 = this._12024;
         return _loc1_ == null || !this._12039 && !this._12030 && _loc1_.isActive() && (_loc2_ = _loc1_._12032()) >= this._12018 && _loc2_ < this._12018 + this._11952() / this._12020;
      }
      
      public function _5142(param1:Boolean, param2:Boolean = false) : Boolean
      {
         this._12039 = !param1;
         this._active = Boolean(param1 && !this._12030 && this._6907 > 0 && this._6907 < this._12010);
         if(!param2)
         {
            if(param1 && this.timeline == null)
            {
               this._12024.add(this,this._12018 - this._11589);
            }
            else if(!param1 && this.timeline != null)
            {
               this._12024._12031(this,true);
            }
         }
         return false;
      }
      
      public function _12037(param1:Object = null, param2:Object = null) : Boolean
      {
         return this._5142(false,false);
      }
      
      public function _12038(param1:Object = null, param2:Object = null) : *
      {
         this._12037(param1,param2);
         return this;
      }
      
      protected function _12027(param1:Boolean) : *
      {
         var _loc2_:Animation = param1 ? this : this.timeline;
         while(_loc2_)
         {
            _loc2_._12033 = true;
            _loc2_ = _loc2_.timeline;
         }
         return this;
      }
      
      protected function _12009(param1:Array) : Array
      {
         var _loc2_:int = int(param1.length);
         var _loc3_:Array = param1.concat();
         while(--_loc2_ > -1)
         {
            if(param1[_loc2_] === "{self}")
            {
               _loc3_[_loc2_] = this;
            }
         }
         return _loc3_;
      }
      
      public function _12012(param1:String, param2:Function = null, param3:Array = null) : *
      {
         if(param1 == null)
         {
            return null;
         }
         if(param1.substr(0,2) == "on")
         {
            if(arguments.length == 1)
            {
               return this.vars[param1];
            }
            if(param2 == null)
            {
               delete this.vars[param1];
            }
            else
            {
               this.vars[param1] = param2;
               this.vars[param1 + "Params"] = param3 is Array && param3.join("").indexOf("{self}") !== -1 ? this._12009(param3) : param3;
            }
            if(param1 == "onUpdate")
            {
               this._12023 = param2;
            }
         }
         return this;
      }
      
      public function delay(param1:Number = NaN) : *
      {
         if(!arguments.length)
         {
            return this._11589;
         }
         if(this._12024.smoothChildTiming)
         {
            this.startTime(this._12018 + param1 - this._11589);
         }
         this._11589 = param1;
         return this;
      }
      
      public function duration(param1:Number = NaN) : *
      {
         if(!arguments.length)
         {
            this._12033 = false;
            return this._1892;
         }
         this._1892 = this._12010 = param1;
         this._12027(true);
         if(this._12024.smoothChildTiming)
         {
            if(this._12035 > 0)
            {
               if(this._12035 < this._1892)
               {
                  if(param1 != 0)
                  {
                     this.totalTime(this._6907 * (param1 / this._1892),true);
                  }
               }
            }
         }
         return this;
      }
      
      public function _11952(param1:Number = NaN) : *
      {
         this._12033 = false;
         return !arguments.length ? this._12010 : this.duration(param1);
      }
      
      public function time(param1:Number = NaN, param2:Boolean = false) : *
      {
         if(!arguments.length)
         {
            return this._12035;
         }
         if(this._12033)
         {
            this._11952();
         }
         if(param1 > this._1892)
         {
            param1 = this._1892;
         }
         return this.totalTime(param1,param2);
      }
      
      public function totalTime(param1:Number = NaN, param2:Boolean = false, param3:Boolean = false) : *
      {
         var _loc5_:_11848 = null;
         if(!arguments.length)
         {
            return this._6907;
         }
         if(this._12024)
         {
            if(param1 < 0 && !param3)
            {
               param1 += this._11952();
            }
            if(this._12024.smoothChildTiming)
            {
               if(this._12033)
               {
                  this._11952();
               }
               if(param1 > this._12010 && !param3)
               {
                  param1 = this._12010;
               }
               _loc5_ = this._12024;
               this._12018 = (this._12030 ? this._12021 : _loc5_._12035) - (!this._12025 ? param1 : this._12010 - param1) / this._12020;
               if(!this._12024._12033)
               {
                  this._12027(false);
               }
               if(_loc5_._12024 != null)
               {
                  while(_loc5_._12024)
                  {
                     if(_loc5_._12024._12035 !== (_loc5_._12018 + _loc5_._6907) / _loc5_._12020)
                     {
                        _loc5_.totalTime(_loc5_._6907,true);
                     }
                     _loc5_ = _loc5_._12024;
                  }
               }
            }
            if(this._12039)
            {
               this._5142(true,false);
            }
            if(this._6907 != param1 || this._1892 === 0)
            {
               this.render(param1,param2,false);
            }
         }
         return this;
      }
      
      public function progress(param1:Number = NaN, param2:Boolean = false) : *
      {
         return !arguments.length ? this._12035 / this.duration() : this.totalTime(this.duration() * param1,param2);
      }
      
      public function _12013(param1:Number = NaN, param2:Boolean = false) : *
      {
         return !arguments.length ? this._12035 / this.duration() : this.totalTime(this.duration() * param1,param2);
      }
      
      public function startTime(param1:Number = NaN) : *
      {
         if(!arguments.length)
         {
            return this._12018;
         }
         if(param1 != this._12018)
         {
            this._12018 = param1;
            if(this.timeline)
            {
               if(this.timeline._12014)
               {
                  this.timeline.add(this,param1 - this._11589);
               }
            }
         }
         return this;
      }
      
      public function timeScale(param1:Number = NaN) : *
      {
         var _loc3_:Number = NaN;
         if(!arguments.length)
         {
            return this._12020;
         }
         param1 ||= 0.000001;
         if(Boolean(this._12024) && this._12024.smoothChildTiming)
         {
            _loc3_ = Boolean(this._12021) || this._12021 == 0 ? this._12021 : this._12024._6907;
            this._12018 = _loc3_ - (_loc3_ - this._12018) * this._12020 / param1;
         }
         this._12020 = param1;
         return this._12027(false);
      }
      
      public function reversed(param1:Boolean = false) : *
      {
         if(!arguments.length)
         {
            return this._12025;
         }
         if(param1 != this._12025)
         {
            this._12025 = param1;
            this.totalTime(Boolean(this._12024) && !this._12024.smoothChildTiming ? this._11952() - this._6907 : this._6907,true);
         }
         return this;
      }
      
      public function paused(param1:Boolean = false) : *
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(!arguments.length)
         {
            return this._12030;
         }
         if(param1 != this._12030)
         {
            if(this._12024)
            {
               _loc3_ = this._12024._12032();
               _loc4_ = _loc3_ - this._12021;
               if(!param1 && this._12024.smoothChildTiming)
               {
                  this._12018 += _loc4_;
                  this._12027(false);
               }
               this._12021 = param1 ? _loc3_ : NaN;
               this._12030 = param1;
               this._active = !param1 && this._6907 > 0 && this._6907 < this._12010;
               if(!param1 && _loc4_ != 0 && this._12029 && this.duration() !== 0)
               {
                  this.render(this._12024.smoothChildTiming ? this._6907 : (_loc3_ - this._12018) / this._12020,true,true);
               }
            }
         }
         if(this._12039 && !param1)
         {
            this._5142(true,false);
         }
         return this;
      }
   }
}

