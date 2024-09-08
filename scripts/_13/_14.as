package _13
{
   import egret.core.Injector;
   import egret.managers._1198;
   import egret.managers._1202;
   import egret.managers.impl._1206;
   
   public class _14 extends _1198
   {
      private static var _impl:_1202;
      
      private static var _1601:Array = [];
      
      private static var _1603:Boolean = false;
      
      public function _14()
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
      
      public static function setCursor(param1:String, param2:uint = 0) : void
      {
         if(_1603)
         {
            _1601.push({
               "isSet":true,
               "name":param1,
               "priority":param2
            });
         }
         else
         {
            impl.setCursor(param1,param2);
         }
      }
      
      public static function _1602(param1:String = "") : void
      {
         if(_1603)
         {
            _1601.push({
               "isSet":false,
               "name":param1
            });
         }
         else
         {
            impl._1602(param1);
         }
      }
      
      public static function lock() : void
      {
         _1603 = true;
      }
      
      public static function unlock() : void
      {
         if(_1603)
         {
            _1603 = false;
            _1600();
         }
      }
      
      private static function _1600() : void
      {
         var _loc1_:Object = null;
         while(_1601.length > 0)
         {
            _loc1_ = _1601.shift();
            if(_loc1_.isSet)
            {
               impl.setCursor(_loc1_.name,_loc1_.priority);
            }
            else
            {
               impl._1602(_loc1_.name);
            }
         }
      }
   }
}

