package _14223
{
   import _14240.Bezier;
   import _14240._14239;
   import _14240._14244;
   import flash.geom.Point;
   
   public class _14222 implements _14226
   {
      private var _15417:_14226;
      
      private var _15422:Array;
      
      private var _15419:Number = 0;
      
      private var _12265:Number = 20;
      
      private var _15408:Boolean = false;
      
      private var _15411:Number = 6;
      
      private var _14299:Boolean = true;
      
      private var _15421:uint = 0;
      
      private var _15406:Number = 0;
      
      private var _15415:Number = 1;
      
      private var _15420:Boolean = false;
      
      public function _14222(param1:_14226)
      {
         this._15422 = [10,10];
         super();
         this._15417 = param1;
         this._15424(this._15419);
      }
      
      public function get _15425() : Number
      {
         return this._15417._15425;
      }
      
      public function get _15426() : Number
      {
         return this._15417._15426;
      }
      
      public function get _15279() : Array
      {
         return this._15422;
      }
      
      public function set _15279(param1:Array) : void
      {
         var _loc3_:Number = NaN;
         var _loc2_:uint = 0;
         while(_loc2_ < param1.length)
         {
            if(isNaN(param1[_loc2_] = Number(param1[_loc2_])) || param1[_loc2_] < 0)
            {
               return;
            }
            _loc2_++;
         }
         if(param1.length & 1)
         {
            param1 = param1.concat(param1);
         }
         this._12265 = 0;
         for each(_loc3_ in param1)
         {
            this._12265 += _loc3_;
         }
         this._15422 = param1;
         this._15424(this._15419);
      }
      
      public function get _15277() : Number
      {
         return this._15419;
      }
      
      public function set _15277(param1:Number) : void
      {
         this._15419 = param1;
         this._15424(this._15419);
      }
      
      public function get _15275() : Boolean
      {
         return this._15408;
      }
      
      public function set _15275(param1:Boolean) : void
      {
         this._15408 = param1;
      }
      
      private function _15424(param1:Number) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:Number = NaN;
         this._14299 = true;
         this._15421 = 0;
         this._15406 = 0;
         param1 %= this._12265;
         if(param1 < 0)
         {
            param1 = this._12265 - param1;
         }
         while(param1 > 0)
         {
            _loc3_ = Math.min(param1,this._15422[this._15421]);
            param1 -= _loc3_;
            this._15409(_loc3_);
         }
      }
      
      private function _15414() : Number
      {
         if(this._15420)
         {
            return this._15422[this._15421] * this._15415;
         }
         return this._15422[this._15421];
      }
      
      private function _15409(param1:Number) : void
      {
         this._15406 += param1;
         if(this._15406 >= this._15414())
         {
            this._14299 = !this._14299;
            ++this._15421;
            if(this._15421 > this._15279.length - 1)
            {
               this._15421 = 0;
            }
            this._15406 = 0;
         }
      }
      
      private function _15413(param1:Number) : void
      {
         var _loc2_:Number = this._15422[0] / 2;
         var _loc3_:Number = this._15422[this._15422.length - 1] + this._15422[this._15422.length - 2] / 2;
         param1 += _loc2_ + _loc3_;
         var _loc4_:int = Math.round(param1 / this._12265);
         var _loc5_:Number = this._12265 * _loc4_;
         this._15415 = param1 / _loc5_;
         this._15424(_loc2_);
         this._15420 = true;
      }
      
      private function _15416() : void
      {
         this._15420 = false;
         this._15415 = 1;
      }
      
      public function moveTo(param1:Number, param2:Number) : void
      {
         this._15417.moveTo(param1,param2);
      }
      
      public function lineTo(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         if(this._15408 && !this._15420)
         {
            this._15413(this._14756(param1 - this._15425,param2 - this._15426));
            this.lineTo(param1,param2);
            this._15416();
            return;
         }
         do
         {
            _loc3_ = param1 - this._15425;
            _loc4_ = param2 - this._15426;
            _loc5_ = this._14756(_loc3_,_loc4_);
            _loc6_ = Math.min(_loc5_,this._15414() - this._15406);
            if(_loc6_ < _loc5_)
            {
               _loc9_ = Math.atan2(_loc4_,_loc3_);
               _loc7_ = Math.cos(_loc9_) * _loc6_ + this._15425;
               _loc8_ = Math.sin(_loc9_) * _loc6_ + this._15426;
            }
            else
            {
               _loc7_ = param1;
               _loc8_ = param2;
            }
            if(this._14299)
            {
               this._15417.lineTo(_loc7_,_loc8_);
            }
            else
            {
               this._15417.moveTo(_loc7_,_loc8_);
            }
            this._15409(_loc6_);
         }
         while(_loc6_ < _loc5_);
         
         this._15415 = 1;
      }
      
      public function curveTo(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Array = null;
         var _loc13_:Array = null;
         if(this._15408 && !this._15420)
         {
            this._15413(this._15418(this._15425,this._15426,param1,param2,param3,param4,this._15411));
            this.curveTo(param1,param2,param3,param4);
            this._15416();
            return;
         }
         do
         {
            _loc5_ = this._15418(this._15425,this._15426,param1,param2,param3,param4,this._15411);
            _loc6_ = Math.min(_loc5_,this._15414() - this._15406);
            if(_loc6_ < _loc5_)
            {
               _loc11_ = _loc6_ / _loc5_;
               _loc12_ = _14244._15404(this._15425,this._15426,param1,param2,param3,param4,_loc11_);
               _loc7_ = Number(_loc12_[2]);
               _loc8_ = Number(_loc12_[3]);
               _loc9_ = Number(_loc12_[4]);
               _loc10_ = Number(_loc12_[5]);
               _loc13_ = _14244._15405(this._15425,this._15426,param1,param2,param3,param4,_loc11_);
               param1 = Number(_loc13_[2]);
               param2 = Number(_loc13_[3]);
            }
            else
            {
               _loc7_ = param1;
               _loc8_ = param2;
               _loc9_ = param3;
               _loc10_ = param4;
            }
            if(this._14299)
            {
               this._15417.curveTo(_loc7_,_loc8_,_loc9_,_loc10_);
            }
            else
            {
               this._15417.moveTo(_loc9_,_loc10_);
            }
            this._15409(_loc6_);
         }
         while(_loc6_ < _loc5_);
         
      }
      
      public function cubicCurveTo(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         var _loc8_:Object = null;
         if(this._15408 && !this._15420)
         {
            this._15413(this._15407(this._15425,this._15426,param1,param2,param3,param4,param5,param6,this._15411));
            this.cubicCurveTo(param1,param2,param3,param4,param5,param6);
            this._15416();
            return;
         }
         var _loc7_:Bezier = new Bezier(new Point(this._15425,this._15426),new Point(param1,param2),new Point(param3,param4),new Point(param5,param6));
         for each(_loc8_ in _loc7_._15427)
         {
            this.curveTo(_loc8_.c.x,_loc8_.c.y,_loc8_.p.x,_loc8_.p.y);
         }
      }
      
      public function _15324(param1:Number, param2:Number, param3:Number, param4:Boolean, param5:Boolean, param6:Number, param7:Number) : void
      {
         if(this._15408 && !this._15420)
         {
            this._15413(this._15423(this._15425,this._15426,param1,param2,param3,param4,param5,param6,param7,this._15411));
            this._15324(param1,param2,param3,param4,param5,param6,param7);
            this._15416();
            return;
         }
         var _loc8_:Object = _14239._15412(param1,param2,param3,param4,param5,param6,param7,this._15425,this._15426);
         var _loc9_:Array = _14239._15410(_loc8_.cx,_loc8_.cy,_loc8_.startAngle,_loc8_.arc,_loc8_.radius,_loc8_.yRadius,_loc8_._15176);
         var _loc10_:int = 0;
         while(_loc10_ < _loc9_.length)
         {
            this.curveTo(_loc9_[_loc10_].c.x,_loc9_[_loc10_].c.y,_loc9_[_loc10_].p.x,_loc9_[_loc10_].p.y);
            _loc10_++;
         }
      }
      
      private function _14756(param1:Number, param2:Number, param3:Number = 0, param4:Number = 0) : Number
      {
         if(arguments.length == 2)
         {
            return Math.sqrt(param1 * param1 + param2 * param2);
         }
         var _loc6_:Number = param3 - param1;
         var _loc7_:Number = param4 - param2;
         return Math.sqrt(_loc6_ * _loc6_ + _loc7_ * _loc7_);
      }
      
      private function _15418(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number) : Number
      {
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc8_:Number = 0;
         var _loc9_:Number = param1;
         var _loc10_:Number = param2;
         var _loc18_:Number = !!param7 ? param7 : this._15411;
         var _loc19_:Number = 1;
         while(_loc19_ <= _loc18_)
         {
            _loc13_ = _loc19_ / _loc18_;
            _loc14_ = 1 - _loc13_;
            _loc15_ = _loc14_ * _loc14_;
            _loc16_ = 2 * _loc13_ * _loc14_;
            _loc17_ = _loc13_ * _loc13_;
            _loc11_ = _loc15_ * param1 + _loc16_ * param3 + _loc17_ * param5;
            _loc12_ = _loc15_ * param2 + _loc16_ * param4 + _loc17_ * param6;
            _loc8_ += this._14756(_loc9_,_loc10_,_loc11_,_loc12_);
            _loc9_ = _loc11_;
            _loc10_ = _loc12_;
            _loc19_++;
         }
         return _loc8_;
      }
      
      private function _15407(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : Number
      {
         var _loc14_:Object = null;
         var _loc10_:Bezier = new Bezier(new Point(param1,param2),new Point(param3,param4),new Point(param5,param6),new Point(param7,param8));
         var _loc11_:Number = 0;
         var _loc12_:Number = param1;
         var _loc13_:Number = param2;
         for each(_loc14_ in _loc10_._15427)
         {
            _loc11_ += this._15418(_loc12_,_loc13_,_loc14_.c.x,_loc14_.c.y,_loc14_.p.x,_loc14_.p.y,param9);
            _loc12_ = Number(_loc14_.p.x);
            _loc13_ = Number(_loc14_.p.y);
         }
         return _loc11_;
      }
      
      private function _15423(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Boolean, param7:Boolean, param8:Number, param9:Number, param10:Number) : Number
      {
         var _loc11_:Object = _14239._15412(param3,param4,param5,param6,param7,param8,param9,param1,param2);
         var _loc12_:Array = _14239._15410(_loc11_.cx,_loc11_.cy,_loc11_.startAngle,_loc11_.arc,_loc11_.radius,_loc11_.yRadius,_loc11_._15176);
         var _loc13_:Number = 0;
         var _loc14_:Number = param1;
         var _loc15_:Number = param2;
         var _loc16_:int = 0;
         while(_loc16_ < _loc12_.length)
         {
            _loc13_ += this._15418(_loc14_,_loc15_,_loc12_[_loc16_].c.x,_loc12_[_loc16_].c.y,_loc12_[_loc16_].p.x,_loc12_[_loc16_].p.y,param10);
            _loc14_ = Number(_loc12_[_loc16_].p.x);
            _loc15_ = Number(_loc12_[_loc16_].p.y);
            _loc16_++;
         }
         return _loc13_;
      }
   }
}

