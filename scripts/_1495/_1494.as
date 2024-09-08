package _1495
{
   public class _1494
   {
      private static var _10067:Array = [];
      
      public function _1494()
      {
         super();
      }
      
      public static function _1848() : int
      {
         var _loc1_:int = 0;
         while(_10066(_loc1_))
         {
            _loc1_++;
         }
         _10068(_loc1_);
         return _loc1_;
      }
      
      private static function _10066(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         while(_loc2_ < _10067.length)
         {
            if(param1 == _10067[_loc2_])
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public static function _10068(param1:int) : void
      {
         if(_10066(param1) == false)
         {
            _10067.push(param1);
         }
      }
   }
}

