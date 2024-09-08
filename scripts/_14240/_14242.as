package _14240
{
   import _14193._14197;
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   
   public class _14242
   {
      public function _14242()
      {
         super();
      }
      
      public static function _15396(param1:DisplayObject, param2:DisplayObject) : Rectangle
      {
         if(param1.width == 0 || param1.height == 0)
         {
            return new Rectangle();
         }
         return param1.getBounds(param2);
      }
      
      public static function _15494(param1:DisplayObject) : _14197
      {
         while(param1 != null && !(param1 is _14197))
         {
            param1 = param1.parent;
         }
         return param1 as _14197;
      }
   }
}

