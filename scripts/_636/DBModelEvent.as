package _636
{
   import flash.events.Event;
   
   public class DBModelEvent extends Event
   {
      public static var EDIT_MODE_CHANGED:String = "DBModelEvent:EDIT_MODE_CHANGED";
      
      public static var ANIMATION_MODE_CHANGED:String = "DBModelEvent:ANIMATION_MODE_CHANGED";
      
      public static var COORDINATE_TYPE_CHANGED:String = "DBModelEvent:COORDINATE_TYPE_CHANGED";
      
      public static var DATA_CHANGED:String = "DBModelEvent:DATA_CHANGED";
      
      public static var CURRENT_DOC_CHANGED:String = "DBModelEvent:CURRENT_DOC_CHANGED";
      
      public static var PREFERENCE_DELETE_CHANGED:String = "DBModelEvent:PREFERENCE_DELETE_CHANGED";
      
      public static var PANEL_STATUS_CHANGED:String = "DBModelEvent:PANEL_STATUS_CHANGED";
      
      public var data:*;
      
      public function DBModelEvent(param1:String, param2:* = null, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.data = param2;
      }
   }
}

