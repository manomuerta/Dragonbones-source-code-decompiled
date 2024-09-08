package egret.managers
{
   import egret.core.Injector;
   import egret.core._999;
   import egret.core.ns_egret;
   import egret.managers.impl._1209;
   import flash.display.DisplayObject;
   
   use namespace ns_egret;
   
   public class _1221
   {
      private static var _impl:_1212;
      
      public function _1221()
      {
         super();
      }
      
      private static function get impl() : _1212
      {
         if(!_impl)
         {
            try
            {
               _impl = Injector.getInstance(_1212);
            }
            catch(e:Error)
            {
               _impl = new _1209();
            }
         }
         return _impl;
      }
      
      public static function get currentTarget() : _1213
      {
         return impl.currentTarget;
      }
      
      public static function set currentTarget(param1:_1213) : void
      {
         impl.currentTarget = param1;
      }
      
      public static function get _8995() : _999
      {
         return impl._8995;
      }
      
      public static function set _8995(param1:_999) : void
      {
         impl._8995 = param1;
      }
      
      public static function get enabled() : Boolean
      {
         return impl.enabled;
      }
      
      public static function set enabled(param1:Boolean) : void
      {
         impl.enabled = param1;
      }
      
      public static function get _9011() : Number
      {
         return impl._9011;
      }
      
      public static function set _9011(param1:Number) : void
      {
         impl._9011 = param1;
      }
      
      public static function get _9003() : Number
      {
         return impl._9003;
      }
      
      public static function set _9003(param1:Number) : void
      {
         impl._9003 = param1;
      }
      
      public static function get _9012() : Number
      {
         return impl._9012;
      }
      
      public static function set _9012(param1:Number) : void
      {
         impl._9012 = param1;
      }
      
      public static function get _8693() : Class
      {
         return impl._8693;
      }
      
      public static function set _8693(param1:Class) : void
      {
         impl._8693 = param1;
      }
      
      ns_egret static function _8677(param1:DisplayObject, param2:Object, param3:Object) : void
      {
         impl._8677(param1,param2,param3);
      }
      
      public static function _9000(param1:String, param2:Number, param3:Number) : _999
      {
         return impl._9000(param1,param2,param3);
      }
      
      public static function _8997(param1:_999) : void
      {
         impl._8997(param1);
      }
      
      public static function _7914(param1:_999, param2:_1213) : void
      {
         impl._7914(param1,param2);
      }
   }
}

