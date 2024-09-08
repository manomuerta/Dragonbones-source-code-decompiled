package _204
{
   import _178._184;
   import flash.geom.Matrix;
   
   public final class _209
   {
      private static const HALF_PI:Number = Math.PI * 0.5;
      
      private static const DOUBLE_PI:Number = Math.PI * 2;
      
      private static const _helpTransformMatrix:Matrix = new Matrix();
      
      private static const _helpParentTransformMatrix:Matrix = new Matrix();
      
      public function _209()
      {
         super();
      }
      
      public static function _2013(param1:_184, param2:Matrix) : void
      {
         param2.a = param1.scaleX * Math.cos(param1.skewY);
         param2.b = param1.scaleX * Math.sin(param1.skewY);
         param2.c = -param1.scaleY * Math.sin(param1.skewX);
         param2.d = param1.scaleY * Math.cos(param1.skewX);
         param2.tx = param1.x;
         param2.ty = param1.y;
      }
      
      public static function _2804(param1:Number) : Number
      {
         if(param1 > Math.PI)
         {
            param1 -= DOUBLE_PI;
         }
         if(param1 < -Math.PI)
         {
            param1 += DOUBLE_PI;
         }
         return param1;
      }
      
      public static function _2014(param1:Matrix, param2:_184, param3:Boolean, param4:Boolean) : void
      {
         param2.x = param1.tx;
         param2.y = param1.ty;
         param2.scaleX = Math.sqrt(param1.a * param1.a + param1.b * param1.b) * (param3 ? 1 : -1);
         param2.scaleY = Math.sqrt(param1.d * param1.d + param1.c * param1.c) * (param4 ? 1 : -1);
         var _loc5_:Array;
         (_loc5_ = [])[0] = Math.acos(param1.d / param2.scaleY);
         _loc5_[1] = -_loc5_[0];
         _loc5_[2] = Math.asin(-param1.c / param2.scaleY);
         _loc5_[3] = _loc5_[2] >= 0 ? Math.PI - _loc5_[2] : _loc5_[2] - Math.PI;
         if(Number(_loc5_[0]).toFixed(4) == Number(_loc5_[2]).toFixed(4) || Number(_loc5_[0]).toFixed(4) == Number(_loc5_[3]).toFixed(4))
         {
            param2.skewX = _loc5_[0];
         }
         else
         {
            param2.skewX = _loc5_[1];
         }
         var _loc6_:Array;
         (_loc6_ = [])[0] = Math.acos(param1.a / param2.scaleX);
         _loc6_[1] = -_loc6_[0];
         _loc6_[2] = Math.asin(param1.b / param2.scaleX);
         _loc6_[3] = _loc6_[2] >= 0 ? Math.PI - _loc6_[2] : _loc6_[2] - Math.PI;
         if(Number(_loc6_[0]).toFixed(4) == Number(_loc6_[2]).toFixed(4) || Number(_loc6_[0]).toFixed(4) == Number(_loc6_[3]).toFixed(4))
         {
            param2.skewY = _loc6_[0];
         }
         else
         {
            param2.skewY = _loc6_[1];
         }
      }
   }
}

