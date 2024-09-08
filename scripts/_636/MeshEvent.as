package _636
{
   import flash.events.Event;
   
   public class MeshEvent extends Event
   {
      public static var SCALE:String = "MeshEvent:SCALE";
      
      public static var PANEL_MOVING:String = "MeshEvent:PANEL_MOVING";
      
      public static var RESET:String = "MeshEvent:RESET";
      
      public static var CHANGE_TO_MESH:String = "MeshEvent:CHANGE_TO_MESH";
      
      public static var CHANGE_TO_IMAGE:String = "MeshEvent:CHANGE_TO_IMAGE";
      
      public static var MESH_EDITOR:String = "MeshEvent:MESH_EDITOR";
      
      public static var MESH_RESET:String = "MeshEvent:MESH_RESET";
      
      public static var GPU_READY:String = "MeshEvent:GPU_READY";
      
      public static var MESH_RIGGING:String = "MeshEvent:MESH_RIGGING";
      
      public static var SELECT_BONE:String = "MeshEvent:SELECT_BONE";
      
      public static var SELECT_BINDING_BONE:String = "MeshEvent:SELECT_BINDING_BONE";
      
      public static var DELETE_BONE:String = "MeshEvent:DELETE_BONE";
      
      public static var MODIFY_WEIGHT:String = "MeshEvent:MODIFY_WEIGHT";
      
      public static var MODIFY_BAR_WEIGHT:String = "MeshEvent:MODIFY_BAR_WEIGHT";
      
      public static var OPEN_MODIFY_WEIGHT:String = "MeshEvent:OPEN_MODIFY_WEIGHT";
      
      public static var AUTO_WEIGHT:String = "MeshEvent:AUTO_WEIGHT";
      
      public static var EDIT_UV:String = "MeshEvent:EDIT_UV";
      
      public static var CHANGE_MODE:String = "MeshEvent:CHANGE_MODE";
      
      public static var CLOSE_EDIT:String = "MeshEvent:CLOSE_EDIT";
      
      public static var CLICK_RESET:String = "MeshEvent:CLICK_RESET";
      
      public static var DEFORM_CHANGE:String = "MeshEvent:DEFORM_CHANGE";
      
      public static var CLICK_AUTO:String = "MeshEvent:CLICK_AUTO";
      
      public var data:*;
      
      public function MeshEvent(param1:String, param2:* = null, param3:Boolean = false, param4:Boolean = false)
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

