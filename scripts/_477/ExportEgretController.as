package _477
{
   import _1009.ExportSuccessWindow;
   import _1011.ExportEgretWindow;
   import _1011._1010;
   import _11111._11110;
   import _1177.CloseEvent;
   import _120._121;
   import _120._123;
   import _13503._13502;
   import _1374.Alert;
   import _1404._1407;
   import _1467._1466;
   import _1491._1490;
   import _470._469;
   import _472._622;
   import _51._50;
   import _51._52;
   import _555.LibraryPanelController;
   import _573.TimelinePanelController;
   import _586._596;
   import _586._605;
   import _609._619;
   import _609._621;
   import _708._715;
   import _721._720;
   import _721._763;
   import _721._765;
   import _73.SymbolType;
   import _783.CommandNotification;
   import _783.PanelNotification;
   import _783.TimelineNotification;
   import _783.TipNotification;
   import _93._94;
   import _97._101;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.events.Event;
   
   public class ExportEgretController extends _94
   {
      private static var _3639:_765 = new _765();
      
      private static var _3624:_765 = new _765();
      
      private var _3619:_619;
      
      private var _3661:ExportEgretWindow;
      
      private var _3677:_1010;
      
      private var _3670:_720;
      
      private var _3617:_13502;
      
      private var _3618:_50;
      
      public function ExportEgretController()
      {
         this._3619 = _1407.getInstance(_619) as _619;
         super();
         this._3670 = new _720();
      }
      
      override protected function _1576() : void
      {
         _1565(PanelNotification.TEXTURE_PACKAGE_WINDOW_CLOSE,this._3627);
      }
      
      private function _3627(param1:PanelNotification) : void
      {
         this._3670.scale = _3639.scale;
         this._3670.backgroundColor = _3639.backgroundColor;
         this._3670.hasBackground = _3639.hasBackground;
         if(this._3661)
         {
            this._3661.refresh();
         }
      }
      
      public function _3631() : void
      {
         _3639.dragonBonesVO = _2214._1844._2871.dragonBonesVO;
         _3639.scale = this._3670.scale;
         _3639.hasBackground = this._3670.hasBackground;
         _3639.backgroundColor = this._3670.backgroundColor;
         _3639.exportType = this._3670.exportType;
         this._3619._3310(_3639);
      }
      
      public function _3305() : void
      {
         var avo:_50 = null;
         var alert:Alert = null;
         var skin:Object = null;
         var max:Number = NaN;
         var wSkin:_1490 = null;
         var mSkin:_1466 = null;
         var bool:Boolean = false;
         for each(avo in _2214._1844._2871.dragonBonesVO._2126)
         {
            if(avo._1811 == SymbolType.STAGE)
            {
               bool = true;
            }
         }
         if(!bool && avo._1811 != SymbolType.COMIC)
         {
            alert = Alert.show(tr("ExportEgret.NoStage"),"",null,function closeHdl(param1:CloseEvent):void
            {
               var _loc2_:* = undefined;
               var _loc3_:* = undefined;
               var _loc4_:* = undefined;
               if(param1.detail == Alert.FIRST_BUTTON)
               {
                  _loc2_ = _50._1782(SymbolType.STAGE.toString(),SymbolType.STAGE);
                  _2214._1844._2871._3286._3285(_loc2_,_763._1572(800,600,16777215));
                  _loc3_ = _52._1729("root",null);
                  _loc2_._1794(_loc3_);
                  _loc2_._1968();
                  _loc4_ = _469._3490(_2214._1844._2871.dragonBonesVO,_loc2_,_2214._1844._2871._2865,_2861._3678._3680());
                  _1567(new CommandNotification(CommandNotification.ADD_ARMATURE,_loc4_));
               }
            },tr("Export.addStage"),tr("Export.cancel"));
            skin = alert.skin;
            if(skin is _1490)
            {
               wSkin = skin as _1490;
               max = Math.max(wSkin.firstButton.width,wSkin.secondButton.width);
               wSkin.firstButton.width = max;
               wSkin.secondButton.width = max;
            }
            else if(skin is _1466)
            {
               mSkin = skin as _1466;
               max = Math.max(mSkin.firstButton.width,mSkin.secondButton.width);
               mSkin.firstButton.width = max;
               mSkin.secondButton.width = max;
            }
            return;
         }
         this._3618 = this._3443._1886;
         this._3617 = this._3443._3648;
         this._3670.dragonBonesVO = _2214._1844._2871.dragonBonesVO;
         this._3670.ouputPath = !!_720._3650 ? _720._3650 : FileUtil.getDirectory(_2214._1844._2871.projectPath);
         this._3670.projectName = FileUtil.getFileName(_2214._1844._2871.projectPath);
         this._3670.exportType = 0;
         _3639.dragonBonesVO = _2214._1844._2871.dragonBonesVO;
         _3639.scale = this._3670.scale;
         _3639.hasBackground = this._3670.hasBackground;
         _3639.backgroundColor = this._3670.backgroundColor;
         _3639.exportType = this._3670.exportType;
         _3639.autoSize = true;
         this._3619._3608 = _3639;
         _495.instance = new _495();
         _621.instance = new _621();
         _621.instance._3608 = _3639;
         _495.instance._3609 = _621.instance;
         if(avo._1811 == SymbolType.COMIC)
         {
            this._3677 = new _1010(this._3670);
            this._3677.addEventListener(Event.CLOSE,this._3658);
            this._3677.open();
         }
         else
         {
            this._3661 = new ExportEgretWindow(this._3670);
            this._3661.addEventListener(Event.CLOSE,this._3658);
            this._3661.open();
            this._3619._3655 = this._3661._3664;
            this._3633(this._3670);
         }
      }
      
      private function _3658(param1:Event) : void
      {
         if(this._3661)
         {
            this._3661.removeEventListener(Event.CLOSE,this._3658);
            this._3661 = null;
         }
         if(this._3677)
         {
            this._3677.removeEventListener(Event.CLOSE,this._3658);
            this._3677 = null;
         }
         if(_2220._2873 == _715.ARMATURE)
         {
            _1567(new TimelineNotification(TimelineNotification.UPDATE_STAGE_VIEW));
         }
         else if(_2220._2873 == _715.ANIMATE || _2220._2873 == _715.GENERAL)
         {
            this._2852._3002();
         }
      }
      
      private function _3633(param1:_720) : void
      {
         _495.instance._3238 = param1;
         _621.instance.clear();
         _495.instance._3609 = _621.instance;
         var _loc2_:_123 = new _123();
         _loc2_._2389(new _479());
         _loc2_._2389(new _482());
         _loc2_._2389(new _507());
         _loc2_._2389(new _502(this._3661._3664));
         _loc2_.addEventListener(_121.COMPLETE,this._3636);
         _loc2_.addEventListener(_121.FAIL,this._3657);
         _loc2_.run();
      }
      
      public function _3635(param1:Object) : void
      {
         var _loc2_:Number = NaN;
         switch(param1.type)
         {
            case ExportController.EXPORT_ERROR_TOO_LARGE:
               _loc2_ = Number(param1.data);
               if(_loc2_ > 0)
               {
                  _3639.scale *= _loc2_;
                  this._3670.scale = _3639.scale;
                  this._3670.backgroundColor = _3639.backgroundColor;
                  this._3670.hasBackground = _3639.hasBackground;
                  if(this._3661)
                  {
                     this._3661.refresh();
                  }
                  _1567(new TipNotification(TipNotification.TIP_ALERT,tr("Export.alert.2017")));
               }
               break;
            case ExportController.EXPORT_ERROR_SIZE_SMALL:
               _1567(new TipNotification(TipNotification.TIP_ALERT,tr("Export.error.smallSize")));
               break;
            case ExportController.EXPORT_ERROR_PACK:
               _1567(new TipNotification(TipNotification.TIP_ALERT,tr("Export.error.2016")));
               if(this._3661)
               {
                  this._3661.close();
               }
               break;
            case ExportController.EXPORT_ERROR_NO_DATA:
               _495.instance.dispose();
               _1567(new TipNotification(TipNotification.TIP_ALERT,tr("Export.error.noData")));
               break;
            case ExportController.EXPORT_ERROR_UNKNOW:
               _1567(new TipNotification(TipNotification.TIP_ALERT,tr("Export.error.unknow")));
               break;
            case ExportController.EXPORT_ERROR_OPEN_FILE:
               _1567(new TipNotification(TipNotification.TIP_ALERT,tr("Export.error.openFile")));
               break;
            case ExportController.EXPORT_ERROR_SAVE_FILE:
               _1567(new TipNotification(TipNotification.TIP_ALERT,tr("Export.error.saveFile")));
               break;
            case ExportController.EXPORT_ERROR_NAME_CONFLICT:
               if(this._3661)
               {
                  this._3661.close();
               }
               break;
            case ExportController.EXPORT_OUT_MEMORY:
               _1567(new TipNotification(TipNotification.TIP_ALERT,tr("Export.error.2016")));
               _495.instance.dispose();
         }
      }
      
      private function _3636(param1:_121) : void
      {
         param1.target.removeEventListener(_121.COMPLETE,this._3636);
         param1.target.removeEventListener(_121.FAIL,this._3657);
         this._3642();
      }
      
      private function _3657(param1:_121) : void
      {
         param1.target.removeEventListener(_121.COMPLETE,this._3636);
         param1.target.removeEventListener(_121.FAIL,this._3657);
         this._3635(param1.data);
         if(param1.data.type == ExportController.EXPORT_ERROR_TOO_LARGE)
         {
            this._3646(null);
         }
         this._3642();
      }
      
      private function _3646(param1:Event) : void
      {
         _3639.scale = this._3670.scale;
         _3639.hasBackground = this._3670.hasBackground;
         _3639.backgroundColor = this._3670.backgroundColor;
         this._3633(this._3670);
      }
      
      private function _3642() : void
      {
         var _loc1_:_13502 = this._2852._13704;
         if(Boolean(_loc1_) && (_2220._2873 == _715.GENERAL || _2220._2873 == _715.ANIMATE))
         {
            _loc1_._1874();
         }
         this._3443._3606(this._3618);
         this._3443._3604(this._3617);
      }
      
      public function _3667(param1:Object) : void
      {
         _11110.instance._11584._11132();
         _1567(new CommandNotification(CommandNotification.EXPORT_EGRET,param1));
      }
      
      public function _3679(param1:Object) : void
      {
         _1567(new CommandNotification(CommandNotification.EXPORT_COMIC,param1));
      }
      
      public function startExport(param1:_720) : void
      {
         var ouputPath:String;
         var temp:_50 = null;
         var _3238:_720 = param1;
         var stageNum:int = 0;
         var _2126:Vector.<_50> = _3238.dragonBonesVO._2126;
         var i:int = 0;
         i = 0;
         while(i < _2126.length)
         {
            if(_2126[i]._1811 == SymbolType.STAGE)
            {
               stageNum = i;
            }
            i++;
         }
         if(stageNum != 0)
         {
            temp = _3238.dragonBonesVO._2126[stageNum];
            _3238.dragonBonesVO._2126.splice(stageNum,1);
            _3238.dragonBonesVO._2126.unshift(temp);
         }
         _3238.projectName = "skeleton";
         _495.instance._3238 = _3238;
         _495.instance._3609 = _621.instance;
         ouputPath = _3238.ouputPath + "release/resource";
         _495.instance.ouputPath = FileUtil.escapePath(ouputPath);
         if(_3238.scale <= 0)
         {
            _3238.scale = 1;
         }
         try
         {
            switch(_3238.imageType)
            {
               case _720.IMAGE_TYPE_TEXTURE:
                  this._3656(_3238);
            }
         }
         catch(e:Error)
         {
            _11110.instance._11204._11132("ExportEgretController::startExport",e);
            switch(e.errorID)
            {
               case 2015:
                  _3666(tr("Export.error.2015"));
                  break;
               default:
                  _3666(e.message);
            }
         }
      }
      
      public function _3230(param1:_720, param2:Function) : void
      {
         param1 = new _720();
         param1.dragonBonesVO = _2214._1844._2871.dragonBonesVO;
         param1.projectName = _2214._1844.label;
         param1.scale = 1;
         param1.dataType = _720.DATA_TYPE_JSON;
         param1.version = _101.DATA_VERSION_5_0;
         this._13771(param1,param2);
      }
      
      private function _3666(param1:String) : void
      {
         if(this._3661)
         {
            this._3661._3659();
         }
         Alert.show(param1);
      }
      
      public function _3656(param1:_720) : void
      {
         var _loc2_:_123 = new _123();
         _loc2_._2389(new _486());
         _loc2_._2389(new _496());
         _loc2_._2389(new _11497());
         _loc2_.addEventListener(_121.COMPLETE,this._3641);
         _loc2_.addEventListener(_121.FAIL,this._3660);
         _loc2_.run();
      }
      
      public function _3229(param1:String) : void
      {
         var _loc2_:ExportSuccessWindow = new ExportSuccessWindow();
         _loc2_._2505 = param1;
         _loc2_.open();
         if(this._3677)
         {
            this._3677.close();
         }
      }
      
      private function _3641(param1:_121) : void
      {
         param1.target.removeEventListener(_121.COMPLETE,this._3641);
         param1.target.removeEventListener(_121.FAIL,this._3660);
         param1.target.removeEventListener(_121.PROGRESS,this._3640);
         var _loc2_:ExportSuccessWindow = new ExportSuccessWindow();
         _loc2_._2505 = _495.instance._3238.ouputPath + "release";
         _loc2_.open();
         if(this._3661)
         {
            this._3661.close();
         }
         if(this._3677)
         {
            this._3677.close();
         }
         this._3642();
      }
      
      private function _3660(param1:_121) : void
      {
         param1.target.removeEventListener(_121.COMPLETE,this._3641);
         param1.target.removeEventListener(_121.FAIL,this._3660);
         param1.target.removeEventListener(_121.PROGRESS,this._3640);
         this._3635(param1.data);
         if(this._3661)
         {
            this._3661._3659();
         }
         this._3642();
      }
      
      private function _3640(param1:_121) : void
      {
         if(this._3661)
         {
            this._3661._3662(param1.data);
         }
      }
      
      public function _13771(param1:_720, param2:Function) : void
      {
         _495.instance = new _495();
         _621.instance = new _621();
         _3639.autoSize = true;
         var _loc3_:Number = _3639.scale;
         _3639.scale = 1;
         _621.instance._3608 = _3639;
         _495.instance._3609 = _621.instance;
         _495.instance._3238 = param1;
         if(param1.dragonBonesVO._2126[0]._1811 == SymbolType.COMIC)
         {
            _3639.maxHeight = _605.MAX_COMIC_HEIGHT;
            _3639.maxWidth = _605.MAX_COMIC_WIDTH;
         }
         var _loc4_:_123 = new _123();
         _loc4_._2389(new _479());
         _loc4_._2389(new _485(_2214._1844._2871._2865.name));
         _loc4_._2389(new _13539());
         _loc4_._2389(new _496());
         _loc4_._2389(new _497(param2));
         _loc4_.addEventListener(_121.COMPLETE,this._3622);
         _loc4_.addEventListener(_121.FAIL,this._3628);
         _loc4_.run();
         _3639.scale = _loc3_;
      }
      
      private function _3628(param1:_121) : void
      {
         param1.target.removeEventListener(_121.COMPLETE,this._3622);
         param1.target.removeEventListener(_121.FAIL,this._3628);
         _495.instance.dispose();
         _495.instance = null;
         this._3642();
      }
      
      private function _3622(param1:_121) : void
      {
         param1.target.removeEventListener(_121.COMPLETE,this._3622);
         param1.target.removeEventListener(_121.FAIL,this._3628);
         _495.instance.dispose();
         _495.instance = null;
         this._3642();
      }
      
      private function get _3443() : _596
      {
         return _1407.getInstance(_596) as _596;
      }
      
      private function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
      
      private function get _3281() : _622
      {
         return _1407.getInstance(_622) as _622;
      }
      
      protected function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
   }
}

