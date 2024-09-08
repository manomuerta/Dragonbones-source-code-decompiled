package _35
{
   import _51._50;
   import _51._71;
   import _97._101;
   
   public class _13488
   {
      public static var _3712:Object;
      
      public function _13488()
      {
         super();
      }
      
      public static function _13604(param1:Object) : Object
      {
         return _13490._13602(param1);
      }
      
      public static function _1736(param1:Object, param2:int, param3:Boolean = true, param4:Boolean = false) : _50
      {
         return _13487._1736(param1,param2,param3,param4);
      }
      
      public static function _1737(param1:*, param2:_37, param3:String = null, param4:String = null, param5:Boolean = true) : _71
      {
         return _13487._1737(param1,param2,param3,param4,param5);
      }
      
      public static function _1757(param1:*, param2:Object, param3:Boolean = true, param4:Boolean = false) : _71
      {
         return _13487._1757(param1,param2,param3,param4);
      }
      
      public static function _1769(param1:*, param2:_37, param3:String, param4:Boolean = true) : _71
      {
         return _13487._1769(param1,param2,param3,param4);
      }
      
      public static function parser(param1:Object, param2:Boolean = true, param3:Boolean = false) : _71
      {
         var _loc4_:String = param1[_101.A_VERSION];
         if(_loc4_ != "5.5")
         {
            _13604(param1);
         }
         return _13487.parser(param1,param2,param3);
      }
      
      public static function _2684(param1:_50, param2:Object, param3:Boolean, param4:String) : void
      {
         _13489._2684(param1,param2,param3,param4);
      }
      
      public static function _13605(param1:_71, param2:String, param3:Boolean) : Object
      {
         return _13489._10458(param1,param2,param3);
      }
   }
}

