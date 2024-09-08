package _783
{
   import _6._9;
   
   public class CommandNotification extends _9
   {
      public static const NEW_PROJECT:String = "CommandNotification:NEW_PROJECT";
      
      public static const OPEN_PROJECT:String = "CommandNotification:OPEN_PROJECT";
      
      public static const OPEN_AND_SELECT_PROJECT:String = "CommandNotification:OPEN_AND_SELECT_PROJECT";
      
      public static const IMPORT_BY_COMMAND_PROJECT:String = "CommandNotification:IMPORT_BY_COMMAND_PROJECT";
      
      public static const IMPORT_ZIP_BY_COMMAND:String = "CommandNotification:IMPORT_ZIP_BY_COMMAND";
      
      public static const EXPORT_BY_COMMAND_PROJECT:String = "CommandNotification:EXPORT_BY_COMMAND_PROJECT";
      
      public static const EXPORT_BY_COMMAND_LINE:String = "CommandNotification:EXPORT_BY_COMMAND_LINE";
      
      public static const CLOSE_PROJECT:String = "CommandNotification:CLOSE_PROJECT";
      
      public static const CLOSE_PROJECT_SUCCESS:String = "CommandNotification:CLOSE_PROJECT_SUCCESS";
      
      public static const SAVE_PROJECT:String = "CommandNotification:SAVE_PROJECT";
      
      public static const SAVE_AS_PROJECT:String = "CommandNotification:SAVE_AS_PROJECT";
      
      public static const SELECT_PROJECT:String = "CommandNotification:SELECT_PROJECT";
      
      public static const SHOW_CLOSE_PROJECT_CONFIRMATION_DIALOG:String = "CommandNotification:SHOW_CLOSE_PROJECT_CONFIRMATION_DIALOG";
      
      public static const OPEN_WELCOME_PAGE:String = "CommandNotification:OPEN_WELCOME_PAGE";
      
      public static const OPEN_AND_SELECT_WELCOME_PAGE:String = "CommandNotification:OPEN_AND_SELECT_WELCOME_PAGE";
      
      public static const CLOSE_WELCOME_PAGE:String = "CommandNotification:CLOSE_WELCOME_PAGE";
      
      public static const SELECT_WELCOME_PAGE:String = "CommandNotification:SELECT_WELCOME_PAGE";
      
      public static const IMPORT_PROJECT:String = "CommandNotification:IMPORT_PROJECT";
      
      public static const IMPORT_PSD_PROJECT:String = "CommandNotification:IMPORT_PSD_PROJECT";
      
      public static const IMPORT_PROJECT_NO_OPEN:String = "CommandNotification:IMPORT_PROJECT_NO_OPEN";
      
      public static const EXPORT_PROJECT:String = "CommandNotification:EXPORT_PROJECT";
      
      public static const SHOW_NEW_PROJECT_WINDOW:String = "CommandNotification:SHOW_NEW_PROJECT_WINDOW";
      
      public static const SHOW_NEW_DRAGON_PROJECT_WINDOW:String = "CommandNotification:SHOW_NEW_DRAGON_PROJECT_WINDOW";
      
      public static const SHOW_NEW_COMIC_PROJECT_WINDOW:String = "CommandNotification:SHOW_NEW_COMIC_PROJECT_WINDOW";
      
      public static const SHOW_OPEN_PROJECT_DIALOG:String = "CommandNotification:SHOW_OPEN_PROJECT_DIALOG";
      
      public static const SHOW_IMPORT_WINDOW:String = "CommandNotification:SHOW_IMPORT_WINDOW";
      
      public static const SHOW_EXPORT_WINDOW:String = "CommandNotification:SHOW_EXPORT_WINDOW";
      
      public static const SHOW_EXPORT_EGRET_WINDOW:String = "CommandNotification:SHOW_EXPORT_EGRET_WINDOW";
      
      public static const SHOW_SETTING_WINDOW:String = "CommandNotification:SHOW_SETTING_WINDOW";
      
      public static const SHOW_SHARE_WINDOW:String = "CommandNotification:SHOW_SHARE_WINDOW";
      
      public static const SHOW_ABOUT_WINDOW:String = "CommandNotification:SHOW_ABOUT_WINDOW";
      
      public static const SHOW_ISSUE_REPORT_WINDOW:String = "CommandNotification:SHOW_ISSUE_REPORT_WINDOW";
      
      public static const SHOW_TEXTURE_PACKER_WINDOW:String = "CommandNotification:SHOW_TEXTURE_PACKER_WINDOW";
      
      public static const OPEN_URL:String = "CommandNotification:OPEN_URL";
      
      public static const OPEN_TRELLO:String = "CommandNotification:OPEN_TRELLO";
      
      public static const PLUGIN_MANAGER:String = "CommandNotification:PLUGIN_MANAGER";
      
      public static const PSDPLUGIN_GUIDE:String = "CommandNotification:PSDPLUGIN_GUIDE";
      
      public static const INSTALL_FLASH_PLUGIN:String = "CommandNotification:INSTALL_FLASH_PLUGIN";
      
      public static const PLUGIN_CHECK_TYPE:String = "CommandNotification:PLUGIN_CHECK_TYPE";
      
      public static const PLUGIN_CHECK_IMPORT_TYPE_COMPLETE:String = "CommandNotification:PLUGIN_CHECK_IMPORT_TYPE_COMPLETE";
      
      public static const PLUGIN_CHECK_EXPORT_TYPE_COMPLETE:String = "CommandNotification:PLUGIN_CHECK_EXPORT_TYPE_COMPLETE";
      
      public static const PLUGIN_SELECT_OPEN:String = "CommandNotification:PLUGIN_SELECT_OPEN";
      
      public static const PLUGIN_SELECT_PLUGIN_COMPLETE:String = "CommandNotification:PLUGIN_SELECT_PLUGIN_COMPLETE";
      
      public static const NEWFEATHER_GUIDE:String = "CommandNotification:NEW_FEATHER_GUIDE";
      
      public static const SHOW_ALL:String = "CommandNotification:SHOW_ALL";
      
      public static const SHOW_OR_HIDE_ALL_BONES:String = "CommandNotification:SHOW_BONE_ONLY";
      
      public static const SHOW_OR_HODE_ALL_IMAGES:String = "CommandNotification:SHOW_IMAGE_ONLY";
      
      public static const SHOW_TOOL_TIP:String = "CommandNotification:SHOW_TOOL_TIP";
      
      public static const HIDE_TOOL_TIP:String = "CommandNotification:HIDE_TOOL_TIP";
      
      public static const DISPLAY_TOOL_TIP:String = "CommandNotification:DISPLAY_TOOL_TIP";
      
      public static const BONE_GROUP:String = "CommandNotification:BONE_GROUP";
      
      public static const BONE_GROUP_REMOVE_OR_UNDO:String = "CommandNotification:BONE_GROUP_REMOVE_OR_UNDO";
      
      public static const UNDO:String = "CommandNotification:UNDO";
      
      public static const REDO:String = "CommandNotification:REDO";
      
      public static const SELECT_ALL:String = "CommandNotification:SELECT_ALL";
      
      public static const SELECT_INVERSE:String = "CommandNotification:SELECT_INVERSE";
      
      public static const RESET_PANEL:String = "CommandNotification:RESET_PANEL";
      
      public static const OPEN_PANEL:String = "CommandNotification:OPEN_PANEL";
      
      public static const CLOSE_PANEL:String = "CommandNotification:CLOSE_PANEL";
      
      public static const EXIT_WINDOW:String = "CommandNotification:EXIT_WINDOW";
      
      public static const SELECT_ITEM:String = "CommandNotification:SELECT_ITEM";
      
      public static const SELECT_ITEMS:String = "CommandNotification:SELECT_ITEMS";
      
      public static const SELECT_DRAG_ITEMS:String = "CommandNotification:SELECT_DRAG_ITEMS";
      
      public static const ADD_REMOVE_SELECT_ITEM:String = "CommandNotification:ADD_REMOVE_SELECT_ITEM";
      
      public static const STAGE_CHANGE:String = "CommandNotification:STAGE_CHANGE";
      
      public static const CHANGE_EDITMODE:String = "CommandNotification:CHANGE_EDITMODE";
      
      public static const CHANGE_TOOL:String = "CommandNotification:CHANGE_TOOL";
      
      public static const CHANGE_COORDINATE:String = "CommandNotification:CHANGE_COORDINATE";
      
      public static const CHANGE_GLOBAL_STAGE_FILTER:String = "CommandNotification:CHANGE_GLOBAL_STAGE_FILTER";
      
      public static const CHANGE_ITEM_STAGE_FILTER:String = "CommandNotification:CHANGE_ITEM_STAGE_FILTER";
      
      public static const CHANGE_ARMAUTRE_STAGE_FILTER:String = "CommandNotification:CHANGE_ARMAUTRE_STAGE_FILTER";
      
      public static const CHANGE_INHERITED_EDITABLE:String = "CommandNotification:CHANGE_INHERITED_EDITABLE";
      
      public static const CHANGE_ITEMS_VISIBLE:String = "CommandNotification:CHANGE_ITEMS_VISIBLE";
      
      public static const CHANGE_ITEMS_SELECTED:String = "CommandNotification:CHANGE_ITEMS_SELECTED";
      
      public static const MOVE_STAGE:String = "CommandNotification:MOVE_STAGE";
      
      public static const ZOOM_STAGE:String = "CommandNotification:ZOOM_STAGE";
      
      public static const MODIFY_STAGE_CANVAS:String = "CommandNotification:MODIFY_STAGE_CANVAS";
      
      public static const SELECT_FRAME:String = "CommandNotification:SELECT_FRAME";
      
      public static const SELECT_FRAME_LINE:String = "CommandNotification:SELECT_FRAME_LINE";
      
      public static const MODIFY_FRAME:String = "CommandNotification:MODIFY_FRAME";
      
      public static const INSERT_BLANK_FRAME:String = "CommandNotification:INSERT_BLANK_FRAME";
      
      public static const ADD_FRAME:String = "CommandNotification:ADD_FRAME";
      
      public static const ADD_FRAMES:String = "CommandNotification:ADD_FRAMES";
      
      public static const DEL_FRAME:String = "CommandNotification:DEL_FRAME";
      
      public static const DEL_FRAMES:String = "CommandNotification:DEL_FRAMES";
      
      public static const MOVE_MUTI_FRAME:String = "CommandNotification:MOVE_MUTI_FRAME";
      
      public static const SCALE_MUTI_FRAME:String = "CommandNotification:SCALE_MUTI_FRAME";
      
      public static const COPY_FRAME:String = "CommandNotification:COPY_FRAME";
      
      public static const PASTE_FRAMES:String = "CommandNotification:PASTE_FRAMES";
      
      public static const CLEAR_KEY_FRAMES:String = "CommandNotification:CLEAR_KEY_FRAMES";
      
      public static const PASTE_BASIC_FRAME:String = "CommandNotification:PASTE_BASIC_FRAME";
      
      public static const DISPERSE_TO_LAYER:String = "CommandNotification:DISPERSE_TO_LAYER";
      
      public static const DISPERSE_SLOT_TO_TIMELINE:String = "CommandNotification:DISPERSE_SLOT_TO_TIMELINE";
      
      public static const ADD_KEY_FRAMES:String = "CommandNotification:ADD_KEY_FRAMES";
      
      public static const MODIFY_FRAMES_TWEEN_TYPE:String = "CommandNotification:MODIFY_FRAMES_TWEEN_TYPE";
      
      public static const MODIFY_FRAMES_TWEEN_CURVE:String = "CommandNotification:MODIFY_FRAMES_TWEEN_CURVE";
      
      public static const MODIFY_FRAMES_TWEEN_ROTATE:String = "CommandNotification:MODIFY_FRAMES_TWEEN_ROTATE";
      
      public static const ADD_FRAME_ACTION:String = "CommandNotification:ADD_FRAME_ACTION";
      
      public static const MODIFY_FRAME_ACTION:String = "CommandNotification:MODIFY_FRAME_ACTION";
      
      public static const MODIFY_FRAME_EVENT:String = "CommandNotification:MODIFY_FRAME_EVENT";
      
      public static const DEL_FRAME_ACTION:String = "CommandNotification:DEL_FRAME_ACTION";
      
      public static const SELECT_ANIMATION:String = "CommandNotification:SELECT_ANIMATION";
      
      public static const ADD_ANIMATION:String = "CommandNotification:ADD_ANIMATION";
      
      public static const DEL_ANIMATION:String = "CommandNotification:DEL_ANIMATION";
      
      public static const DUP_ANIMATION:String = "CommandNotification:DUP_ANIMATION";
      
      public static const RENAME_ANIMATION:String = "CommandNotification:RENAME_ANIMATION";
      
      public static const MODIFY_ANIMATION:String = "CommandNotification:MODIFY_ANIMATION";
      
      public static const IMPORT_ANIMATION:String = "CommandNotification:IMPORT_ANIMATION";
      
      public static const ADD_BONE:String = "CommandNotification:ADD_BONE";
      
      public static const ADD_SLOT:String = "CommandNotification:ADD_SLOT";
      
      public static const ADD_DISPLAY_TO_BONE:String = "CommandNotification:ADD_DISPLAY_TO_BONE";
      
      public static const ADD_DISPLAYS_TO_BONE:String = "CommandNotification:ADD_DISPLAYS_TO_BONE";
      
      public static const ADD_DISPLAY_TO_SLOT:String = "CommandNotification:ADD_DISPLAY_TO_SLOT";
      
      public static const ADD_DISPLAYS_TO_SLOT:String = "CommandNotification:ADD_DISPLAYS_TO_SLOT";
      
      public static const ADD_SEQUENCE_ASSETS:String = "CommandNotification:ADD_SEQUENCE_ASSETS";
      
      public static const ADD_DISPLAY_TO_STAGE:String = "CommandNotification:ADD_DISPLAYS_TO_STAGE";
      
      public static const ADD_DISPLAYS_TO_STAGE:String = "CommandNotification:ADD_DISPLAYS_TO_STAGE";
      
      public static const ADD_LAYER:String = "CommandNotification:ADD_LAYER";
      
      public static const DELETE_TRANSFORM_ITEMS:String = "CommandNotification:DELETE_TRANSFORM_ITEMS";
      
      public static const DELETE_BONE:String = "CommandNotification:DELETE_BONE";
      
      public static const DELETE_SLOT:String = "CommandNotification:DELETE_SLOT";
      
      public static const DELETE_EMPTY_SLOT:String = "CommandNotification:DELETE_EMPTY_SLOT";
      
      public static const DELETE_DISPLAY:String = "CommandNotification:DELETE_DISPLAY";
      
      public static const DELETE_LAYERS:String = "CommandNotification:DELETE_LAYERS";
      
      public static const DELETE_IKCONSTRAINT:String = "CommandNotification:DELETE_IKCONSTRAINT";
      
      public static const MODIFY_ARMATURE_NAME:String = "CommandNotification:MODIFY_ARMATURE_NAME";
      
      public static const MODIFY_ARMATURE_ANIMATION:String = "CommandNotification:MODIFY_ARMATURE_ANIMATION";
      
      public static const MODIFY_SLOT_ANIMATION:String = "CommandNotification:MODIFY_SLOT_ANIMATION";
      
      public static const MODIFY_SLOT_FRAME_ANIMATION:String = "CommandNotification:MODIFY_SLOT_FRAME_ANIMATION";
      
      public static const MODIFY_BASIC_SLOT_FRAME_ANIMATION:String = "CommandNotification:MODIFY_BASIC_SLOT_FRAME_ANIMATION";
      
      public static const MODIFY_BONE_NAME:String = "CommandNotification:MODIFY_BONE_NAME";
      
      public static const MODIFY_BONE_ITEMS_LENGTH:String = "CommandNotification:MODIFY_BONE_ITEMS_LENGTH";
      
      public static const MODIFY_BONE_ITEMS_COLOR:String = "CommandNotification:MODIFY_BONE_ITEMS_COLOR";
      
      public static const MODIFY_BONE_TRANSFORM:String = "CommandNotification:MODIFY_BONE_TRANSFORM";
      
      public static const MODIFY_BONES_INHERIT:String = "CommandNotification:MODIFY_BONES_INHERIT";
      
      public static const MODIFY_BONES_SYMBOL_COLOR:String = "CommandNotification:MODIFY_BONES_SYMBOL_COLOR";
      
      public static const MODIFY_CREATING_BONE:String = "CommandNotification:MODIFY_CREATING_BONE";
      
      public static const MODIFY_CREATING_IKCONSTRAINT:String = "CommandNotification:MODIFY_CREATING_IKCONSTRAINT";
      
      public static const MODIFY_CREATING_IKCONSTRAINT_NEW_BONE:String = "CommandNotification:MODIFY_CREATING_IKCONSTRAINT_NEW_BONE";
      
      public static const MODIFY_SLOT_NAME:String = "CommandNotification:MODIFY_SLOT_NAME";
      
      public static const MODIFY_SLOT_TRANSFORM:String = "CommandNotification:MODIFY_SLOT_TRANSFORM";
      
      public static const MODIFY_SLOT_COLOR:String = "CommandNotification:MODIFY_SLOT_COLOR";
      
      public static const MODIFY_SLOT_BLENDMODE:String = "CommandNotification:MODIFY_SLOT_BLENDMODE";
      
      public static const MODIFY_SLOT_DISPLAY:String = "CommandNotification:MODIFY_SLOT_DISPLAY";
      
      public static const Modify_SLOT_ZORDER:String = "CommandNotification:Modify_SLOT_ZORDER";
      
      public static const Modify_SLOT_ITEMS_ZORDER:String = "CommandNotification:Modify_SLOT_ITEMS_ZORDER";
      
      public static const MODIFY_SLOT_ITEMS_ZORDER_TEMP:String = "CommandNotification:MODIFY_SLOT_ITEMS_ZORDER_TEMP";
      
      public static const MODIFY_COMIC_SLOT_ITEMS_ZORDER:String = "ComicNotification:MODIFY_COMIC_SLOT_ITEMS_ZORDER";
      
      public static const MODIFY_LAYER_NAME:String = "CommandNotification:MODIFY_LAYER_NAME";
      
      public static const MODIFY_ZORDER_FRAME:String = "CommandNotification:MODIFY_ZORDER_FRAME";
      
      public static const MODIFY_BOUNDINGBOX_NAME:String = "CommandNotification:MODIFY_BOUNDINGBOX_NAME";
      
      public static const MODIFY_SCENETREE_ITEMS_ORDER:String = "CommandNotification:MODIFY_SCENETREE_ITEMS_ORDER";
      
      public static const MODIFY_ARMATURE_ZORDER:String = "CommandNotification:MODIFY_ARMATURE_ZORDER";
      
      public static const MODIFY_ARMATURE_ZORDER_TEMP:String = "CommandNotification:MODIFY_ARMATURE_ZORDER_TEMP";
      
      public static const MODIFY_IKCONSTRAINT_NAME:String = "CommandNotification:MODIFY_IKCONSTRAINT_NAME";
      
      public static const MODIFY_IKCONSTRAINT_BEND:String = "CommandNotification:MODIFY_IKCONSTRAINT_BEND";
      
      public static const MODIFY_IKCONSTRAINT_WEIGHT:String = "CommandNotification:MODIFY_IKCONSTRAINT_WEIGHT";
      
      public static const MODIFY_IKCONSTRAINT_WEIGHT_ONLY:String = "CommandNotification:MODIFY_IKCONSTRAINT_WEIGHT_ONLY";
      
      public static const MODIFY_BASIC_BONE_FRAME_TRANSFORM:String = "CommandNotification:MODIFY_BASIC_BONE_FRAME_TRANSFORM";
      
      public static const MODIFY_MULT_BONE_FRAME_TRANSFORM:String = "CommandNotification:MODIFY_MULT_BONE_FRAME_TRANSFORM";
      
      public static const MODIFY_BONE_FRAME_TRANSFORM:String = "CommandNotification:MODIFY_BONE_FRAME_TRANSFORM";
      
      public static const MODIFY_SLOT_FRAME_TRANSFORM:String = "CommandNotification:MODIFY_SLOT_FRAME_TRANSFORM";
      
      public static const MODIFY_SLOT_FRAME_DISPLAY:String = "CommandNotification:MODIFY_SLOT_FRAME_DISPLAY";
      
      public static const MODIFY_SLOT_FRAME_COLOR:String = "CommandNotification:MODIFY_SLOT_FRAME_COLOR";
      
      public static const MODIFY_SLOT_FRAME_GOTO:String = "CommandNotification:MODIFY_SLOT_FRAME_GOTO";
      
      public static const MODIFY_BASIC_SLOT_FRAME_COLOR:String = "CommandNotification:MODIFY_BASIC_SLOT_FRAME_COLOR";
      
      public static const MODIFY_SLOT_FRAME_ALPHA:String = "CommandNotification:MODIFY_SLOT_FRAME_ALPHA";
      
      public static const MODIFY_ITEMS_TRANSFORM:String = "CommandNotification:MODIFY_ITEMS_TRANSFORM";
      
      public static const MODIFY_PIVOT:String = "CommandNotification:MODIFY_PIVOT";
      
      public static const SET_BONES_PARENT:String = "CommandNotification:SET_BONES_PARENT";
      
      public static const SET_SLOTS_PARENT:String = "CommandNotification:SET_SLOT_PARENT";
      
      public static const SET_DISPLAY_PARENT:String = "CommandNotification:SET_DISPLAY_PARENT";
      
      public static const SET_DISPLAY_PARENT_TO_SLOT:String = "CommandNotification:SET_DISPLAY_PARENT_TO_SLOT";
      
      public static const SET_DISPLAY_ITEMS_PARENT_TO_SLOT:String = "CommandNotification:SET_DISPLAY_ITEMS_PARENT_TO_SLOT";
      
      public static const SET_DISPLAY_ITEMS_PARENT_TO_BONE:String = "CommandNotification:SET_DISPLAY_ITEMS_PARENT_TO_BONE";
      
      public static const SET_DISPLAY_PARENT_TO_BONE:String = "CommandNotification:SET_DISPLAY_PARENT_TO_BONE";
      
      public static const SET_CURRENT_ARMATURE:String = "CommandNotification:SET_CURRENT_ARMATURE";
      
      public static const ADD_ARMATURE:String = "CommandNotification:ADD_ARMATURE";
      
      public static const DELETE_ARMATURE:String = "CommandNotification:DELETE_ARMATURE";
      
      public static const DELETE_LIBRARY_ASSETS:String = "CommandNotification:DELETE_LIBRARY_ASSETS";
      
      public static const RENAME_LIBRARY_ASSETS:String = "CommandNotification:RENAME_LIBRARY_ASSETS";
      
      public static const PREVIEW:String = "CommandNotification:PREVIEW";
      
      public static const EXPORT_EGRET:String = "CommandNotification:EXPORT_EGRET";
      
      public static const EXPORT_COMIC:String = "CommandNotification:EXPORT_COMIC";
      
      public static const APPLICATION_EXIT:String = "CommandNotification:APPLICATION_EXIT";
      
      public static const ADD_VERTEX:String = "CommandNotification:ADD_VERTEX";
      
      public static const DELETE_VERTEX:String = "CommandNotification:DELETE_VERTEX";
      
      public static const DELETE_VERTEX_2:String = "CommandNotification:DELETE_VERTEX_2";
      
      public static const DELETE_VERTICES:String = "CommandNotification:DELETE_VERTICES";
      
      public static const MODIFY_VERTEX:String = "CommandNotification:MODIFY_VERTEX";
      
      public static const MODIFY_OUTLINE_VERTEX:String = "CommandNotification:MODIFY_OUTLINE_VERTEX";
      
      public static const ADD_EDGE:String = "CommandNotification:ADD_EDGE";
      
      public static const DELETE_EDGE:String = "CommandNotification:DELETE_EDGE";
      
      public static const RESET_ORIGIN:String = "CommandNotification:RESET_ORIGIN";
      
      public static const START_ADD_OUTLINE:String = "CommandNotification:START_ADD_OUTLINE";
      
      public static const END_ADD_OUTLINE:String = "CommandNotification:END_ADD_OUTLINE";
      
      public static const ADD_OUTLINE_VERTEX:String = "CommandNotification:ADD_OUTLINE_VERTEX";
      
      public static const MODIFY_FFD_UV:String = "CommandNotification:MODIFY_FFD_UV";
      
      public static const MODIFY_SKINED_FFD_UV:String = "CommandNotification:MODIFY_SKINED_FFD_UV";
      
      public static const AUTO_ORIGIN:String = "CommandNotification:AUTO_ORIGIN";
      
      public static const CHANGE_TO_MESH:String = "CommandNotification:CHANGE_TO_MESH";
      
      public static const CHANGE_TO_IMAGE:String = "CommandNotification:CHANGE_TO_IMAGE";
      
      public static const FFD_RESET:String = "CommandNotification:FFD_RESET";
      
      public static const MODIFY_FFD:String = "CommandNotification:MODIFY_FFD";
      
      public static const MODIFY_ANIMATION_CACHE_FFD:String = "CommandNotification:MODIFY_ANIMATION_CACHE_FFD";
      
      public static const MODIFY_SKINED_MESH_CACHE_FFD:String = "CommandNotification:MODIFY_SKINED_MESH_CACHE_FFD";
      
      public static const ADD_AUTO_FFD_FRAME:String = "CommandNotification:ADD_AUTO_FFD_FRAME";
      
      public static const MODIFY_SKINED_MESH_FFD:String = "CommandNotification:MODIFY_SKINED_MESH_FFD";
      
      public static const MESH_ADD_BONE:String = "CommandNotification:MESH_ADD_BONE";
      
      public static const MESH_DELETE_BONE:String = "CommandNotification:MESH_DELETE_BONE";
      
      public static const MODIFY_BONE_WEIGHT:String = "CommandNotification:MODIFY_BONE_WEIGHT";
      
      public static const MODIFY_BONE_WEIGHTS:String = "CommandNotification:MODIFY_BONE_WEIGHTS";
      
      public static const MODIFY_DISPLAY_ASSET:String = "CommandNotification:MODIFY_DISPLAY_ASSET";
      
      public static const MODIFY_DISPLAY_NAME:String = "CommandNotification:MODIFY_DISPLAY_NAME";
      
      public static const DRAG_SLOT_TO_SLOT:String = "CommandNotification:DRAG_SLOT_TO_SLOT";
      
      public static const MODIFY_IK_FRAME:String = "CommandNotification:MODIFY_IK_FRAME";
      
      public static const COPY_BONE:String = "CommandNotification:COPY_BONE";
      
      public static const PASTE_BONE:String = "CommandNotification:PASTE_BONE";
      
      public static const COPY_SLOT:String = "CommandNotification:COPY_SLOT";
      
      public static const PASTE_SLOT:String = "CommandNotification:PASTE_SLOT";
      
      public static const COPY_DISPLAY:String = "CommandNotification:COPY_DISPLAY";
      
      public static const PASTE_DISPLAY:String = "CommandNotification:PASTE_DISPLAY";
      
      public static const DUPLICATE_BONE:String = "CommandNotification:DUPLICATE_BONE";
      
      public static const DUPLICATE_SLOT:String = "CommandNotification:DUPLICATE_SLOT";
      
      public static const COPY_TRANSFORM:String = "CommandNotification:COPY_TRANSFORM";
      
      public static const MODIFY_ARMATURE_FRAMERATE:String = "CommandNotification:MODIFY_ARMATURE_FRAMERATE";
      
      public static const IMPORT_ARMATUERS:String = "CommandNotification:IMPORT_ARMATUERS";
      
      public static const COPY_SLOT_PROPERTY:String = "CommandNotification:COPY_SLOT_PROPERTY";
      
      public static const PASTE_SLOT_PROPERTY:String = "CommandNotification:PASTE_SLOT_PROPERTY";
      
      public static const PASTE_DISPLAY_TO_BONE:String = "CommandNotification:PASTE_DISPLAY_TO_BONE";
      
      public static const PASTE_DISPLAY_TO_SLOT:String = "CommandNotification:PASTE_DISPLAY_TO_SLOT";
      
      public static const PASTE_BONETIMELINEVO_TO_BONE:String = "CommandNotification:PASTE_BONETIMELINEVO_TO_BONE";
      
      public static const PASTE_SLOTTIMELINEVO_TO_SLOT:String = "CommandNotification:PASTE_SLOTTIMELINEVO_TO_SLOT";
      
      public static const PASTE_FFDTIMELINEVO_TO_MESH:String = "CommandNotification:PASTE_FFDTIMELINEVO_TO_MESH";
      
      public static const SCENE_PANEL_TREE_SOLT_ITEMS:String = "CommandNotification:SCENE_PANEL_TREE_SOLT_ITEMS";
      
      public static const ADD_COMICOBJECT_TO_STAGE:String = "CommandNotification:ADD_COMICOBJECT_TO_STAGE";
      
      public static const ADD_COMICOBJECTS_TO_STAGE:String = "CommandNotification:ADD_COMICOBJECTS_TO_STAGE";
      
      public static const MODIFY_COMICOBJECT_TRANSFORM:String = "CommandNotification:MODIFY_COMICOBJECT_TRANSFORM";
      
      public static const MODIFY_COMICOBJECT_ALPHA:String = "CommandNotification:MODIFY_COMICOBJECT_ALPHA";
      
      public static const MODIFY_COMICOBJECT_TWEEN_TRANSFORM:String = "CommandNotification:MODIFY_COMICOBJECT_TWEEN_TRANSFORM";
      
      public static const ADD_COMIC_TWEEN:String = "CommandNotification:ADD_COMIC_TWEEN";
      
      public static const MODIFY_COMIC_TWEEN_VALUE:String = "CommandNotification:MODIFY_COMIC_TWEEN_VALUE";
      
      public static const MODIFY_COMIC_TWEEN_DURING:String = "CommandNotification:MODIFY_COMIC_TWEEN_DURING";
      
      public static const MODIFY_COMIC_TWEENS_DURING:String = "CommandNotification:MODIFY_COMIC_TWEENS_DURING";
      
      public static const MODIFY_COMIC_TWEEN_EASING:String = "CommandNotification:MODIFY_COMIC_TWEEN_EASING";
      
      public static const MODIFY_COMIC_TWEENS_EASING:String = "CommandNotification:MODIFY_COMIC_TWEENS_EASING";
      
      public static const MODIFY_COMIC_TWEEN_LOOP:String = "CommandNotification:MODIFY_COMIC_TWEEN_LOOP";
      
      public static const ADD_COMIC_TRACK_TWEEN:String = "CommandNotification:ADD_COMIC_TRACK_TWEEN";
      
      public static const ADD_COMIC_STRIP_TRACK_TWEEN:String = "CommandNotification:ADD_COMIC_STRIP_TRACK_TWEEN";
      
      public static const DELETE_COMICOBJECT:String = "CommandNotification:DELETE_COMICOBJECT";
      
      public static const DELETE_COMIC_TRACKMODEL:String = "CommandNotification:DELETE_COMIC_TRACKMODEL";
      
      public static const MODIFY_COMIC_STAGE_CANVAS:String = "CommandNotification:MODIFY_COMIC_STAGE_CANVAS";
      
      public static const MODIFY_COMIC_TWEEN_TYPE:String = "CommandNotification:MODIFY_COMIC_TWEEN_TYPE";
      
      public static const MODIFY_COMIC_APPEAR_TWEEN_TYPE:String = "CommandNotification:MODIFY_COMIC_APPEAR_TWEEN_TYPE";
      
      public static const MODIFY_COMIC_DISAPPEAR_TWEEN_TYPE:String = "CommandNotification:MODIFY_COMIC_DISAPPEAR_TWEEN_TYPE";
      
      public static const DELETE_COMIC_TWEENS:String = "CommandNotification:DELETE_COMIC_TWEENS";
      
      public static const IMPORT_COMIC_ASSETS:String = "CommandNotification:IMPORT_COMIC_ASSETS";
      
      public static const IMPORT_ASSETS_TO_STAGE:String = "CommandNotification:IMPORT_ASSETS_TO_STAGE";
      
      public static const IMPORT_SEQUENCE_ASSETS_TO_STAGE:String = "CommandNotification:IMPORT_SEQUENCE_ASSETS_TO_STAGE";
      
      public static const IMPORT_ASSETS_TO_LIBRARY:String = "CommandNotification:IMPORT_ASSETS_TO_LIBRARY";
      
      public static const DRAG_MERGE:String = "CommandNotification:DRAG_MERGE";
      
      public static const MOVE_TWEEN_TO_STRIP:String = "CommandNotification:MOVE_TWEEN_TO_STRIP";
      
      public static const MOVE_TWEEN_TO_TRACK:String = "CommandNotification:MOVE_TWEEN_TO_TRACK";
      
      public static const MOVE_TWEEN_OUT_STRIP:String = "CommandNotification:MOVE_TWEEN_OUT_STRIP";
      
      public static const MOVE_TWEEN_AFTER_TRACKS_OUT_STRIP:String = "CommandNotification:MOVE_TWEEN_AFTER_TRACKS_OUT_STRIP";
      
      public static const MODIFY_BOUNDINGBOX:String = "CommandNotification:MODIFY_BOUNDINGBOX";
      
      public static const CREATE_BOUNDINGBOX:String = "CommandNotification:CREATE_BOUNDINGBOX";
      
      public static const NEW_BOUNDINGBOX_ADD_VERTEX:String = "CommandNotification:NEW_BOUNDINGBOX_ADD_VERTEX";
      
      public static const ADD_BOUNDINGBOX_TO_SLOT:String = "CommandNotification:ADD_BOUNDINGBOX_TO_SLOT";
      
      public static const NORMALIZE_BOUNDINGBOX:String = "CommandNotification:NORMALIZE_BOUNDINGBOX";
      
      public static const FREEZE_BOUNDINGBOX:String = "CommandNotification:FREEZE_BOUNDINGBOX";
      
      public static const ADD_SHEET_FRAMES:String = "CommandNotification:ADD_SHEET_FRAMES";
      
      public static const DEL_SHEET_FRAMES:String = "CommandNotification:DEL_SHEET_FRAMES";
      
      public static const RESET_SHEET_ORDER:String = "CommandNotification:RESET_SHEET_ORDER";
      
      public static const MODIFY_SHEET_TRANSFORM:String = "CommandNotification:MODIFY_SHEET_TRANSFORM";
      
      public static const MODIFY_SHEETS_TRANSFORM:String = "CommandNotification:MODIFY_SHEETS_TRANSFORM";
      
      public static const MODIFY_SHEET_FPS:String = "CommandNotification:MODIFY_SHEET_FPS";
      
      public static const MODIFY_SHEET_PLAY_TIME:String = "CommandNotification:MODIFY_SHEET_PLAY_TIME";
      
      public static const UPDATE_CANVASVO:String = "CommandNotification:UPDATE_CANVASVO";
      
      public static const ADD_BONE_FRAME:String = "CommandNotification:ADD_BONE_FRAME";
      
      public static const ADD_ZORDER_FRAME:String = "CommandNotification:ADD_ZORDER_FRAME";
      
      public static const ADD_ZORDER_FRAME_CACHE:String = "CommandNotification:ADD_ZORDER_FRAME_CACHE";
      
      public static const ADD_EVENT_FRAEM:String = "CommandNotification:ADD_EVENT_FRAEM";
      
      public static const ADD_BASIC_FRAMES:String = "CommandNotification:ADD_BASIC_FRAMES";
      
      public static const MODIFY_VITUALFOLDER_NAME:String = "CommandNotification:MODIFY_VITUALFOLDER_NAME";
      
      public static const DELETE_VITUALFOLDER:String = "CommandNotification:DELETE_VITUALFOLDER";
      
      public static const SET_LIBRARYNODEMODEL_PARENT:String = "CommandNotification:SET_LIBRARYNODEMODEL_PARENT";
      
      public static const ADD_VITUAL_FOLDER:String = "CommandNotification:ADD_VITUAL_FOLDER";
      
      public function CommandNotification(param1:String, param2:* = null)
      {
         super(param1);
         data = param2;
      }
   }
}

