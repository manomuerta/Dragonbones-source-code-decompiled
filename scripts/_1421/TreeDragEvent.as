package _1421
{
   import flash.events.Event;
   
   public class TreeDragEvent extends Event
   {
      public static const ITEMS_DRAG_IN_COMPLETE:String = "itemsDargInComplete";
      
      public static const ITEMS_DRAG_START:String = "itemsDragStart";
      
      public static const ITEMS_DRAG_MOVE_COMPLETE:String = "itemsDargMoveComplete";
      
      public static const ITEMS_DRAG_COMPLETE:String = "itemsDargComplete";
      
      public var _3597:Array;
      
      public var _4137:Object;
      
      public var _4136:Boolean;
      
      public function TreeDragEvent(param1:String, param2:Boolean = false, param3:Boolean = true)
      {
         super(param1,param2,param3);
      }
   }
}

