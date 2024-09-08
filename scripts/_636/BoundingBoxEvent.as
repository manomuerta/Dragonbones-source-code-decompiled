package _636
{
   import flash.events.Event;
   
   public class BoundingBoxEvent extends Event
   {
      public static var EDIT:String = "BoundingBoxEvent:EDIT";
      
      public static var FREEZE:String = "BoundingBoxEvent:FREEZE";
      
      public static var COLOR_CHANGE:String = "BoundingBoxEvent:COLOR_CHANGE";
      
      public static var COLOR_CONFIRM:String = "BoundingBoxEvent:COLOR_CONFIRM";
      
      public static var COLOR_CANCEL:String = "BoundingBoxEvent:COLOR_CANCEL";
      
      public static var COLOR_CLEAR:String = "BoundingBoxEvent:COLOR_CLEAR";
      
      public static var CLOSE_EDIT:String = "BoundingBoxEvent:CLOSE_EDIT";
      
      public static var CHANGE_MODE:String = "BoundingBoxEvent:CHANGE_MODE";
      
      public var data:*;
      
      public function BoundingBoxEvent(param1:String, param2:* = null, param3:Boolean = true, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.data = param2;
      }
      
      override public function clone() : Event
      {
         return new MeshEvent(this.type,this.data);
      }
   }
}

