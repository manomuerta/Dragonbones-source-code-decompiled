package _127
{
   import _1421.TreeDragEvent;
   
   public class _10547 extends TreeDragEvent
   {
      public static const ITEMS_DRAG_UP_REFRESH:String = "DBTreeEvent:ITEMS_DRAG_UP_REFRESH";
      
      public static const ITEMS_DRAG_DOWN_REFRESH:String = "DBTreeEvent:ITEMS_DRAG_DOWN_REFRESH";
      
      public static const ITEMS_DRAG_RESET_REFRESH:String = "DBTreeEvent:ITEMS_DRAG_RESET_REFRESH";
      
      public function _10547(param1:String, param2:Boolean = false, param3:Boolean = true)
      {
         super(param1,param2,param3);
      }
   }
}

