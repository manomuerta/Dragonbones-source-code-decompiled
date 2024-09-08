package _1421
{
   import _1374._1396;
   import _1376._1379;
   import flash.events.Event;
   
   public class BoxContainerEvent extends Event
   {
      public static const BOX_DRAG_COMPLETE:String = "boxDragComplete";
      
      public static const DRAG_PANEL_OUT:String = "dragPanelOut";
      
      public static const DRAG_GROUP_MOVED:String = "dragGroupMoved";
      
      public static const DRAG_PANEL_MOVED:String = "dragPanelMoved";
      
      public static const DRAG_GROUP_IN:String = "dragGroupIn";
      
      public static const BOX_ADDED:String = "boxAdded";
      
      public var _9619:_1396 = null;
      
      public var _9605:int = -1;
      
      public var _9625:_1396 = null;
      
      public var _9614:int = -1;
      
      public var _9620:_1379 = null;
      
      public var _9626:_1379 = null;
      
      public var _9597:String = "";
      
      public function BoxContainerEvent(param1:String, param2:Boolean = true, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}

