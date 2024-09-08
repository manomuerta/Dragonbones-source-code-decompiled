package _11489
{
   import flash.geom.Point;
   
   public class Utils
   {
      public static const PI_D:Number = Math.PI * 2;
      
      public static const PI_H:Number = Math.PI * 0.5;
      
      public function Utils()
      {
         super();
      }
      
      public static function crt(param1:Number) : Number
      {
         return param1 < 0 ? -Math.pow(-param1,1 / 3) : Math.pow(param1,1 / 3);
      }
      
      public static function between(param1:Number, param2:Number = 0, param3:Number = 1) : Boolean
      {
         if(param2 === param3)
         {
            param2 -= 0.000001;
            param3 += 0.000001;
         }
         return param2 <= param1 && param1 <= param3;
      }
      
      public static function _11530(param1:Number, param2:Point, param3:Point, param4:Point) : void
      {
         param4.setTo(param2.x + param1 * (param3.x - param2.x),param2.y + param1 * (param3.y - param2.y));
      }
      
      public static function distance(param1:Point, param2:Point) : Number
      {
         var _loc3_:Number = param2.x - param1.x;
         var _loc4_:Number = param2.y - param1.y;
         return Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_);
      }
      
      public static function _11526(param1:Vector.<Point>, param2:Point, param3:Array = null) : uint
      {
         var _loc8_:Number = NaN;
         var _loc4_:Number = Number.MAX_VALUE;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = param1.length;
         while(_loc6_ < _loc7_)
         {
            _loc8_ = distance(param1[_loc6_],param2);
            if(_loc8_ < _loc4_)
            {
               _loc4_ = _loc8_;
               _loc5_ = _loc6_;
            }
            _loc6_++;
         }
         if(param3)
         {
            param3[0] = _loc4_;
         }
         return _loc5_;
      }
   }
}

