package _11111
{
   import _11106._11105;
   import _11106._11107;
   import _11106._11205;
   import _11106._11509;
   import _11106._11510;
   import _11106._12897;
   import _11106._13167;
   import _783.CommandNotification;
   import _783.MenuNotification;
   import _93._94;
   import com.google.analytics.AnalyticsTracker;
   import com.google.analytics.GATracker;
   import flash.desktop.NativeApplication;
   
   public class _11110 extends _94
   {
      private static var _instance:_11110;
      
      public static const GA_ID:String = "UA-35106030-5";
      
      private var _tracker:AnalyticsTracker;
      
      private var _11165:String = "";
      
      private var _11168:String = "";
      
      public var _11206:_11205;
      
      public var _11204:_11509;
      
      public var _13189:_13167;
      
      public var _12948:_12897;
      
      public var _11133:_11107;
      
      public var _11564:_11107;
      
      public var _11563:_11107;
      
      public var _11619:_11107;
      
      public var _11620:_11107;
      
      public var _11131:_11107;
      
      public var _11137:_11107;
      
      public var _11584:_11107;
      
      public var _11320:_11107;
      
      public var _11318:_11107;
      
      public var _11380:_11107;
      
      public var _11322:_11107;
      
      private var _11756:_11510;
      
      private var _11754:Object;
      
      private var _appVersion:String = null;
      
      public function _11110()
      {
         this._11206 = new _11205();
         this._11204 = new _11509();
         this._13189 = new _13167();
         this._12948 = new _12897();
         this._11133 = new _11107(_11105.Name_NewProject);
         this._11564 = new _11107(_11105.Name_OpenProject);
         this._11563 = new _11107(_11105.Name_SaveAsProject);
         this._11619 = new _11107(_11105.Name_ImportAssetsToStage);
         this._11620 = new _11107(_11105.Name_ImportAssetsToLibrary);
         this._11131 = new _11107(_11105.Name_ImportData);
         this._11137 = new _11107(_11105.Name_Export);
         this._11584 = new _11107(_11105.Name_EgretPublish);
         this._11320 = new _11107(_11105.Name_NewSymbol);
         this._11318 = new _11107(_11105.Name_NewElement);
         this._11380 = new _11107(_11105.Name_CreateBone);
         this._11322 = new _11107(_11105.Name_CreateIKConstraint);
         this._11756 = new _11510();
         super();
         this._tracker = new GATracker(this.stage,GA_ID,"AS3");
      }
      
      public static function get instance() : _11110
      {
         if(_instance == null)
         {
            _instance = new _11110();
         }
         return _instance;
      }
      
      public function _11167(param1:String) : void
      {
         this._11168 = this._11165;
         this._11165 = param1;
         this._tracker.trackPageview(param1);
      }
      
      public function trackEvent(param1:String, param2:String = null, param3:String = null) : Boolean
      {
         return this._tracker.trackEvent(param1,param2,param3);
      }
      
      public function _11652(param1:String, param2:String) : void
      {
         this._11756.init(param1);
         this._11756._11130(param2);
      }
      
      public function _11755(param1:String) : _11107
      {
         var _loc3_:_11107 = null;
         if(!this._11754)
         {
            this._11753();
         }
         var _loc2_:Object = this._11754[param1];
         if(_loc2_)
         {
            if(_loc2_ is String)
            {
               this._11756.init(String(_loc2_));
               return this._11756;
            }
            if(_loc2_ is _11107)
            {
               return _loc2_ as _11107;
            }
            if(_loc2_ is Array)
            {
               _loc3_ = _loc2_[0] as _11107;
               if(_loc3_)
               {
                  _loc3_.name = String(_loc2_[1]);
                  return _loc3_;
               }
            }
         }
         return null;
      }
      
      public function _11593(param1:String, param2:String) : _11107
      {
         var _loc3_:_11107 = this._11755(param1);
         if(_loc3_)
         {
            _loc3_._11130(param2);
         }
         return _loc3_;
      }
      
      private function _11753() : void
      {
         this._11754 = {};
         this._11754[MenuNotification.FILE_NEW_PROJECT] = this._11133;
         this._11754[MenuNotification.FILE_OPEN_PROJECT] = this._11564;
         this._11754[MenuNotification.FILE_SAVE_PROJECT] = _11105.Name_SaveProject;
         this._11754[MenuNotification.FILE_SAVE_AS_PROJECT] = this._11563;
         this._11754[MenuNotification.FILE_CLOSE_PROJECT] = _11105.Name_CloseProject;
         this._11754[MenuNotification.FILE_IMPORT_ASSETS] = this._11619;
         this._11754[MenuNotification.FILE_IMPORT_ASSETS_TO_LIB] = this._11620;
         this._11754[MenuNotification.FILE_IMPORT] = this._11131;
         this._11754[MenuNotification.FILE_EXPORT] = this._11137;
         this._11754[MenuNotification.FILE_SETTING] = _11105.Name_Prefrence;
         this._11754[MenuNotification.FILE_PREVIEW] = _11105.Name_EgretPreview;
         this._11754[MenuNotification.FILE_EXPORT_EGRET] = this._11584;
         this._11754[MenuNotification.EDIT_UNDO] = _11105.Name_Undo;
         this._11754[MenuNotification.EDIT_REDO] = _11105.Name_Redo;
         this._11754[MenuNotification.EDIT_SELECT_ALL] = _11105.Name_SelectAll;
         this._11754[MenuNotification.WINDOW_SCENE_PANEL] = _11105.Name_ScenePanel;
         this._11754[MenuNotification.WINDOW_PROPERTY_PANEL] = _11105.Name_PropertyPanel;
         this._11754[MenuNotification.WINDOW_DRAWORDER_PANEL] = _11105.Name_DrawOrderPanel;
         this._11754[MenuNotification.WINDOW_LIBRARY_PANEL] = _11105.Name_LibraryPanel;
         this._11754[MenuNotification.WINDOW_ANIMATION_PANEL] = _11105.Name_AnimationPanel;
         this._11754[MenuNotification.WINDOW_TIMELINE_PANEL] = _11105.Name_TimelinePanel;
         this._11754[MenuNotification.WINDOW_CURVE_PANEL] = _11105.Name_CurvePanel;
         this._11754[MenuNotification.WINDOW_SHEET_PANEL] = _11105.Name_SheetPanel;
         this._11754[MenuNotification.WINDOW_RESET] = _11105.Name_Reset;
         this._11754[MenuNotification.HELP_LEARN_DB] = [this._12948,_12897.LearnDB];
         this._11754[MenuNotification.HELP_WELCOME_PAGE] = _11105.Name_WelcomePage;
         this._11754[MenuNotification.HELP_ISSUE_REPORT] = _11105.Name_IssueReoort;
         this._11754[MenuNotification.HELP_OPEN_TRELLO] = [this._12948,_12897.IdeaCollection];
         this._11754[MenuNotification.HELP_PLUGIN_MANAGER] = _11105.Name_PluginWindow;
         this._11754[MenuNotification.HELP_PSDPLUGIN_GUIDE] = _11105.Name_PsdGuide;
         this._11754[MenuNotification.HELP_INSTALL_FLASH_PLUGIN] = _11105.Name_InstallFlPlugin;
         this._11754[MenuNotification.HELP_ABOUT] = _11105.Name_ScenePanel;
         this._11754[MenuNotification.HELP_NEWFEATHER_GUIDE] = _11105.Name_NewFeatherGuide;
         this._11754[MenuNotification.IMPORT_ASSET] = this._11620;
         this._11754[CommandNotification.STAGE_CHANGE] = _11105.Name_ArmatureSwitchEditMode;
      }
      
      public function get _11166() : String
      {
         return this._11165;
      }
      
      public function get lastPage() : String
      {
         return this._11168;
      }
      
      public function get appVersion() : String
      {
         var _loc1_:XML = null;
         var _loc2_:Namespace = null;
         if(!this._appVersion)
         {
            _loc1_ = NativeApplication.nativeApplication.applicationDescriptor;
            _loc2_ = _loc1_.namespace();
            this._appVersion = _loc1_._loc2_::versionNumber[0].toString() + "." + _loc1_._loc2_::versionLabel[0];
         }
         return this._appVersion;
      }
   }
}

