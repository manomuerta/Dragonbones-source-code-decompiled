package _11845
{
   import _11846.Animation;
   import _11846._11847;
   import _11846._11848;
   import _11885._1183;
   import _11910.*;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.utils.getTimer;
   
   public class _11950 extends _11949 implements IEventDispatcher
   {
      public static const version:String = "12.1.5";
      
      protected static var _12392:Object = {
         "onCompleteListener":_1183.COMPLETE,
         "onUpdateListener":_1183.UPDATE,
         "onStartListener":_1183.START,
         "onRepeatListener":_1183.REPEAT,
         "onReverseCompleteListener":_1183.REVERSE_COMPLETE
      };
      
      public static var _12034:Shape = Animation._12034;
      
      public static var _12432:Function = _12385;
      
      public static var _12431:Function = _12379;
      
      public static var _12426:Function = _12377;
      
      _11944.activate([_11909,_11920,_11926,_11933,_11942,_11945,_11946,_11911,_11912,_11913,_11914,_11916,_11917,_11919,_11925,_11927,_11928,_11934,_11939]);
      
      protected var _9086:EventDispatcher;
      
      protected var _12389:Boolean;
      
      protected var _6452:int = 0;
      
      protected var _8377:Number = 0;
      
      protected var _12398:int = 0;
      
      public var _12399:Boolean;
      
      public function _11950(param1:Object, param2:Number, param3:Object)
      {
         super(param1,param2,param3);
         this._12399 = this.vars.yoyo == true;
         this._6452 = int(this.vars.repeat);
         this._8377 = Number(this.vars.repeatDelay) || 0;
         _12033 = true;
         if(Boolean(this.vars.onCompleteListener) || Boolean(this.vars.onUpdateListener) || Boolean(this.vars.onStartListener) || Boolean(this.vars.onRepeatListener) || Boolean(this.vars.onReverseCompleteListener))
         {
            this._12391();
            if(_1892 == 0)
            {
               if(_11589 == 0)
               {
                  if(this.vars.immediateRender)
                  {
                     this._9086.dispatchEvent(new _1183(_1183.UPDATE));
                     this._9086.dispatchEvent(new _1183(_1183.COMPLETE));
                  }
               }
            }
         }
      }
      
      public static function _12409(param1:*, param2:* = false, param3:Object = null) : void
      {
         _11949._12409(param1,param2,param3);
      }
      
      public static function _12401(param1:Function) : void
      {
         _11949._12409(param1);
      }
      
      public static function _12380(param1:*, param2:Boolean = false) : Array
      {
         return _11949._12380(param1,param2);
      }
      
      public static function to(param1:Object, param2:Number, param3:Object) : _11950
      {
         return new _11950(param1,param2,param3);
      }
      
      public static function from(param1:Object, param2:Number, param3:Object) : _11950
      {
         param3 = _12384(param3,true);
         param3.runBackwards = true;
         return new _11950(param1,param2,param3);
      }
      
      public static function _12049(param1:Object, param2:Number, param3:Object, param4:Object) : _11950
      {
         param4 = _12384(param4,false);
         param3 = _12384(param3,false);
         param4.startAt = param3;
         param4.immediateRender = param4.immediateRender != false && param3.immediateRender != false;
         return new _11950(param1,param2,param4);
      }
      
      public static function _12385(param1:Array, param2:Number, param3:Object, param4:Number = 0, param5:Function = null, param6:Array = null) : Array
      {
         var copy:Object = null;
         var i:int = 0;
         var p:String = null;
         var targets:Array = param1;
         var duration:Number = param2;
         var vars:Object = param3;
         var stagger:Number = param4;
         var onCompleteAll:Function = param5;
         var onCompleteAllParams:Array = param6;
         vars = _12384(vars,false);
         var a:Array = [];
         var l:int = int(targets.length);
         var delay:Number = Number(Number(vars.delay) || 0);
         i = 0;
         while(i < l)
         {
            copy = {};
            for(p in vars)
            {
               copy[p] = vars[p];
            }
            copy.delay = delay;
            if(i == l - 1)
            {
               if(onCompleteAll != null)
               {
                  copy.onComplete = function():void
                  {
                     if(vars.onComplete)
                     {
                        vars.onComplete.apply(null,arguments);
                     }
                     onCompleteAll.apply(null,onCompleteAllParams);
                  };
               }
            }
            a[i] = new _11950(targets[i],duration,copy);
            delay += stagger;
            i++;
         }
         return a;
      }
      
      public static function _12379(param1:Array, param2:Number, param3:Object, param4:Number = 0, param5:Function = null, param6:Array = null) : Array
      {
         param3 = _12384(param3,true);
         param3.runBackwards = true;
         if(param3.immediateRender != false)
         {
            param3.immediateRender = true;
         }
         return _12385(param1,param2,param3,param4,param5,param6);
      }
      
      public static function _12377(param1:Array, param2:Number, param3:Object, param4:Object, param5:Number = 0, param6:Function = null, param7:Array = null) : Array
      {
         param4 = _12384(param4,false);
         param3 = _12384(param3,false);
         param4.startAt = param3;
         param4.immediateRender = param4.immediateRender != false && param3.immediateRender != false;
         return _12385(param1,param2,param4,param5,param6,param7);
      }
      
      public static function _12381(param1:Number, param2:Function, param3:Array = null, param4:Boolean = false) : _11950
      {
         return new _11950(param2,0,{
            "delay":param1,
            "onComplete":param2,
            "onCompleteParams":param3,
            "onReverseComplete":param2,
            "onReverseCompleteParams":param3,
            "immediateRender":false,
            "useFrames":param4,
            "overwrite":0
         });
      }
      
      public static function set(param1:Object, param2:Object) : _11950
      {
         return new _11950(param1,0,param2);
      }
      
      public static function _12425(param1:Object) : Boolean
      {
         return _11949._12380(param1,true).length > 0;
      }
      
      public static function _12424(param1:Boolean = false) : Array
      {
         var _loc2_:Array = _12422(_12011,param1);
         return _loc2_.concat(_12422(_12008,param1));
      }
      
      protected static function _12422(param1:_11848, param2:Boolean) : Array
      {
         if(param1 == null)
         {
            return [];
         }
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         var _loc5_:Animation = param1._3072;
         while(_loc5_)
         {
            if(_loc5_ is _11949)
            {
               var _loc6_:*;
               _loc3_[_loc6_ = _loc4_++] = _loc5_;
            }
            else
            {
               if(param2)
               {
                  _loc3_[_loc6_ = _loc4_++] = _loc5_;
               }
               _loc3_ = _loc3_.concat(_12422(_11848(_loc5_),param2));
               _loc4_ = int(_loc3_.length);
            }
            _loc5_ = _loc5_._next;
         }
         return _loc3_;
      }
      
      public static function _12430(param1:Boolean = false, param2:Boolean = true, param3:Boolean = true, param4:Boolean = true) : void
      {
         var _loc7_:Boolean = false;
         var _loc9_:Animation = null;
         var _loc10_:int = 0;
         var _loc5_:Array = _12424(param4);
         var _loc6_:int = int(_loc5_.length);
         var _loc8_:Boolean = param2 && param3 && param4;
         _loc10_ = 0;
         while(_loc10_ < _loc6_)
         {
            _loc9_ = _loc5_[_loc10_];
            if(_loc8_ || _loc9_ is _11848 || (_loc7_ = _11949(_loc9_).target == _11949(_loc9_).vars.onComplete) && param3 || param2 && !_loc7_)
            {
               if(param1)
               {
                  _loc9_.totalTime(_loc9_._12025 ? 0 : _loc9_._11952());
               }
               else
               {
                  _loc9_._5142(false,false);
               }
            }
            _loc10_++;
         }
      }
      
      public static function _12419(param1:DisplayObjectContainer, param2:Boolean = false) : void
      {
         var _loc5_:int = 0;
         var _loc3_:Array = _12424(false);
         var _loc4_:int = int(_loc3_.length);
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            if(_12420(param1,_loc3_[_loc5_].target))
            {
               if(param2)
               {
                  _loc3_[_loc5_].totalTime(_loc3_[_loc5_]._11952());
               }
               else
               {
                  _loc3_[_loc5_]._5142(false,false);
               }
            }
            _loc5_++;
         }
      }
      
      private static function _12420(param1:DisplayObjectContainer, param2:Object) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:DisplayObjectContainer = null;
         if(param2 is Array)
         {
            _loc3_ = int(param2.length);
            while(--_loc3_ > -1)
            {
               if(_12420(param1,param2[_loc3_]))
               {
                  return true;
               }
            }
         }
         else if(param2 is DisplayObject)
         {
            _loc4_ = param2.parent;
            while(_loc4_)
            {
               if(_loc4_ == param1)
               {
                  return true;
               }
               _loc4_ = _loc4_.parent;
            }
         }
         return false;
      }
      
      public static function _12428(param1:Boolean = true, param2:Boolean = true, param3:Boolean = true) : void
      {
         _12423(true,param1,param2,param3);
      }
      
      public static function _12427(param1:Boolean = true, param2:Boolean = true, param3:Boolean = true) : void
      {
         _12423(false,param1,param2,param3);
      }
      
      private static function _12423(param1:Boolean, param2:Boolean = true, param3:Boolean = false, param4:Boolean = true) : void
      {
         var _loc6_:Boolean = false;
         var _loc7_:Animation = null;
         var _loc5_:Array = _12424(param4);
         var _loc8_:Boolean = param2 && param3 && param4;
         var _loc9_:int = int(_loc5_.length);
         while(--_loc9_ > -1)
         {
            _loc7_ = _loc5_[_loc9_];
            _loc6_ = _loc7_ is _11949 && _11949(_loc7_).target == _loc7_.vars.onComplete;
            if(_loc8_ || _loc7_ is _11848 || _loc6_ && param3 || param2 && !_loc6_)
            {
               _loc7_.paused(param1);
            }
         }
      }
      
      public static function _12421(param1:Number = NaN) : Number
      {
         if(!arguments.length)
         {
            return _12011 == null ? 1 : _12011._12020;
         }
         param1 ||= 0.0001;
         if(_12011 == null)
         {
            _11949.to({},0,{});
         }
         var _loc3_:_11848 = _12011;
         var _loc4_:Number = getTimer() / 1000;
         _loc3_._12018 = _loc4_ - (_loc4_ - _loc3_._12018) * _loc3_._12020 / param1;
         _loc3_ = _12008;
         _loc4_ = _12022;
         _loc3_._12018 = _loc4_ - (_loc4_ - _loc3_._12018) * _loc3_._12020 / param1;
         _12008._12020 = _12011._12020 = param1;
         return param1;
      }
      
      override public function invalidate() : *
      {
         this._12399 = Boolean(this.vars.yoyo == true);
         this._6452 = int(this.vars.repeat) || 0;
         this._8377 = Number(this.vars.repeatDelay) || 0;
         this._12389 = false;
         this._12391();
         _12027(true);
         return super.invalidate();
      }
      
      public function _12429(param1:Object, param2:Boolean = false) : *
      {
         var _loc4_:String = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:_11847 = null;
         var _loc8_:Number = NaN;
         var _loc3_:Number = ratio;
         if(param2)
         {
            if(_12018 < _12024._12035)
            {
               _12018 = _12024._12035;
               _12027(false);
               if(_12039)
               {
                  _5142(true,false);
               }
               else
               {
                  _12024.insert(this,_12018 - _11589);
               }
            }
         }
         for(_loc4_ in param1)
         {
            this.vars[_loc4_] = param1[_loc4_];
         }
         if(_12029)
         {
            if(param2)
            {
               _12029 = false;
            }
            else
            {
               if(_12039)
               {
                  _5142(true,false);
               }
               if(_12400)
               {
                  if(_12334 != null)
                  {
                     _12366("_onDisable",this);
                  }
               }
               if(_12035 / _1892 > 0.998)
               {
                  _loc5_ = _12035;
                  this.render(0,true,false);
                  _12029 = false;
                  this.render(_loc5_,true,false);
               }
               else if(_12035 > 0)
               {
                  _12029 = false;
                  _init();
                  _loc6_ = 1 / (1 - _loc3_);
                  _loc7_ = _12334;
                  while(_loc7_)
                  {
                     _loc8_ = _loc7_.s + _loc7_.c;
                     _loc7_.c *= _loc6_;
                     _loc7_.s = _loc8_ - _loc7_.c;
                     _loc7_ = _loc7_._next;
                  }
               }
            }
         }
         return this;
      }
      
      override public function render(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
      {
         var _loc8_:Boolean = false;
         var _loc9_:String = null;
         var _loc10_:_11847 = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         if(!_12029)
         {
            if(_1892 === 0 && Boolean(vars.repeat))
            {
               this.invalidate();
            }
         }
         var _loc4_:Number = !_12033 ? _12010 : this._11952();
         var _loc5_:Number = _12035;
         var _loc6_:Number = _6907;
         var _loc7_:Number = this._12398;
         if(param1 >= _loc4_)
         {
            _6907 = _loc4_;
            this._12398 = this._6452;
            if(this._12399 && (this._12398 & 1) != 0)
            {
               _12035 = 0;
               ratio = _12418._12054 ? _12418._12050(0) : 0;
            }
            else
            {
               _12035 = _1892;
               ratio = _12418._12054 ? _12418._12050(1) : 1;
            }
            if(!_12025)
            {
               _loc8_ = true;
               _loc9_ = "onComplete";
            }
            if(_1892 == 0)
            {
               _loc11_ = _12015;
               if(_12018 === _12024._1892)
               {
                  param1 = 0;
               }
               if(param1 === 0 || _loc11_ < 0 || _loc11_ === _12028)
               {
                  if(_loc11_ !== param1)
                  {
                     param3 = true;
                     if(_loc11_ > _12028)
                     {
                        _loc9_ = "onReverseComplete";
                     }
                  }
               }
               _12015 = _loc11_ = !param2 || param1 !== 0 || _12015 === param1 ? param1 : _12028;
            }
         }
         else if(param1 < 1e-7)
         {
            _6907 = _12035 = this._12398 = 0;
            ratio = _12418._12054 ? _12418._12050(0) : 0;
            if(_loc6_ !== 0 || _1892 === 0 && _12015 > 0 && _12015 !== _12028)
            {
               _loc9_ = "onReverseComplete";
               _loc8_ = _12025;
            }
            if(param1 < 0)
            {
               _active = false;
               if(_1892 == 0)
               {
                  if(_12015 >= 0)
                  {
                     param3 = true;
                  }
                  _12015 = _loc11_ = !param2 || param1 !== 0 || _12015 === param1 ? param1 : _12028;
               }
            }
            else if(!_12029)
            {
               param3 = true;
            }
         }
         else
         {
            _6907 = _12035 = param1;
            if(this._6452 != 0)
            {
               _loc12_ = _1892 + this._8377;
               this._12398 = _6907 / _loc12_ >> 0;
               if(this._12398 !== 0)
               {
                  if(this._12398 === _6907 / _loc12_)
                  {
                     --this._12398;
                  }
               }
               _12035 = _6907 - this._12398 * _loc12_;
               if(this._12399)
               {
                  if((this._12398 & 1) != 0)
                  {
                     _12035 = _1892 - _12035;
                  }
               }
               if(_12035 > _1892)
               {
                  _12035 = _1892;
               }
               else if(_12035 < 0)
               {
                  _12035 = 0;
               }
            }
            if(_12415)
            {
               _loc13_ = _12035 / _1892;
               _loc14_ = _12415;
               _loc15_ = _12411;
               if(_loc14_ == 1 || _loc14_ == 3 && _loc13_ >= 0.5)
               {
                  _loc13_ = 1 - _loc13_;
               }
               if(_loc14_ == 3)
               {
                  _loc13_ *= 2;
               }
               if(_loc15_ == 1)
               {
                  _loc13_ *= _loc13_;
               }
               else if(_loc15_ == 2)
               {
                  _loc13_ *= _loc13_ * _loc13_;
               }
               else if(_loc15_ == 3)
               {
                  _loc13_ *= _loc13_ * _loc13_ * _loc13_;
               }
               else if(_loc15_ == 4)
               {
                  _loc13_ *= _loc13_ * _loc13_ * _loc13_ * _loc13_;
               }
               if(_loc14_ == 1)
               {
                  ratio = 1 - _loc13_;
               }
               else if(_loc14_ == 2)
               {
                  ratio = _loc13_;
               }
               else if(_12035 / _1892 < 0.5)
               {
                  ratio = _loc13_ / 2;
               }
               else
               {
                  ratio = 1 - _loc13_ / 2;
               }
            }
            else
            {
               ratio = _12418._12050(_12035 / _1892);
            }
         }
         if(_loc5_ == _12035 && !param3 && this._12398 === _loc7_)
         {
            if(_loc6_ !== _6907)
            {
               if(_12023 != null)
               {
                  if(!param2)
                  {
                     _12023.apply(vars.onUpdateScope || this,vars.onUpdateParams);
                  }
               }
            }
            return;
         }
         if(!_12029)
         {
            _init();
            if(!_12029 || _12039)
            {
               return;
            }
            if(Boolean(_12035) && !_loc8_)
            {
               ratio = _12418._12050(_12035 / _1892);
            }
            else if(_loc8_ && _12418._12054)
            {
               ratio = _12418._12050(_12035 === 0 ? 0 : 1);
            }
         }
         if(!_active)
         {
            if(!_12030 && _12035 !== _loc5_ && param1 >= 0)
            {
               _active = true;
            }
         }
         if(_loc6_ == 0)
         {
            if(_12417 != null)
            {
               if(param1 >= 0)
               {
                  _12417.render(param1,param2,param3);
               }
               else if(!_loc9_)
               {
                  _loc9_ = "_dummyGS";
               }
            }
            if(_6907 != 0 || _1892 == 0)
            {
               if(!param2)
               {
                  if(vars.onStart)
                  {
                     vars.onStart.apply(null,vars.onStartParams);
                  }
                  if(this._9086)
                  {
                     this._9086.dispatchEvent(new _1183(_1183.START));
                  }
               }
            }
         }
         _loc10_ = _12334;
         while(_loc10_)
         {
            if(_loc10_.f)
            {
               _loc10_.t[_loc10_.p](_loc10_.c * ratio + _loc10_.s);
            }
            else
            {
               _loc10_.t[_loc10_.p] = _loc10_.c * ratio + _loc10_.s;
            }
            _loc10_ = _loc10_._next;
         }
         if(_12023 != null)
         {
            if(param1 < 0 && _12417 != null && _12018 != 0)
            {
               _12417.render(param1,param2,param3);
            }
            if(!param2)
            {
               if(_6907 !== _loc6_ || _loc8_)
               {
                  _12023.apply(null,vars.onUpdateParams);
               }
            }
         }
         if(this._12389)
         {
            if(param1 < 0 && _12417 != null && _12023 == null && _12018 != 0)
            {
               _12417.render(param1,param2,param3);
            }
            if(!param2)
            {
               this._9086.dispatchEvent(new _1183(_1183.UPDATE));
            }
         }
         if(this._12398 != _loc7_)
         {
            if(!param2)
            {
               if(!_12039)
               {
                  if(vars.onRepeat)
                  {
                     vars.onRepeat.apply(null,vars.onRepeatParams);
                  }
                  if(this._9086)
                  {
                     this._9086.dispatchEvent(new _1183(_1183.REPEAT));
                  }
               }
            }
         }
         if(_loc9_)
         {
            if(!_12039)
            {
               if(param1 < 0 && _12417 != null && _12023 == null && !this._12389 && _12018 != 0)
               {
                  _12417.render(param1,param2,true);
               }
               if(_loc8_)
               {
                  if(_12024._12041)
                  {
                     _5142(false,false);
                  }
                  _active = false;
               }
               if(!param2)
               {
                  if(vars[_loc9_])
                  {
                     vars[_loc9_].apply(null,vars[_loc9_ + "Params"]);
                  }
                  if(this._9086)
                  {
                     this._9086.dispatchEvent(new _1183(_loc9_ == "onComplete" ? _1183.COMPLETE : _1183.REVERSE_COMPLETE));
                  }
               }
               if(_1892 === 0 && _12015 === _12028 && _loc11_ !== _12028)
               {
                  _12015 = 0;
               }
            }
         }
      }
      
      protected function _12391() : Boolean
      {
         var _loc2_:String = null;
         var _loc1_:Boolean = false;
         for(_loc2_ in _12392)
         {
            if(_loc2_ in vars)
            {
               if(vars[_loc2_] is Function)
               {
                  if(this._9086 == null)
                  {
                     this._9086 = new EventDispatcher(this);
                  }
                  this._9086.addEventListener(_12392[_loc2_],vars[_loc2_],false,0,true);
                  _loc1_ = true;
               }
            }
         }
         return _loc1_;
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         if(this._9086 == null)
         {
            this._9086 = new EventDispatcher(this);
         }
         if(param1 == _1183.UPDATE)
         {
            this._12389 = true;
         }
         this._9086.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         if(this._9086)
         {
            this._9086.removeEventListener(param1,param2,param3);
         }
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._9086 == null ? false : this._9086.hasEventListener(param1);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._9086 == null ? false : this._9086.willTrigger(param1);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._9086 == null ? false : this._9086.dispatchEvent(param1);
      }
      
      override public function progress(param1:Number = NaN, param2:Boolean = false) : *
      {
         return !arguments.length ? _12035 / this.duration() : totalTime(this.duration() * (this._12399 && (this._12398 & 1) !== 0 ? 1 - param1 : param1) + this._12398 * (_1892 + this._8377),param2);
      }
      
      override public function _12013(param1:Number = NaN, param2:Boolean = false) : *
      {
         return !arguments.length ? _6907 / this._11952() : totalTime(this._11952() * param1,param2);
      }
      
      override public function time(param1:Number = NaN, param2:Boolean = false) : *
      {
         if(!arguments.length)
         {
            return _12035;
         }
         if(_12033)
         {
            this._11952();
         }
         if(param1 > _1892)
         {
            param1 = _1892;
         }
         if(this._12399 && (this._12398 & 1) !== 0)
         {
            param1 = _1892 - param1 + this._12398 * (_1892 + this._8377);
         }
         else if(this._6452 != 0)
         {
            param1 += this._12398 * (_1892 + this._8377);
         }
         return totalTime(param1,param2);
      }
      
      override public function duration(param1:Number = NaN) : *
      {
         if(!arguments.length)
         {
            return this._1892;
         }
         return super.duration(param1);
      }
      
      override public function _11952(param1:Number = NaN) : *
      {
         if(!arguments.length)
         {
            if(_12033)
            {
               _12010 = this._6452 == -1 ? 999999999999 : _1892 * (this._6452 + 1) + this._8377 * this._6452;
               _12033 = false;
            }
            return _12010;
         }
         return this._6452 == -1 ? this : this.duration((param1 - this._6452 * this._8377) / (this._6452 + 1));
      }
      
      public function repeat(param1:int = 0) : *
      {
         if(!arguments.length)
         {
            return this._6452;
         }
         this._6452 = param1;
         return _12027(true);
      }
      
      public function repeatDelay(param1:Number = NaN) : *
      {
         if(!arguments.length)
         {
            return this._8377;
         }
         this._8377 = param1;
         return _12027(true);
      }
      
      public function yoyo(param1:Boolean = false) : *
      {
         if(!arguments.length)
         {
            return this._12399;
         }
         this._12399 = param1;
         return this;
      }
   }
}

