package _81
{
   import flash.geom.Point;
   
   public class _85
   {
      public static var _2189:Point = new Point();
      
      public function _85()
      {
         super();
      }
      
      public static function _1738(param1:Number) : Number
      {
         param1 = (param1 + Math.PI) % (2 * Math.PI);
         param1 = param1 > 0 ? param1 : 2 * Math.PI + param1;
         return param1 - Math.PI;
      }
      
      public static function _11115(param1:Number) : Number
      {
         param1 = (param1 + 180) % 360;
         param1 = param1 > 0 ? param1 : 360 + param1;
         return param1 - 180;
      }
      
      public static function _2185(param1:Point, param2:Point) : Number
      {
         return Math.sqrt(Math.pow(param1.x - param2.x,2) + Math.pow(param1.y - param2.y,2));
      }
      
      public static function _2187(param1:Point, param2:Point, param3:Point, param4:Point) : Number
      {
         var _loc5_:Number = _2186(param3,param4) - _2186(param1,param2);
         if(_loc5_ > Math.PI)
         {
            _loc5_ -= 2 * Math.PI;
         }
         else if(_loc5_ < -Math.PI)
         {
            _loc5_ += 2 * Math.PI;
         }
         return _loc5_;
      }
      
      public static function _2186(param1:Point, param2:Point) : Number
      {
         var _loc3_:Number = param2.x - param1.x;
         var _loc4_:Number = param2.y - param1.y;
         var _loc5_:Number = Math.atan(_loc4_ / _loc3_);
         if(!_loc5_)
         {
            _loc5_ = 0;
         }
         if(_loc3_ < 0 && _loc4_ > 0)
         {
            _loc5_ += Math.PI;
         }
         else if(_loc3_ < 0 && _loc4_ < 0)
         {
            _loc5_ -= Math.PI;
         }
         return _loc5_;
      }
      
      public static function _2171(param1:Point, param2:Point, param3:Point, param4:Point) : Boolean
      {
         var _loc5_:Number = direction(param3,param4,param1);
         var _loc6_:Number = direction(param3,param4,param2);
         var _loc7_:Number = direction(param1,param2,param3);
         var _loc8_:Number = direction(param1,param2,param4);
         if(_loc5_ * _loc6_ < 0 && _loc7_ * _loc8_ < 0)
         {
            return true;
         }
         if(_loc5_ == 0 && _2188(param3,param4,param1))
         {
            return true;
         }
         if(_loc6_ == 0 && _2188(param3,param4,param2))
         {
            return true;
         }
         if(_loc7_ == 0 && _2188(param1,param2,param3))
         {
            return true;
         }
         if(_loc8_ == 0 && _2188(param1,param2,param4))
         {
            return true;
         }
         return false;
      }
      
      private static function _2188(param1:Point, param2:Point, param3:Point) : Boolean
      {
         if(Math.min(param1.x,param2.x) <= param3.x && param3.x <= Math.max(param1.x,param2.x))
         {
            if(Math.min(param1.y,param2.y) <= param3.y && param3.y <= Math.max(param1.y,param2.y))
            {
               return true;
            }
         }
         return false;
      }
      
      private static function direction(param1:Point, param2:Point, param3:Point) : Number
      {
         return (param1.x - param3.x) * (param1.y - param2.y) - (param1.y - param3.y) * (param1.x - param2.x);
      }
   }
}

