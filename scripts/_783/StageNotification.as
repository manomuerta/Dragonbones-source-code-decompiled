package _783
{
   import _6._9;
   
   public class StageNotification extends _9
   {
      public static const ROLLOVER_BONE:String = "StageNotification:ROLLOVER_BONE";
      
      public static const ROLLOUT_BONE:String = "StageNotification:ROLLOUT_BONE";
      
      public static const ROLLOVER_SLOT:String = "StageNotification:ROLLOVER_SLOT";
      
      public static const ROLLOUT_SLOT:String = "StageNotification:ROLLOUT_SLOT";
      
      public static const START_TRANSFORM:String = "StageNotification:START_TRANSFORM";
      
      public static const STOP_TRANSFORM:String = "StageNotification:STOP_TRANSFORM";
      
      public static const START_PICK:String = "StageNotification:START_PICK";
      
      public static const STOP_PICK:String = "StageNotification:STOP_PICK";
      
      public static const PICK_ITEM:String = "StageNotification:PICK_ITEM";
      
      public static const START_FRAMESELECT:String = "StageNotification:START_FRAMESELECT";
      
      public static const STOP_FRAMESELECT:String = "StageNotification:STOP_FRAMESELECT";
      
      public static const START_MOVE_BONE:String = "StageNotification:START_MOVE_BONE";
      
      public static const STOP_MOVE_BONE:String = "StageNotification:STOP_MOVE_BONE";
      
      public static const START_EDIT_FFD:String = "StageNotification:START_EDIT_FFD";
      
      public static const STOP_EDIT_FFD:String = "StageNotification:STOP_EDIT_FFD";
      
      public static const OVER_FFD:String = "StageNotification:OVER_FFD";
      
      public static const START_EDIT_WEIGHT:String = "StageNotification:START_EDIT_WEIGHT";
      
      public static const STOP_EDIT_WEIGHT:String = "StageNotification:STOP_EDIT_WEIGHT";
      
      public static const START_EDIT_BOUNDINGBOX:String = "StageNotification:START_EDIT_BOUNDINGBOX";
      
      public static const STOP_EDIT_BOUNDINGBOX:String = "StageNotification:STOP_EDIT_BOUNDINGBOX";
      
      public static const UPDATE_LIBRARY:String = "StageNotification:UPDATE_LIBRARY";
      
      public static const REDRAW_MESH:String = "StageNotification:REDRAW_MESH";
      
      public static const UPDATE_SELECTED_ITEMS:String = "StageNotification:UPDATE_SELECTED_ITEMS";
      
      public static const UPDATE_TIMELINE_SELECTED_ITEMS:String = "StageNotification:UPDATE_TIMELINE_SELECTED_ITEMS";
      
      public static const CANCEL_SELECTION:String = "CommandNotification:CANCEL_SELECTION";
      
      public static const UPDATE_EDIT_MODE:String = "StageNotification:UPDATE_EDIT_MODE";
      
      public static const UPDATE_ANIMATION_MODE:String = "StageNotification:UPDATE_ANIMATION_MODE";
      
      public static const UPDATE_FILTER_STATUS:String = "StageNotification:UPDATE_FILTER_STATUS";
      
      public static const UPDATE_COORDINATE_TYPE:String = "StageNotification:UPDATE_COORDINATE_TYPE";
      
      public static const UPDATE_DISPLAY_LIST:String = "StageNotification:UPDATE_DISPLAY_LIST";
      
      public static const UPDATE_CURRENT_ARMATURE:String = "StageNotification:UPDATE_CURRENT_ARMATURE";
      
      public static const UPDATE_CURRENT_TOOL:String = "StageNotification:UPDATE_CURRENT_TOOL";
      
      public static const CHECK_CURRENT_ARMATURE:String = "StageNotification:CHECK_CURRENT_ARMATURE";
      
      public static const UPDATE_ALLOW_BONE_MULTIPLE_SELECTION:String = "StageNotification:UPDATE_ALLOW_BONE_MULTIPLE_SELECTION";
      
      public static const UPDATE_ALLOW_SLOT_MULTIPLE_SELECTION:String = "StageNotification:UPDATE_ALLOW_SLOT_MULTIPLE_SELECTION";
      
      public static const DRAG_IAMGE_TO_STAGE:String = "StageNotification:DRAG_IAMGE_TO_STAGE";
      
      public static const DRAG_IAMGES_TO_STAGE:String = "StageNotification:DRAG_IAMGES_TO_STAGE";
      
      public static const SET_CURSOR:String = "StageNotification:SET_CURSOR";
      
      public static const REMOVE_CURSOR:String = "StageNotification:REMOVE_CURSOR";
      
      public static const OPEN_MESH_EDITOR:String = "StageNotification:OPEN_MESH_EDITOR";
      
      public static const CLOSE_MESH_EDITOR:String = "StageNotification:CLOSE_MESH_EDITOR";
      
      public static const GPU_READY:String = "StageNotification:GPU_READY";
      
      public static const UPDATE_MESH:String = "StageNotification:UPDATE_MESH";
      
      public static const START_EDIT_RIG:String = "StageNotification:START_EDIT_RIG";
      
      public static const STOP_EDIT_RIG:String = "StageNotification:STOP_EDIT_RIG";
      
      public static const ADD_RIG_BONE:String = "StageNotification:ADD_RIG_BONE";
      
      public static const DELETE_RIG_BONE:String = "StageNotification:DELETE_RIG_BONE";
      
      public static const UPDATE_SELECTED_VERTEX:String = "StageNotification:UPDATE_SELECTED_VERTEX";
      
      public static const UPDATE_SELECTED_BINDING_BONE:String = "StageNotification:UPDATE_SELECTED_BINDING_BONE";
      
      public static const MODIFY_BONE_WEIGHT:String = "StageNotification:MODIFY_BONE_WEIGHT";
      
      public static const MODIFY_BONE_WEIGHT_BAR:String = "StageNotification:MODIFY_BONE_WEIGHT_BAR";
      
      public static const OPEN_MODIFY_WEIGHT:String = "StageNotification:OPEN_MODIFY_WEIGHT";
      
      public static const UPDATE_BONE_COLOR:String = "StageNotification:UPDATE_BONE_COLOR";
      
      public static const AUTO_WEIGHT:String = "StageNotification:AUTO_WEIGHT";
      
      public static const START_AUTO_WEIGHT:String = "StageNotification:START_AUTO_WEIGHT";
      
      public static const END_AUTO_WEIGHT:String = "StageNotification:END_AUTO_WEIGHT";
      
      public static const START_WEIGHT_TOOL:String = "StageNotification:START_WEIGHT_TOOL";
      
      public static const STOP_WEIGHT_TOOL:String = "StageNotification:STOP_WEIGHT_TOOL";
      
      public static const SWAP_IMAGE:String = "StageNotification:SWAP_IMAGE";
      
      public static const CHANGE_TRANSFORM_MODEL:String = "StageNotification:CHANGE_TRANSFORM_MODEL";
      
      public static const CHANGE_LOCK_WIDTH_HEIGHT:String = "StageNotification:CHANGE_LOCK_WIDTH_HEIGHT";
      
      public static const ADD_ASSETS_TO_STAGE:String = "StageNotification:ADD_ASSETS_TO_STAGE";
      
      public static const ADD_SEQUENCE_ASSETS_TO_STAGE:String = "StageNotification:ADD_SEQUENCE_ASSETS_TO_STAGE";
      
      public static const START_EDIT_MESH_UV:String = "StageNotification:START_EDIT_MESH_UV";
      
      public static const STOP_EDIT_MESH_UV:String = "StageNotification:STOP_EDIT_MESH_UV";
      
      public static const WINDOW_DEACTIVATE:String = "StageNotification:WINDOW_DEACTIVATE";
      
      public static const EXPORT_ANIMATION:String = "StageNotification:EXPORT_ANIMATION";
      
      public static const UPDATE_BONE_INTERACTION_AREA:String = "StageNotification:UPDATE_BONE_INTERACTION_AREA";
      
      public static const GROUP_SELECT:String = "StageNotification:GROUP_SELECT";
      
      public static const UPDATE_BG_COLOR:String = "StageNotification:UPDATE_BG_COLOR";
      
      public static const UPDATE_SLOT_DOWN_LAYER:String = "StageNotification:UPDATE_SLOT_DOWN_LAYER";
      
      public static const UPDATE_RULER_USABLE:String = "StageNotification:UPDATE_RULER_USABLE";
      
      public static const UPDATE_RULER_ASSIST_LINE_USABLE:String = "StageNotification:UPDATE_RULER_ASSIST_LINE_USABLE";
      
      public static const UPDATE_RULER_ASSIST_LINE_SELECT:String = "StageNotification:UPDATE_RULER_ASSIST_LINE_SELECT";
      
      public static const UPDATE_RULER_ASSIST_LINE_COLOR:String = "StageNotification:UPDATE_RULER_ASSIST_LINE_COLOR";
      
      public static const UPDATE_RULER:String = "StageNotification:UPDATE_RULER";
      
      public static const CREATE_FOLDER_ERROR:String = "StageNotification:CREATE_FOLDER_ERROR";
      
      public function StageNotification(param1:String, param2:* = null)
      {
         super(param1);
         data = param2;
      }
   }
}

