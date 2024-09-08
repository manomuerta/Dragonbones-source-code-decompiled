package _14240
{
   import flash.geom.Point;
   
   public class _14239
   {
      public function _14239()
      {
         super();
      }
      
      public static function _15412(param1:Number, param2:Number, param3:Number, param4:Boolean, param5:Boolean, param6:Number, param7:Number, param8:Number, param9:Number) : Object
      {
         var _loc35_:Number = NaN;
         var _loc36_:Number = NaN;
         var _loc10_:Number = param3;
         var _loc11_:Number = (param8 - param6) / 2;
         var _loc12_:Number = (param9 - param7) / 2;
         param3 = _14244._15487(param3);
         var _loc13_:Number = Math.cos(param3);
         var _loc14_:Number = Math.sin(param3);
         var _loc15_:Number = _loc13_ * _loc11_ + _loc14_ * _loc12_;
         var _loc16_:Number = -_loc14_ * _loc11_ + _loc13_ * _loc12_;
         param1 = Math.abs(param1);
         param2 = Math.abs(param2);
         var _loc17_:Number = param1 * param1;
         var _loc18_:Number = param2 * param2;
         var _loc19_:Number = _loc15_ * _loc15_;
         var _loc20_:Number = _loc16_ * _loc16_;
         var _loc21_:Number = _loc19_ / _loc17_ + _loc20_ / _loc18_;
         if(_loc21_ > 1)
         {
            param1 = Math.sqrt(_loc21_) * param1;
            param2 = Math.sqrt(_loc21_) * param2;
            _loc17_ = param1 * param1;
            _loc18_ = param2 * param2;
         }
         var _loc22_:Number = param4 == param5 ? -1 : 1;
         var _loc23_:Number = (_loc17_ * _loc18_ - _loc17_ * _loc20_ - _loc18_ * _loc19_) / (_loc17_ * _loc20_ + _loc18_ * _loc19_);
         _loc23_ = _loc23_ < 0 ? 0 : _loc23_;
         var _loc24_:Number = _loc22_ * Math.sqrt(_loc23_);
         var _loc25_:Number = _loc24_ * (param1 * _loc16_ / param2);
         var _loc26_:Number = _loc24_ * -(param2 * _loc15_ / param1);
         var _loc27_:Number = (param8 + param6) / 2;
         var _loc28_:Number = (param9 + param7) / 2;
         var _loc29_:Number = _loc27_ + (_loc13_ * _loc25_ - _loc14_ * _loc26_);
         var _loc30_:Number = _loc28_ + (_loc14_ * _loc25_ + _loc13_ * _loc26_);
         var _loc31_:Number = (_loc15_ - _loc25_) / param1;
         var _loc32_:Number = (_loc16_ - _loc26_) / param2;
         var _loc33_:Number = (-_loc15_ - _loc25_) / param1;
         var _loc34_:Number = (-_loc16_ - _loc26_) / param2;
         _loc36_ = Math.sqrt(_loc31_ * _loc31_ + _loc32_ * _loc32_);
         _loc35_ = _loc31_;
         _loc22_ = _loc32_ < 0 ? -1 : 1;
         var _loc37_:Number = _14244._15241(_loc22_ * Math.acos(_loc35_ / _loc36_));
         _loc36_ = Math.sqrt((_loc31_ * _loc31_ + _loc32_ * _loc32_) * (_loc33_ * _loc33_ + _loc34_ * _loc34_));
         _loc35_ = _loc31_ * _loc33_ + _loc32_ * _loc34_;
         _loc22_ = _loc31_ * _loc34_ - _loc32_ * _loc33_ < 0 ? -1 : 1;
         var _loc38_:Number = _14244._15241(_loc22_ * Math.acos(_loc35_ / _loc36_));
         if(!param5 && _loc38_ > 0)
         {
            _loc38_ -= 360;
         }
         else if(param5 && _loc38_ < 0)
         {
            _loc38_ += 360;
         }
         _loc38_ %= 360;
         _loc37_ %= 360;
         return Object({
            "x":param8,
            "y":param9,
            "startAngle":_loc37_,
            "arc":_loc38_,
            "radius":param1,
            "yRadius":param2,
            "_15176":_loc10_,
            "cx":_loc29_,
            "cy":_loc30_
         });
      }
      
      public static function _15410(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number = 0) : Array
      {
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:int = 0;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc8_:Array = [];
         if(Math.abs(param4) > 360)
         {
            param4 = 360;
         }
         var _loc9_:Number = Math.ceil(Math.abs(param4) / 45);
         var _loc10_:Number = param4 / _loc9_;
         var _loc11_:Number = _14244._15487(_loc10_);
         var _loc12_:Number = _14244._15487(param3);
         if(_loc9_ > 0)
         {
            _loc13_ = _14244._15487(param7);
            _loc14_ = Math.sin(_loc13_);
            _loc15_ = Math.cos(_loc13_);
            _loc20_ = 0;
            while(_loc20_ < _loc9_)
            {
               _loc12_ += _loc11_;
               _loc21_ = Math.sin(_loc12_ - _loc11_ / 2);
               _loc22_ = Math.cos(_loc12_ - _loc11_ / 2);
               _loc23_ = Math.cos(_loc11_ / 2);
               _loc16_ = param1 + (param5 * _loc22_ * _loc15_ - param6 * _loc21_ * _loc14_) / _loc23_;
               _loc17_ = param2 + (param5 * _loc22_ * _loc14_ + param6 * _loc21_ * _loc15_) / _loc23_;
               _loc21_ = Math.sin(_loc12_);
               _loc22_ = Math.cos(_loc12_);
               _loc18_ = param1 + (param5 * _loc22_ * _loc15_ - param6 * _loc21_ * _loc14_);
               _loc19_ = param2 + (param5 * _loc22_ * _loc14_ + param6 * _loc21_ * _loc15_);
               _loc8_.push({
                  "s":new Point(param1,param2),
                  "c":new Point(_loc16_,_loc17_),
                  "p":new Point(_loc18_,_loc19_)
               });
               _loc20_++;
            }
         }
         return _loc8_;
      }
   }
}

