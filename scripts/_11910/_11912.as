package _11910
{
   import _11845._11949;
   import flash.geom.Point;
   
   public class _11912 extends _11944
   {
      public static const API:Number = 2;
      
      protected static const _RAD2DEG:Number = 180 / Math.PI;
      
      protected static var _r1:Array = [];
      
      protected static var _r2:Array = [];
      
      protected static var _r3:Array = [];
      
      protected static var _12300:Object = {};
      
      protected var _target:Object;
      
      protected var _12297:Array;
      
      protected var _12307:Object;
      
      protected var _12303:Array;
      
      protected var _12301:Array;
      
      protected var _length:Number;
      
      protected var _12056:Object;
      
      protected var _props:Array;
      
      protected var _12313:Number;
      
      protected var _12312:Number;
      
      protected var _12314:Number;
      
      protected var _12306:Array;
      
      protected var _12311:Number;
      
      protected var _12310:Number;
      
      protected var _12309:Number;
      
      protected var _12305:Object;
      
      protected var _12302:int;
      
      protected var _12308:Number;
      
      protected var _12304:int;
      
      protected var _12289:Array;
      
      protected var _12298:int;
      
      public function _11912()
      {
         super("bezier");
         this._12295.pop();
         this._12056 = {};
         this._12307 = {};
      }
      
      public static function bezierThrough(param1:Array, param2:Number = 1, param3:Boolean = false, param4:Boolean = false, param5:String = "x,y,z", param6:Object = null) : Object
      {
         var _loc9_:Array = null;
         var _loc10_:int = 0;
         var _loc11_:String = null;
         var _loc12_:int = 0;
         var _loc13_:Array = null;
         var _loc14_:int = 0;
         var _loc15_:Number = NaN;
         var _loc16_:Boolean = false;
         var _loc17_:Object = null;
         var _loc7_:Object = {};
         var _loc8_:Object = param6 || param1[0];
         param5 = "," + param5 + ",";
         if(_loc8_ is Point)
         {
            _loc9_ = ["x","y"];
         }
         else
         {
            _loc9_ = [];
            for(_loc11_ in _loc8_)
            {
               _loc9_.push(_loc11_);
            }
         }
         if(param1.length > 1)
         {
            _loc17_ = param1[param1.length - 1];
            _loc16_ = true;
            _loc10_ = int(_loc9_.length);
            while(--_loc10_ > -1)
            {
               _loc11_ = _loc9_[_loc10_];
               if(Math.abs(_loc8_[_loc11_] - _loc17_[_loc11_]) > 0.05)
               {
                  _loc16_ = false;
                  break;
               }
            }
            if(_loc16_)
            {
               param1 = param1.concat();
               if(param6)
               {
                  param1.unshift(param6);
               }
               param1.push(param1[1]);
               param6 = param1[param1.length - 3];
            }
         }
         _r1.length = _r2.length = _r3.length = 0;
         _loc10_ = int(_loc9_.length);
         while(--_loc10_ > -1)
         {
            _loc11_ = _loc9_[_loc10_];
            _12300[_loc11_] = param5.indexOf("," + _loc11_ + ",") !== -1;
            _loc7_[_loc11_] = _12296(param1,_loc11_,_12300[_loc11_],param6);
         }
         _loc10_ = int(_r1.length);
         while(--_loc10_ > -1)
         {
            _r1[_loc10_] = Math.sqrt(_r1[_loc10_]);
            _r2[_loc10_] = Math.sqrt(_r2[_loc10_]);
         }
         if(!param4)
         {
            _loc10_ = int(_loc9_.length);
            while(--_loc10_ > -1)
            {
               if(_12300[_loc11_])
               {
                  _loc13_ = _loc7_[_loc9_[_loc10_]];
                  _loc14_ = int(_loc13_.length - 1);
                  _loc12_ = 0;
                  while(_loc12_ < _loc14_)
                  {
                     _loc15_ = _loc13_[_loc12_ + 1].da / _r2[_loc12_] + _loc13_[_loc12_].da / _r1[_loc12_];
                     _r3[_loc12_] = (_r3[_loc12_] || 0) + _loc15_ * _loc15_;
                     _loc12_++;
                  }
               }
            }
            _loc10_ = int(_r3.length);
            while(--_loc10_ > -1)
            {
               _r3[_loc10_] = Math.sqrt(_r3[_loc10_]);
            }
         }
         _loc10_ = int(_loc9_.length);
         _loc12_ = param3 ? 4 : 1;
         while(--_loc10_ > -1)
         {
            _loc11_ = _loc9_[_loc10_];
            _loc13_ = _loc7_[_loc11_];
            _12288(_loc13_,param2,param3,param4,_12300[_loc11_]);
            if(_loc16_)
            {
               _loc13_.splice(0,_loc12_);
               _loc13_.splice(_loc13_.length - _loc12_,_loc12_);
            }
         }
         return _loc7_;
      }
      
      public static function _12290(param1:Array, param2:String, param3:Object = null) : Object
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Array = null;
         var _loc12_:Array = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:String = null;
         var _loc17_:int = 0;
         var _loc18_:Object = null;
         param2 ||= "soft";
         var _loc4_:Object = {};
         var _loc5_:int = param2 === "cubic" ? 3 : 2;
         var _loc6_:* = param2 === "soft";
         if((_loc6_) && Boolean(param3))
         {
            param1 = [param3].concat(param1);
         }
         if(param1 == null || param1.length < _loc5_ + 1)
         {
            throw new Error("invalid Bezier data");
         }
         if(param1[1] is Point)
         {
            _loc12_ = ["x","y"];
         }
         else
         {
            _loc12_ = [];
            for(_loc16_ in param1[0])
            {
               _loc12_.push(_loc16_);
            }
         }
         _loc13_ = int(_loc12_.length);
         while(--_loc13_ > -1)
         {
            _loc16_ = _loc12_[_loc13_];
            _loc4_[_loc16_] = _loc11_ = [];
            _loc17_ = 0;
            _loc15_ = int(param1.length);
            _loc14_ = 0;
            while(_loc14_ < _loc15_)
            {
               _loc18_ = param1[_loc14_][_loc16_];
               _loc7_ = param3 == null ? Number(param1[_loc14_][_loc16_]) : (typeof _loc18_ === "string" && _loc18_.charAt(1) === "=" ? param3[_loc16_] + Number(_loc18_.charAt(0) + _loc18_.substr(2)) : Number(_loc18_));
               if(_loc6_)
               {
                  if(_loc14_ > 1)
                  {
                     if(_loc14_ < _loc15_ - 1)
                     {
                        var _loc19_:*;
                        _loc11_[_loc19_ = _loc17_++] = (_loc7_ + _loc11_[_loc17_ - 2]) / 2;
                     }
                  }
               }
               _loc11_[_loc19_ = _loc17_++] = _loc7_;
               _loc14_++;
            }
            _loc15_ = _loc17_ - _loc5_ + 1;
            _loc17_ = 0;
            _loc14_ = 0;
            while(_loc14_ < _loc15_)
            {
               _loc7_ = Number(_loc11_[_loc14_]);
               _loc8_ = Number(_loc11_[_loc14_ + 1]);
               _loc9_ = Number(_loc11_[_loc14_ + 2]);
               _loc10_ = _loc5_ === 2 ? 0 : Number(_loc11_[_loc14_ + 3]);
               _loc11_[_loc19_ = _loc17_++] = _loc5_ === 3 ? new _11490(_loc7_,_loc8_,_loc9_,_loc10_) : new _11490(_loc7_,(2 * _loc8_ + _loc7_) / 3,(2 * _loc8_ + _loc9_) / 3,_loc9_);
               _loc14_ += _loc5_;
            }
            _loc11_.length = _loc17_;
         }
         return _loc4_;
      }
      
      protected static function _12296(param1:Array, param2:String, param3:Boolean, param4:Object) : Array
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Object = null;
         var _loc5_:Array = [];
         if(param4)
         {
            param1 = [param4].concat(param1);
            _loc7_ = int(param1.length);
            while(--_loc7_ > -1)
            {
               _loc11_ = param1[_loc7_][param2];
               if(typeof _loc11_ === "string")
               {
                  if(_loc11_.charAt(1) === "=")
                  {
                     param1[_loc7_][param2] = param4[param2] + Number(_loc11_.charAt(0) + _loc11_.substr(2));
                  }
               }
            }
         }
         _loc6_ = param1.length - 2;
         if(_loc6_ < 0)
         {
            _loc5_[0] = new _11490(param1[0][param2],0,0,param1[_loc6_ < -1 ? 0 : 1][param2]);
            return _loc5_;
         }
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc8_ = Number(param1[_loc7_][param2]);
            _loc9_ = Number(param1[_loc7_ + 1][param2]);
            _loc5_[_loc7_] = new _11490(_loc8_,0,0,_loc9_);
            if(param3)
            {
               _loc10_ = Number(param1[_loc7_ + 2][param2]);
               _r1[_loc7_] = (_r1[_loc7_] || 0) + (_loc9_ - _loc8_) * (_loc9_ - _loc8_);
               _r2[_loc7_] = (_r2[_loc7_] || 0) + (_loc10_ - _loc9_) * (_loc10_ - _loc9_);
            }
            _loc7_++;
         }
         _loc5_[_loc7_] = new _11490(param1[_loc7_][param2],0,0,param1[_loc7_ + 1][param2]);
         return _loc5_;
      }
      
      protected static function _12288(param1:Array, param2:Number = 1, param3:Boolean = false, param4:Boolean = false, param5:Boolean = false) : void
      {
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:_11490 = null;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Array = null;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc6_:int = int(param1.length - 1);
         var _loc7_:int = 0;
         var _loc8_:Number = Number(param1[0].a);
         _loc9_ = 0;
         while(_loc9_ < _loc6_)
         {
            _loc13_ = param1[_loc7_];
            _loc10_ = _loc13_.a;
            _loc11_ = _loc13_.d;
            _loc12_ = Number(param1[_loc7_ + 1].d);
            if(param5)
            {
               _loc19_ = Number(_r1[_loc9_]);
               _loc20_ = Number(_r2[_loc9_]);
               _loc21_ = (_loc20_ + _loc19_) * param2 * 0.25 / (param4 ? 0.5 : _r3[_loc9_] || 0.5);
               _loc14_ = _loc11_ - (_loc11_ - _loc10_) * (param4 ? param2 * 0.5 : (_loc19_ !== 0 ? _loc21_ / _loc19_ : 0));
               _loc15_ = _loc11_ + (_loc12_ - _loc11_) * (param4 ? param2 * 0.5 : (_loc20_ !== 0 ? _loc21_ / _loc20_ : 0));
               _loc16_ = _loc11_ - (_loc14_ + ((_loc15_ - _loc14_) * (_loc19_ * 3 / (_loc19_ + _loc20_) + 0.5) / 4 || 0));
            }
            else
            {
               _loc14_ = _loc11_ - (_loc11_ - _loc10_) * param2 * 0.5;
               _loc15_ = _loc11_ + (_loc12_ - _loc11_) * param2 * 0.5;
               _loc16_ = _loc11_ - (_loc14_ + _loc15_) / 2;
            }
            _loc14_ += _loc16_;
            _loc15_ += _loc16_;
            _loc13_.c = _loc17_ = _loc14_;
            if(_loc9_ != 0)
            {
               _loc13_.b = _loc8_;
            }
            else
            {
               _loc13_.b = _loc8_ = _loc13_.a + (_loc13_.c - _loc13_.a) * 0.6;
            }
            _loc13_.da = _loc11_ - _loc10_;
            _loc13_.ca = _loc17_ - _loc10_;
            _loc13_.ba = _loc8_ - _loc10_;
            if(param3)
            {
               _loc18_ = _12294(_loc10_,_loc8_,_loc17_,_loc11_);
               param1.splice(_loc7_,1,_loc18_[0],_loc18_[1],_loc18_[2],_loc18_[3]);
               _loc7_ += 4;
            }
            else
            {
               _loc7_++;
            }
            _loc8_ = _loc15_;
            _loc9_++;
         }
         (_loc13_ = param1[_loc7_]).b = _loc8_;
         _loc13_.c = _loc8_ + (_loc13_.d - _loc8_) * 0.4;
         _loc13_.da = _loc13_.d - _loc13_.a;
         _loc13_.ca = _loc13_.c - _loc13_.a;
         _loc13_.ba = _loc8_ - _loc13_.a;
         if(param3)
         {
            _loc18_ = _12294(_loc13_.a,_loc8_,_loc13_.c,_loc13_.d);
            param1.splice(_loc7_,1,_loc18_[0],_loc18_[1],_loc18_[2],_loc18_[3]);
         }
      }
      
      public static function _12294(param1:Number, param2:Number, param3:Number, param4:Number) : Array
      {
         var _loc5_:Object = {"a":param1};
         var _loc6_:Object = {};
         var _loc7_:Object = {};
         var _loc8_:Object = {"c":param4};
         var _loc9_:Number = (param1 + param2) / 2;
         var _loc10_:Number = (param2 + param3) / 2;
         var _loc11_:Number = (param3 + param4) / 2;
         var _loc12_:Number = (_loc9_ + _loc10_) / 2;
         var _loc13_:Number = (_loc10_ + _loc11_) / 2;
         var _loc14_:Number = (_loc13_ - _loc12_) / 8;
         _loc5_.b = _loc9_ + (param1 - _loc9_) / 4;
         _loc6_.b = _loc12_ + _loc14_;
         _loc5_.c = _loc6_.a = (_loc5_.b + _loc6_.b) / 2;
         _loc6_.c = _loc7_.a = (_loc12_ + _loc13_) / 2;
         _loc7_.b = _loc13_ - _loc14_;
         _loc8_.b = _loc11_ + (param4 - _loc11_) / 4;
         _loc7_.c = _loc8_.a = (_loc7_.b + _loc8_.b) / 2;
         return [_loc5_,_loc6_,_loc7_,_loc8_];
      }
      
      public static function _12292(param1:Number, param2:Number, param3:Number) : Object
      {
         return new _11490(param1,(2 * param2 + param1) / 3,(2 * param2 + param3) / 3,param3);
      }
      
      protected static function _12291(param1:Object, param2:uint = 6) : Object
      {
         var _loc10_:String = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:Number = NaN;
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         var _loc7_:int = int(param2 - 1);
         var _loc8_:Array = [];
         var _loc9_:Array = [];
         for(_loc10_ in param1)
         {
            _12293(param1[_loc10_],_loc3_,param2);
         }
         _loc12_ = int(_loc3_.length);
         _loc11_ = 0;
         while(_loc11_ < _loc12_)
         {
            _loc5_ += Math.sqrt(_loc3_[_loc11_]);
            _loc13_ = _loc11_ % param2;
            _loc9_[_loc13_] = _loc5_;
            if(_loc13_ == _loc7_)
            {
               _loc6_ += _loc5_;
               _loc13_ = _loc11_ / param2 >> 0;
               _loc8_[_loc13_] = _loc9_;
               _loc4_[_loc13_] = _loc6_;
               _loc5_ = 0;
               _loc9_ = [];
            }
            _loc11_++;
         }
         return {
            "length":_loc6_,
            "lengths":_loc4_,
            "segments":_loc8_
         };
      }
      
      private static function _12293(param1:Array, param2:Array, param3:uint = 6) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:int = 0;
         var _loc14_:Number = NaN;
         var _loc15_:_11490 = null;
         var _loc16_:int = 0;
         var _loc4_:Number = 1 / param3;
         var _loc5_:int = int(param1.length);
         while(--_loc5_ > -1)
         {
            _loc15_ = param1[_loc5_];
            _loc8_ = _loc15_.a;
            _loc9_ = _loc15_.d - _loc8_;
            _loc10_ = _loc15_.c - _loc8_;
            _loc11_ = _loc15_.b - _loc8_;
            _loc6_ = _loc7_ = 0;
            _loc13_ = 1;
            while(_loc13_ <= param3)
            {
               _loc12_ = _loc4_ * _loc13_;
               _loc14_ = 1 - _loc12_;
               _loc6_ = _loc7_ - (_loc7_ = (_loc12_ * _loc12_ * _loc9_ + 3 * _loc14_ * (_loc12_ * _loc10_ + _loc14_ * _loc11_)) * _loc12_);
               _loc16_ = _loc5_ * param3 + _loc13_ - 1;
               param2[_loc16_] = (param2[_loc16_] || 0) + _loc6_ * _loc6_;
               _loc13_++;
            }
         }
      }
      
      override public function _12284(param1:Object, param2:*, param3:_11949) : Boolean
      {
         var _loc9_:String = null;
         var _loc10_:Boolean = false;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:Array = null;
         var _loc14_:Object = null;
         var _loc15_:Object = null;
         this._target = param1;
         var _loc4_:Object = param2 is Array ? {"values":param2} : param2;
         this._props = [];
         this._12304 = _loc4_.timeResolution == null ? 6 : int(_loc4_.timeResolution);
         var _loc5_:Array = _loc4_.values || [];
         var _loc6_:Object = {};
         var _loc7_:Object = _loc5_[0];
         var _loc8_:Object = _loc4_._12045 || param3.vars.orientToBezier;
         this._12297 = !!_loc8_ ? (_loc8_ is Array ? _loc8_ as Array : [["x","y","rotation",_loc8_ === true ? 0 : Number(_loc8_)]]) : null;
         if(_loc7_ is Point)
         {
            this._props = ["x","y"];
         }
         else
         {
            for(_loc9_ in _loc7_)
            {
               this._props.push(_loc9_);
            }
         }
         _loc11_ = int(this._props.length);
         while(--_loc11_ > -1)
         {
            _loc9_ = this._props[_loc11_];
            this._12295.push(_loc9_);
            _loc10_ = this._12056[_loc9_] = param1[_loc9_] is Function;
            _loc6_[_loc9_] = !_loc10_ ? param1[_loc9_] : param1[Boolean(_loc9_.indexOf("set")) || !("get" + _loc9_.substr(3) in param1) ? _loc9_ : "get" + _loc9_.substr(3)]();
            if(!_loc14_)
            {
               if(_loc6_[_loc9_] !== _loc5_[0][_loc9_])
               {
                  _loc14_ = _loc6_;
               }
            }
         }
         this._12305 = _loc4_.type !== "cubic" && _loc4_.type !== "quadratic" && _loc4_.type !== "soft" ? bezierThrough(_loc5_,isNaN(_loc4_.curviness) ? 1 : Number(_loc4_.curviness),false,_loc4_.type === "thruBasic",_loc4_.correlate || "x,y,z",_loc14_) : _12290(_loc5_,_loc4_.type,_loc6_);
         this._12302 = this._12305[_loc9_].length;
         if(this._12304)
         {
            _loc15_ = _12291(this._12305,this._12304);
            this._length = _loc15_.length;
            this._12303 = _loc15_.lengths;
            this._12301 = _loc15_.segments;
            this._12313 = this._12314 = this._12311 = this._12309 = 0;
            this._12312 = this._12303[0];
            this._12306 = this._12301[0];
            this._12310 = this._12306[0];
            this._12308 = 1 / this._12306.length;
         }
         _loc13_ = this._12297;
         if(_loc13_)
         {
            this._12289 = [];
            if(!(_loc13_[0] is Array))
            {
               this._12297 = _loc13_ = [_loc13_];
            }
            _loc11_ = int(_loc13_.length);
            while(--_loc11_ > -1)
            {
               _loc12_ = 0;
               while(_loc12_ < 3)
               {
                  _loc9_ = _loc13_[_loc11_][_loc12_];
                  this._12056[_loc9_] = param1[_loc9_] is Function ? param1[Boolean(_loc9_.indexOf("set")) || !("get" + _loc9_.substr(3) in param1) ? _loc9_ : "get" + _loc9_.substr(3)] : false;
                  _loc12_++;
               }
               _loc9_ = _loc13_[_loc11_][2];
               this._12289[_loc11_] = !!this._12056[_loc9_] ? this._12056[_loc9_]() : this._target[_loc9_];
            }
         }
         this._12298 = !!param3.vars.runBackwards ? 1 : 0;
         return true;
      }
      
      override public function _12037(param1:Object) : Boolean
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc2_:Array = this._props;
         for(_loc3_ in this._12305)
         {
            if(_loc3_ in param1)
            {
               delete this._12305[_loc3_];
               delete this._12056[_loc3_];
               _loc4_ = int(_loc2_.length);
               while(--_loc4_ > -1)
               {
                  if(_loc2_[_loc4_] === _loc3_)
                  {
                     _loc2_.splice(_loc4_,1);
                  }
               }
            }
         }
         return super._12037(param1);
      }
      
      override public function _12299(param1:Object, param2:Boolean = true) : void
      {
         var _loc3_:Array = this._12295;
         var _loc4_:int = int(_loc3_.length);
         while(--_loc4_ > -1)
         {
            if(_loc3_[_loc4_] in param1 || "bezier" in param1 || "bezierThrough" in param1)
            {
               this._12307[_loc3_[_loc4_]] = param2;
            }
         }
      }
      
      override public function setRatio(param1:Number) : void
      {
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:String = null;
         var _loc10_:_11490 = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:int = 0;
         var _loc14_:Array = null;
         var _loc15_:Array = null;
         var _loc16_:Array = null;
         var _loc17_:_11490 = null;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc2_:int = this._12302;
         var _loc3_:Object = this._12056;
         var _loc4_:Object = this._target;
         var _loc5_:* = param1 !== this._12298;
         if(this._12304 == 0)
         {
            _loc6_ = param1 < 0 ? 0 : (param1 >= 1 ? _loc2_ - 1 : _loc2_ * param1 >> 0);
            _loc11_ = (param1 - _loc6_ * (1 / _loc2_)) * _loc2_;
         }
         else
         {
            _loc14_ = this._12303;
            _loc15_ = this._12306;
            param1 *= this._length;
            _loc8_ = this._12314;
            if(param1 > this._12312 && _loc8_ < _loc2_ - 1)
            {
               _loc13_ = _loc2_ - 1;
               while(_loc8_ < _loc13_ && (this._12312 = _loc14_[++_loc8_]) <= param1)
               {
               }
               this._12313 = _loc14_[_loc8_ - 1];
               this._12314 = _loc8_;
               this._12306 = _loc15_ = this._12301[_loc8_];
               this._12310 = _loc15_[this._12311 = this._12309 = 0];
            }
            else if(param1 < this._12313 && _loc8_ > 0)
            {
               while(_loc8_ > 0 && (this._12313 = _loc14_[--_loc8_]) >= param1)
               {
               }
               if(_loc8_ === 0 && param1 < this._12313)
               {
                  this._12313 = 0;
               }
               else
               {
                  _loc8_++;
               }
               this._12312 = _loc14_[_loc8_];
               this._12314 = _loc8_;
               this._12306 = _loc15_ = this._12301[_loc8_];
               this._12311 = Number(_loc15_[(this._12309 = _loc15_.length - 1) - 1]) || 0;
               this._12310 = _loc15_[this._12309];
            }
            _loc6_ = _loc8_;
            param1 -= this._12313;
            _loc8_ = this._12309;
            if(param1 > this._12310 && _loc8_ < _loc15_.length - 1)
            {
               _loc13_ = int(_loc15_.length - 1);
               while(_loc8_ < _loc13_ && (this._12310 = _loc15_[++_loc8_]) <= param1)
               {
               }
               this._12311 = _loc15_[_loc8_ - 1];
               this._12309 = _loc8_;
            }
            else if(param1 < this._12311 && _loc8_ > 0)
            {
               while(_loc8_ > 0 && (this._12311 = _loc15_[--_loc8_]) >= param1)
               {
               }
               if(_loc8_ === 0 && param1 < this._12311)
               {
                  this._12311 = 0;
               }
               else
               {
                  _loc8_++;
               }
               this._12310 = _loc15_[_loc8_];
               this._12309 = _loc8_;
            }
            _loc11_ = (_loc8_ + (param1 - this._12311) / (this._12310 - this._12311)) * this._12308;
         }
         _loc7_ = 1 - _loc11_;
         _loc8_ = int(this._props.length);
         while(--_loc8_ > -1)
         {
            _loc9_ = this._props[_loc8_];
            _loc10_ = this._12305[_loc9_][_loc6_];
            _loc12_ = (_loc11_ * _loc11_ * _loc10_.da + 3 * _loc7_ * (_loc11_ * _loc10_.ca + _loc7_ * _loc10_.ba)) * _loc11_ + _loc10_.a;
            if(this._12307[_loc9_])
            {
               _loc12_ = _loc12_ + (_loc12_ > 0 ? 0.5 : -0.5) >> 0;
            }
            if(_loc3_[_loc9_])
            {
               _loc4_[_loc9_](_loc12_);
            }
            else
            {
               _loc4_[_loc9_] = _loc12_;
            }
         }
         if(this._12297 != null)
         {
            _loc16_ = this._12297;
            _loc8_ = int(_loc16_.length);
            while(--_loc8_ > -1)
            {
               _loc9_ = _loc16_[_loc8_][2];
               _loc22_ = Number(Number(_loc16_[_loc8_][3]) || 0);
               _loc23_ = _loc16_[_loc8_][4] == true ? 1 : _RAD2DEG;
               _loc10_ = this._12305[_loc16_[_loc8_][0]][_loc6_];
               _loc17_ = this._12305[_loc16_[_loc8_][1]][_loc6_];
               _loc18_ = _loc10_.a + (_loc10_.b - _loc10_.a) * _loc11_;
               _loc20_ = _loc10_.b + (_loc10_.c - _loc10_.b) * _loc11_;
               _loc18_ += (_loc20_ - _loc18_) * _loc11_;
               _loc20_ += (_loc10_.c + (_loc10_.d - _loc10_.c) * _loc11_ - _loc20_) * _loc11_;
               _loc19_ = _loc17_.a + (_loc17_.b - _loc17_.a) * _loc11_;
               _loc21_ = _loc17_.b + (_loc17_.c - _loc17_.b) * _loc11_;
               _loc19_ += (_loc21_ - _loc19_) * _loc11_;
               _loc21_ += (_loc17_.c + (_loc17_.d - _loc17_.c) * _loc11_ - _loc21_) * _loc11_;
               _loc12_ = _loc5_ ? Math.atan2(_loc21_ - _loc19_,_loc20_ - _loc18_) * _loc23_ + _loc22_ : Number(this._12289[_loc8_]);
               if(_loc3_[_loc9_])
               {
                  _loc4_[_loc9_](_loc12_);
               }
               else
               {
                  _loc4_[_loc9_] = _loc12_;
               }
            }
         }
      }
   }
}

class _11490
{
   public var a:Number;
   
   public var b:Number;
   
   public var c:Number;
   
   public var d:Number;
   
   public var da:Number;
   
   public var ca:Number;
   
   public var ba:Number;
   
   public function _11490(param1:Number, param2:Number, param3:Number, param4:Number)
   {
      super();
      this.a = param1;
      this.b = param2;
      this.c = param3;
      this.d = param4;
      this.da = param4 - param1;
      this.ca = param3 - param1;
      this.ba = param2 - param1;
   }
}

