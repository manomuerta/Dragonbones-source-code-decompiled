package _97
{
   import _28._30;
   import flash.utils.Dictionary;
   
   public class _115
   {
      private static var _2367:Dictionary = new Dictionary();
      
      private static var _2362:Dictionary = new Dictionary();
      
      public static var _2366:Object = {};
      
      public function _115()
      {
         super();
      }
      
      public static function _1709(param1:_30) : void
      {
         var _loc2_:String = null;
         if(Boolean(param1.id) && param1.id != "")
         {
            _2367[param1.id] = param1;
            if(param1.userData)
            {
               _loc2_ = String(param1.userData);
               if(Boolean(_loc2_) && _loc2_ != "")
               {
                  _2367[param1.userData] = param1;
               }
            }
         }
      }
      
      public static function _2365(param1:String) : _30
      {
         return _2367[param1];
      }
      
      public static function _2363(param1:String) : String
      {
         return _2366[param1];
      }
      
      public static function _1698(param1:_30) : void
      {
         _2366[param1.shortcut] = param1.id;
      }
      
      public static function _1695(param1:_30) : void
      {
         if(param1.id)
         {
            _2362[param1.id] = param1;
         }
      }
      
      public static function _2364(param1:Object) : _30
      {
         return _2362[param1];
      }
   }
}

