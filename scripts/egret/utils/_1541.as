package egret.utils
{
   import flash.desktop.NativeApplication;
   import flash.display.NativeMenu;
   import flash.display.NativeMenuItem;
   
   public class _1541
   {
      private static var _10197:Array = [];
      
      private static var _10196:Boolean = false;
      
      public function _1541()
      {
         super();
      }
      
      public static function get _6382() : NativeMenu
      {
         _10195();
         return NativeApplication.nativeApplication.menu;
      }
      
      public static function set _6382(param1:NativeMenu) : void
      {
         if(!NativeApplication.supportsMenu)
         {
            return;
         }
         _10195();
         while(NativeApplication.nativeApplication.menu.numItems > 1)
         {
            NativeApplication.nativeApplication.menu.removeItemAt(NativeApplication.nativeApplication.menu.numItems - 1);
         }
         var _loc2_:Array = [];
         while(param1.numItems > 0)
         {
            _loc2_.push(param1.getItemAt(0));
            param1.removeItemAt(0);
         }
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            NativeApplication.nativeApplication.menu.addItem(_loc2_[_loc3_]);
            _loc3_++;
         }
      }
      
      public static function _10198() : void
      {
         var _loc1_:NativeMenuItem = null;
         while(NativeApplication.nativeApplication.menu.items.length > 1)
         {
            _loc1_ = NativeApplication.nativeApplication.menu.removeItemAt(1);
            _10197.push(_loc1_);
         }
      }
      
      public static function _3937() : void
      {
         while(_10197.length > 0)
         {
            NativeApplication.nativeApplication.menu.addItem(_10197.shift());
         }
      }
      
      private static function _10195() : void
      {
         if(!_10196)
         {
            NativeApplication.nativeApplication.menu.getItemAt(0).submenu.removeItemAt(0);
            _10196 = true;
         }
      }
   }
}

