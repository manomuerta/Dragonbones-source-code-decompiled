package _521
{
   import _97._99;
   import flash.utils.Dictionary;
   
   public class _524
   {
      private static var _3786:Dictionary = new Dictionary();
      
      public function _524()
      {
         super();
      }
      
      public static function _3785(param1:*, param2:Object = "default") : void
      {
         _3786[param2] = param1;
         _99(clear);
      }
      
      public static function _3784(param1:Object = "default") : *
      {
         return _3786[param1];
      }
      
      private static function clear() : void
      {
         _3786 = new Dictionary();
      }
   }
}

