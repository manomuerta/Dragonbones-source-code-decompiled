package _81
{
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public final class _88
   {
      public static const ANGLE_TO_RADIAN:Number = Math.PI / 180;
      
      public static const RADIAN_TO_ANGLE:Number = 180 / Math.PI;
      
      private static const HALF_PI:Number = Math.PI * 0.5;
      
      private static const DOUBLE_PI:Number = Math.PI * 2;
      
      private static var _2204:Vector.<Number> = new Vector.<Number>(4);
      
      private static var _2203:Vector.<Number> = new Vector.<Number>(4);
      
      private static var _2206:Number = 0.0001;
      
      private static const _2205:Matrix = new Matrix();
      
      public function _88()
      {
         super();
      }
      
      public static function _2013(param1:_86, param2:Matrix) : void
      {
         param2.a = param1.scaleX * Math.cos(param1.skewY);
         param2.b = param1.scaleX * Math.sin(param1.skewY);
         param2.c = -param1.scaleY * Math.sin(param1.skewX);
         param2.d = param1.scaleY * Math.cos(param1.skewX);
         param2.tx = param1.x;
         param2.ty = param1.y;
      }
      
      public static function _2003(param1:Matrix, param2:_86) : void
      {
         param2.x = param1.tx;
         param2.y = param1.ty;
      }
      
      public static function _2191(param1:Matrix, param2:_86, param3:Boolean, param4:Boolean) : void
      {
         param2.scaleX = Math.sqrt(param1.a * param1.a + param1.b * param1.b) * (param3 ? 1 : -1);
         param2.scaleY = Math.sqrt(param1.d * param1.d + param1.c * param1.c) * (param4 ? 1 : -1);
      }
      
      public static function _2190(param1:Matrix, param2:_86, param3:Number, param4:Number) : void
      {
         _2204[0] = Math.acos(param1.d / param4);
         _2204[1] = -_2204[0];
         _2204[2] = Math.asin(-param1.c / param4);
         _2204[3] = _2204[2] >= 0 ? Math.PI - _2204[2] : _2204[2] - Math.PI;
         if(_2207(_2204[0],_2204[2]) || _2207(_2204[0],_2204[3]))
         {
            param2.skewX = _2204[0];
         }
         else
         {
            param2.skewX = _2204[1];
         }
         _2203[0] = Math.acos(param1.a / param3);
         _2203[1] = -_2203[0];
         _2203[2] = Math.asin(param1.b / param3);
         _2203[3] = _2203[2] >= 0 ? Math.PI - _2203[2] : _2203[2] - Math.PI;
         if(_2207(_2203[0],_2203[2]) || _2207(_2203[0],_2203[3]))
         {
            param2.skewY = _2203[0];
         }
         else
         {
            param2.skewY = _2203[1];
         }
      }
      
      public static function _2014(param1:Matrix, param2:_86, param3:Boolean, param4:Boolean) : void
      {
         _2003(param1,param2);
         _2191(param1,param2,param3,param4);
         _2190(param1,param2,param2.scaleX,param2.scaleY);
      }
      
      public static function _2135(param1:Point, param2:Matrix, param3:Boolean = false) : Point
      {
         _2205.tx = param1.x;
         _2205.ty = param1.y;
         _2205.concat(param2);
         if(param3)
         {
            return new Point(_2205.tx,_2205.ty);
         }
         param1.x = _2205.tx;
         param1.y = _2205.ty;
         return param1;
      }
      
      private static function _2207(param1:Number, param2:Number) : Boolean
      {
         if(param1 >= param2)
         {
            return param1 - param2 <= _2206;
         }
         return param2 - param1 <= _2206;
      }
   }
}

