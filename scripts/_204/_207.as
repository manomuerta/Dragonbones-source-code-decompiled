package _204
{
   public final class _207
   {
      public function _207()
      {
         super();
      }
      
      public static function _2772(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = 1;
         if(param2 > 1)
         {
            _loc3_ = 0.5 * (1 - Math.cos(param1 * Math.PI));
            param2--;
         }
         else if(param2 > 0)
         {
            _loc3_ = 1 - Math.pow(1 - param1,2);
         }
         else if(param2 < 0)
         {
            param2 *= -1;
            _loc3_ = Math.pow(param1,2);
         }
         return (_loc3_ - param1) * param2 + param1;
      }
   }
}

