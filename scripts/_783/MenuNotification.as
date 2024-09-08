package _783
{
   import _6._9;
   import flash.events.Event;
   
   public class MenuNotification extends _9
   {
      public static const FILE:String = "MenuNotification:FILE";
      
      public static const EDIT:String = "MenuNotification:EDIT";
      
      public static const WINDOW:String = "MenuNotification:WINDOW";
      
      public static const HELP:String = "MenuNotification:HELP";
      
      public static const FILE_NEW_PROJECT:String = CommandNotification.SHOW_NEW_PROJECT_WINDOW;
      
      public static const FILE_OPEN_PROJECT:String = CommandNotification.SHOW_OPEN_PROJECT_DIALOG;
      
      public static const FILE_SAVE_PROJECT:String = CommandNotification.SAVE_PROJECT;
      
      public static const FILE_SAVE_AS_PROJECT:String = CommandNotification.SAVE_AS_PROJECT;
      
      public static const FILE_CLOSE_PROJECT:String = CommandNotification.CLOSE_PROJECT;
      
      public static const FILE_IMPORT_ASSETS:String = CommandNotification.IMPORT_ASSETS_TO_STAGE;
      
      public static const FILE_IMPORT_ASSETS_TO_LIB:String = CommandNotification.IMPORT_ASSETS_TO_LIBRARY;
      
      public static const FILE_IMPORT_SEQUENCE_ASSETS:String = CommandNotification.IMPORT_SEQUENCE_ASSETS_TO_STAGE;
      
      public static const FILE_IMPORT:String = CommandNotification.SHOW_IMPORT_WINDOW;
      
      public static const FILE_EXPORT:String = CommandNotification.SHOW_EXPORT_WINDOW;
      
      public static const FILE_SETTING:String = CommandNotification.SHOW_SETTING_WINDOW;
      
      public static const FILE_PREVIEW:String = CommandNotification.PREVIEW;
      
      public static const FILE_EXPORT_EGRET:String = CommandNotification.SHOW_EXPORT_EGRET_WINDOW;
      
      public static const FILE_SHARE:String = CommandNotification.SHOW_SHARE_WINDOW;
      
      public static const FILE_EXIT:String = CommandNotification.EXIT_WINDOW;
      
      public static const EDIT_UNDO:String = CommandNotification.UNDO;
      
      public static const EDIT_REDO:String = CommandNotification.REDO;
      
      public static const EDIT_SELECT_ALL:String = CommandNotification.SELECT_ALL;
      
      public static const EDIT_SELECT_INVERSE:String = CommandNotification.SELECT_INVERSE;
      
      public static const EDIT_DELETE:String = PanelNotification.SCENE_PANEL_DELETE_ITEM;
      
      public static const WINDOW_SCENE_PANEL:String = "MenuNotification:WINDOW_SCENE_PANEL";
      
      public static const WINDOW_PROPERTY_PANEL:String = "MenuNotification:WINDOW_PROPERTY_PANEL";
      
      public static const WINDOW_DRAWORDER_PANEL:String = "MenuNotification:WINDOW_DRAWORDER_PANEL";
      
      public static const WINDOW_LIBRARY_PANEL:String = "MenuNotification:WINDOW_LIBRARY_PANEL";
      
      public static const WINDOW_ANIMATION_PANEL:String = "MenuNotification:WINDOW_ANIMATION_PANEL";
      
      public static const WINDOW_TIMELINE_PANEL:String = "MenuNotification:WINDOW_TIMELINE_PANEL";
      
      public static const WINDOW_CURVE_PANEL:String = "MenuNotification:WINDOW_CURVE_PANEL";
      
      public static const WINDOW_SHEET_PANEL:String = "MenuNotification:WINDOW_SHEET_PANEL";
      
      public static const WINDOW_COMIC_PANEL:String = "MenuNotification:WINDOW_COMIC_PANEL";
      
      public static const WINDOW_COMIC_ORDER_PANEL:String = "MenuNotification:WINDOW_COMIC_ORDER";
      
      public static const WINDOW_TRANSFORM_PANEL:String = "MenuNotification:WINDOW_TRANSFORM_PANEL";
      
      public static const WINDOW_RESET:String = "MenuNotification:WINDOW_RESET";
      
      public static const HELP_LEARN_DB:String = "MenuNotification.HELP_LEARN_DB";
      
      public static const HELP_WELCOME_PAGE:String = CommandNotification.OPEN_AND_SELECT_WELCOME_PAGE;
      
      public static const HELP_ISSUE_REPORT:String = CommandNotification.SHOW_ISSUE_REPORT_WINDOW;
      
      public static const HELP_OPEN_TRELLO:String = CommandNotification.OPEN_TRELLO;
      
      public static const HELP_PLUGIN_MANAGER:String = CommandNotification.PLUGIN_MANAGER;
      
      public static const HELP_PSDPLUGIN_GUIDE:String = CommandNotification.PSDPLUGIN_GUIDE;
      
      public static const HELP_INSTALL_FLASH_PLUGIN:String = CommandNotification.INSTALL_FLASH_PLUGIN;
      
      public static const HELP_ABOUT:String = CommandNotification.SHOW_ABOUT_WINDOW;
      
      public static const HELP_NEWFEATHER_GUIDE:String = CommandNotification.NEWFEATHER_GUIDE;
      
      public static const ID_EXPORT:String = "export";
      
      public static const ID_NEW_EXML:String = "newExml";
      
      public static const ID_SAVE:String = "save";
      
      public static const ID_SAVE_ALL:String = "saveAll";
      
      public static const TYPE_EDIT:String = "edit";
      
      public static const TYPE_ALIGN:String = "align";
      
      public static const TYPE_AVG:String = "avg";
      
      public static const ID_UNDO:String = "undo";
      
      public static const ID_REDO:String = "redo";
      
      public static const ID_ALIGN_TOP:String = "alignTop";
      
      public static const ID_ALIGN_VC:String = "alignVC";
      
      public static const ID_ALIGN_BOTTOM:String = "alignBottom";
      
      public static const ID_ALIGN_LEFT:String = "alignLeft";
      
      public static const ID_ALIGN_HC:String = "alignHC";
      
      public static const ID_ALIGN_RIGHT:String = "alignRight";
      
      public static const ID_AVG_TOP:String = "avgTop";
      
      public static const ID_AVG_VC:String = "avgVC";
      
      public static const ID_AVG_BOTTOM:String = "avgBottom";
      
      public static const ID_AVG_LEFT:String = "avgLeft";
      
      public static const ID_AVG_HC:String = "avgHC";
      
      public static const ID_AVG_RIGHT:String = "avgRight";
      
      public static const ID_ARG_FRONT:String = "argFront";
      
      public static const ID_ARG_FORWARD:String = "argForward";
      
      public static const ID_ARG_BACKWORD:String = "argBackward";
      
      public static const ID_ARG_BACK:String = "argBack";
      
      public static const TYPE_RESOURCE:String = "resource";
      
      public static const ID_ADD_RESOURCE:String = "addResource";
      
      public static const ID_ADD_RESOURCE_FOLDER:String = "addResourceFolder";
      
      public static const TYPE_PROJECT:String = "project";
      
      public static const ID_RUN:String = "run";
      
      public static const ID_PROJECT_PROPTY:String = "projectPropry";
      
      public static const ID_WINDOW_COMPONENT:String = "windowComponent";
      
      public static const ID_WINDOW_LAYER:String = "windowLayer";
      
      public static const ID_WINDOW_STATE:String = "windowState";
      
      public static const ID_WINDOW_PROPERTY:String = "windowProperty";
      
      public static const ID_WINDOW_RESOURCE:String = "windowResource";
      
      public static const ID_WINDOW_PACKAGE:String = "windowPackage";
      
      public static const ID_WINDOW_CONSOLE:String = "windowConsole";
      
      public static const ID_WINDOW_PROGRESS:String = "windowProgress";
      
      public static const ID_WINDOW_ANIMATE:String = "windowAnimate";
      
      public static const ID_WINDOW_DATA:String = "windowData";
      
      public static const ID_PREFERENCE:String = "preference";
      
      public static const TYPE_HELP:String = "help";
      
      public static const ID_HELP_WELCOME:String = "welcome";
      
      public static const ID_HELP_WEBSITE:String = "website";
      
      public static const ID_HELP_BBS:String = "bbs";
      
      public static const ID_HELP_TUTORIALS:String = "tutorials";
      
      public static const ID_HELP_BUG:String = "bug";
      
      public static const ID_HELP_DOC:String = "docCenter";
      
      public static const ID_HELP_ABOUT:String = "about";
      
      public static const DISTRIBUTE_TO_FRAMES:String = "DISTRIBUTE_TO_FRAMES";
      
      public static const DISTRIBUTE_SLOT_TO_FRAMES:String = "DISTRIBUTE_SLOT_TO_FRAMES";
      
      public static const KEY_FRAME:String = "KEY_FRAME";
      
      public static const DUPLICATE:String = "DUPLICATE";
      
      public static const COPY_TRANSFORM:String = "COPY_TRANSFORM";
      
      public static const PASTE_TRANSFORM:String = "PASTE_TRANSFORM";
      
      public static const EXPAND_ALL:String = "EXPAND_ALL";
      
      public static const COLLAPSE_ALL:String = "COLLAPSE_ALL";
      
      public static const SHOW_ALL:String = "SHOW_ALL";
      
      public static const MENU_EDIT:String = "MENU_EDIT";
      
      public static const CONVERT_TO_MESH:String = "CONVERT_TO_MESH";
      
      public static const CONVERT_TO_IMAGE:String = "CONVERT_TO_IMAGE";
      
      public static const SWAP_IMAGE:String = "SWAP_IMAGE";
      
      public static const CUT_FRAME:String = "CUT_FRAME";
      
      public static const COPY_FRAME:String = "COPY_FRAME";
      
      public static const PASTE_FRAME:String = "PASTE_FRAME";
      
      public static const CLEAR_FRAME:String = "CLEAR_FRAME";
      
      public static const DELETE_FRAME:String = "DELETE_FRAME";
      
      public static const INSERT_LAYER:String = "INSERT_LAYER";
      
      public static const DELETE_LAYER:String = "DELETE_LAYER";
      
      public static const SHOW_IN_EXPLORER:String = "SHOW_IN_EXPLORER";
      
      public static const RELOCATE_PATH:String = "RELOCATE_PATH";
      
      public static const NEW_SYMBOL:String = "NEW_SYMBOL";
      
      public static const IMPORT_ASSET:String = "IMPORT_ASSET";
      
      public static const EXPORT:String = "RIGHT_EXPORT";
      
      public static const RENAME:String = "RIGHT_RENAME";
      
      public static const DELETE_ARMATURE:String = "DELETE_ARMATURE";
      
      public static const DELETE_VITUAL_FOLDER:String = "DELETE_VITUAL_FOLDER";
      
      public static const SET_PARENT:String = "SET_PARENT";
      
      public static const BRING_TO_FRONT:String = "BRING_TO_FRONT";
      
      public static const BRING_FORWARD:String = "BRING_FORWARD";
      
      public static const SEND_BACKWARD:String = "SEND_BACKWARD";
      
      public static const SEND_TO_BOTTOM:String = "SEND_TO_BOTTOM";
      
      public static const CLONE_ANIMATION:String = "CLONE_ANIMATION";
      
      public static const ADD_ANIMATION:String = "ADD_ANIMATION";
      
      public static const DELETE_ANIMATION:String = "DELETE_ANIMATION";
      
      public static const ADD_TWEEN:String = "ADD_TWEEN";
      
      public static const DELETE_TWEEN:String = "DELETE_TWEEN";
      
      public static const ADD_BOUNDINGBOX:String = "ADD_BOUNDINGBOX";
      
      public static const COPY_BONE:String = "COPY_BONE";
      
      public static const PASTE_BONE:String = "PASTE_BONE";
      
      public static const COPY_SLOT:String = "COPY_SLOT";
      
      public static const PASTE_SLOT:String = "PASTE_SLOT";
      
      public static const COPY_DISPLAY:String = "COPY_DISPLAY";
      
      public static const PASTE_DISPLAY:String = "PASTE_DISPLAY";
      
      public static const ADD_COMIC_TWEEN:String = "ADD_COMIC_TWEEN";
      
      public static const CHANGE_COMIC_TWEEN:String = "CHANGE_COMIC_TWEEN";
      
      public static const CHANGE_COMIC_APPEAR_TWEEN:String = "CHANGE_COMIC_APPEAR_TWEEN";
      
      public static const CHANGE_COMIC_DISAPPEAR_TWEEN:String = "CHANGE_COMIC_DISAPPEAR_TWEEN";
      
      public static const COPY_SLOT_PROPERTY:String = "COPY_SLOT_PROPERTY";
      
      public static const PASTE_SLOT_PROPERTY:String = "PASTE_SLOT_PROPERTY";
      
      public static const SELECTIVE_PASTE:String = "SELECTIVE_PASTE";
      
      public static const EXPAND_SELECTED:String = "EXPADN_SELECTED";
      
      public static const COLLAPSE_SELECTED:String = "COLLAPSE_SELECTED";
      
      public static const SHOW_ITEM:String = "SHOW_ITEM";
      
      public var _5985:String = "";
      
      public var enabled:Boolean = true;
      
      public function MenuNotification(param1:String, param2:String = null, param3:* = null)
      {
         super(param1);
         this._5985 = param2;
         data = param3;
      }
      
      override public function clone() : Event
      {
         var _loc1_:MenuNotification = new MenuNotification(type,this._5985);
         _loc1_.enabled = this.enabled;
         return _loc1_;
      }
   }
}

