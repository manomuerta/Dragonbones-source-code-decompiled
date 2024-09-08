package egret.managers
{
   import egret.core.Injector;
   import egret.managers.impl._1206;
   
   public class _1198
   {
      private static var _impl:_1202;
      
      public function _1198()
      {
         super();
      }
      
      private static function get impl() : _1202
      {
         if(!_impl)
         {
            try
            {
               _impl = Injector.getInstance(_1202);
            }
            catch(e:Error)
            {
               _impl = new _1206();
            }
         }
         return _impl;
      }
      
      public static function get cursor() : String
      {
         return impl.cursor;
      }
      
      public static function setCursor(param1:String, param2:uint = 0) : void
      {
         impl.setCursor(param1,param2);
      }
      
      public static function _1602(param1:String = "") : void
      {
         impl._1602(param1);
      }
   }
}

