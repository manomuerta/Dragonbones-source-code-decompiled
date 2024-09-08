package _214
{
   import _13492._13496;
   import _51._52;
   import _51._70;
   import _51._79;
   import _668._671;
   import _81._86;
   
   public class _213
   {
      public static var type:int;
      
      public static var project:_671;
      
      public static const TYPE_NONE:int = 0;
      
      public static const TYPE_FRAME:int = 1;
      
      public static const TYPE_TRANSFORM:int = 2;
      
      public static const TYPE_COMIC_SLOT:int = 3;
      
      public static const TYPE_BONE:int = 4;
      
      public static const TYPE_SLOT:int = 5;
      
      public static const TYPE_DISPLAY:int = 6;
      
      public static const TYPE_SLOT_PROPERTY:int = 7;
      
      public static var frames:_215 = new _215();
      
      public static var _3437:_13512 = new _13512();
      
      public static var transform:_86 = new _86();
      
      public static var _2837:Vector.<_79> = new Vector.<_79>();
      
      public static var bone:_12440 = new _12440();
      
      public static var slot:_12442 = new _12442();
      
      public static var display:_12441 = new _12441();
      
      public static var _14375:_14051 = new _14051();
      
      public function _213()
      {
         super();
      }
      
      public static function clear() : void
      {
         type = TYPE_NONE;
      }
      
      public static function _2836(param1:Vector.<_13496>) : void
      {
         type = TYPE_FRAME;
         _3437._2838(param1);
      }
      
      public static function _2835(param1:_86) : void
      {
         type = TYPE_TRANSFORM;
         transform.copyFrom(param1);
      }
      
      public static function _2834(param1:Vector.<_79>) : void
      {
         type = TYPE_COMIC_SLOT;
         _2837.length = 0;
         var _loc2_:int = 0;
         var _loc3_:int = int(param1.length);
         while(_loc2_ < _loc3_)
         {
            _2837.push(param1[_loc2_]);
            _loc2_++;
         }
      }
      
      public static function _12516(param1:_52, param2:String) : void
      {
         type = TYPE_BONE;
         bone.copyFrom(param1,param2);
      }
      
      public static function _12517(param1:_79, param2:String) : void
      {
         type = TYPE_SLOT;
         slot.copyFrom(param1,param2);
      }
      
      public static function _12515(param1:_70, param2:String) : void
      {
         type = TYPE_DISPLAY;
         display.copyFrom(param1,param2);
      }
      
      public static function _14374(param1:_79) : void
      {
         type = TYPE_SLOT_PROPERTY;
         _14375._2838(param1);
      }
   }
}

