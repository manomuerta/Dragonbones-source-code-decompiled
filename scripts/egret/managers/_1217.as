package egret.managers
{
   import _1177._1180;
   import egret.core.Injector;
   import egret.core._1133;
   import egret.managers.impl._1208;
   
   public class _1217
   {
      private static var _impl:_1210;
      
      public function _1217()
      {
         super();
      }
      
      private static function get impl() : _1210
      {
         if(!_impl)
         {
            try
            {
               _impl = Injector.getInstance(_1210);
            }
            catch(e:Error)
            {
               _impl = new _1208();
            }
         }
         return _impl;
      }
      
      public static function get _8979() : uint
      {
         return impl._8979;
      }
      
      public static function set _8979(param1:uint) : void
      {
         impl._8979 = param1;
      }
      
      public static function get _8978() : Number
      {
         return impl._8978;
      }
      
      public static function set _8978(param1:Number) : void
      {
         impl._8978 = param1;
      }
      
      public static function addPopUp(param1:_1133, param2:Boolean = false, param3:Boolean = true, param4:_1211 = null) : void
      {
         impl.addPopUp(param1,param2,param3,param4);
         impl.dispatchEvent(new _1180(_1180.ADD_POPUP,false,false,param1,param2));
      }
      
      public static function removePopUp(param1:_1133) : void
      {
         impl.removePopUp(param1);
         impl.dispatchEvent(new _1180(_1180.REMOVE_POPUP,false,false,param1));
      }
      
      public static function _8974(param1:_1133) : void
      {
         impl._8974(param1);
      }
      
      public static function bringToFront(param1:_1133) : void
      {
         impl.bringToFront(param1);
         impl.dispatchEvent(new _1180(_1180.BRING_TO_FRONT,false,false,param1));
      }
      
      public static function get _8981() : Array
      {
         return impl._8981;
      }
      
      public static function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = true) : void
      {
         impl.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public static function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         impl.removeEventListener(param1,param2,param3);
      }
   }
}

