package _541
{
   import _11106._11108;
   import _11111._11110;
   import _1177.MenuEvent;
   import _12465._12464;
   import _1374.Application;
   import _1404._1407;
   import _28._30;
   import _472._12461;
   import _648._12463;
   import _73.SymbolType;
   import _783.CommandNotification;
   import _783.MenuNotification;
   import _783._12475;
   import _783._782;
   import _874.MainMenu;
   import _93._94;
   import _97._115;
   import egret.utils.SystemInfo;
   import flash.events.Event;
   
   public class _553 extends _94
   {
      public var application:Application;
      
      private var mainMenu:MainMenu;
      
      private var _3970:Boolean;
      
      public function _553()
      {
         this._12594 = _1407.getInstance(_12463);
         this._12569 = _1407.getInstance(_12461);
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this.mainMenu = new MainMenu();
         this.mainMenu._3967 = this._3967;
         this.mainMenu._3971 = this._3971;
      }
      
      override protected function _1576() : void
      {
         super._1576();
         if(_2214._3524)
         {
            this._3745(null);
         }
         else
         {
            _1565(_782.INIT_COMPLETE,this._3745,1);
         }
      }
      
      private function _3745(param1:_782) : void
      {
         this.mainMenu.init(this.application);
         _1565(_782.UNDOABLE_CHANGED,this._3744);
         _1565(_782.REDOABLE_CHANGED,this._3743);
         _1565(_782.SAVEABLE_CHANGED,this._3742);
         _1565(_782.CURRENT_DOC_CHANGED,this._3741);
         _1565(_12475.CHECK_FUNCTION_LIMITED,this._12949);
         this._3744(null);
         this._3743(null);
         this._3742(null);
         this._3741(null);
      }
      
      private function _12949(param1:_12475) : void
      {
         _115._2365(MenuNotification.FILE_SAVE_PROJECT).limited = _115._2365(MenuNotification.FILE_SAVE_AS_PROJECT).limited = _115._2365(MenuNotification.FILE_EXPORT).limited = _115._2365(MenuNotification.FILE_EXPORT_EGRET).limited = _115._2365(MenuNotification.FILE_PREVIEW).limited = this._12950._12951();
      }
      
      private function _3744(param1:_782) : void
      {
         _115._2365(MenuNotification.EDIT_UNDO).enabled = _2217._1653;
      }
      
      private function _3743(param1:_782) : void
      {
         _115._2365(MenuNotification.EDIT_REDO).enabled = _2217._1654;
      }
      
      private function _3742(param1:_782) : void
      {
         var _loc2_:Boolean = false;
         if(_2214 && _2214._1844 && Boolean(_2214._1844._2871))
         {
            _loc2_ = _2214._1844._2871.isNew;
         }
         _115._2365(MenuNotification.FILE_SAVE_PROJECT).enabled = _2217._1658 || _loc2_;
      }
      
      private function _3741(param1:_782) : void
      {
         var _loc2_:Boolean = false;
         _115._2365(MenuNotification.FILE_SHARE).enabled = false;
         _115._2365(MenuNotification.FILE_EXPORT).enabled = _115._2365(MenuNotification.FILE_PREVIEW).enabled = _115._2365(MenuNotification.FILE_IMPORT_ASSETS).enabled = _115._2365(MenuNotification.FILE_SAVE_AS_PROJECT).enabled = this._2214._3740;
         if(this._2214 && this._2214._1844 && this._2214._1844._2871 && this._2214._1844._2871._2865 && this._2214._1844._2871._2865._1811 == SymbolType.COMIC)
         {
            _loc2_ = true;
         }
         _115._2365(MenuNotification.FILE_EXPORT).enabled = this._2214._3740 && !_loc2_;
         _115._2365(MenuNotification.FILE_EXPORT_EGRET).enabled = this._2214._3740 && _loc2_;
      }
      
      private function _3967(param1:Event) : void
      {
         var _loc2_:String = null;
         if(param1 is MenuEvent)
         {
            _loc2_ = !!MenuEvent(param1).item ? MenuEvent(param1).item.@id : "";
         }
         else
         {
            _loc2_ = param1.target.data as String;
         }
         _11110.instance._11593(_loc2_,_11108.MainMenu);
         this._3969(_loc2_);
      }
      
      private function _3971(param1:String) : void
      {
         var _loc2_:String = _115._2363(param1);
         _11110.instance._11593(_loc2_,_11108.Shortcut);
         this._3969(_loc2_);
      }
      
      private function _3969(param1:String) : void
      {
         if(!param1 || param1 == "")
         {
            return;
         }
         var _loc2_:_30 = _115._2365(param1);
         if(Boolean(_loc2_) && !_loc2_.enabled)
         {
            return;
         }
         switch(param1)
         {
            case MenuNotification.HELP_LEARN_DB:
            case MenuNotification.HELP_OPEN_TRELLO:
               _1567(new CommandNotification(CommandNotification.OPEN_URL,_loc2_.userData));
               break;
            case MenuNotification.WINDOW_SCENE_PANEL:
            case MenuNotification.WINDOW_LIBRARY_PANEL:
            case MenuNotification.WINDOW_PROPERTY_PANEL:
            case MenuNotification.WINDOW_TRANSFORM_PANEL:
            case MenuNotification.WINDOW_CURVE_PANEL:
            case MenuNotification.WINDOW_COMIC_PANEL:
            case MenuNotification.WINDOW_COMIC_ORDER_PANEL:
            case MenuNotification.WINDOW_DRAWORDER_PANEL:
            case MenuNotification.WINDOW_ANIMATION_PANEL:
            case MenuNotification.WINDOW_TIMELINE_PANEL:
            case MenuNotification.WINDOW_SHEET_PANEL:
               if(SystemInfo.isMacOS)
               {
                  _1567(new CommandNotification(_loc2_._1705 ? CommandNotification.CLOSE_PANEL : CommandNotification.OPEN_PANEL,_loc2_.userData));
               }
               else
               {
                  _1567(new CommandNotification(_loc2_._1705 ? CommandNotification.OPEN_PANEL : CommandNotification.CLOSE_PANEL,_loc2_.userData));
               }
               break;
            case MenuNotification.WINDOW_RESET:
               _1567(new CommandNotification(_loc2_._1705 ? CommandNotification.RESET_PANEL : CommandNotification.RESET_PANEL,_loc2_.userData));
               break;
            case MenuNotification.HELP_INSTALL_FLASH_PLUGIN:
               _1567(new CommandNotification(CommandNotification.INSTALL_FLASH_PLUGIN));
               break;
            default:
               if(param1)
               {
                  _1567(new MenuNotification(param1));
               }
         }
      }
      
      private function get _12950() : _12464
      {
         return _1407.getInstance(_12464) as _12464;
      }
   }
}

