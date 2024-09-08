package _14240
{
   import flash.geom.Point;
   
   public final class _14244
   {
      public function _14244()
      {
         super();
      }
      
      public static function _15488(param1:Point, param2:Point, param3:Point, param4:Point) : Point
      {
         var _loc5_:Number = param1.x;
         var _loc6_:Number = param1.y;
         var _loc7_:Number = param4.x;
         var _loc8_:Number = param4.y;
         var _loc9_:Number = param2.x - _loc5_;
         var _loc10_:Number = param3.x - _loc7_;
         if(!_loc9_ && !_loc10_)
         {
            return null;
         }
         var _loc11_:Number = (param2.y - _loc6_) / _loc9_;
         var _loc12_:Number = (param3.y - _loc8_) / _loc10_;
         if(!_loc9_)
         {
            return new Point(_loc5_,_loc12_ * (_loc5_ - _loc7_) + _loc8_);
         }
         if(!_loc10_)
         {
            return new Point(_loc7_,_loc11_ * (_loc7_ - _loc5_) + _loc6_);
         }
         var _loc13_:Number = (-_loc12_ * _loc7_ + _loc8_ + _loc11_ * _loc5_ - _loc6_) / (_loc11_ - _loc12_);
         var _loc14_:Number = _loc11_ * (_loc13_ - _loc5_) + _loc6_;
         return new Point(_loc13_,_loc14_);
      }
      
      public static function _15498(param1:Point, param2:Point) : Point
      {
         return Point.interpolate(param1,param2,0.5);
      }
      
      public static function _15493(param1:Point, param2:Point, param3:Point, param4:Point) : Object
      {
         var _loc5_:Function = _14244._15498;
         var _loc6_:Point = _loc5_(param1,param2);
         var _loc7_:Point = _loc5_(param2,param3);
         var _loc8_:Point = _loc5_(param3,param4);
         var _loc9_:Point = _loc5_(_loc6_,_loc7_);
         var _loc10_:Point = _loc5_(_loc7_,_loc8_);
         var _loc11_:Point = _loc5_(_loc9_,_loc10_);
         return {
            "b0":{
               "a":param1,
               "b":_loc6_,
               "c":_loc9_,
               "d":_loc11_
            },
            "b1":{
               "a":_loc11_,
               "b":_loc10_,
               "c":_loc8_,
               "d":param4
            }
         };
      }
      
      public static function _15487(param1:Number) : Number
      {
         return param1 * (Math.PI / 180);
      }
      
      public static function _15241(param1:Number) : Number
      {
         return param1 * (180 / Math.PI);
      }
      
      public static function _15404(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number) : Array
      {
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         if(isNaN(param7))
         {
            param7 = 1;
         }
         if(param7 != 1)
         {
            _loc8_ = param3 + (param5 - param3) * param7;
            _loc9_ = param4 + (param6 - param4) * param7;
            param3 = param1 + (param3 - param1) * param7;
            param4 = param2 + (param4 - param2) * param7;
            param5 = param3 + (_loc8_ - param3) * param7;
            param6 = param4 + (_loc9_ - param4) * param7;
         }
         return [param1,param2,param3,param4,param5,param6];
      }
      
      public static function _15405(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number) : Array
      {
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         if(isNaN(param7))
         {
            param7 = 1;
         }
         if(param7 != 1)
         {
            _loc8_ = param1 + (param3 - param1) * param7;
            _loc9_ = param2 + (param4 - param2) * param7;
            param3 += (param5 - param3) * param7;
            param4 += (param6 - param4) * param7;
            param1 = _loc8_ + (param3 - _loc8_) * param7;
            param2 = _loc9_ + (param4 - _loc9_) * param7;
         }
         return [param1,param2,param3,param4,param5,param6];
      }
   }
}

