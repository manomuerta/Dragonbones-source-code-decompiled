package _11106
{
   import _11111._11110;
   
   public class _13167
   {
      public static const NETWORK_ERROR:String = "Network Error";
      
      public static const JSON_ERROR:String = "JSON Error";
      
      public static const DATA_ERROR:String = "DATA Error";
      
      public static const RESULTDATA_ERROR:String = "RESULT DATA Error";
      
      public function _13167()
      {
         super();
      }
      
      public function _11132(param1:String, param2:String, param3:String = null) : void
      {
         _11110.instance.trackEvent(_11109.NetworkError + "-" + _11110.instance.appVersion,param1,param2);
         if(param3)
         {
            _11110.instance.trackEvent(_11109.NetworkError + "-" + _11110.instance.appVersion,param1 + " ErrorJSON",param3);
         }
      }
   }
}

