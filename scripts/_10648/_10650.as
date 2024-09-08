package _10648
{
   public class _10650
   {
      public function _10650()
      {
         super();
         throw new Error("Static class");
      }
      
      public static function _11071(param1:String, param2:int) : Array
      {
         var _loc3_:int = 0;
         var _loc4_:Array = new Array();
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_[_loc3_ / param2] = parseInt(param1.substr(_loc3_,param2),16);
            _loc3_ += param2;
         }
         return _loc4_;
      }
      
      public static function _11090(param1:Array, param2:int) : String
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:String = null;
         var _loc5_:String = new String();
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc6_ = param1[_loc3_].toString(16);
            if(_loc6_.length > param2)
            {
               _loc6_ = _loc6_.substr(_loc6_.length - param2,param2);
            }
            else if(_loc6_.length < param2)
            {
               _loc4_ = 0;
               while(_loc4_ < param2 - _loc6_.length)
               {
                  _loc6_ = "0" + _loc6_;
                  _loc4_++;
               }
            }
            _loc5_ += _loc6_;
            _loc3_++;
         }
         return _loc5_;
      }
   }
}

