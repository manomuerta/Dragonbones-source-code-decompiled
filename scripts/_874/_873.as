package _874
{
   import _1038._1039;
   import _1038._1043;
   import _1045.Menu;
   import _1177.MenuEvent;
   import _24._26;
   import _28._27;
   import _28._29;
   import _28._30;
   import _708._715;
   import _710._711;
   import _710._712;
   import _710._713;
   import _783.MenuNotification;
   import _97._115;
   import egret.utils.tr;
   import flash.display.DisplayObjectContainer;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   
   public class _873
   {
      public var _6376:Dictionary;
      
      private var contextMenu:Menu;
      
      private var _6372:Object;
      
      private var _6374:Function;
      
      private var _parent:DisplayObjectContainer;
      
      public function _873(param1:DisplayObjectContainer, param2:Function)
      {
         this._6376 = new Dictionary();
         super();
         this._parent = param1;
         this._6374 = param2;
         this._6373();
         this.contextMenu = Menu._6375(param1,null);
         this.contextMenu.addEventListener(MenuEvent.ITEM_CLICK,param2);
         this.contextMenu._5987 = "@label";
         this.contextMenu._6377 = "@icon";
      }
      
      private function _6373() : void
      {
         var _loc1_:Object = null;
         this._6372 = {
            "stage":{
               "blank":{
                  "armature":[_713.SELECT_ALL,"",_713.IMPORT_IMAGES,_713.IMPORT_SEQUENCE_IMAGES,_713.RULER,_713.GRID,"",_713.SHOW_ALL,"",_713.CLEAR_RULER_LINES],
                  "animation":"armature",
                  "general":[_713.PASTE,"",_713.SELECT_ALL,"",_713.IMPORT_IMAGES,_713.RULER,_713.GRID,"",_713.SHOW_ALL,"",_713.CLEAR_RULER_LINES]
               },
               "bone":{
                  "armature":[_713.CONVERT_TO_SYMBOL,_713.SET_PARENT,"",[_713.INSERT,[_713.BONE,_713.SLOT,_713.BOUNDING_BOX]],"",_713.COPY_BONE,_713.PASTE_BONE,_713.SELECTIVE_PASTE,_713.DUPLICATE,_713.DELETE,"",_713.RENAME,"",_713.COPY_TRANSFORM,_713.PASTE_TRANSFORM,"",_713.HIDE,_713.HIDE_OTHERS,_713.HIDE_IRRELEVANT,_713.HIDE_RELATED,"",_713.LOCK,_713.LOCK_OTHERS,_713.LOCK_IRRELEVANT,_713.LOCK_RELATED,"",_713.SHOW_ALL,_713.SELECT_CHILD_BONES,_713.SELECT_CHILD_SLOTS,_713.SELECT_INVERSE],
                  "animation":[_713.KEY_FRAME,"",_713.COPY_BONE,"",_713.RENAME,"",_713.COPY_TRANSFORM,_713.PASTE_TRANSFORM,"",_713.HIDE,_713.HIDE_OTHERS,_713.HIDE_IRRELEVANT,_713.HIDE_RELATED,"",_713.LOCK,_713.LOCK_OTHERS,_713.LOCK_IRRELEVANT,_713.LOCK_RELATED,"",_713.SHOW_ALL,"",_713.SELECT_CHILD_BONES,_713.SELECT_CHILD_SLOTS,_713.SELECT_INVERSE]
               },
               "image":{
                  "armature":[_713.MESH,_713.SWITCH_DISPLAY,_713.SWAP_IMAGE,"",_713.SET_PARENT,"",_713.COPY_SLOT,_713.PASTE_DISPLAY,_713.SELECTIVE_PASTE,_713.DUPLICATE,_713.DELETE_SLOT,"",_713.RENAME,"",_713.COPY_TRANSFORM,_713.PASTE_TRANSFORM,"",_713.COPY_SLOT_PROPERTY,_713.PASTE_SLOT_PROPERTY,"",_713.BRING_FORWARD,_713.SEND_BACKWARD,_713.BRING_TO_FRONT,_713.SEND_TO_BOTTOM,"",_713.HIDE,_713.HIDE_OTHERS,"",_713.LOCK,_713.LOCK_OTHERS,"",_713.SHOW_ALL],
                  "animation":[_713.KEY_FRAME,_713.DISTRIBUTE_SLOT_TO_FRAMES,"",_713.SWITCH_DISPLAY,"",_713.COPY_SLOT,"",_713.COPY_SLOT_PROPERTY,_713.PASTE_SLOT_PROPERTY,"",_713.RENAME,"",_713.COPY_TRANSFORM,"",_713.BRING_FORWARD,_713.SEND_BACKWARD,_713.BRING_TO_FRONT,_713.SEND_TO_BOTTOM,"",_713.HIDE,_713.HIDE_OTHERS,"",_713.LOCK,_713.LOCK_OTHERS,"",_713.SHOW_ALL],
                  "general":[_713.KEY_FRAME,"",_713.SWAP_RESOURCE,_713.SWAP_IMAGE,_713.CONVERT_TO_SYMBOL,_713.DUPLICATE,_713.CUT,_713.COPY,_713.PASTE,_713.DELETE,"",_713.SELECT_INVERSE,_713.HIDE,_713.LOCK,"",_713.DISTRIBUTE_TO_FRAMES,_713.SHOW_IN_LIBRARY]
               },
               "mesh":{
                  "armature":[_713.MESH,_713.SWITCH_DISPLAY,_713.SWAP_IMAGE,"",_713.SET_PARENT,"",_713.COPY_SLOT,_713.PASTE_DISPLAY,_713.DUPLICATE,_713.DELETE_SLOT,"",_713.RENAME,"",_713.COPY_TRANSFORM,_713.PASTE_TRANSFORM,"",_713.COPY_SLOT_PROPERTY,_713.PASTE_SLOT_PROPERTY,"",_713.BRING_FORWARD,_713.SEND_BACKWARD,_713.BRING_TO_FRONT,_713.SEND_TO_BOTTOM,"",_713.HIDE,_713.HIDE_OTHERS,"",_713.LOCK,_713.LOCK_OTHERS,"",_713.SHOW_ALL],
                  "animation":[_713.KEY_FRAME,_713.DISTRIBUTE_SLOT_TO_FRAMES,"",_713.SWITCH_DISPLAY,"",_713.COPY_SLOT,"",_713.COPY_SLOT_PROPERTY,_713.PASTE_SLOT_PROPERTY,"",_713.RENAME,"",_713.COPY_TRANSFORM,"",_713.BRING_TO_FRONT,_713.BRING_FORWARD,_713.SEND_BACKWARD,_713.SEND_TO_BOTTOM,"",_713.HIDE,_713.HIDE_OTHERS,"",_713.LOCK,_713.LOCK_OTHERS,"",_713.SHOW_ALL],
                  "general":[_713.KEY_FRAME,"",_713.SWAP_RESOURCE,_713.SWAP_IMAGE,_713.CONVERT_TO_SYMBOL,_713.DUPLICATE,_713.CUT,_713.COPY,_713.PASTE,_713.DELETE,"",_713.SELECT_INVERSE,_713.HIDE,_713.LOCK,"",_713.DISTRIBUTE_TO_FRAMES,_713.SHOW_IN_LIBRARY]
               },
               "childSymbol":{
                  "armature":[_713.EDIT,_713.SWAP_RESOURCE,_713.SWITCH_DISPLAY,"",_713.CONVERT_TO_SYMBOL,_713.SET_PARENT,"",_713.COPY_SLOT,_713.PASTE_DISPLAY,_713.SELECTIVE_PASTE,_713.DUPLICATE,_713.DELETE_SLOT,"",_713.RENAME,"",_713.COPY_TRANSFORM,_713.PASTE_TRANSFORM,"",_713.COPY_SLOT_PROPERTY,_713.PASTE_SLOT_PROPERTY,"",_713.BRING_FORWARD,_713.SEND_BACKWARD,_713.BRING_TO_FRONT,_713.SEND_TO_BOTTOM,"",_713.HIDE,_713.HIDE_OTHERS,"",_713.LOCK,_713.LOCK_OTHERS,"",_713.SHOW_ALL],
                  "animation":[_713.KEY_FRAME,_713.DISTRIBUTE_SLOT_TO_FRAMES,"",_713.SWITCH_DISPLAY,"",_713.COPY_SLOT,"",_713.COPY_SLOT_PROPERTY,_713.PASTE_SLOT_PROPERTY,"",_713.RENAME,"",_713.COPY_TRANSFORM,"",_713.BRING_FORWARD,_713.SEND_BACKWARD,_713.BRING_TO_FRONT,_713.SEND_TO_BOTTOM,"",_713.HIDE,_713.HIDE_OTHERS,"",_713.LOCK,_713.LOCK_OTHERS,"",_713.SHOW_ALL],
                  "general":[_713.KEY_FRAME,"",_713.SWAP_RESOURCE,_713.CONVERT_TO_SYMBOL,_713.DUPLICATE,_713.CUT,_713.COPY,_713.PASTE,_713.DELETE,"",_713.SELECT_INVERSE,_713.HIDE,_713.LOCK,"",_713.DISTRIBUTE_TO_FRAMES,_713.SHOW_IN_LIBRARY]
               }
            },
            "scenePanel":{
               "mainSymbol":[_713.RENAME,"",_713.EXPAND_ALL,_713.COLLAPSE_ALL,_713.SHOW_ALL],
               "childSymbol":{
                  "armature":[_713.EDIT,_713.SWAP_RESOURCE,_713.CONVERT_TO_SYMBOL,_713.SET_PARENT,"",_713.DELETE,"",_713.EXPAND_ALL,_713.COLLAPSE_ALL,"",_713.SHOW_IN_LIBRARY,_713.SHOW_ALL],
                  "animation":[],
                  "general":[]
               },
               "bone":{
                  "armature":[_713.CONVERT_TO_SYMBOL,_713.SET_PARENT,"",[_713.INSERT,[_713.BONE,_713.SLOT,_713.BOUNDING_BOX]],"",_713.COPY_BONE,_713.PASTE_BONE,_713.SELECTIVE_PASTE,_713.DUPLICATE,_713.DELETE,"",_713.RENAME,"",_713.COPY_TRANSFORM,_713.PASTE_TRANSFORM,"",_713.HIDE,_713.HIDE_OTHERS,_713.HIDE_IRRELEVANT,_713.HIDE_RELATED,"",_713.LOCK,_713.LOCK_OTHERS,_713.LOCK_IRRELEVANT,_713.LOCK_RELATED,"",_713.SHOW_ALL,"",_713.EXPAND_SELECTED,_713.COLLAPSE_SELECTED,_713.EXPAND_ALL,_713.COLLAPSE_ALL],
                  "animation":[_713.KEY_FRAME,"",_713.COPY_BONE,"",_713.RENAME,"",_713.COPY_TRANSFORM,_713.PASTE_TRANSFORM,"",_713.HIDE,_713.HIDE_OTHERS,_713.HIDE_IRRELEVANT,_713.HIDE_RELATED,"",_713.LOCK,_713.LOCK_OTHERS,_713.LOCK_IRRELEVANT,_713.LOCK_RELATED,"",_713.SHOW_ALL,"",_713.EXPAND_SELECTED,_713.COLLAPSE_SELECTED,_713.EXPAND_ALL,_713.COLLAPSE_ALL]
               },
               "slot":{
                  "armature":[_713.SWITCH_DISPLAY,"",_713.CONVERT_TO_SYMBOL,_713.SET_PARENT,"",_713.COPY_SLOT,_713.PASTE_DISPLAY,_713.SELECTIVE_PASTE,_713.DUPLICATE,_713.DELETE,"",_713.COPY_SLOT_PROPERTY,_713.PASTE_SLOT_PROPERTY,"",_713.RENAME,"",_713.COPY_TRANSFORM,_713.PASTE_TRANSFORM,"",_713.BRING_FORWARD,_713.SEND_BACKWARD,_713.BRING_TO_FRONT,_713.SEND_TO_BOTTOM,"",_713.HIDE,_713.HIDE_OTHERS,_713.LOCK_OTHERS,"",_713.LOCK,_713.LOCK_OTHERS,"",_713.SHOW_ALL,"",_713.EXPAND_SELECTED,_713.COLLAPSE_SELECTED,_713.EXPAND_ALL,_713.COLLAPSE_ALL],
                  "animation":[_713.KEY_FRAME,_713.DISTRIBUTE_SLOT_TO_FRAMES,"",_713.SWITCH_DISPLAY,"",_713.COPY_SLOT,"",_713.COPY_SLOT_PROPERTY,_713.PASTE_SLOT_PROPERTY,"",_713.RENAME,"",_713.COPY_TRANSFORM,"",_713.BRING_FORWARD,_713.SEND_BACKWARD,_713.BRING_TO_FRONT,_713.SEND_TO_BOTTOM,"",_713.HIDE,_713.HIDE_OTHERS,"",_713.LOCK,_713.LOCK_OTHERS,"",_713.SHOW_ALL,"",_713.EXPAND_SELECTED,_713.COLLAPSE_SELECTED,_713.EXPAND_ALL,_713.COLLAPSE_ALL]
               },
               "image":{
                  "armature":[_713.MESH,_713.CONVERT_TO_SYMBOL,_713.SWAP_IMAGE,"",_713.COPY_DISPLAY,_713.DELETE,"",_713.RENAME,"",_713.SHOW_ALL,"",_713.EXPAND_ALL,_713.COLLAPSE_ALL],
                  "animation":[],
                  "general":[]
               },
               "mesh":{
                  "armature":[_713.MESH,_713.SWAP_RESOURCE,_713.CONVERT_TO_SYMBOL,_713.SWAP_IMAGE,"",_713.COPY_DISPLAY,_713.DELETE,"",_713.RENAME,"",_713.EXPAND_ALL,_713.COLLAPSE_ALL,"",_713.SHOW_IN_LIBRARY,_713.SHOW_ALL],
                  "animation":[],
                  "general":[]
               }
            },
            "libraryPanel":{
               "armature":[_713.NEW_SYMBOL,_713.IMPORT_ASSET,"",_713.RENAME,_713.DELETE_ARMATURE,_713.DUPLICATE,"",_713.EXPORT],
               "asset":[_713.IMPORT_ASSET,_713.RENAME,_713.SHOW_IN_EXPLORER],
               "folder":[_713.IMPORT_ASSET,_713.RELOCATE_PATH,_713.SHOW_IN_EXPLORER],
               "blank":[_713.NEW_SYMBOL],
               "vitualfolder":[_713.RENAME,_713.DELETE_VITUAL_FOLDER]
            },
            "timeline":{
               "frame":[_713.ADD_TWEEN,_713.DELETE_TWEEN,_713.KEY_FRAME,"",_713.CUT_FRAME,_713.COPY_FRAME,_713.PASTE_FRAME,_713.DELETE_FRAME,"",_713.SELECT_ALL_KEY_FRAMES],
               "timeline":{
                  "animation":[_713.SHOW_ALL,_713.HIDE_OTHERS,_713.LOCK_OTHERS,"",_713.EXPAND_ALL,_713.COLLAPSE_ALL],
                  "general":[_713.SHOW_ALL,_713.HIDE_OTHERS_LAYER,_713.LOCK_OTHERS_LAYER,"",_713.RENAME,_713.DUPLICATE_LAYER,_713.CUT_LAYER,_713.COPY_LAYER,_713.PASTE_LAYER,_713.INSERT_LAYER,_713.DELETE_LAYER]
               }
            },
            "animationPanel":{"animation":[_713.RENAME,_713.CLONE_ANIMATION,_713.ADD_ANIMATIOM,_713.DELETE_ANIMATION]},
            "addActionPanel":{
               "animation":[_713.ADD_ACTION,_713.ADD_SOUND,_713.ADD_EVENT],
               "general":[_713.ADD_ACTION,_713.ADD_SOUND,_713.ADD_EVENT]
            },
            "comic":{
               "slot":[_713.SWAP_IMAGE],
               "addTween":[_713.TWEEN_ALPHA,_713.TWEEN_POSITION,_713.TWEEN_ROTATION,_713.TWEEN_SCALE,"",_713.TWEEN_SHAKE,_713.TWEEN_SWING,_713.TWEEN_HEARTBEAT,_713.TWEEN_TWINKLE,_713.TWEEN_INVERT],
               "addAppear":[_713.TWEEN_APPEAR_POSITION,_713.TWEEN_APPEAR_ALPHA,_713.TWEEN_APPEAR_SCALE,_713.TWEEN_APPEAR_DROP],
               "addDisAppear":[_713.TWEEN_DISAPPEAR_POSITION,_713.TWEEN_DISAPPEAR_ALPHA],
               "changeTween":[_713.CHANGE_TWEEN_NULL,_713.CHANGE_TWEEN_ALPHA,_713.CHANGE_TWEEN_POSITION,_713.CHANGE_TWEEN_ROTATION,_713.CHANGE_TWEEN_SCALE,"",_713.CHANGE_TWEEN_SHAKE,_713.CHANGE_TWEEN_SWING,_713.CHANGE_TWEEN_HEARTBEAT,_713.CHANGE_TWEEN_TWINKLE,_713.CHANGE_TWEEN_INVERT],
               "changeAppearTween":[_713.CHANGE_APPEAR_TWEEN_NULL,_713.CHANGE_APPEAR_TWEEN_ALPHA,_713.CHANGE_APPEAR_TWEEN_POSITION,_713.CHANGE_APPEAR_TWEEN_SCALE,_713.CHANGE_APPEAR_TWEEN_DROP],
               "changeDisappearTween":[_713.CHANGE_DISAPPEAR_TWEEN_NULL,_713.CHANGE_DISAPPEAR_TWEEN_POSITION,_713.CHANGE_DISAPPEAR_TWEEN_ALPHA]
            }
         };
         this._6376[_713.NULL] = {};
         this._6376[_713.IMPORT] = {};
         this._6376[_713.IMPORT_ASSET] = {"userData":MenuNotification.IMPORT_ASSET};
         this._6376[_713.EXPORT] = {"userData":MenuNotification.EXPORT};
         this._6376[_713.DUPLICATE] = {
            "userData":MenuNotification.DUPLICATE,
            "shortcutKey":_26.DUPLICATE
         };
         this._6376[_713.COPY_TRANSFORM] = {
            "shortcut":_26.COPY,
            "userData":MenuNotification.COPY_TRANSFORM,
            "shortcutKey":_26.COPY_TRANSFORM
         };
         this._6376[_713.PASTE_TRANSFORM] = {
            "shortcut":_26.PASTE,
            "userData":MenuNotification.PASTE_TRANSFORM,
            "shortcutKey":_26.PASTE_TRANSFORM
         };
         this._6376[_713.DELETE] = {
            "shortcut":_26.DELETE,
            "userData":MenuNotification.EDIT_DELETE,
            "shortcutKey":_26.DELETE
         };
         this._6376[_713.DELETE_SLOT] = {
            "shortcut":_26.DELETE,
            "userData":MenuNotification.EDIT_DELETE,
            "shortcutKey":_26.DELETE
         };
         this._6376[_713.DELETE_ARMATURE] = {
            "shortcut":_26.DELETE,
            "userData":MenuNotification.DELETE_ARMATURE
         };
         this._6376[_713.DELETE_VITUAL_FOLDER] = {
            "shortcut":_26.DELETE,
            "userData":MenuNotification.DELETE_VITUAL_FOLDER
         };
         this._6376[_713.SELECT_ALL] = {
            "userData":MenuNotification.EDIT_SELECT_ALL,
            "shortcutKey":_26.SELECT_ALL
         };
         this._6376[_713.IMPORT_IMAGES] = {"userData":MenuNotification.FILE_IMPORT_ASSETS};
         this._6376[_713.IMPORT_SEQUENCE_IMAGES] = {"userData":MenuNotification.FILE_IMPORT_SEQUENCE_ASSETS};
         this._6376[_713.HIDE] = {"shortcutKey":_26.HIDE};
         this._6376[_713.LOCK] = {"shortcutKey":_26.LOCK};
         this._6376[_713.HIDE_IRRELEVANT] = {"shortcutKey":_26.HIDE_IRRELEVANT};
         this._6376[_713.LOCK_IRRELEVANT] = {"shortcutKey":_26.LOCK_IRRELEVANT};
         this._6376[_713.HIDE_OTHERS] = {"shortcutKey":_26.HIDE_OTHERS};
         this._6376[_713.LOCK_OTHERS] = {"shortcutKey":_26.LOCK_OTHERS};
         this._6376[_713.HIDE_OTHERS_LAYER] = {};
         this._6376[_713.LOCK_OTHERS_LAYER] = {};
         this._6376[_713.SHOW_ALL] = {"userData":MenuNotification.SHOW_ALL};
         this._6376[_713.BRING_TO_FRONT] = {
            "userData":MenuNotification.BRING_TO_FRONT,
            "shortcut":_26.BRING_TO_FRONT,
            "shortcutKey":_26.BRING_TO_FRONT
         };
         this._6376[_713.BRING_FORWARD] = {
            "userData":MenuNotification.BRING_FORWARD,
            "shortcut":_26.BRING_FORWARD,
            "shortcutKey":_26.BRING_FORWARD
         };
         this._6376[_713.SEND_BACKWARD] = {
            "userData":MenuNotification.SEND_BACKWARD,
            "shortcut":_26.SEND_BACKWARD,
            "shortcutKey":_26.SEND_BACKWARD
         };
         this._6376[_713.SEND_TO_BOTTOM] = {
            "userData":MenuNotification.SEND_TO_BOTTOM,
            "shortcut":_26.SEND_TO_BOTTOM,
            "shortcutKey":_26.SEND_TO_BOTTOM
         };
         this._6376[_713.EXPAND_ALL] = {"userData":MenuNotification.EXPAND_ALL};
         this._6376[_713.COLLAPSE_ALL] = {"userData":MenuNotification.COLLAPSE_ALL};
         this._6376[_713.EDIT] = {"userData":MenuNotification.MENU_EDIT};
         this._6376[_713.SET_PARENT] = {
            "userData":MenuNotification.SET_PARENT,
            "shortcutKey":_26.SET_PARENT
         };
         this._6376[_713.RENAME] = {
            "userData":MenuNotification.RENAME,
            "shortcutKey":_26.RENAME
         };
         this._6376[_713.DISTRIBUTE_TO_FRAMES] = {"userData":MenuNotification.DISTRIBUTE_TO_FRAMES};
         this._6376[_713.DISTRIBUTE_SLOT_TO_FRAMES] = {"userData":MenuNotification.DISTRIBUTE_SLOT_TO_FRAMES};
         this._6376[_713.CONVERT_TO_MESH] = {"userData":MenuNotification.CONVERT_TO_MESH};
         this._6376[_713.CONVERT_TO_IMAGE] = {"userData":MenuNotification.CONVERT_TO_IMAGE};
         this._6376[_713.SWAP_IMAGE] = {"userData":MenuNotification.SWAP_IMAGE};
         this._6376[_713.SWITCH_DISPLAY] = {};
         this._6376[_713.KEY_FRAME] = {
            "userData":MenuNotification.KEY_FRAME,
            "shortcutKey":_26.KEY_FRAME
         };
         this._6376[_713.ADD_TWEEN] = {"userData":MenuNotification.ADD_TWEEN};
         this._6376[_713.DELETE_TWEEN] = {"userData":MenuNotification.DELETE_TWEEN};
         this._6376[_713.CUT_FRAME] = {"userData":MenuNotification.CUT_FRAME};
         this._6376[_713.COPY_FRAME] = {"userData":MenuNotification.COPY_FRAME};
         this._6376[_713.PASTE_FRAME] = {"userData":MenuNotification.PASTE_FRAME};
         this._6376[_713.CLEAR_FRAME] = {"userData":MenuNotification.CLEAR_FRAME};
         this._6376[_713.DELETE_FRAME] = {"userData":MenuNotification.DELETE_FRAME};
         this._6376[_713.INSERT_LAYER] = {"userData":MenuNotification.INSERT_LAYER};
         this._6376[_713.DELETE_LAYER] = {"userData":MenuNotification.DELETE_LAYER};
         this._6376[_713.SHOW_IN_EXPLORER] = {"userData":MenuNotification.SHOW_IN_EXPLORER};
         this._6376[_713.RELOCATE_PATH] = {"userData":MenuNotification.RELOCATE_PATH};
         this._6376[_713.NEW_SYMBOL] = {"userData":MenuNotification.NEW_SYMBOL};
         this._6376[_713.INSERT] = {};
         this._6376[_713.BONE] = {};
         this._6376[_713.SLOT] = {};
         this._6376[_713.BOUNDING_BOX] = {"userData":MenuNotification.ADD_BOUNDINGBOX};
         this._6376[_713.CLONE_ANIMATION] = {"userData":MenuNotification.CLONE_ANIMATION};
         this._6376[_713.ADD_ANIMATIOM] = {"userData":MenuNotification.ADD_ANIMATION};
         this._6376[_713.DELETE_ANIMATION] = {"userData":MenuNotification.DELETE_ANIMATION};
         this._6376[_713.TWEEN_ALPHA] = {"userData":MenuNotification.ADD_COMIC_TWEEN};
         this._6376[_713.TWEEN_POSITION] = {"userData":MenuNotification.ADD_COMIC_TWEEN};
         this._6376[_713.TWEEN_ROTATION] = {"userData":MenuNotification.ADD_COMIC_TWEEN};
         this._6376[_713.TWEEN_SCALE] = {"userData":MenuNotification.ADD_COMIC_TWEEN};
         this._6376[_713.TWEEN_SHAKE] = {"userData":MenuNotification.ADD_COMIC_TWEEN};
         this._6376[_713.TWEEN_SWING] = {"userData":MenuNotification.ADD_COMIC_TWEEN};
         this._6376[_713.TWEEN_HEARTBEAT] = {"userData":MenuNotification.ADD_COMIC_TWEEN};
         this._6376[_713.TWEEN_TWINKLE] = {"userData":MenuNotification.ADD_COMIC_TWEEN};
         this._6376[_713.TWEEN_INVERT] = {"userData":MenuNotification.ADD_COMIC_TWEEN};
         this._6376[_713.TWEEN_APPEAR_POSITION] = {"userData":MenuNotification.ADD_COMIC_TWEEN};
         this._6376[_713.TWEEN_APPEAR_ALPHA] = {"userData":MenuNotification.ADD_COMIC_TWEEN};
         this._6376[_713.TWEEN_APPEAR_SCALE] = {"userData":MenuNotification.ADD_COMIC_TWEEN};
         this._6376[_713.TWEEN_APPEAR_DROP] = {"userData":MenuNotification.ADD_COMIC_TWEEN};
         this._6376[_713.TWEEN_DISAPPEAR_POSITION] = {"userData":MenuNotification.ADD_COMIC_TWEEN};
         this._6376[_713.TWEEN_DISAPPEAR_ALPHA] = {"userData":MenuNotification.ADD_COMIC_TWEEN};
         this._6376[_713.CHANGE_TWEEN_NULL] = {"userData":MenuNotification.CHANGE_COMIC_TWEEN};
         this._6376[_713.CHANGE_TWEEN_ALPHA] = {"userData":MenuNotification.CHANGE_COMIC_TWEEN};
         this._6376[_713.CHANGE_TWEEN_POSITION] = {"userData":MenuNotification.CHANGE_COMIC_TWEEN};
         this._6376[_713.CHANGE_TWEEN_ROTATION] = {"userData":MenuNotification.CHANGE_COMIC_TWEEN};
         this._6376[_713.CHANGE_TWEEN_SCALE] = {"userData":MenuNotification.CHANGE_COMIC_TWEEN};
         this._6376[_713.CHANGE_TWEEN_SHAKE] = {"userData":MenuNotification.CHANGE_COMIC_TWEEN};
         this._6376[_713.CHANGE_TWEEN_SWING] = {"userData":MenuNotification.CHANGE_COMIC_TWEEN};
         this._6376[_713.CHANGE_TWEEN_HEARTBEAT] = {"userData":MenuNotification.CHANGE_COMIC_TWEEN};
         this._6376[_713.CHANGE_TWEEN_TWINKLE] = {"userData":MenuNotification.CHANGE_COMIC_TWEEN};
         this._6376[_713.CHANGE_TWEEN_INVERT] = {"userData":MenuNotification.CHANGE_COMIC_TWEEN};
         this._6376[_713.CHANGE_APPEAR_TWEEN_SCALE] = {"userData":MenuNotification.CHANGE_COMIC_APPEAR_TWEEN};
         this._6376[_713.CHANGE_APPEAR_TWEEN_NULL] = {"userData":MenuNotification.CHANGE_COMIC_APPEAR_TWEEN};
         this._6376[_713.CHANGE_APPEAR_TWEEN_POSITION] = {"userData":MenuNotification.CHANGE_COMIC_APPEAR_TWEEN};
         this._6376[_713.CHANGE_APPEAR_TWEEN_ALPHA] = {"userData":MenuNotification.CHANGE_COMIC_APPEAR_TWEEN};
         this._6376[_713.CHANGE_APPEAR_TWEEN_DROP] = {"userData":MenuNotification.CHANGE_COMIC_APPEAR_TWEEN};
         this._6376[_713.CHANGE_DISAPPEAR_TWEEN_NULL] = {"userData":MenuNotification.CHANGE_COMIC_DISAPPEAR_TWEEN};
         this._6376[_713.CHANGE_DISAPPEAR_TWEEN_POSITION] = {"userData":MenuNotification.CHANGE_COMIC_DISAPPEAR_TWEEN};
         this._6376[_713.CHANGE_DISAPPEAR_TWEEN_ALPHA] = {"userData":MenuNotification.CHANGE_COMIC_DISAPPEAR_TWEEN};
         this._6376[_713.COPY_BONE] = {
            "userData":MenuNotification.COPY_BONE,
            "shortcutKey":_26.COPY
         };
         this._6376[_713.PASTE_BONE] = {
            "userData":MenuNotification.PASTE_BONE,
            "shortcutKey":_26.PASTE
         };
         this._6376[_713.COPY_SLOT] = {
            "userData":MenuNotification.COPY_SLOT,
            "shortcutKey":_26.COPY
         };
         this._6376[_713.PASTE_SLOT] = {
            "userData":MenuNotification.PASTE_SLOT,
            "shortcutKey":_26.PASTE
         };
         this._6376[_713.COPY_DISPLAY] = {"userData":MenuNotification.COPY_DISPLAY};
         this._6376[_713.PASTE_DISPLAY] = {
            "userData":MenuNotification.PASTE_DISPLAY,
            "shortcutKey":_26.PASTE
         };
         this._6376[_713.COPY_SLOT_PROPERTY] = {"userData":MenuNotification.COPY_SLOT_PROPERTY};
         this._6376[_713.PASTE_SLOT_PROPERTY] = {"userData":MenuNotification.PASTE_SLOT_PROPERTY};
         this._6376[_713.SELECTIVE_PASTE] = {"userData":MenuNotification.SELECTIVE_PASTE};
         this._6376[_713.HIDE_RELATED] = {"shortcutKey":_26.HIDE_RELATED};
         this._6376[_713.LOCK_RELATED] = {"shortcutKey":_26.LOCK_RELATED};
         this._6376[_713.EXPAND_SELECTED] = {
            "userData":MenuNotification.EXPAND_SELECTED,
            "shortcutKey":_26.MOVE_RIGHT
         };
         this._6376[_713.COLLAPSE_SELECTED] = {
            "userData":MenuNotification.COLLAPSE_SELECTED,
            "shortcutKey":_26.MOVE_LEFT
         };
         this._6376[_713.MESH] = {};
         this._6376[_713.SHOW_ITEM] = {"userData":MenuNotification.SHOW_ITEM};
         this._6376[_713.CLEAR_RULER_LINES] = {};
         for(_loc1_ in this._6376)
         {
            this._1709(_loc1_ as _713,this._6376[_loc1_]["shortcut"],this._6376[_loc1_]["userData"],null,null,this._6376[_loc1_]["shortcutKey"]);
         }
      }
      
      private function _1709(param1:_713, param2:String = null, param3:* = null, param4:String = null, param5:String = null, param6:String = null) : void
      {
         _27._1697(tr(param1.toString()),param1,param2,param4,param5,param3,param6);
      }
      
      public function _3945(param1:_711, param2:_712, param3:_715) : Array
      {
         var _loc4_:Object = this._6372[param1.toString()];
         var _loc5_:Object;
         if((_loc5_ = _loc4_[param2.toString()]) is String)
         {
            _loc5_ = _loc4_[_loc5_];
         }
         var _loc6_:Object = _loc5_[param3.toString()];
         if(!_loc6_)
         {
            _loc6_ = _loc5_;
         }
         else if(_loc6_ is String)
         {
            _loc6_ = _loc5_[_loc6_];
         }
         if(_loc6_ is Array)
         {
            return (_loc6_ as Array).concat();
         }
         return null;
      }
      
      public function _3937(param1:Array, param2:Number, param3:Number) : _1039
      {
         var _loc4_:_1039 = this._6371(param1);
         this.contextMenu.dataProvider = _loc4_;
         param2 = Math.min(param2,this._parent.width - 300);
         param3 = Math.min(param3,this._parent.height - _loc4_.length * 20);
         this.contextMenu.hide();
         this.contextMenu.show(param2,param3);
         this._parent.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this._6369,true);
         return _loc4_;
      }
      
      private function _6371(param1:Array) : _1039
      {
         var _loc2_:_29 = null;
         var _loc4_:Object = null;
         var _loc3_:XML = <root/>;
         for each(_loc4_ in param1)
         {
            _loc2_ = this._6370(_loc4_);
            if(_loc2_)
            {
               _loc3_.appendChild(_loc2_.data);
            }
         }
         return new _1043(_loc3_);
      }
      
      private function _6370(param1:Object) : _29
      {
         var _loc3_:_30 = null;
         var _loc4_:Object = null;
         var _loc2_:_30 = null;
         if(param1 == "")
         {
            _loc2_ = _27._1696();
         }
         else if(param1 is _30)
         {
            _loc2_ = param1 as _30;
         }
         else if(param1 is _713)
         {
            _loc2_ = _115._2364(param1);
         }
         else if(param1 is Array)
         {
            _loc2_ = _115._2364(param1[0]);
            _loc2_._1700();
            _loc3_ = null;
            for each(_loc4_ in param1[1])
            {
               _loc3_ = this._6370(_loc4_);
               if(_loc3_)
               {
                  _loc2_._1702(_loc3_);
               }
            }
         }
         return _loc2_ as _29;
      }
      
      private function _6369(param1:MouseEvent) : void
      {
         this._parent.removeEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this._6369,true);
         this.contextMenu.hide();
      }
      
      public function _11294() : void
      {
         if(this._parent)
         {
            this._parent.removeEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this._6369,true);
         }
         if(this.contextMenu)
         {
            this.contextMenu.hide();
         }
      }
   }
}

