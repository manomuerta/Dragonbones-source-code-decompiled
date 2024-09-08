package _783
{
   import _6._9;
   
   public class MeshNotification extends _9
   {
      public static const UPDATE_SELECT_VERTICES:String = "MeshNotification:UPDATE_SELECT_VERTICES";
      
      public static const UPDATE_SELECT_M_VERTICES:String = "MeshNotification:UPDATE_SELECT_M_VERTICES";
      
      public static const EDIT_UV:String = "MeshNotification:EDIT_UV";
      
      public static const UPDATE_SELECT_UV:String = "MeshNotification:UPDATE_SELECT_UV";
      
      public static const STOP_EDIT:String = "MeshNotification:STOP_EDIT";
      
      public static const CHANGE_UV_TOOL:String = "MeshNotification:CHANGE_UV_TOOL";
      
      public static const RESET_UV:String = "MeshNotification:RESET_UV";
      
      public static const CHANGE_DEFORM:String = "MeshNotification:CHANGE_DEFORM";
      
      public static const END_ADD_OUTLINE:String = "MeshNotification:END_ADD_OUTLINE";
      
      public static const AUTO_UV:String = "MeshNotification:AUTO_UV";
      
      public function MeshNotification(param1:String, param2:* = null)
      {
         super(param1);
         data = param2;
      }
   }
}

