package _24
{
   import _1177._1181;
   import _639.HotkeysModel;
   import flash.display.Stage;
   import flash.ui.Keyboard;
   
   public class _25
   {
      private static var _1694:Object;
      
      private static var initialized:Boolean = false;
      
      public function _25()
      {
         super();
      }
      
      public static function initialize(param1:Stage) : void
      {
         if(initialized)
         {
            return;
         }
         initialized = true;
         Shortcut.initialize(param1);
      }
      
      protected static function _1689(param1:_1181) : void
      {
         if(param1.property == "shortcutMap")
         {
            _1693();
         }
      }
      
      public static function _1693() : void
      {
         _1694 = null;
         Shortcut._1671();
         Shortcut._1672(_1691);
      }
      
      public static function get _1691() : Object
      {
         if(!_1694)
         {
            _1694 = _1692;
         }
         return _1694;
      }
      
      public static function get _1692() : Object
      {
         return HotkeysModel.getInstance()._5635;
      }
      
      private static function get _1687() : Object
      {
         var _loc1_:HotkeysModel = HotkeysModel.getInstance();
         return _loc1_._5635;
      }
      
      private static function get _1688() : Object
      {
         var _loc1_:Object = _1687;
         _loc1_[_26.EXIT] = [Keyboard.Q,Keyboard.COMMAND];
         _1690(_loc1_);
         return _loc1_;
      }
      
      private static function _1690(param1:Object) : void
      {
         var keyCodes:Array = null;
         var config:Object = param1;
         var convert:Function = function(param1:Array):void
         {
            var _loc2_:* = undefined;
            for(_loc2_ in param1)
            {
               if(param1[_loc2_] is Array)
               {
                  convert(param1[_loc2_]);
               }
               else if(param1[_loc2_] == Keyboard.CONTROL)
               {
                  param1[_loc2_] = Keyboard.COMMAND;
               }
            }
         };
         for each(keyCodes in config)
         {
            convert(keyCodes);
         }
      }
   }
}

