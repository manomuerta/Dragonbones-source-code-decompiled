package _127
{
   import flash.geom.Point;
   
   public class _149
   {
      public function _149()
      {
         super();
      }
      
      public static function _2546(param1:Point, param2:Point) : Number
      {
         var _loc3_:Number = param2.x - param1.x;
         var _loc4_:Number = param2.y - param1.y;
         var _loc5_:Number = Math.atan(_loc4_ / _loc3_) * 180 / Math.PI;
         if(_loc3_ < 0)
         {
            _loc5_ = 180 + _loc5_;
         }
         if(_loc3_ >= 0 && _loc4_ < 0)
         {
            _loc5_ = 360 + _loc5_;
         }
         if(!_loc5_)
         {
            _loc5_ = 0;
         }
         return _loc5_;
      }
      
      public static function _2555(param1:Point, param2:Number) : Point
      {
         var _loc3_:Number = Math.cos(Math.PI * param2 / 180) * param1.x - Math.sin(Math.PI * param2 / 180) * param1.y;
         var _loc4_:Number = Math.cos(Math.PI * param2 / 180) * param1.y + Math.sin(Math.PI * param2 / 180) * param1.x;
         return new Point(_loc3_,_loc4_);
      }
   }
}

