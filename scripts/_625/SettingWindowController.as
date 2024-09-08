package _625
{
   import _11111._11110;
   import _1177.UIEvent;
   import _1404._1407;
   import _14123.SettingEvent;
   import _14123._1030;
   import _1529._1530;
   import _472._12461;
   import _472._471;
   import _477.ExportController;
   import _579._580;
   import _586._588;
   import _586._603;
   import _639._640;
   import _783.StageNotification;
   import _783.TipNotification;
   import _783._12475;
   import _783._782;
   import _880._879;
   import _93._94;
   import _97._100;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.filesystem.File;
   
   public class SettingWindowController extends _94
   {
      private var _5609:_1030;
      
      public function SettingWindowController()
      {
         this._12569 = _1407.getInstance(_12461);
         super();
      }
      
      private function _12593(param1:Event) : void
      {
         switch(param1.type)
         {
            case _12475.LOGIN:
            case _12475.LOGOUT:
            case _12475.OFFLINE:
               if(this._5609)
               {
                  this._5609._12694();
               }
         }
      }
      
      public function onOpen() : void
      {
         _1565(_12475.LOGIN,this._12593);
         _1565(_12475.LOGOUT,this._12593);
         _1565(_12475.OFFLINE,this._12593);
         this._5609 = new _1030();
         this._5609.addEventListener(UIEvent.CREATION_COMPLETE,this._5483);
         this._5609.open();
      }
      
      protected function _5483(param1:UIEvent) : void
      {
         this._5609._14658._11716.selectedIndex = this.getCurLanguageIndex();
         this._5609._14659.addEventListener(SettingEvent.SYSTEM_RESET_SETTING,this._5605);
         this._5609._14659.addEventListener(SettingEvent.SYSTEM_LOG_SETTING,this.onLogClickHandler);
         this._5609._14659.addEventListener(SettingEvent.SYSTEM_EXPORTDEFAULT,this._14654);
         this._5609._14658.addEventListener(SettingEvent.NORMAL_HOTKEY_SETTING,this.onHotKeyClickHandler);
         this._5609._14658.addEventListener(SettingEvent.NORMAL_HOTKEYDEFAULT,this._11704);
         this._5609._14658.addEventListener(SettingEvent.NORMAL_LANGDROPLIST_SETTING,this.onLanguageChange);
         this._5609._14658.addEventListener(SettingEvent.NORMAL_SETTING,this._2493);
         this._5609._14661.addEventListener(SettingEvent.RULER_SETTING,this._2493);
         var _loc2_:File = new File(_640._11713());
         this._5609._14659._11718.enabled = _loc2_.exists;
      }
      
      private function getCurLanguageIndex() : int
      {
         var lang:String = null;
         try
         {
            lang = _2216.language;
            switch(lang)
            {
               case _1530.zh_CN:
                  return 0;
               case _1530.en_US:
                  return 1;
               case _1530.ru_RF:
                  return 2;
               default:
                  return 0;
            }
         }
         catch(e:Error)
         {
            _11110.instance._11204._11132("SettingWindowController::getCurLanguageIndex",e);
            return 0;
         }
      }
      
      private function _11714(param1:int) : String
      {
         switch(param1)
         {
            case 0:
               return _1530.zh_CN;
            case 1:
               return _1530.en_US;
            case 2:
               return "ru_RF";
            default:
               return _1530.zh_CN;
         }
      }
      
      private function onLanguageChange(param1:SettingEvent) : void
      {
         var e:SettingEvent = param1;
         var file:File = new File(_640._11707());
         if(file.exists)
         {
            try
            {
               _2216.language = this._11714(e.data);
               this._11576(tr("Setting.lang.success"),tr("Setting.restart.ok"),tr("Setting.restart.cancel"));
            }
            catch(e:Error)
            {
               _11110.instance._11204._11132("SettingWindowController::onLanguageChange",e);
            }
         }
      }
      
      private function _11704(param1:SettingEvent) : void
      {
         var e:SettingEvent = param1;
         var o:Object = {};
         o.message = tr("Setting.hotkey.change1");
         o.confirmLabel = tr("Alert.Confirm");
         o.cancelLabel = tr("Alert.Cancel");
         o.confirm = function():void
         {
            _11976();
         };
         _1567(new TipNotification(TipNotification.TIP_CONFIRM,o));
      }
      
      private function _14654(param1:SettingEvent) : void
      {
         var o:Object = null;
         var e:SettingEvent = param1;
         if(this._5609._12594._3766)
         {
            o = {};
            o.message = tr("Setting.export.change1");
            o.confirmLabel = tr("Alert.Confirm");
            o.cancelLabel = tr("Alert.Cancel");
            o.confirm = function():void
            {
               _14657._14453();
            };
            _1567(new TipNotification(TipNotification.TIP_CONFIRM,o));
         }
         else
         {
            this._12569._1567(new _12475(_12475.SHOW_LOGIN));
         }
      }
      
      private function _11976() : void
      {
         _2214._11715._11705();
         this._11576(tr("Setting.hotkey.change"),tr("Setting.restart.ok"),tr("Setting.restart.cancel"));
      }
      
      private function _11576(param1:String, param2:String, param3:String) : void
      {
         var message:String = param1;
         var confirmLable:String = param2;
         var cancelLabel:String = param3;
         var o:Object = {};
         o.message = message;
         o.confirmLabel = confirmLable;
         o.cancelLabel = cancelLabel;
         o.confirm = function():void
         {
            if(_5609)
            {
               _5609.close();
            }
            _1567(new _782(_782.RESTART));
         };
         _1567(new TipNotification(TipNotification.TIP_CONFIRM,o));
      }
      
      private function onHotKeyClickHandler(param1:SettingEvent) : void
      {
         var e:SettingEvent = param1;
         var file:File = new File(_640._11709());
         if(file.exists)
         {
            try
            {
               file.openWithDefaultApplication();
            }
            catch(e:Error)
            {
               _11110.instance._11204._11132("SettingWindowController::onHotKeyClickHandler",e);
            }
         }
      }
      
      private function onLogClickHandler(param1:SettingEvent) : void
      {
         var e:SettingEvent = param1;
         var file:File = new File(_640._11713());
         if(file.exists)
         {
            try
            {
               file.openWithDefaultApplication();
            }
            catch(e:Error)
            {
               _11110.instance._11204._11132("SettingWindowController::onLogClickHandler",e);
            }
         }
      }
      
      private function _5605(param1:SettingEvent) : void
      {
         var o:Object = null;
         var e:SettingEvent = param1;
         if(this._5609._12594._3766)
         {
            o = {};
            o.message = tr("Setting.All.Change1");
            o.confirmLabel = tr("Alert.Confirm");
            o.cancelLabel = tr("Alert.Cancel");
            o.confirm = function():void
            {
               _2216.deleteConfirm = true;
               _2216.imageSmooth = true;
               _2216.autoBindSlot = true;
               _2216.backgroundColor = _100.backgroundColor;
               _2216.backgroundSize = 25;
               _2216.boneColor = _100._2266;
               _2216.boneSize = 8;
               _2216.language = null;
               _2216.useruler = true;
               _2216.assistLine = true;
               _2216.assistLineenable = true;
               _2216.assistLineColor = _100.assistLine;
               _5609.invalidateDisplayList();
               _5612();
               updataBoneColor();
               updataBoneSize();
               _14660();
            };
            _1567(new TipNotification(TipNotification.TIP_CONFIRM,o));
         }
         else
         {
            this._12569._1567(new _12475(_12475.SHOW_LOGIN));
         }
      }
      
      private function _2493(param1:SettingEvent) : void
      {
         var _loc2_:Object = param1.data;
         switch(_loc2_.type)
         {
            case "deleteCheckBox":
               _2216.deleteConfirm = _loc2_.value;
               break;
            case "imageCheckBox":
               _2216.imageSmooth = _loc2_.value;
               if(_2216.imageSmooth)
               {
                  _879.instance.smoothing = _879.BILINEAR;
               }
               else
               {
                  _879.instance.smoothing = _879.NONE;
               }
               _1567(new StageNotification(StageNotification.UPDATE_LIBRARY));
               _1567(new StageNotification(StageNotification.REDRAW_MESH));
               break;
            case "boneCheckBox":
               _2216.autoBindSlot = _loc2_.value;
               break;
            case "rulerCheckBox":
               _2216.useruler = _loc2_.value;
               _1567(new StageNotification(StageNotification.UPDATE_RULER_USABLE));
            case "rlineCheckBox":
               _2216.assistLine = _loc2_.value;
               _1567(new StageNotification(StageNotification.UPDATE_RULER_ASSIST_LINE_USABLE));
               break;
            case "rLineSelectCheckBox":
               _2216.assistLineenable = _loc2_.value;
               _1567(new StageNotification(StageNotification.UPDATE_RULER_ASSIST_LINE_SELECT));
         }
      }
      
      public function _14660() : void
      {
         _1567(new StageNotification(StageNotification.UPDATE_RULER));
      }
      
      public function _5612() : void
      {
         if(this._2212)
         {
            this._2212._2939();
         }
      }
      
      public function _13909() : void
      {
         _1567(new StageNotification(StageNotification.UPDATE_BG_COLOR));
      }
      
      public function updataBoneColor() : void
      {
         try
         {
            this._2877._3198._14656();
         }
         catch(error:Error)
         {
            _11110.instance._11204._11132("SettingWindowController::updataBoneColor",error);
         }
      }
      
      public function _14655() : void
      {
         _1567(new StageNotification(StageNotification.UPDATE_RULER_ASSIST_LINE_COLOR));
      }
      
      public function updataBoneSize() : void
      {
         try
         {
            this._2877._3198.updataBoneSize();
         }
         catch(error:Error)
         {
            _11110.instance._11204._11132("SettingWindowController::updataBoneSize",error);
         }
      }
      
      protected function get _2212() : _603
      {
         return (_1407.getInstance(_580) as _580)._2212;
      }
      
      protected function get _2877() : _588
      {
         return _1407.getInstance(_588) as _588;
      }
      
      protected function get _2210() : _471
      {
         return _1407.getInstance(_471) as _471;
      }
      
      protected function get _14657() : ExportController
      {
         return _1407.getInstance(ExportController) as ExportController;
      }
   }
}

