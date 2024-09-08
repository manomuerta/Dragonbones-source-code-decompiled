package _783
{
   import _6._9;
   
   public class BoundingBoxNotification extends _9
   {
      public static const UPDATE_SELECT_VERTICES:String = "BoundingBoxNotification:UPDATE_SELECT_VERTICES";
      
      public static const UPDATE_SELECTED_VERTEX:String = "BoundingBoxNotification:UPDATE_SELECTED_VERTEX";
      
      public static const FREEZE:String = "BoundingBoxNotification:FREEZE";
      
      public static const EDIT:String = "BoundingBoxNotification:EDIT";
      
      public static const START_EDIT:String = "BoundingBoxNotification:START_EDIT";
      
      public static const STOP_EDIT:String = "BoundingBoxNotification:STOP_EDIT";
      
      public static const CHANGE_MODE:String = "BoundingBoxNotification:CHANGE_MODE";
      
      public static const END_NEW:String = "BoundingBoxNotification:END_NEW";
      
      public static const DOUBLE_CLICK:String = "BoundingBoxNotification:DOUBLE_CLICK";
      
      public function BoundingBoxNotification(param1:String, param2:* = null)
      {
         super(param1);
         data = param2;
      }
   }
}

