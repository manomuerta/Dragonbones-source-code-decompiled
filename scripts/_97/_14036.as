package _97
{
   import _822._10616;
   
   public class _14036
   {
      public static const PREV:int = 1;
      
      public static const NEXT:int = 2;
      
      public static var _9587:Boolean = false;
      
      private static var _14320:Array = [];
      
      private static var index:int = 0;
      
      public function _14036()
      {
         super();
      }
      
      public static function register(param1:Array) : void
      {
         if(!_14318(param1))
         {
            index = 0;
         }
         _14320.length = 0;
         _14320 = param1;
      }
      
      public static function set _14317(param1:int) : void
      {
         if(param1 == -1)
         {
            index = 0;
         }
         else
         {
            index = param1;
         }
      }
      
      public static function _14316(param1:_10616) : int
      {
         return _14320.indexOf(param1);
      }
      
      private static function get prev() : _10616
      {
         if(_14320.length == 0)
         {
            return null;
         }
         --index;
         if(index < 0)
         {
            index = _14320.length - 1;
         }
         return _14320[index];
      }
      
      private static function get next() : _10616
      {
         if(_14320.length == 0)
         {
            return null;
         }
         ++index;
         if(index == _14320.length)
         {
            index = 0;
         }
         return _14320[index];
      }
      
      public static function clear() : void
      {
         index = 0;
         _14320.length = 0;
         _9587 = false;
      }
      
      public static function _14263(param1:int) : void
      {
         var _loc2_:_10616 = null;
         _14315();
         if(param1 == PREV)
         {
            _loc2_ = _14036.prev;
         }
         else
         {
            _loc2_ = _14036.next;
         }
         if(_loc2_)
         {
            _loc2_._2581();
         }
      }
      
      private static function _14315() : void
      {
         _14036._9587 = true;
         if(_14320[index])
         {
            _14320[index]._14319();
         }
      }
      
      private static function _14318(param1:Array) : Boolean
      {
         if(_14320.length != param1.length)
         {
            return false;
         }
         var _loc2_:int = 0;
         while(_loc2_ < _14320.length)
         {
            if(param1.indexOf(_14320[_loc2_]) == -1)
            {
               return false;
            }
            _loc2_++;
         }
         return true;
      }
   }
}

