package _636
{
   import flash.events.Event;
   
   public class DBPanelEvent extends Event
   {
      public static var LAYOUT_CHANGED:String = "DBPanelEvent:LAYOUT_CHANGED";
      
      public static var EDIT_MODE_CHANGED:String = "DBPanelEvent:EDIT_MODE_CHANGED";
      
      public static var TOOL_CHANGED:String = "DBPanelEvent:TOOL_CHANGED";
      
      public static var COORDINATE_CHANGED:String = "DBPanelEvent:COORDINATE_CHANGED";
      
      public static var ZOOM_CHANGED:String = "DBPanelEvent:ZOOM_CHANGED";
      
      public static var IMPORT_ASSET:String = "DBPanelEvent:IMPORT_ASSET";
      
      public static var CHANGE_ASSET:String = "DBPanelEvent:CHANGE_ASSET";
      
      public static var ADD_BONE:String = "DBPanelEvent:ADD_BONE";
      
      public static var ADD_SLOT:String = "DBPanelEvent:ADD_SLOT";
      
      public static var ADD_BOUNDINGBOX:String = "DBPanelEvent:ADD_BOUNDINGBOX";
      
      public static var UPDATE_CANVASVO:String = "DBPanelEvent:UPDATE_CANVASVO";
      
      public static var BLOCK_HISTORY:String = "DBPanelEvent:BLOCK_HISTORY";
      
      public static var AUTO_CANVAS_SIZE:String = "DBPanelEvent:AUTO_CANVAS_SIZE";
      
      public static var PANEL_ALERT:String = "DBPanelEvent:PANEL_ALERT";
      
      public var data:*;
      
      public function DBPanelEvent(param1:String, param2:* = null)
      {
         super(param1,true,false);
         this.data = param2;
      }
   }
}

