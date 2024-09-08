package _11845
{
   import _11846.Animation;
   import _11846._11847;
   import _11846._11848;
   import _11852._11866;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.utils.Dictionary;
   
   public class _11949 extends Animation
   {
      public static var _12366:Function;
      
      protected static var _12403:Object;
      
      public static const version:String = "12.1.5";
      
      public static var _12410:_11866 = new _11866(null,null,1,1);
      
      public static var _12043:String = "auto";
      
      public static var _12034:Shape = Animation._12034;
      
      public static var _12047:Object = {};
      
      protected static var _12407:Dictionary = new Dictionary(false);
      
      protected static var _12405:Object = {
         "ease":1,
         "delay":1,
         "overwrite":1,
         "onComplete":1,
         "onCompleteParams":1,
         "onCompleteScope":1,
         "useFrames":1,
         "runBackwards":1,
         "startAt":1,
         "onUpdate":1,
         "onUpdateParams":1,
         "onUpdateScope":1,
         "onStart":1,
         "onStartParams":1,
         "onStartScope":1,
         "onReverseComplete":1,
         "onReverseCompleteParams":1,
         "onReverseCompleteScope":1,
         "onRepeat":1,
         "onRepeatParams":1,
         "onRepeatScope":1,
         "easeParams":1,
         "yoyo":1,
         "onCompleteListener":1,
         "onUpdateListener":1,
         "onStartListener":1,
         "onReverseCompleteListener":1,
         "onRepeatListener":1,
         "orientToBezier":1,
         "immediateRender":1,
         "repeat":1,
         "repeatDelay":1,
         "data":1,
         "paused":1,
         "reversed":1
      };
      
      public var target:Object;
      
      public var ratio:Number;
      
      public var _12345:Object;
      
      public var _12334:_11847;
      
      protected var _8841:Array;
      
      public var _12418:_11866;
      
      protected var _12415:int;
      
      protected var _12411:int;
      
      protected var _12416:Array;
      
      protected var _12412:int;
      
      protected var _12402:Object;
      
      protected var _12400:Boolean;
      
      protected var _12417:_11949;
      
      public function _11949(param1:Object, param2:Number, param3:Object)
      {
         var _loc4_:int = 0;
         super(param2,param3);
         if(param1 == null)
         {
            throw new Error("Cannot tween a null object. Duration: " + param2 + ", data: " + this.data);
         }
         if(!_12403)
         {
            _12403 = {
               "none":0,
               "all":1,
               "auto":2,
               "concurrent":3,
               "allOnStart":4,
               "preexisting":5,
               "true":1,
               "false":0
            };
            _12034.addEventListener("enterFrame",_12408,false,-1,true);
         }
         this.ratio = 0;
         this.target = param1;
         this._12418 = _12410;
         this._12412 = !("overwrite" in this.vars) ? int(_12403[_12043]) : (typeof this.vars.overwrite === "number" ? this.vars.overwrite >> 0 : int(_12403[this.vars.overwrite]));
         if(this.target is Array && typeof this.target[0] === "object")
         {
            this._8841 = this.target.concat();
            this._12345 = [];
            this._12416 = [];
            _loc4_ = int(this._8841.length);
            while(--_loc4_ > -1)
            {
               this._12416[_loc4_] = _12414(this._8841[_loc4_],this,false);
               if(this._12412 == 1)
               {
                  if(this._12416[_loc4_].length > 1)
                  {
                     _12404(this._8841[_loc4_],this,null,1,this._12416[_loc4_]);
                  }
               }
            }
         }
         else
         {
            this._12345 = {};
            this._12416 = _12407[param1];
            if(this._12416 == null)
            {
               this._12416 = _12407[param1] = [this];
            }
            else
            {
               this._12416[this._12416.length] = this;
               if(this._12412 == 1)
               {
                  _12404(param1,this,null,1,this._12416);
               }
            }
         }
         if(Boolean(this.vars.immediateRender) || param2 == 0 && _11589 == 0 && this.vars.immediateRender != false)
         {
            this.render(-_11589,false,true);
         }
      }
      
      public static function to(param1:Object, param2:Number, param3:Object) : _11949
      {
         return new _11949(param1,param2,param3);
      }
      
      public static function from(param1:Object, param2:Number, param3:Object) : _11949
      {
         param3 = _12384(param3,true);
         param3.runBackwards = true;
         return new _11949(param1,param2,param3);
      }
      
      public static function _12049(param1:Object, param2:Number, param3:Object, param4:Object) : _11949
      {
         param4 = _12384(param4,true);
         param3 = _12384(param3);
         param4.startAt = param3;
         param4.immediateRender = param4.immediateRender != false && param3.immediateRender != false;
         return new _11949(param1,param2,param4);
      }
      
      protected static function _12384(param1:Object, param2:Boolean = false) : Object
      {
         if(param1._12026)
         {
            param1 = param1.vars;
         }
         if(param2 && !("immediateRender" in param1))
         {
            param1.immediateRender = true;
         }
         return param1;
      }
      
      public static function _12381(param1:Number, param2:Function, param3:Array = null, param4:Boolean = false) : _11949
      {
         return new _11949(param2,0,{
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
      
      public static function set(param1:Object, param2:Object) : _11949
      {
         return new _11949(param1,0,param2);
      }
      
      private static function _12408(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:Object = null;
         if(_12022 / 60 >> 0 === _12022 / 60)
         {
            for(_loc4_ in _12407)
            {
               _loc3_ = _12407[_loc4_];
               _loc2_ = int(_loc3_.length);
               while(--_loc2_ > -1)
               {
                  if(_loc3_[_loc2_]._12039)
                  {
                     _loc3_.splice(_loc2_,1);
                  }
               }
               if(_loc3_.length === 0)
               {
                  delete _12407[_loc4_];
               }
            }
         }
      }
      
      public static function _12409(param1:*, param2:* = false, param3:Object = null) : void
      {
         if(typeof param2 === "object")
         {
            param3 = param2;
            param2 = false;
         }
         var _loc4_:Array = _11949._12380(param1,param2);
         var _loc5_:int = int(_loc4_.length);
         while(--_loc5_ > -1)
         {
            _loc4_[_loc5_]._12037(param3,param1);
         }
      }
      
      public static function _12401(param1:Function) : void
      {
         _12409(param1);
      }
      
      public static function _12380(param1:*, param2:Boolean = false) : Array
      {
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:_11949 = null;
         if(param1 is Array && typeof param1[0] != "string" && typeof param1[0] != "number")
         {
            _loc3_ = int(param1.length);
            _loc4_ = [];
            while(--_loc3_ > -1)
            {
               _loc4_ = _loc4_.concat(_12380(param1[_loc3_],param2));
            }
            _loc3_ = int(_loc4_.length);
            while(--_loc3_ > -1)
            {
               _loc6_ = _loc4_[_loc3_];
               _loc5_ = _loc3_;
               while(--_loc5_ > -1)
               {
                  if(_loc6_ === _loc4_[_loc5_])
                  {
                     _loc4_.splice(_loc3_,1);
                  }
               }
            }
         }
         else
         {
            _loc4_ = _12414(param1).concat();
            _loc3_ = int(_loc4_.length);
            while(--_loc3_ > -1)
            {
               if(Boolean(_loc4_[_loc3_]._12039) || param2 && !_loc4_[_loc3_].isActive())
               {
                  _loc4_.splice(_loc3_,1);
               }
            }
         }
         return _loc4_;
      }
      
      protected static function _12414(param1:Object, param2:_11949 = null, param3:Boolean = false) : Array
      {
         var _loc5_:int = 0;
         var _loc4_:Array = _12407[param1];
         if(_loc4_ == null)
         {
            _loc4_ = _12407[param1] = [];
         }
         if(param2)
         {
            _loc5_ = int(_loc4_.length);
            _loc4_[_loc5_] = param2;
            if(param3)
            {
               while(--_loc5_ > -1)
               {
                  if(_loc4_[_loc5_] === param2)
                  {
                     _loc4_.splice(_loc5_,1);
                  }
               }
            }
         }
         return _loc4_;
      }
      
      protected static function _12404(param1:Object, param2:_11949, param3:Object, param4:int, param5:Array) : Boolean
      {
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:_11949 = null;
         var _loc13_:Number = NaN;
         var _loc14_:int = 0;
         if(param4 == 1 || param4 >= 4)
         {
            _loc14_ = int(param5.length);
            _loc6_ = 0;
            while(_loc6_ < _loc14_)
            {
               _loc8_ = param5[_loc6_];
               if(_loc8_ != param2)
               {
                  if(!_loc8_._12039)
                  {
                     if(_loc8_._5142(false,false))
                     {
                        _loc7_ = true;
                     }
                  }
               }
               else if(param4 == 5)
               {
                  break;
               }
               _loc6_++;
            }
            return _loc7_;
         }
         var _loc9_:Number = param2._12018 + 1e-10;
         var _loc10_:Array = [];
         var _loc11_:int = 0;
         var _loc12_:* = param2._1892 == 0;
         _loc6_ = int(param5.length);
         while(--_loc6_ > -1)
         {
            _loc8_ = param5[_loc6_];
            if(!(_loc8_ === param2 || _loc8_._12039 || _loc8_._12030))
            {
               if(_loc8_._12024 != param2._12024)
               {
                  _loc13_ ||= _12406(param2,0,_loc12_);
                  if(_12406(_loc8_,_loc13_,_loc12_) === 0)
                  {
                     var _loc15_:*;
                     _loc10_[_loc15_ = _loc11_++] = _loc8_;
                  }
               }
               else if(_loc8_._12018 <= _loc9_)
               {
                  if(_loc8_._12018 + _loc8_._11952() / _loc8_._12020 > _loc9_)
                  {
                     if(!((_loc12_ || !_loc8_._12029) && _loc9_ - _loc8_._12018 <= 2e-10))
                     {
                        _loc10_[_loc15_ = _loc11_++] = _loc8_;
                     }
                  }
               }
            }
         }
         _loc6_ = _loc11_;
         while(--_loc6_ > -1)
         {
            _loc8_ = _loc10_[_loc6_];
            if(param4 == 2)
            {
               if(_loc8_._12037(param3,param1))
               {
                  _loc7_ = true;
               }
            }
            if(param4 !== 2 || !_loc8_._12334 && _loc8_._12029)
            {
               if(_loc8_._5142(false,false))
               {
                  _loc7_ = true;
               }
            }
         }
         return _loc7_;
      }
      
      private static function _12406(param1:Animation, param2:Number, param3:Boolean) : Number
      {
         var _loc4_:_11848 = param1._12024;
         var _loc5_:Number = _loc4_._12020;
         var _loc6_:Number = param1._12018;
         var _loc7_:Number = 1e-10;
         while(_loc4_._12024)
         {
            _loc6_ += _loc4_._12018;
            _loc5_ *= _loc4_._12020;
            if(_loc4_._12030)
            {
               return -100;
            }
            _loc4_ = _loc4_._12024;
         }
         _loc6_ = _loc6_ + param1._11952() / param1._12020 / _loc5_;
         return (_loc6_ /= _loc5_) > param2 ? _loc6_ - param2 : (param3 && _loc6_ == param2 || !param1._12029 && _loc6_ - param2 < 2 * _loc7_ ? _loc7_ : (_loc6_ > param2 + _loc7_ ? 0 : _loc6_ - param2 - _loc7_));
      }
      
      protected function _init() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         var _loc4_:_11847 = null;
         var _loc5_:String = null;
         var _loc6_:Object = null;
         var _loc1_:Boolean = Boolean(vars.immediateRender);
         if(vars.startAt)
         {
            if(this._12417 != null)
            {
               this._12417.render(-1,true);
            }
            vars.startAt.overwrite = 0;
            vars.startAt.immediateRender = true;
            this._12417 = new _11949(this.target,0,vars.startAt);
            if(_loc1_)
            {
               if(_12035 > 0)
               {
                  this._12417 = null;
               }
               else if(_1892 !== 0)
               {
                  return;
               }
            }
         }
         else if(Boolean(vars.runBackwards) && _1892 !== 0)
         {
            if(this._12417 != null)
            {
               this._12417.render(-1,true);
               this._12417 = null;
            }
            else
            {
               _loc6_ = {};
               for(_loc5_ in vars)
               {
                  if(!(_loc5_ in _12405))
                  {
                     _loc6_[_loc5_] = vars[_loc5_];
                  }
               }
               _loc6_.overwrite = 0;
               _loc6_.data = "isFromStart";
               this._12417 = _11949.to(this.target,0,_loc6_);
               if(!_loc1_)
               {
                  this._12417.render(-1,true);
               }
               else if(_12035 === 0)
               {
                  return;
               }
            }
         }
         if(vars.ease is _11866)
         {
            this._12418 = vars.easeParams is Array ? vars.ease.config.apply(vars.ease,vars.easeParams) : vars.ease;
         }
         else if(typeof vars.ease === "function")
         {
            this._12418 = new _11866(vars.ease,vars.easeParams);
         }
         else
         {
            this._12418 = _12410;
         }
         this._12415 = this._12418._type;
         this._12411 = this._12418._12055;
         this._12334 = null;
         if(this._8841)
         {
            _loc2_ = int(this._8841.length);
            while(--_loc2_ > -1)
            {
               if(this._12413(this._8841[_loc2_],this._12345[_loc2_] = {},this._12416[_loc2_],!!this._12402 ? this._12402[_loc2_] : null))
               {
                  _loc3_ = true;
               }
            }
         }
         else
         {
            _loc3_ = this._12413(this.target,this._12345,this._12416,this._12402);
         }
         if(_loc3_)
         {
            _12366("_onInitAllProps",this);
         }
         if(this._12402)
         {
            if(this._12334 == null)
            {
               if(typeof this.target !== "function")
               {
                  this._5142(false,false);
               }
            }
         }
         if(vars.runBackwards)
         {
            _loc4_ = this._12334;
            while(_loc4_)
            {
               _loc4_.s += _loc4_.c;
               _loc4_.c = -_loc4_.c;
               _loc4_ = _loc4_._next;
            }
         }
         _12023 = vars.onUpdate;
         _12029 = true;
      }
      
      protected function _12413(param1:Object, param2:Object, param3:Array, param4:Object) : Boolean
      {
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:Boolean = false;
         var _loc9_:Object = null;
         var _loc10_:Object = null;
         var _loc5_:Object = this.vars;
         if(param1 == null)
         {
            return false;
         }
         for(_loc6_ in _loc5_)
         {
            _loc10_ = _loc5_[_loc6_];
            if(_loc6_ in _12405)
            {
               if(_loc10_ is Array)
               {
                  if(_loc10_.join("").indexOf("{self}") !== -1)
                  {
                     _loc5_[_loc6_] = _12009(_loc10_ as Array);
                  }
               }
            }
            else if(_loc6_ in _12047 && Boolean((_loc9_ = new _12047[_loc6_]())._12284(param1,_loc10_,this)))
            {
               this._12334 = new _11847(_loc9_,"setRatio",0,1,_loc6_,true,this._12334,_loc9_._priority);
               _loc7_ = int(_loc9_._12295.length);
               while(--_loc7_ > -1)
               {
                  param2[_loc9_._12295[_loc7_]] = this._12334;
               }
               if(Boolean(_loc9_._priority) || "_onInitAllProps" in _loc9_)
               {
                  _loc8_ = true;
               }
               if("_onDisable" in _loc9_ || "_onEnable" in _loc9_)
               {
                  this._12400 = true;
               }
            }
            else
            {
               this._12334 = param2[_loc6_] = new _11847(param1,_loc6_,0,1,_loc6_,false,this._12334);
               this._12334.s = !this._12334.f ? Number(param1[_loc6_]) : Number(param1[Boolean(_loc6_.indexOf("set")) || !("get" + _loc6_.substr(3) in param1) ? _loc6_ : "get" + _loc6_.substr(3)]());
               this._12334.c = typeof _loc10_ === "number" ? Number(_loc10_) - this._12334.s : (typeof _loc10_ === "string" && _loc10_.charAt(1) === "=" ? int(_loc10_.charAt(0) + "1") * Number(_loc10_.substr(2)) : Number(_loc10_) || 0);
            }
         }
         if(param4)
         {
            if(this._12037(param4,param1))
            {
               return this._12413(param1,param2,param3,param4);
            }
         }
         if(this._12412 > 1)
         {
            if(this._12334 != null)
            {
               if(param3.length > 1)
               {
                  if(_12404(param1,this,param2,this._12412,param3))
                  {
                     this._12037(param2,param1);
                     return this._12413(param1,param2,param3,param4);
                  }
               }
            }
         }
         return _loc8_;
      }
      
      override public function render(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
      {
         var _loc4_:Boolean = false;
         var _loc5_:String = null;
         var _loc6_:_11847 = null;
         var _loc7_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc8_:Number = _12035;
         if(param1 >= _1892)
         {
            _6907 = _12035 = _1892;
            this.ratio = this._12418._12054 ? this._12418._12050(1) : 1;
            if(!_12025)
            {
               _loc4_ = true;
               _loc5_ = "onComplete";
            }
            if(_1892 == 0)
            {
               _loc7_ = _12015;
               if(_12018 === _12024._1892)
               {
                  param1 = 0;
               }
               if(param1 === 0 || _loc7_ < 0 || _loc7_ === _12028)
               {
                  if(_loc7_ !== param1)
                  {
                     param3 = true;
                     if(_loc7_ > 0 && _loc7_ !== _12028)
                     {
                        _loc5_ = "onReverseComplete";
                     }
                  }
               }
               _12015 = _loc7_ = !param2 || param1 !== 0 || _12015 === param1 ? param1 : _12028;
            }
         }
         else if(param1 < 1e-7)
         {
            _6907 = _12035 = 0;
            this.ratio = this._12418._12054 ? this._12418._12050(0) : 0;
            if(_loc8_ !== 0 || _1892 === 0 && _12015 > 0 && _12015 !== _12028)
            {
               _loc5_ = "onReverseComplete";
               _loc4_ = _12025;
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
                  _12015 = _loc7_ = !param2 || param1 !== 0 || _12015 === param1 ? param1 : _12028;
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
            if(this._12415)
            {
               _loc9_ = param1 / _1892;
               if(this._12415 == 1 || this._12415 == 3 && _loc9_ >= 0.5)
               {
                  _loc9_ = 1 - _loc9_;
               }
               if(this._12415 == 3)
               {
                  _loc9_ *= 2;
               }
               if(this._12411 == 1)
               {
                  _loc9_ *= _loc9_;
               }
               else if(this._12411 == 2)
               {
                  _loc9_ *= _loc9_ * _loc9_;
               }
               else if(this._12411 == 3)
               {
                  _loc9_ *= _loc9_ * _loc9_ * _loc9_;
               }
               else if(this._12411 == 4)
               {
                  _loc9_ *= _loc9_ * _loc9_ * _loc9_ * _loc9_;
               }
               if(this._12415 == 1)
               {
                  this.ratio = 1 - _loc9_;
               }
               else if(this._12415 == 2)
               {
                  this.ratio = _loc9_;
               }
               else if(param1 / _1892 < 0.5)
               {
                  this.ratio = _loc9_ / 2;
               }
               else
               {
                  this.ratio = 1 - _loc9_ / 2;
               }
            }
            else
            {
               this.ratio = this._12418._12050(param1 / _1892);
            }
         }
         if(_12035 == _loc8_ && !param3)
         {
            return;
         }
         if(!_12029)
         {
            this._init();
            if(!_12029 || _12039)
            {
               return;
            }
            if(Boolean(_12035) && !_loc4_)
            {
               this.ratio = this._12418._12050(_12035 / _1892);
            }
            else if(_loc4_ && this._12418._12054)
            {
               this.ratio = this._12418._12050(_12035 === 0 ? 0 : 1);
            }
         }
         if(!_active)
         {
            if(!_12030 && _12035 !== _loc8_ && param1 >= 0)
            {
               _active = true;
            }
         }
         if(_loc8_ == 0)
         {
            if(this._12417 != null)
            {
               if(param1 >= 0)
               {
                  this._12417.render(param1,param2,param3);
               }
               else if(!_loc5_)
               {
                  _loc5_ = "_dummyGS";
               }
            }
            if(vars.onStart)
            {
               if(_12035 != 0 || _1892 == 0)
               {
                  if(!param2)
                  {
                     vars.onStart.apply(null,vars.onStartParams);
                  }
               }
            }
         }
         _loc6_ = this._12334;
         while(_loc6_)
         {
            if(_loc6_.f)
            {
               _loc6_.t[_loc6_.p](_loc6_.c * this.ratio + _loc6_.s);
            }
            else
            {
               _loc6_.t[_loc6_.p] = _loc6_.c * this.ratio + _loc6_.s;
            }
            _loc6_ = _loc6_._next;
         }
         if(_12023 != null)
         {
            if(param1 < 0 && this._12417 != null && _12018 != 0)
            {
               this._12417.render(param1,param2,param3);
            }
            if(!param2)
            {
               if(_12035 !== _loc8_ || _loc4_)
               {
                  _12023.apply(null,vars.onUpdateParams);
               }
            }
         }
         if(_loc5_)
         {
            if(!_12039)
            {
               if(param1 < 0 && this._12417 != null && _12023 == null && _12018 != 0)
               {
                  this._12417.render(param1,param2,param3);
               }
               if(_loc4_)
               {
                  if(_12024._12041)
                  {
                     this._5142(false,false);
                  }
                  _active = false;
               }
               if(!param2)
               {
                  if(vars[_loc5_])
                  {
                     vars[_loc5_].apply(null,vars[_loc5_ + "Params"]);
                  }
               }
               if(_1892 === 0 && _12015 === _12028 && _loc7_ !== _12028)
               {
                  _12015 = 0;
               }
            }
         }
      }
      
      override public function _12037(param1:Object = null, param2:Object = null) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         var _loc5_:String = null;
         var _loc6_:_11847 = null;
         var _loc7_:Object = null;
         var _loc8_:Boolean = false;
         var _loc9_:Object = null;
         var _loc10_:Boolean = false;
         if(param1 === "all")
         {
            param1 = null;
         }
         if(param1 == null)
         {
            if(param2 == null || param2 == this.target)
            {
               return this._5142(false,false);
            }
         }
         param2 = param2 || this._8841 || this.target;
         if(param2 is Array && typeof param2[0] === "object")
         {
            _loc3_ = int(param2.length);
            while(--_loc3_ > -1)
            {
               if(this._12037(param1,param2[_loc3_]))
               {
                  _loc8_ = true;
               }
            }
         }
         else
         {
            if(this._8841)
            {
               _loc3_ = int(this._8841.length);
               while(--_loc3_ > -1)
               {
                  if(param2 === this._8841[_loc3_])
                  {
                     _loc7_ = this._12345[_loc3_] || {};
                     this._12402 = this._12402 || [];
                     _loc4_ = this._12402[_loc3_] = !!param1 ? this._12402[_loc3_] || {} : "all";
                     break;
                  }
               }
            }
            else
            {
               if(param2 !== this.target)
               {
                  return false;
               }
               _loc7_ = this._12345;
               _loc4_ = this._12402 = !!param1 ? this._12402 || {} : "all";
            }
            if(_loc7_)
            {
               _loc9_ = param1 || _loc7_;
               _loc10_ = param1 != _loc4_ && _loc4_ != "all" && param1 != _loc7_ && (typeof param1 != "object" || param1._tempKill != true);
               for(_loc5_ in _loc9_)
               {
                  _loc6_ = _loc7_[_loc5_];
                  if(_loc6_ != null)
                  {
                     if(_loc6_.pg && Boolean(_loc6_.t._12037(_loc9_)))
                     {
                        _loc8_ = true;
                     }
                     if(!_loc6_.pg || _loc6_.t._12295.length === 0)
                     {
                        if(_loc6_._12036)
                        {
                           _loc6_._12036._next = _loc6_._next;
                        }
                        else if(_loc6_ == this._12334)
                        {
                           this._12334 = _loc6_._next;
                        }
                        if(_loc6_._next)
                        {
                           _loc6_._next._12036 = _loc6_._12036;
                        }
                        _loc6_._next = _loc6_._12036 = null;
                     }
                     delete _loc7_[_loc5_];
                  }
                  if(_loc10_)
                  {
                     _loc4_[_loc5_] = 1;
                  }
               }
               if(this._12334 == null && _12029)
               {
                  this._5142(false,false);
               }
            }
         }
         return _loc8_;
      }
      
      override public function invalidate() : *
      {
         if(this._12400)
         {
            _12366("_onDisable",this);
         }
         this._12334 = null;
         this._12402 = null;
         _12023 = null;
         this._12417 = null;
         _12029 = _active = this._12400 = false;
         this._12345 = !!this._8841 ? {} : [];
         return this;
      }
      
      override public function _5142(param1:Boolean, param2:Boolean = false) : Boolean
      {
         var _loc3_:int = 0;
         if(param1 && _12039)
         {
            if(this._8841)
            {
               _loc3_ = int(this._8841.length);
               while(--_loc3_ > -1)
               {
                  this._12416[_loc3_] = _12414(this._8841[_loc3_],this,true);
               }
            }
            else
            {
               this._12416 = _12414(this.target,this,true);
            }
         }
         super._5142(param1,param2);
         if(this._12400)
         {
            if(this._12334 != null)
            {
               return _12366(param1 ? "_onEnable" : "_onDisable",this);
            }
         }
         return false;
      }
   }
}

