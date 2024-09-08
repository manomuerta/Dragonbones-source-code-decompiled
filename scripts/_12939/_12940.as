package _12939
{
   public class _12940
   {
      public function _12940()
      {
         super();
      }
      
      public static function _13124(param1:Array) : Array
      {
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc2_:int = int(param1.length);
         for(_loc3_ in param1)
         {
            _loc4_ = param1[_loc3_];
            _loc5_ = 0;
            while(_loc5_ < _loc2_)
            {
               _loc4_[_loc5_] &= 1;
               _loc5_++;
            }
            param1[_loc3_] = _loc4_;
         }
         return param1;
      }
      
      public static function _13164(param1:Array) : String
      {
         var _loc5_:int = 0;
         var _loc2_:String = "";
         var _loc3_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc3_)
            {
               _loc2_ += param1[_loc4_][_loc5_].toString().charCodeAt() + ",";
               _loc5_++;
            }
            _loc4_++;
         }
         return _loc2_;
      }
   }
}

