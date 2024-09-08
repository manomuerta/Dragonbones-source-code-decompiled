package _874
{
   import _1038._1043;
   import _1045.MenuBar;
   import _1177.MenuEvent;
   import _1185._1189;
   import _1374.Application;
   import _24.Shortcut;
   import _24._26;
   import _28._30;
   import _28._31;
   import _28._32;
   import _28._33;
   import _783.MenuNotification;
   import _834._12901;
   import _97._106;
   import _97._115;
   import _97._116;
   import egret.utils.SystemInfo;
   import egret.utils._1541;
   import egret.utils.tr;
   import flash.display.NativeMenu;
   import flash.display.NativeMenuItem;
   import flash.events.Event;
   
   public class MainMenu
   {
      private var application:Application;
      
      public var _3967:Function;
      
      public var _3971:Function;
      
      private var _6381:Array;
      
      private var _6383:MenuBar;
      
      public function MainMenu()
      {
         this._6381 = [];
         super();
         _32._1710 = SystemInfo.isMacOS;
         this._6373();
      }
      
      public function init(param1:Application) : void
      {
         this.application = param1;
         this._6380();
         if(SystemInfo.isMacOS)
         {
            this._6379();
         }
         else
         {
            this._6378();
         }
      }
      
      private function _6373() : void
      {
         var _loc1_:_30 = _32._1708(tr("Menu.File"),MenuNotification.FILE);
         var _loc2_:_30 = _32._1708(tr("Menu.Edit"),MenuNotification.EDIT);
         var _loc3_:_30 = _32._1708(tr("Menu.Window"),MenuNotification.WINDOW);
         var _loc4_:_30 = _32._1708(tr("Menu.Help"),MenuNotification.HELP);
         _loc1_._1702(_32._1697(tr("Menu.File.NewProject"),MenuNotification.FILE_NEW_PROJECT,_26.NEW_PROJECT,"assets/menu/new.png"));
         _loc1_._1702(_32._1697(tr("Menu.File.OpenProject"),MenuNotification.FILE_OPEN_PROJECT,_26.OPEN_PROJECT,"assets/menu/open.png"));
         _loc1_._1702(_32._1697(tr("Menu.File.SaveProject"),MenuNotification.FILE_SAVE_PROJECT,_26.SAVE_PROJECT,"assets/menu/save.png"));
         _loc1_._1702(_32._1697(tr("Menu.File.SaveAsProject"),MenuNotification.FILE_SAVE_AS_PROJECT,null,"assets/menu/saveas.png"));
         _loc1_._1702(_32._1697(tr("Menu.File.CloseProject"),MenuNotification.FILE_CLOSE_PROJECT,_26.CLOSE_PROJECT,"assets/menu/close.png"));
         _loc1_._1702(_32._1696());
         _loc1_._1702(_32._1697(tr("Menu.File.ImportAssets"),MenuNotification.FILE_IMPORT_ASSETS,null,"assets/button/importImage.png"));
         _loc1_._1702(_32._1697(tr("Menu.File.ImportAssetsToLib"),MenuNotification.FILE_IMPORT_ASSETS_TO_LIB,null,"assets/button/importImage.png"));
         _loc1_._1702(_32._1697(tr("Menu.File.Import"),MenuNotification.FILE_IMPORT,null,"assets/menu/import.png"));
         _loc1_._1702(_32._1696());
         _loc1_._1702(_32._1697(tr("Menu.File.Preview"),MenuNotification.FILE_PREVIEW,_26.PREVIEW,"assets/button/preview.png"));
         _loc1_._1702(_32._1697(tr("Menu.File.Export"),MenuNotification.FILE_EXPORT,_26.EXPORT,"assets/menu/export.png"));
         _loc1_._1702(_32._1697(tr("Menu.File.ExportEgret"),MenuNotification.FILE_EXPORT_EGRET,_26.PUBLISH,"assets/button/exportEgret.png"));
         _loc1_._1702(_32._1696());
         _loc1_._1702(_32._1697(tr("Menu.File.Setting"),MenuNotification.FILE_SETTING,null,"assets/menu/preference.png"));
         _loc1_._1702(_32._1697(tr("Menu.File.Share"),MenuNotification.FILE_SHARE,null,"assets/menu/share.png"));
         _loc1_._1702(_32._1696());
         _loc1_._1702(_32._1697(tr("Menu.File.Exit"),MenuNotification.FILE_EXIT,_26.EXIT,"assets/menu/exit.png"));
         _loc2_._1702(_32._1697(tr("Menu.Edit.Updo"),MenuNotification.EDIT_UNDO,_26.UNDO,"assets/menu/undo.png"));
         _loc2_._1702(_32._1697(tr("Menu.Edit.Redo"),MenuNotification.EDIT_REDO,_26.REDO,"assets/menu/redo.png"));
         _loc2_._1702(_32._1696());
         _loc2_._1702(_32._1697(tr("Menu.Edit.SelectAll"),MenuNotification.EDIT_SELECT_ALL,_26.SELECT_ALL));
         _loc3_._1702(_32._1697(tr("Menu.Window.SceneTree"),MenuNotification.WINDOW_SCENE_PANEL,null,null,"check",_116.SCENE_PANEL));
         _loc3_._1702(_32._1697(tr("Menu.Window.Property"),MenuNotification.WINDOW_PROPERTY_PANEL,null,null,"check",_116.PROPERTY_PANEL));
         _loc3_._1702(_32._1697(tr("Menu.Window.Layer"),MenuNotification.WINDOW_DRAWORDER_PANEL,null,null,"check",_116.DRAWORDER_PANEL));
         _loc3_._1702(_32._1697(tr("Menu.Window.Resources"),MenuNotification.WINDOW_LIBRARY_PANEL,null,null,"check",_116.LIBRARY_PANEL));
         _loc3_._1702(_32._1697(tr("Menu.Window.Animations"),MenuNotification.WINDOW_ANIMATION_PANEL,null,null,"check",_116.ANIMATION_PANEL));
         _loc3_._1702(_32._1697(tr("Menu.Window.Timeline"),MenuNotification.WINDOW_TIMELINE_PANEL,null,null,"check",_116.TIMELINE_PANEL));
         _loc3_._1702(_32._1697(tr("Menu.Window.Curve"),MenuNotification.WINDOW_CURVE_PANEL,null,null,"check",_116.CURVE_PANEL));
         _loc3_._1702(_32._1696());
         _loc3_._1702(_32._1697(tr("Menu.Window.SheetPanel"),MenuNotification.WINDOW_SHEET_PANEL,null,null,"check",_116.SHEET_PANEL));
         _loc3_._1702(_32._1696());
         _loc3_._1702(_32._1697(tr("Menu.Window.Comic"),MenuNotification.WINDOW_COMIC_PANEL,null,null,"check",_116.COMIC_PANEL));
         _loc3_._1702(_32._1697(tr("Menu.Window.ComicOrder"),MenuNotification.WINDOW_COMIC_ORDER_PANEL,null,null,"check",_116.COMIC_ORDER_PANEL));
         _loc3_._1702(_32._1697(tr("Menu.Window.Transform"),MenuNotification.WINDOW_TRANSFORM_PANEL,null,null,"check",_116.TRANSFORM_PANEL));
         _loc3_._1702(_32._1696());
         _loc3_._1702(_32._1697(tr("Menu.Window.Reset"),MenuNotification.WINDOW_RESET,null,null,null,_116.RESET));
         _32._1697(tr("Menu.Window.Mesh"),"MenuNotification:WINDOW_MESH_PANEL",null,null,"check",_116.MESH_PANEL);
         _loc4_._1702(_32._1697(tr("Menu.Help.LearnDB"),MenuNotification.HELP_LEARN_DB,null,"assets/menu/doc.png",null,_106.local(_106.LEARN_DB)));
         _loc4_._1702(_32._1697(tr("Menu.Help.WelcomePage"),MenuNotification.HELP_WELCOME_PAGE,null,"assets/menu/welcome.png"));
         _loc4_._1702(_32._1697(tr("Menu.Help.NewFeature"),MenuNotification.HELP_NEWFEATHER_GUIDE,null,"assets/menu/doc.png"));
         _loc4_._1702(_32._1696());
         _loc4_._1702(_32._1697(tr("Menu.Help.IssueReport"),MenuNotification.HELP_ISSUE_REPORT,null,"assets/menu/issueReport.png"));
         _loc4_._1702(_32._1697(tr("Menu.Help.OpenTrello"),MenuNotification.HELP_OPEN_TRELLO,null,"assets/button/trello.png",null,_106.OPEN_TRELLO));
         _loc4_._1702(_32._1696());
         _loc4_._1702(_32._1697(tr("Menu.Help.Plugin"),MenuNotification.HELP_PLUGIN_MANAGER,null,"assets/menu/plugin.png"));
         _loc4_._1702(_32._1697(tr("Menu.Help.PSDPluginGuide"),MenuNotification.HELP_PSDPLUGIN_GUIDE,null,"assets/menu/plugin.png"));
         _loc4_._1702(_32._1697(tr("Menu.Help.InstallFlashPlugin"),MenuNotification.HELP_INSTALL_FLASH_PLUGIN,null,"assets/menu/plugin.png"));
         _loc4_._1702(_32._1696());
         _loc4_._1702(_32._1697(tr("Menu.Help.About"),MenuNotification.HELP_ABOUT,null,"assets/menu/about.png"));
         this._6381.push(_loc1_,_loc2_,_loc3_,_loc4_);
      }
      
      private function _6380() : void
      {
         var _loc1_:String = null;
         for(_loc1_ in _115._2366)
         {
            Shortcut._1681(this.application.stage,_loc1_,this._3971);
         }
      }
      
      private function _6378() : void
      {
         var _loc1_:XML = null;
         var _loc2_:_33 = null;
         _loc1_ = <root/>;
         for each(_loc2_ in this._6381)
         {
            _loc1_.appendChild(_loc2_.data);
         }
         this._6383 = new MenuBar();
         this._6383.skinName = _12901;
         this._6383.height = 20;
         this._6383.verticalCenter = 0;
         this._6383.dataProvider = new _1043(_loc1_);
         this._6383.addEventListener(MenuEvent.ITEM_CLICK,this._3967);
         this.application._2527.layout = new _1189();
         this.application._2527.addElement(this._6383);
      }
      
      private function _6379() : void
      {
         var _loc2_:_31 = null;
         var _loc3_:Array = null;
         var _loc4_:NativeMenuItem = null;
         var _loc1_:NativeMenu = new NativeMenu();
         for each(_loc2_ in this._6381)
         {
            _loc1_.addItem(_loc2_._1706);
            _loc3_ = _loc2_._1706.submenu.items;
            for each(_loc4_ in _loc3_)
            {
               _loc4_.addEventListener(Event.SELECT,this._3967);
            }
         }
         _1541._6382 = _loc1_;
      }
      
      private function _1697(param1:String, param2:String = null) : NativeMenuItem
      {
         var _loc3_:NativeMenuItem = new NativeMenuItem(param1,!Boolean(param1));
         _loc3_.addEventListener(Event.SELECT,this._3967);
         if(param2)
         {
            _loc3_.data = param2;
         }
         return _loc3_;
      }
   }
}

