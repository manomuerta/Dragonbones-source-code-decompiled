package _11489
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class Bezier
   {
      private static const ZERO:Point = new Point();
      
      private static const T_VALUES:Vector.<Number> = Vector.<Number>([-0.06405689286260563,0.06405689286260563,-0.1911188674736163,0.1911188674736163,-0.3150426796961634,0.3150426796961634,-0.4337935076260451,0.4337935076260451,-0.5454214713888396,0.5454214713888396,-0.6480936519369755,0.6480936519369755,-0.7401241915785544,0.7401241915785544,-0.820001985973903,0.820001985973903,-0.8864155270044011,0.8864155270044011,-0.9382745520027328,0.9382745520027328,-0.9747285559713095,0.9747285559713095,-0.9951872199970213,0.9951872199970213]);
      
      private static const C_VALUES:Vector.<Number> = Vector.<Number>([0.12793819534675216,0.12793819534675216,0.1258374563468283,0.1258374563468283,0.12167047292780339,0.12167047292780339,0.1155056680537256,0.1155056680537256,0.10744427011596563,0.10744427011596563,0.09761865210411388,0.09761865210411388,0.08619016153195327,0.08619016153195327,0.0733464814110803,0.0733464814110803,0.05929858491543678,0.05929858491543678,0.04427743881741981,0.04427743881741981,0.028531388628933663,0.028531388628933663,0.0123412297999872,0.0123412297999872]);
      
      private static const _4235:Point = new Point();
      
      public var _11525:Point;
      
      private var _11522:Boolean;
      
      private var _11521:Boolean;
      
      public function Bezier(param1:Vector.<Number> = null, param2:Boolean = false)
      {
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         this.start = new Point(0,0);
         this.end = new Point(1,1);
         this.controlA = new Point(0,0);
         this._controlB = new Point(1,1);
         this._11956 = new Vector.<Point>();
         this._pointsD = new Vector.<Vector.<Point>>();
         this._lut = new Vector.<Point>();
         super();
         this._11522 = param2;
         this._11521 = false;
         this._11956.push(this.start);
         this._11956.push(this.controlA);
         if(this._11522)
         {
            this._11525 = this.controlA;
         }
         else
         {
            this._11525 = this._controlB;
            this._11956.push(this._11525);
         }
         this._11956.push(this.end);
         if(Boolean(param1) && param1.length > 0)
         {
            _loc3_ = 0;
            _loc4_ = this._11956.length;
            while(_loc3_ < _loc4_)
            {
               _loc5_ = _loc3_ * 2;
               if(_loc5_ + 1 >= param1.length - 1)
               {
                  this._11956[_loc3_].setTo(param1[_loc5_],param1[_loc5_ + 1]);
               }
               _loc3_++;
            }
         }
      }
      
      private function _11519(param1:Number, param2:Rectangle) : Boolean
      {
         if(Utils.between(param1))
         {
            this.compute(param1,_4235);
            return Utils.between(_4235.x,param2.left,param2.right) && Utils.between(_4235.y,param2.top,param2.bottom);
         }
         return false;
      }
      
      public function copyFrom(param1:Bezier) : Bezier
      {
         if(!param1 || param1 === this)
         {
            throw new ArgumentError();
         }
         this._11522 = param1._11522;
         this._11521 = param1._11521;
         this.start.copyFrom(param1.start);
         this.end.copyFrom(param1.end);
         this.controlA.copyFrom(param1.controlA);
         this._11525.copyFrom(param1._11525);
         return this;
      }
      
      public function clone() : Bezier
      {
         var _loc1_:Bezier = new Bezier();
         _loc1_.copyFrom(this);
         return _loc1_;
      }
      
      public function update(param1:uint = 100) : void
      {
         var _loc5_:Vector.<Point> = null;
         var _loc6_:uint = 0;
         var _loc7_:Point = null;
         this._pointsD.length = 0;
         var _loc2_:Vector.<Point> = this._11956;
         var _loc3_:uint = this._11956.length;
         var _loc4_:int = int(_loc3_ - 1);
         while(_loc4_ > 0)
         {
            _loc5_ = new Vector.<Point>();
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               _loc7_ = new Point(_loc4_ * (_loc2_[_loc6_ + 1].x - _loc2_[_loc6_].x),_loc4_ * (_loc2_[_loc6_ + 1].y - _loc2_[_loc6_].y));
               _loc5_.push(_loc7_);
               _loc6_++;
            }
            this._pointsD.push(_loc5_);
            _loc2_ = _loc5_;
            _loc4_--;
         }
         this._lut.length = param1;
         _loc4_ = 0;
         while(_loc4_ <= param1)
         {
            this._lut[_loc4_] = this.compute(_loc4_ / param1);
            _loc4_++;
         }
      }
      
      public function compute(param1:Number, param2:Point = null) : Point
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         if(param1 !== param1)
         {
            param1 = 0;
         }
         else if(param1 < 0)
         {
            param1 = 0;
         }
         else if(param1 > 1)
         {
            param1 = 1;
         }
         param2 ||= new Point();
         if(param1 === 0)
         {
            param2.copyFrom(this.start);
         }
         else if(param1 === 1)
         {
            param2.copyFrom(this.end);
         }
         else
         {
            _loc3_ = param1 * param1;
            _loc4_ = 1 - param1;
            _loc5_ = _loc4_ * _loc4_;
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            _loc9_ = 0;
            if(this._11522)
            {
               _loc6_ = _loc5_;
               _loc7_ = _loc4_ * param1 * 2;
               _loc8_ = _loc3_;
               param2.setTo(_loc6_ * this.start.x + _loc7_ * this.controlA.x + _loc8_ * this.end.x,_loc6_ * this.start.y + _loc7_ * this.controlA.y + _loc8_ * this.end.y);
            }
            else
            {
               _loc6_ = _loc5_ * _loc4_;
               _loc7_ = _loc5_ * param1 * 3;
               _loc8_ = _loc4_ * _loc3_ * 3;
               _loc9_ = param1 * _loc3_;
               param2.setTo(_loc6_ * this.start.x + _loc7_ * this.controlA.x + _loc8_ * this._11525.x + _loc9_ * this.end.x,_loc6_ * this.start.y + _loc7_ * this.controlA.y + _loc8_ * this._11525.y + _loc9_ * this.end.y);
            }
         }
         return param2;
      }
      
      public function _11524(param1:Number, param2:Point = null) : Point
      {
         if(param1 !== param1)
         {
            param1 = 0;
         }
         else if(param1 < 0)
         {
            param1 = 0;
         }
         else if(param1 > 1)
         {
            param1 = 1;
         }
         param2 ||= new Point();
         var _loc3_:Vector.<Point> = this._pointsD[0];
         var _loc4_:Number = 1 - param1;
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         var _loc7_:Number = 0;
         if(this._11522)
         {
            _loc5_ = _loc4_;
            _loc6_ = param1;
            param2.setTo(_loc5_ * _loc3_[0].x + _loc6_ * _loc3_[1].x,_loc5_ * _loc3_[0].y + _loc6_ * _loc3_[1].y);
         }
         else
         {
            _loc5_ = _loc4_ * _loc4_;
            _loc6_ = _loc4_ * param1 * 2;
            _loc7_ = param1 * param1;
            param2.setTo(_loc5_ * _loc3_[0].x + _loc6_ * _loc3_[1].x + _loc7_ * _loc3_[2].x,_loc5_ * _loc3_[0].y + _loc6_ * _loc3_[1].y + _loc7_ * _loc3_[2].y);
         }
         return param2;
      }
      
      public function normal(param1:Number, param2:Point = null) : Point
      {
         if(param1 !== param1)
         {
            param1 = 0;
         }
         else if(param1 < 0)
         {
            param1 = 0;
         }
         else if(param1 > 1)
         {
            param1 = 1;
         }
         return param2 || new Point();
      }
      
      public function _11529(param1:Number) : Vector.<Point>
      {
         var _loc4_:Vector.<Point> = null;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:Point = null;
         var _loc2_:Vector.<Point> = this._11956.concat();
         var _loc3_:Vector.<Point> = this._11956;
         while(_loc3_.length > 1)
         {
            _loc4_ = new Vector.<Point>();
            _loc5_ = 0;
            _loc6_ = _loc3_.length - 1;
            while(_loc5_ < _loc6_)
            {
               _loc7_ = new Point();
               _loc2_.push(_loc7_);
               _loc4_.push(_loc7_);
               Utils._11530(param1,_loc3_[_loc5_],_loc3_[_loc5_ + 1],_loc7_);
               _loc5_++;
            }
            _loc3_ = _loc4_;
         }
         return _loc2_;
      }
      
      public function distance(param1:Point, param2:Array = null) : Number
      {
         var _loc11_:Number = NaN;
         if(!param1)
         {
            throw new ArgumentError();
         }
         param2 ||= [];
         var _loc3_:uint = this._lut.length - 1;
         var _loc4_:uint = Utils._11526(this._lut,param1,param2);
         if(_loc4_ === 0 || _loc4_ === _loc3_)
         {
            return _loc4_ / _loc3_;
         }
         var _loc5_:Number = (_loc4_ - 1) / _loc3_;
         var _loc6_:Number = (_loc4_ + 1) / _loc3_;
         var _loc7_:Number = 1 / _loc3_;
         var _loc8_:Number = param2[0] + 1;
         var _loc9_:Number;
         var _loc10_:Number = _loc9_ = _loc5_;
         while(_loc9_ < _loc6_ + _loc7_)
         {
            _loc11_ = Utils.distance(this.compute(_loc9_,_4235),param1);
            if(_loc11_ < _loc8_)
            {
               _loc8_ = _loc11_;
               _loc10_ = _loc9_;
            }
            _loc9_ += _loc7_;
         }
         param2[0] = _loc8_;
         return _loc9_;
      }
      
      public function _11520(param1:_11489._11490, param2:Vector.<Number> = null) : Vector.<Number>
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         var _loc30_:Number = NaN;
         var _loc31_:Number = NaN;
         if(!param1)
         {
            throw new ArgumentError();
         }
         param2 ||= new Vector.<Number>();
         var _loc3_:Vector.<Point> = param1.align(this._11956);
         var _loc4_:Rectangle = new Rectangle();
         if(param1.start.x <= param1.end.x)
         {
            _loc4_.left = param1.start.x;
            _loc4_.right = param1.end.x;
         }
         else
         {
            _loc4_.left = param1.end.x;
            _loc4_.right = param1.start.x;
         }
         if(param1.start.y <= param1.end.y)
         {
            _loc4_.top = param1.start.y;
            _loc4_.bottom = param1.end.y;
         }
         else
         {
            _loc4_.top = param1.end.y;
            _loc4_.bottom = param1.start.y;
         }
         var _loc5_:Number = 0;
         if(this._11522)
         {
            _loc6_ = _loc3_[0].y;
            _loc7_ = _loc3_[1].y;
            _loc8_ = _loc3_[2].y;
            _loc9_ = _loc6_ - 2 * _loc7_ + _loc8_;
            if(_loc9_ !== 0)
            {
               _loc10_ = -Math.sqrt(_loc7_ * _loc7_ - _loc6_ * _loc8_);
               _loc11_ = -_loc6_ + _loc7_;
               _loc5_ = -(_loc10_ + _loc11_) / _loc9_;
               if(this._11519(_loc5_,_loc4_))
               {
                  param2.push(_loc5_);
               }
               _loc5_ = -(-_loc10_ + _loc11_) / _loc9_;
               if(this._11519(_loc5_,_loc4_))
               {
                  param2.push(_loc5_);
               }
            }
            else if(_loc7_ !== _loc8_ && _loc9_ === 0)
            {
               _loc5_ = (2 * _loc7_ - _loc8_) / 2 * (_loc7_ - _loc8_);
               if(this._11519(_loc5_,_loc4_))
               {
                  param2.push(_loc5_);
               }
            }
         }
         else
         {
            _loc12_ = _loc3_[0].y;
            _loc13_ = _loc3_[1].y;
            _loc14_ = _loc3_[2].y;
            _loc15_ = _loc3_[3].y;
            _loc9_ = -_loc12_ + 3 * _loc13_ - 3 * _loc14_ + _loc15_;
            _loc6_ = (3 * _loc12_ - 6 * _loc13_ + 3 * _loc14_) / _loc9_;
            _loc7_ = (-3 * _loc12_ + 3 * _loc13_) / _loc9_;
            _loc8_ = _loc12_ / _loc9_;
            _loc16_ = (3 * _loc7_ - _loc6_ * _loc6_) / 3;
            _loc17_ = _loc16_ / 3;
            _loc18_ = (2 * _loc6_ * _loc6_ * _loc6_ - 9 * _loc6_ * _loc7_ + 27 * _loc8_) / 27;
            _loc19_ = _loc18_ / 2;
            _loc20_ = _loc19_ * _loc19_ + _loc17_ * _loc17_ * _loc17_;
            _loc21_ = 0;
            _loc22_ = 0;
            if(_loc20_ < 0)
            {
               _loc23_ = -_loc16_ / 3;
               _loc24_ = _loc23_ * _loc23_ * _loc23_;
               _loc25_ = Math.sqrt(_loc24_);
               _loc26_ = -_loc18_ / (2 * _loc25_);
               _loc27_ = _loc26_ < -1 ? -1 : (_loc26_ > 1 ? 1 : _loc26_);
               _loc28_ = Math.acos(_loc27_);
               _loc29_ = Utils.crt(_loc25_);
               _loc30_ = 2 * _loc29_;
               _loc5_ = _loc30_ * Math.cos(_loc28_ / 3) - _loc6_ / 3;
               if(this._11519(_loc5_,_loc4_))
               {
                  param2.push(_loc5_);
               }
               _loc5_ = _loc30_ * Math.cos((_loc28_ + Utils.PI_D) / 3) - _loc6_ / 3;
               if(this._11519(_loc5_,_loc4_))
               {
                  param2.push(_loc5_);
               }
               _loc5_ = _loc30_ * Math.cos((_loc28_ + 2 * Utils.PI_D) / 3) - _loc6_ / 3;
               if(this._11519(_loc5_,_loc4_))
               {
                  param2.push(_loc5_);
               }
            }
            else if(_loc20_ === 0)
            {
               _loc21_ = _loc19_ < 0 ? Utils.crt(-_loc19_) : -Utils.crt(_loc19_);
               _loc5_ = 2 * _loc21_ - _loc6_ / 3;
               if(this._11519(_loc5_,_loc4_))
               {
                  param2.push(_loc5_);
               }
               _loc5_ = -_loc21_ - _loc6_ / 3;
               if(this._11519(_loc5_,_loc4_))
               {
                  param2.push(_loc5_);
               }
            }
            else
            {
               _loc31_ = Math.sqrt(_loc20_);
               _loc21_ = Utils.crt(-_loc19_ + _loc31_);
               _loc22_ = Utils.crt(_loc19_ + _loc31_);
               _loc5_ = _loc21_ - _loc22_ - _loc6_ / 3;
               if(this._11519(_loc5_,_loc4_))
               {
                  param2.push(_loc5_);
               }
            }
         }
         return param2;
      }
      
      public function _11528() : void
      {
      }
      
      public function get _11523() : Boolean
      {
         return this._11522;
      }
      
      public function get _11527() : Boolean
      {
         return !this._11522;
      }
      
      public function get length() : Number
      {
         var _loc3_:uint = 0;
         var _loc5_:Number = NaN;
         var _loc6_:Point = null;
         var _loc1_:Number = 0.5;
         var _loc2_:Number = 0;
         var _loc4_:uint = T_VALUES.length;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = _loc1_ * T_VALUES[_loc3_] + _loc1_;
            _loc6_ = this._11524(_loc5_);
            _loc2_ += C_VALUES[_loc3_] * _loc6_.length;
            _loc3_++;
         }
         return _loc1_ * _loc2_;
      }
      
      public function get _11531() : Vector.<Point>
      {
         return this._lut;
      }
      
      public function get points() : Vector.<Point>
      {
         return this._11956;
      }
   }
}

