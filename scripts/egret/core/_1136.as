package egret.core
{
   import flash.geom.Matrix;
   
   public class _1136
   {
      private static const DEFAULT_MAX_WIDTH:Number = 10000;
      
      private static const DEFAULT_MAX_HEIGHT:Number = 10000;
      
      public function _1136()
      {
         super();
      }
      
      public static function _8490(param1:_1130, param2:Matrix) : Number
      {
         return _8662(param1);
      }
      
      public static function _8487(param1:_1130, param2:Matrix) : Number
      {
         return _8661(param1);
      }
      
      public static function _8506(param1:_1130, param2:Matrix) : Number
      {
         return _8663(param1);
      }
      
      public static function _8505(param1:_1130, param2:Matrix) : Number
      {
         return _8660(param1);
      }
      
      private static function _8662(param1:_1130) : Number
      {
         var _loc2_:Number = NaN;
         if(!isNaN(param1._8314))
         {
            _loc2_ = param1._8314;
         }
         else
         {
            _loc2_ = isNaN(param1._7983) ? 0 : param1._7983;
            if(!isNaN(param1._6706))
            {
               _loc2_ = Math.min(_loc2_,param1._6706);
            }
         }
         return _loc2_;
      }
      
      private static function _8661(param1:_1130) : Number
      {
         var _loc2_:Number = NaN;
         if(!isNaN(param1._8311))
         {
            _loc2_ = param1._8311;
         }
         else
         {
            _loc2_ = isNaN(param1._7980) ? 0 : param1._7980;
            if(!isNaN(param1._6704))
            {
               _loc2_ = Math.min(_loc2_,param1._6704);
            }
         }
         return _loc2_;
      }
      
      private static function _8663(param1:_1130) : Number
      {
         var _loc2_:Number = NaN;
         if(!isNaN(param1._6706))
         {
            _loc2_ = param1._6706;
         }
         else
         {
            _loc2_ = DEFAULT_MAX_WIDTH;
         }
         return _loc2_;
      }
      
      private static function _8660(param1:_1130) : Number
      {
         var _loc2_:Number = NaN;
         if(!isNaN(param1._6704))
         {
            _loc2_ = param1._6704;
         }
         else
         {
            _loc2_ = DEFAULT_MAX_HEIGHT;
         }
         return _loc2_;
      }
   }
}

