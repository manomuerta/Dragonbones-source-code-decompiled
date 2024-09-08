package _97
{
   public class _124
   {
      public function _124()
      {
         super();
      }
      
      public static function _1747(param1:String, param2:Function) : String
      {
         var _loc3_:int = 0;
         var _loc4_:String = param1;
         while(param2(_loc4_))
         {
            _loc4_ = param1 + String(++_loc3_);
         }
         return _loc4_;
      }
      
      public static function _14327(param1:String, param2:String, param3:Function) : String
      {
         var _loc4_:int = 0;
         var _loc5_:String = param1;
         while(param3(_loc5_,param2))
         {
            _loc5_ = param1 + String(++_loc4_);
         }
         return _loc5_;
      }
      
      public static function _2392(param1:String) : String
      {
         var _loc2_:RegExp = /[\/\\:*?"'<>|. @#$%^&!~]+/g;
         return param1.replace(_loc2_,"");
      }
      
      public static function _3256(param1:String) : String
      {
         var _loc2_:RegExp = /[\\:*?"'<>|. @#$%^&!~]+/g;
         return param1.replace(_loc2_,"");
      }
      
      public static function vertifyFileName(param1:String) : Boolean
      {
         var _loc2_:RegExp = /[\/\\:*?"'<>|. @#$%^&!~]+/g;
         return param1.match(_loc2_).length > 0;
      }
      
      public static function _10558(param1:String) : Boolean
      {
         var _loc2_:RegExp = /[\/\\:*?"'<>|. @#$%^&!~]+/g;
         return param1.match(_loc2_).length > 0;
      }
   }
}

