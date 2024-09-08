package _477
{
   import _1009.ExportSuccessWindow;
   import _1011._1013;
   import _1011._14113;
   import _11106._11105;
   import _11111._11110;
   import _120._10601;
   import _120._119;
   import _120._121;
   import _120._122;
   import _120._123;
   import _12454._12455;
   import _13492._13495;
   import _13503._13502;
   import _13505._13508;
   import _1374.Alert;
   import _1404._1407;
   import _14079._14078;
   import _14079._14080;
   import _14079._14081;
   import _14079._14082;
   import _40._39;
   import _472._12461;
   import _472._471;
   import _51._50;
   import _51._71;
   import _51._79;
   import _521._14070;
   import _555.LibraryPanelController;
   import _573.TimelinePanelController;
   import _586._596;
   import _586._605;
   import _609._616;
   import _609._619;
   import _609._621;
   import _636.DBPanelEvent;
   import _636.ExportEvent;
   import _648.PluginModel;
   import _648._11507;
   import _708._715;
   import _721._720;
   import _721._765;
   import _73.SymbolType;
   import _772._771;
   import _777._779;
   import _783.CommandNotification;
   import _783.PanelNotification;
   import _783.StageNotification;
   import _783.TimelineNotification;
   import _783.TipNotification;
   import _872._11512;
   import _93._94;
   import _97._101;
   import _978.Timeline;
   import com.hurlant.util.Base64;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.desktop.NativeProcess;
   import flash.desktop.NativeProcessStartupInfo;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.NativeProcessExitEvent;
   import flash.events.ProgressEvent;
   import flash.filesystem.File;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.utils.getTimer;
   
   public class ExportController extends _94
   {
      public static const EXPORT_ERROR_CLOSE:String = "EXPORT_CLOSE";
      
      public static const EXPORT_ERROR_TOO_LARGE_WH:String = "TOO_LARGE_WH";
      
      public static const EXPORT_ERROR_TOO_LARGE:String = "TOO_LARGE";
      
      public static const EXPORT_ERROR_PACK:String = "PACK_ERROR";
      
      public static const EXPORT_ERROR_SIZE_SMALL:String = "SIZE_SMALL";
      
      public static const EXPORT_ERROR_NO_DATA:String = "NO_DATA";
      
      public static const EXPORT_ERROR_UNKNOW:String = "UNKNOW";
      
      public static const EXPORT_ERROR_SAVE_FILE:String = "SAVE_FILE";
      
      public static const EXPORT_ERROR_OPEN_FILE:String = "OPEN_FILE";
      
      public static const EXPORT_ERROR_NAME_CONFLICT:String = "EXPORT_ERROR_NAME_CONFLICT";
      
      public static const EXPORT_OUT_MEMORY:String = "EXPORT_OUT_MEMORY";
      
      public static const EXPORT_ERROR_NET:String = "EXPORT_ERROR_NET";
      
      public static var _14446:Boolean = false;
      
      private static var _3639:_765 = new _765();
      
      private static var _3624:_765 = new _765();
      
      private var _3619:_619;
      
      private var _3661:_1013;
      
      private var _3670:_720;
      
      private var _3651:int;
      
      private var _3617:_13502;
      
      private var _3618:_50;
      
      private var _10726:int;
      
      private var _11583:_11507;
      
      private var _11581:_11512;
      
      private var _14451:_122;
      
      private var gifAlert:_14113;
      
      private var _14458:int;
      
      private var _14460:int = 0;
      
      private var _14456:_720;
      
      public function ExportController()
      {
         this._3619 = _1407.getInstance(_619) as _619;
         this._11583 = _1407.getInstance(_11507) as _11507;
         this._11581 = _1407.getInstance(_11512) as _11512;
         this._12569 = _1407.getInstance(_12461);
         super();
         this._3670 = new _720();
      }
      
      public function get _14464() : _14078
      {
         return _14082.getInstance().cacheDB;
      }
      
      public function get _14463() : _14081
      {
         return _14082.getInstance().cacheIMG;
      }
      
      public function get _14461() : _14080
      {
         return _14082.getInstance().cacheHTML;
      }
      
      public function _1657() : void
      {
         _14082.getInstance().update();
      }
      
      public function _14453() : void
      {
         _14082.getInstance().reset();
      }
      
      public function _14455(param1:Object) : void
      {
         if(this._3661)
         {
            this._3661._14455(param1);
         }
      }
      
      public function _14454(param1:Number) : void
      {
         this._3670.scale = param1;
         if(this._3661)
         {
            this._3661._14454();
         }
      }
      
      override protected function _1576() : void
      {
         _1565(PanelNotification.TEXTURE_PACKAGE_WINDOW_CLOSE,this._3627);
         _1565(StageNotification.EXPORT_ANIMATION,this._11579);
         (_1407.getInstance(_471) as _471)._11575.addElement(this._11581);
      }
      
      private function _11579(param1:StageNotification) : void
      {
         this._11580(param1.data);
      }
      
      private function _3637(param1:PluginModel) : void
      {
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
         _495.instance._3238 = this._3670;
         _495.instance._3609 = _621.instance;
         this._3619._3310(_3639);
      }
      
      public function _3305(param1:Boolean) : void
      {
         var _loc2_:_71 = _2214._1844._2871.dragonBonesVO;
         this._13261(_loc2_);
         this._3618 = this._3443._1886;
         this._3617 = this._3443._3648;
         this._10720(param1);
         _3639.dragonBonesVO = _2214._1844._2871.dragonBonesVO;
         _3639.scale = this._3670.scale;
         _3639.hasBackground = this._3670.hasBackground;
         _3639.backgroundColor = this._3670.backgroundColor;
         _3639.exportType = this._3670.exportType;
         _3639.autoSize = true;
         _3639.smooth = this._3670.smooth;
         this._3619._3608 = _3639;
         _495.instance = new _495();
         _621.instance = new _621();
         _495.instance._3238 = this._3670;
         _621.instance._3608 = _3639;
         _495.instance._3609 = _621.instance;
         this._3651 = _720.EXPORT_TYPE_DRAGONBONES;
         this._3661 = new _1013(this._3670);
         this._3661.addEventListener(ExportEvent.EXPORT_TYPE_CHANGE,this._3634);
         this._3661.addEventListener(ExportEvent.FRAME_RATE_CHANGE,this._3623);
         this._3661.addEventListener(ExportEvent.PREVIEW_SINGLE_IMAGE,this._12574);
         this._3661.addEventListener(ExportEvent.PREVIEW_IMAGES,this._14450);
         this._3661.addEventListener(ExportEvent.CHECK_MESH_EGRET,this._12577);
         this._3661.addEventListener(DBPanelEvent.PANEL_ALERT,this._13265);
         this._3661.addEventListener(Event.CHANGE,this._3646);
         this._3661.addEventListener(Event.CLOSE,this._3658);
         this._3661.open();
         this._3619._3655 = this._3661._3664;
         this._12575();
      }
      
      private function _3658(param1:Event) : void
      {
         this._3661.removeEventListener(ExportEvent.EXPORT_TYPE_CHANGE,this._3634);
         this._3661.removeEventListener(ExportEvent.FRAME_RATE_CHANGE,this._3623);
         this._3661.removeEventListener(ExportEvent.PREVIEW_SINGLE_IMAGE,this._12574);
         this._3661.removeEventListener(ExportEvent.CHECK_MESH_EGRET,this._12577);
         this._3661.removeEventListener(DBPanelEvent.PANEL_ALERT,this._13265);
         this._3661.removeEventListener(Event.CHANGE,this._3646);
         this._3661.removeEventListener(Event.CLOSE,this._3658);
         this._3661 = null;
         if(_2220._2873 == _715.ARMATURE)
         {
            _1567(new TimelineNotification(TimelineNotification.UPDATE_STAGE_VIEW));
         }
         else if(_2220._2873 == _715.ANIMATE || _2220._2873 == _715.GENERAL)
         {
            this._2852._3002();
         }
         var _loc2_:_71 = _2214._1844._2871.dragonBonesVO;
         this._13260(_loc2_);
      }
      
      private function _13265(param1:DBPanelEvent) : void
      {
         _1567(new TipNotification(TipNotification.TIP_ALERT,param1.data));
      }
      
      private function _13261(param1:_71) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1 && param1._2126 && param1._2126.length > 0)
         {
            _loc2_ = 0;
            _loc3_ = int(param1._2126.length);
            while(_loc2_ < _loc3_)
            {
               if(param1._2126[_loc2_]._1811 == SymbolType.SHEET)
               {
                  this._13263(param1._2126[_loc2_]);
               }
               _loc2_++;
            }
         }
      }
      
      private function _13260(param1:_71) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1 && param1._2126 && param1._2126.length > 0)
         {
            _loc2_ = 0;
            _loc3_ = int(param1._2126.length);
            while(_loc2_ < _loc3_)
            {
               if(param1._2126[_loc2_]._1811 == SymbolType.SHEET)
               {
                  this._13263(param1._2126[_loc2_]);
               }
               _loc2_++;
            }
         }
      }
      
      private function _13263(param1:_50) : void
      {
         var _loc2_:_79 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:_13508 = null;
         var _loc7_:_13502 = null;
         var _loc8_:_13495 = null;
         if(param1._1811 == SymbolType.SHEET)
         {
            _loc2_ = param1._1780[0];
            if(_loc2_)
            {
               _loc5_ = [];
               _loc3_ = 0;
               _loc4_ = int(_loc2_._1715.length);
               while(_loc3_ < _loc4_)
               {
                  (_loc8_ = new _13495()).startPos = _loc3_;
                  _loc8_.duration = 1;
                  _loc8_.value = _loc2_._1715[_loc3_];
                  _loc5_.push(_loc8_);
                  _loc3_++;
               }
               _loc6_ = new _13508();
               _loc6_._13572._1816 = _loc5_;
               _loc6_._1824 = _loc2_;
               (_loc7_ = new _13502()).playTimes = param1.playTimes;
               _loc7_.frameRate = param1.frameRate;
               _loc7_.name = param1.name;
               _loc7_.duration = _loc2_._1715.length;
               _loc7_._1745 = [_loc6_];
               _loc7_._1746 = [];
               param1._13619[0] = _loc7_;
            }
         }
      }
      
      private function _13262(param1:_50) : void
      {
         if(param1._1811 == SymbolType.SHEET)
         {
            if(param1._13619)
            {
               param1._13619.length = 0;
            }
         }
      }
      
      private function _12577(param1:ExportEvent) : void
      {
         this._12575();
      }
      
      private function _12574(param1:ExportEvent) : void
      {
         this._12576();
      }
      
      private function _10720(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         this._3670.dragonBonesVO = _2214._1844._2871.dragonBonesVO;
         this._3670.ouputPath = !!_720._3650 ? _720._3650 : FileUtil.getDirectory(_2214._1844._2871.projectPath);
         this._3670.projectName = FileUtil.getFileName(_2214._1844._2871.projectPath);
         this._3670.smooth = _2214._2216.imageSmooth;
         this._3670.exportSuperType = _720.SUPERTYPE_DATA;
         this._3670._2000 = null;
         if(this._3670.exportType != _720.EXPORT_TYPE_SPINE)
         {
            if(_101.DATA_VERSIONS.indexOf(this._3670.version) < 0)
            {
               this._3670.version = _101.DATA_VERSION;
            }
         }
         this._3670.allArmatures = [];
         this._3670.selectedArmatures = [];
         this._3670.openedArmatures = [];
         if(param1)
         {
            this._3670.targetType = _720.TARGET_SELECTED;
         }
         else
         {
            this._3670.targetType = _720.TARGET_ALL;
         }
         this._3670.outputName = this._3670.projectName;
         this._3670.allAnimations.length = 0;
         this._3670.allAnimationDurings.length = 0;
         var _loc4_:_13502 = this._2852._13704;
         var _loc5_:_50 = _2214._1844._2871._2865;
         if(_loc5_)
         {
            this._3670.curArmature = _loc5_.name;
            if(_loc4_)
            {
               this._3670.curFrameIndex = this._2852.timeline.curFrame;
               this._3670.curAnimation = _loc4_.name;
               if(!_loc5_._1971(this._3670.curAnimation))
               {
                  this._3670.curAnimation = null;
               }
            }
            _loc2_ = 0;
            _loc3_ = int(_loc5_._13619.length);
            while(_loc2_ < _loc3_)
            {
               this._3670.allAnimations.push(_loc5_._13619[_loc2_].name);
               this._3670.allAnimationDurings.push(_loc5_._13619[_loc2_].duration);
               _loc2_++;
            }
            this._3670.exportFrameRate = _loc5_.frameRate;
            if(_loc5_._1811 == SymbolType.SHEET)
            {
               if(Boolean(_loc5_._13619) && _loc5_._13619.length > 0)
               {
                  this._3670.curAnimation = _loc5_._13619[0].name;
               }
            }
            this._3670._2000 = _loc5_._2000;
         }
         this._3670.singleFrameAnimation = null;
         this._3670.singleFrameIndex = 0;
         this._3670.exportAnimations.length = 0;
         if(_2214._1844._2873 == _715.ARMATURE)
         {
            this._3670.curAnimation = null;
            this._3670.curFrameIndex = 0;
            _loc2_ = 0;
            _loc3_ = int(this._3670.allAnimations.length);
            while(_loc2_ < _loc3_)
            {
               this._3670.exportAnimations.push(this._3670.allAnimations[_loc2_]);
               _loc2_++;
            }
         }
         else
         {
            this._3670.singleFrameAnimation = this._3670.curAnimation;
            this._3670.singleFrameIndex = this._3670.curFrameIndex;
            if(this._3670.curAnimation != null)
            {
               this._3670.exportAnimations.push(this._3670.curAnimation);
            }
         }
         _loc2_ = 0;
         _loc3_ = int(this._3670.dragonBonesVO._2126.length);
         while(_loc2_ < _loc3_)
         {
            this._3670.allArmatures.push(this._3670.dragonBonesVO._2126[_loc2_].name);
            _loc2_++;
         }
         this._3670.openedArmatures.push(_2214._1844._2871._2865.name);
         this._3670.selectedArmatures = this._2861.getSelectedArmatures();
         this._3670._10713();
         if(this._3670.exportFrameRate <= 0)
         {
            this._3670.exportFrameRate = Timeline.DEFAULT_FPS;
         }
         this._3670.currentFPS = this._3670.exportFrameRate;
         this._3670._13268 = null;
      }
      
      private function _12580() : void
      {
         if(_495.instance)
         {
            _495.instance.dispose();
         }
      }
      
      private function _3634(param1:ExportEvent) : void
      {
         this._3651 = int(param1.data);
         _495.instance._3444();
         this._3670.exportType = this._3651;
         _3639.exportType = this._3651;
         _3639.autoSize = true;
      }
      
      private function _3623(param1:ExportEvent) : void
      {
         _495.instance._3444();
      }
      
      private function _3646(param1:Event) : void
      {
         _3639.scale = this._3670.scale;
         _3639.hasBackground = this._3670.hasBackground;
         _3639.backgroundColor = this._3670.backgroundColor;
         if(this._3670.exportSuperType == _720.SUPERTYPE_DATA)
         {
            switch(this._3670.exportType)
            {
               case _720.EXPORT_TYPE_DRAGONBONES:
                  this._3633(this._3670);
                  break;
               case _720.EXPORT_TYPE_MOVIECLIP:
                  this._3638(this._3670);
                  break;
               case _720.EXPORT_TYPE_SPRITESHEET:
                  this._3632(this._3670);
                  break;
               case _720.EXPORT_TYPE_EGRETFAST:
               case _720.EXPORT_TYPE_BINARY:
               case _720.EXPORT_TYPE_SPINE:
                  this._3633(this._3670);
                  break;
               case _720.EXPORT_TYPE_IMAGE:
               case _720.EXPORT_TYPE_VIDEO:
            }
         }
         else if(this._3670.imagesPackageType == _720.IMAGES_PACKAGE_TEXTURE)
         {
            this._3632(this._3670);
         }
      }
      
      public function _12576() : void
      {
         var _loc2_:_39 = null;
         var _loc3_:_50 = null;
         var _loc4_:_71 = null;
         var _loc5_:_123 = null;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc1_:_720 = this._3670;
         if(this._3661)
         {
            if(_loc1_.exportSuperType == _720.SUPERTYPE_DATA && _loc1_.imageType == _720.IMAGE_TYPE_FILES)
            {
               return;
            }
            _495.instance._3238 = _loc1_;
            _621.instance.clear();
            _495.instance._3609 = _621.instance;
            _loc3_ = _2214._1844._2871._2865;
            _loc4_ = _2214._1844._2871.dragonBonesVO;
            if(Boolean(_loc1_._10711) && _loc1_._10711.length == 1)
            {
               _loc3_ = _loc4_._2107(_loc1_._10711[0]);
               if(_loc3_ == null)
               {
                  _loc3_ = _2214._1844._2871._2865;
                  _loc1_._10711[0] = _loc3_.name;
               }
            }
            _loc5_ = new _123();
            _loc5_._2389(new _501());
            if(_loc1_.singleFrame)
            {
               _loc6_ = _loc1_.singleFrameAnimation;
               _loc7_ = _loc1_.singleFrameIndex;
               _loc5_._2389(new _12459(_loc3_.name,_loc6_,_loc7_));
            }
            _loc5_._2389(new _12457(_loc3_.name,this._3661.singleSingleImagePreview));
            _loc5_.addEventListener(_121.COMPLETE,this._3636);
            _loc5_.addEventListener(_121.FAIL,this._3657);
            _loc5_.run();
         }
      }
      
      private function _3666(param1:String) : void
      {
         if(this._3661)
         {
            this._3661._3659();
         }
         Alert.show(param1);
      }
      
      public function _14450(param1:ExportEvent) : void
      {
         var _loc2_:_123 = new _123();
         _loc2_._2389(new _14068(this._3661.preViewImagesData));
         _loc2_.run();
      }
      
      public function exportFile(param1:_720) : void
      {
         _1567(new TipNotification(TipNotification.TIP_ALERT,tr("Export.fail")));
      }
      
      public function _3667(param1:_720) : void
      {
         _1567(new CommandNotification(CommandNotification.EXPORT_PROJECT,param1));
      }
      
      public function startExport(param1:_720) : void
      {
         var outputPath:String = null;
         var files:Array = null;
         var dragonBonesConfig:Object = null;
         var exportQueue:_123 = null;
         var _3238:_720 = param1;
         if(_3238 == null)
         {
            return;
         }
         if(_495.instance == null)
         {
            _495.instance = new _495();
         }
         if(_621.instance == null)
         {
            _621.instance = new _621();
         }
         _495.instance._3238 = _3238;
         _495.instance._3609 = _621.instance;
         outputPath = _3238.ouputPath + _3238.outputFolder;
         files = [];
         dragonBonesConfig = null;
         _495.instance.ouputPath = FileUtil.escapePath(outputPath);
         if(_3238.scale <= 0)
         {
            _3238.scale = 1;
         }
         if(Number(_3238.version) < 5.5)
         {
            try
            {
               switch(_3238.imageType)
               {
                  case _720.IMAGE_TYPE_FILES:
                     if(_3238.isZip)
                     {
                        this._3653(_3238);
                     }
                     else
                     {
                        this._3663(_3238);
                     }
                     break;
                  case _720.IMAGE_TYPE_TEXTURE:
                     if(_3238.isZip)
                     {
                        this._3643(_3238);
                     }
                     else
                     {
                        this._3656(_3238);
                     }
               }
            }
            catch(e:Error)
            {
               _11110.instance._11204._11132("ExportController::startExport",e);
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
         else
         {
            try
            {
               exportQueue = new _123();
               exportQueue._2389(new _486());
               exportQueue._2389(new _10601(function(param1:_119):void
               {
                  dragonBonesConfig = param1._11540.data;
               }));
               exportQueue._2389(new _479());
               exportQueue._2389(new _482());
               switch(_3238.imageType)
               {
                  case _720.IMAGE_TYPE_FILES:
                     exportQueue._2389(new _489());
                     exportQueue._2389(new _10601(function(param1:_119):void
                     {
                        var _loc3_:* = undefined;
                        var _loc2_:* = param1._11540 || null;
                        if(_loc2_)
                        {
                           for each(_loc3_ in _loc2_)
                           {
                              files.push(_loc3_);
                           }
                        }
                     }));
                     break;
                  case _720.IMAGE_TYPE_TEXTURE:
                     exportQueue._2389(new _507());
                     exportQueue._2389(new _496());
                     exportQueue._2389(new _10601(function(param1:_119):void
                     {
                        var _loc4_:* = undefined;
                        var _loc5_:* = undefined;
                        var _loc6_:* = undefined;
                        var _loc2_:* = !!param1._11540 ? param1._11540.textureAtlases as Array : null;
                        var _loc3_:* = !!param1._11540 ? param1._11540.textures as Array : null;
                        if(_loc2_)
                        {
                           _loc4_ = 0;
                           for each(_loc5_ in _loc2_)
                           {
                              if(_loc5_)
                              {
                                 files.push(_loc5_);
                                 if(_loc3_)
                                 {
                                    _loc6_ = _loc3_[_loc4_];
                                    if(_loc6_)
                                    {
                                       files.push(_loc6_);
                                    }
                                 }
                              }
                              _loc4_++;
                           }
                        }
                     }));
               }
               exportQueue._2389(new _10601(function(param1:_119):void
               {
                  param1._2222 = {
                     "to":(Number(_3238.version) < 5.5 ? "v45" : "new"),
                     "data":dragonBonesConfig
                  };
               }));
               exportQueue._2389(new _14069());
               exportQueue._2389(new _10601(function(param1:_119):void
               {
                  var _loc2_:* = undefined;
                  for each(_loc2_ in param1._11540)
                  {
                     files.push({
                        "path":outputPath + _loc2_.name + _loc2_.suffix,
                        "data":_loc2_.data
                     });
                  }
                  param1._2222 = files;
               }));
               if(_3238.isZip)
               {
                  exportQueue._2389(new _510());
                  exportQueue._2389(new _11497());
               }
               else
               {
                  exportQueue._2389(new SaveFilesTask());
               }
               exportQueue.addEventListener(_121.COMPLETE,this._3641);
               exportQueue.addEventListener(_121.FAIL,this._3660);
               exportQueue.run();
            }
            catch(e:Error)
            {
               _11110.instance._11204._11132("ExportController::startExport",e);
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
      }
      
      public function _3663(param1:_720) : void
      {
         var _loc2_:_123 = new _123();
         _loc2_._2389(new _486());
         _loc2_._2389(new _479());
         _loc2_._2389(new _489());
         _loc2_._2389(new _11497());
         _loc2_.addEventListener(_121.COMPLETE,this._3641);
         _loc2_.addEventListener(_121.FAIL,this._3660);
         _loc2_.run();
      }
      
      public function _3653(param1:_720) : void
      {
         var _loc2_:_123 = new _123();
         _loc2_._2389(new _486());
         _loc2_._2389(new _479());
         _loc2_._2389(new _489());
         _loc2_._2389(new _510());
         _loc2_._2389(new _11497());
         _loc2_.addEventListener(_121.COMPLETE,this._3641);
         _loc2_.addEventListener(_121.FAIL,this._3660);
         _loc2_.run();
      }
      
      public function _3656(param1:_720) : void
      {
         var _loc2_:_123 = new _123();
         _loc2_._2389(new _486());
         _loc2_._2389(new _479());
         _loc2_._2389(new _482());
         _loc2_._2389(new _507());
         _loc2_._2389(new _496());
         _loc2_._2389(new _11497());
         _loc2_.addEventListener(_121.COMPLETE,this._3641);
         _loc2_.addEventListener(_121.FAIL,this._3660);
         _loc2_.run();
      }
      
      public function _3643(param1:_720) : void
      {
         var _loc2_:_123 = new _123();
         _loc2_._2389(new _486());
         _loc2_._2389(new _479());
         _loc2_._2389(new _482());
         _loc2_._2389(new _507());
         _loc2_._2389(new _496());
         _loc2_._2389(new _510());
         _loc2_._2389(new _11497());
         _loc2_.addEventListener(_121.COMPLETE,this._3641);
         _loc2_.addEventListener(_121.FAIL,this._3660);
         _loc2_.run();
      }
      
      public function _3629(param1:_720) : void
      {
         var _loc2_:_50 = _2214._1844._2871._2865;
         var _loc3_:_123 = new _123();
         _loc3_._2389(new _501());
         _loc3_._2389(new _504(_loc2_.name));
         _loc3_._2389(new _480(_loc2_.name));
         _loc3_._2389(new _507());
         _loc3_._2389(new _616());
         _loc3_._2389(new _490(_loc2_.name));
         _loc3_._2389(new _11497());
         _loc3_.addEventListener(_121.COMPLETE,this._3641);
         _loc3_.addEventListener(_121.FAIL,this._3660);
         _loc3_.run();
      }
      
      public function _3626(param1:_720) : void
      {
         var _loc2_:int = 0;
         var _loc5_:_123 = null;
         var _loc6_:_122 = null;
         var _loc9_:_39 = null;
         var _loc10_:* = false;
         var _loc11_:_11101 = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:String = null;
         var _loc15_:_491 = null;
         var _loc16_:_491 = null;
         if(param1 == null)
         {
            return;
         }
         _495.instance._3238 = param1;
         if(param1.imageFormat == _720.IMAGES_FORMAT_GIF)
         {
            this._10718(param1);
            return;
         }
         if(_621.instance)
         {
            _621.instance.clear();
         }
         if(!(Boolean(_2214) && Boolean(_2214._1844) && _2214._1844._2871))
         {
            return;
         }
         var _loc3_:_50 = _2214._1844._2871._2865;
         var _loc4_:_71 = _2214._1844._2871.dragonBonesVO;
         if(_loc4_ == null)
         {
            return;
         }
         if(Boolean(param1._10711) && param1._10711.length == 1)
         {
            _loc3_ = _loc4_._2107(param1._10711[0]);
            if(_loc3_ == null)
            {
               _loc3_ = _2214._1844._2871._2865;
               if(_loc3_ == null)
               {
                  return;
               }
               param1._10711[0] = _loc3_.name;
            }
         }
         var _loc7_:String = param1.ouputPath + param1.outputFolder;
         _495.instance.ouputPath = FileUtil.escapePath(_loc7_);
         _loc5_ = new _123();
         _loc6_ = new _122();
         if(param1.singleFrame || param1.imagesPackageType == _720.IMAGES_PACKAGE_TEXTURE)
         {
            _loc5_._2389(new _501());
         }
         else
         {
            _loc6_._2389(new _501());
         }
         var _loc8_:String = param1.curAnimation;
         if(param1.singleFrame)
         {
            if(param1.singleFrameAnimation)
            {
               _loc8_ = param1.singleFrameAnimation;
               _loc2_ = param1.singleFrameIndex;
            }
            _loc10_ = _loc3_._1811 == SymbolType.SHEET;
            _loc5_._2389(new _12459(_loc3_.name,_loc8_,_loc2_));
            _loc5_._2389(new SaveAnimationSingleFrameTask(_loc3_.name,_loc8_,_loc2_,_loc10_));
            _loc11_ = new _11101(_loc3_.name,_loc8_,_loc2_);
            _loc5_.addEventListener(_121.COMPLETE,this._3641);
            _loc5_.addEventListener(_121.FAIL,this._3660);
            _loc5_.addEventListener(_121.PROGRESS,this._3640);
            _loc5_.run();
         }
         else if(param1.imagesPackageType == _720.IMAGES_PACKAGE_TEXTURE)
         {
            _loc5_._2389(new _12458(_loc3_.name,param1.exportAnimations));
            if(param1.imagesPackageType == _720.IMAGES_PACKAGE_TEXTURE)
            {
               _loc5_._2389(new AssemblySpriteSheetTextureTask(_loc3_.name,param1.exportAnimations));
               _loc5_._2389(new _507());
               _loc5_._2389(new _616());
               _loc5_._2389(new _493());
               _loc5_._2389(new _11497());
            }
            else
            {
               _loc5_._2389(new _492(_loc3_.name,param1.exportAnimations));
            }
            _loc5_.addEventListener(_121.COMPLETE,this._3641);
            _loc5_.addEventListener(_121.FAIL,this._3660);
            _loc5_.addEventListener(_121.PROGRESS,this._3640);
            _loc5_.run();
         }
         else if(param1.exportAnimations.length > 0)
         {
            _loc12_ = 0;
            _loc13_ = int(param1.exportAnimations.length);
            while(_loc12_ < _loc13_)
            {
               _loc14_ = param1.exportAnimations[_loc12_];
               if(_loc3_._1971(_loc14_))
               {
                  _loc15_ = new _491(_loc3_.name,_loc14_);
                  _loc6_._2389(_loc15_);
               }
               _loc12_++;
            }
            _loc6_.addEventListener(_121.COMPLETE,this._3641);
            _loc6_.addEventListener(_121.FAIL,this._3660);
            _loc6_.addEventListener(_121.PROGRESS,this._3640);
            _loc6_.run();
         }
         else
         {
            _loc16_ = new _491(_loc3_.name,_loc8_);
            _loc16_.addEventListener(_121.COMPLETE,this._3641);
            _loc16_.addEventListener(_121.FAIL,this._3660);
            _loc16_.addEventListener(_121.PROGRESS,this._3640);
            _loc16_.run();
         }
      }
      
      public function _10718(param1:_720) : void
      {
         var _loc4_:_39 = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         this._14456 = param1;
         if(!this.gifAlert)
         {
            this.gifAlert = new _14113();
            this.gifAlert._14459 = this._14449;
            this.gifAlert.open();
         }
         _621.instance.clear();
         var _loc2_:_50 = _2214._1844._2871._2865;
         var _loc3_:_71 = _2214._1844._2871.dragonBonesVO;
         if(Boolean(param1._10711) && param1._10711.length == 1)
         {
            _loc2_ = _loc3_._2107(param1._10711[0]);
            if(_loc2_ == null)
            {
               _loc2_ = _2214._1844._2871._2865;
               param1._10711[0] = _loc2_.name;
            }
         }
         this._14451 = new _122();
         this._14451._2389(new _501());
         if(param1.singleFrame)
         {
            _loc7_ = "";
            this._14458 = 1;
            _loc5_ = param1.singleFrameAnimation;
            _loc6_ = param1.singleFrameIndex;
            this._14451._2389(new _12459(_loc2_.name,_loc5_,_loc6_));
         }
         else
         {
            _loc7_ = param1.exportAnimations[this._14460];
            this._14458 = param1.exportAnimations.length;
            this._14451._2389(new _12458(_loc2_.name,[_loc7_]));
         }
         this._14447(1,this._14458,null);
         var _loc8_:* = _loc2_._1811 == SymbolType.SHEET;
         this._14451._2389(new ExportGIFTask(_loc2_.name,_loc5_,_loc6_,this._10712,this._14447,_loc8_,_loc7_));
         this._14451._2389(new _11497());
         this._14451.addEventListener(_121.COMPLETE,this._14448);
         this._14451.addEventListener(_121.FAIL,this._3660);
         this._14451.addEventListener(_121.PROGRESS,this._3640);
         this._14451.run();
      }
      
      private function _14448(param1:_121) : void
      {
         if(this._14458 - 1 == this._14460 || this._14456.singleFrame)
         {
            this._14460 = 0;
            this._14458 = 0;
            this._3641(param1);
            return;
         }
         ++this._14460;
         this._10718(this._3670);
      }
      
      private function _14449() : void
      {
         if(this._14451)
         {
            this._14451.stop();
         }
         if(this.gifAlert)
         {
            this.gifAlert.close();
            this.gifAlert = null;
         }
         if(this._3661)
         {
            this._3661._3659();
         }
         _11110.instance._11137.name = _11105.Name_ExportImage;
         this._3647();
         var _loc1_:String = "error";
         _779.instance._3645(_779.PARAM_RESULT,_loc1_);
         _779.instance._3630();
         _11110.instance._11137.fail(_loc1_);
         _11110.instance._11137._11132();
         this._3642();
      }
      
      private function _10712(param1:int, param2:int, param3:String) : void
      {
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         if(param1 == 0)
         {
            _loc4_ = 10;
            _loc5_ = tr("Export.gifAlert.label2","...");
            this._10726 = getTimer();
         }
         else
         {
            _loc7_ = getTimer();
            _loc8_ = _loc7_ - this._10726;
            _loc9_ = (param2 - param1) * _loc8_;
            _loc4_ = int(param1 / param2 * 90) + 10;
            if(int(_loc9_ / 1000) < 0)
            {
               _loc10_ = tr("Date.S",0);
               _loc5_ = tr("Export.gifAlert.label2",_loc10_);
            }
            else
            {
               _loc10_ = tr("Date.S",int(_loc9_ / 1000));
               _loc5_ = tr("Export.gifAlert.label2",_loc10_);
            }
            this._10726 = _loc7_;
         }
         var _loc6_:String = this._14460 + 1 + "/" + this._14458;
         this.gifAlert.refresh(_loc4_,_loc6_,param3,_loc5_);
      }
      
      private function _14447(param1:int, param2:int, param3:String) : void
      {
         var _loc4_:String = tr("Export.gifAlert.label3",param1 + "/" + param2);
         var _loc5_:String = this._14460 + 1 + "/" + this._14458;
         var _loc6_:int = int(param1 / param2 * 10);
         if(!param3)
         {
            param3 = "...";
         }
         this.gifAlert.refresh(_loc6_,_loc5_,param3,_loc4_);
      }
      
      public function _11582(param1:_720) : void
      {
         var _11537:Object;
         var exportQueue:_123;
         var outputPath:String = null;
         var task:_119 = null;
         var _3238:_720 = param1;
         if(this._3661)
         {
            this._3661.close();
         }
         if(_495.instance == null)
         {
            _495.instance = new _495();
         }
         if(_621.instance == null)
         {
            _621.instance = new _621();
         }
         outputPath = FileUtil.escapePath(_3238.ouputPath + _3238.outputFolder);
         _3238.version = _101.DATA_VERSION_5_0;
         _495.instance._3238 = _3238;
         _495.instance._3609 = _621.instance;
         _495.instance.ouputPath = outputPath;
         _11537 = {
            "date":new Date(),
            "name":_3238.outputName,
            "outputPath":outputPath,
            "files":[]
         };
         exportQueue = new _123();
         exportQueue.setData(null,_11537);
         exportQueue._2389(new _486());
         exportQueue._2389(new _479());
         exportQueue._2389(new _482());
         exportQueue._2389(new _507());
         exportQueue._2389(new _496(false));
         exportQueue._2389(new _10601(function(param1:_119):void
         {
            var _loc3_:* = undefined;
            var _loc2_:* = !!param1._11540 ? param1._11540.textures as Array : null;
            if(_loc2_)
            {
               for each(_loc3_ in _loc2_)
               {
                  if(_loc3_)
                  {
                     param1._11537.files.push(_loc3_);
                  }
               }
            }
            param1._2222 = _495.instance;
         }));
         exportQueue._2389(new ExportToEgretTask());
         exportQueue._2389(new _10601(function(param1:_119):void
         {
            param1._11537.outputFile = outputPath + _3238.outputName + "_ske.dbmv";
            param1._11537.files.push({
               "path":param1._11537.outputFile,
               "data":param1._11540
            });
            param1._2222 = param1._11537.files;
         }));
         if(_3238.isZip)
         {
            exportQueue._2389(new CreateZipTask());
            exportQueue._2389(new _10601(function(param1:_119):void
            {
               param1._11537.outputFile = outputPath + _3238.outputName + ".zip";
               param1._11537.files.length = 0;
               param1._11537.files.push({
                  "path":param1._11537.outputFile,
                  "data":param1._2222
               });
               param1._2222 = param1._11537.files;
            }));
         }
         exportQueue._2389(new SaveFilesTask());
         for each(task in this._11583.taskQueue.waitingTasks)
         {
            if(task._11537.name === _11537.name)
            {
               this._11583.taskQueue._11548(task);
               break;
            }
         }
         for each(task in this._11583.taskQueue.runingTasks)
         {
            if(task._11537.name === _11537.name)
            {
               this._11583.taskQueue._11548(task);
               break;
            }
         }
         this._11583.taskQueue._2389(exportQueue);
         this._11583.taskQueue.run();
      }
      
      private function _3640(param1:_121) : void
      {
         if(this._3661)
         {
            this._3661._3662(param1.data);
         }
      }
      
      private function _3641(param1:_121) : void
      {
         var _loc2_:_71 = null;
         var _loc3_:ExportSuccessWindow = null;
         if(this.gifAlert)
         {
            this.gifAlert.close();
            this.gifAlert = null;
         }
         ExportController._14446 = false;
         param1.target.removeEventListener(_121.COMPLETE,this._14448);
         param1.target.removeEventListener(_121.COMPLETE,this._3641);
         param1.target.removeEventListener(_121.FAIL,this._3660);
         param1.target.removeEventListener(_121.PROGRESS,this._3640);
         switch(this._3670.exportSuperType)
         {
            case _720.SUPERTYPE_DATA:
               _11110.instance._11137.name = _11105.Name_ExportData;
               break;
            case _720.SUPERTYPE_IMAGE:
               _11110.instance._11137.name = _11105.Name_ExportImage;
               break;
            case _720.SUPERTYPE_HTML:
               _11110.instance._11137.name = _11105.Name_ExportHTML;
               this._3670._12586();
         }
         this._3647();
         _779.instance._3645(_779.PARAM_RESULT,0);
         _779.instance._3630();
         _11110.instance._11137._11132();
         if(this._3670._12582)
         {
            this._12579(0,"success");
            _loc2_ = _2214._1844._2871.dragonBonesVO;
            this._13260(_loc2_);
         }
         else
         {
            _loc3_ = new ExportSuccessWindow();
            _loc3_._2505 = _495.instance.ouputPath;
            _loc3_.open();
         }
         if(this._3661)
         {
            this._3661.close();
         }
         else
         {
            this._12580();
         }
         this._3642();
      }
      
      private function _3660(param1:_121) : void
      {
         if(this.gifAlert)
         {
            this.gifAlert.close();
            this.gifAlert = null;
         }
         ExportController._14446 = false;
         param1.target.removeEventListener(_121.COMPLETE,this._14448);
         param1.target.removeEventListener(_121.COMPLETE,this._3641);
         param1.target.removeEventListener(_121.FAIL,this._3660);
         param1.target.removeEventListener(_121.PROGRESS,this._3640);
         switch(this._3670.exportSuperType)
         {
            case _720.SUPERTYPE_DATA:
               _11110.instance._11137.name = _11105.Name_ExportData;
               break;
            case _720.SUPERTYPE_IMAGE:
               _11110.instance._11137.name = _11105.Name_ExportImage;
               break;
            case _720.SUPERTYPE_HTML:
               this._3670._12586();
               _11110.instance._11137.name = _11105.Name_ExportHTML;
         }
         this._3647();
         var _loc2_:String = !!param1.data ? param1.data.type : "error";
         _779.instance._3645(_779.PARAM_RESULT,_loc2_);
         _779.instance._3630();
         _11110.instance._11137.fail(_loc2_);
         _11110.instance._11137._11132();
         this._3635(param1.data);
         if(this._3661)
         {
            this._3661._3659();
         }
         this._3642();
      }
      
      private function _12579(param1:int, param2:String) : void
      {
         var _loc4_:String = null;
         var _loc5_:Vector.<String> = null;
         var _loc6_:File = null;
         var _loc7_:NativeProcessStartupInfo = null;
         var _loc8_:NativeProcess = null;
         if(this._3670._12579)
         {
            _loc4_ = this._3670._12579;
            (_loc5_ = new Vector.<String>())[0] = param1.toString();
            _loc5_[1] = param2;
            if(FileUtil.exists(_loc4_))
            {
               _loc6_ = new File(_loc4_);
               if(FileUtil.getExtension(_loc4_).toLowerCase() == "bat")
               {
                  _loc4_ = FileUtil.escapePath("C:\\Windows\\System32\\cmd.exe");
                  if(!FileUtil.exists(_loc4_))
                  {
                     _loc6_.openWithDefaultApplication();
                     return;
                  }
                  _loc6_ = new File(_loc4_);
                  _loc5_[0] = "/c";
                  _loc5_[1] = this._3670._12579;
                  _loc5_[2] = param1.toString();
                  _loc5_[3] = param2;
               }
               try
               {
                  (_loc7_ = new NativeProcessStartupInfo()).executable = _loc6_;
                  _loc7_.arguments = _loc5_;
                  _loc7_.workingDirectory = File.applicationStorageDirectory.resolvePath("");
                  _loc8_ = new NativeProcess();
                  _loc8_.start(_loc7_);
                  _loc8_.addEventListener(ProgressEvent.STANDARD_OUTPUT_DATA,this._3847);
                  _loc8_.addEventListener(ProgressEvent.STANDARD_ERROR_DATA,this._3847);
                  _loc8_.addEventListener(IOErrorEvent.STANDARD_ERROR_IO_ERROR,this.error);
                  _loc8_.addEventListener(IOErrorEvent.STANDARD_INPUT_IO_ERROR,this.error);
                  _loc8_.addEventListener(IOErrorEvent.STANDARD_OUTPUT_IO_ERROR,this.error);
                  _loc8_.addEventListener(NativeProcessExitEvent.EXIT,this._3841);
               }
               catch(e:Error)
               {
               }
            }
         }
         this._12573();
      }
      
      private function error(param1:Event) : void
      {
      }
      
      private function _3847(param1:ProgressEvent) : void
      {
      }
      
      private function _3841(param1:NativeProcessExitEvent) : void
      {
      }
      
      private function _11140() : void
      {
         if(this._3670.hasBackground)
         {
            _11110.instance._11137._11139(_11105.ExportData_BGColor,this._3670.backgroundColor.toString(16));
         }
         else
         {
            _11110.instance._11137._11139(_11105.ExportData_BGColor,_11105.BGColor_Transparent);
         }
      }
      
      private function _3647() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         switch(this._3670.exportSuperType)
         {
            case _720.SUPERTYPE_DATA:
               if(this._3670.exportData && this._3670.exportTexture)
               {
                  _11110.instance._11137._11139(_11105.ExportData_Contains,_11105.Contains_Both);
               }
               else if(this._3670.exportData)
               {
                  _11110.instance._11137._11139(_11105.ExportData_Contains,_11105.Contains_Data);
               }
               else if(this._3670.exportTexture)
               {
                  _11110.instance._11137._11139(_11105.ExportData_Contains,_11105.Contains_Image);
               }
               if(this._3670.exportData)
               {
                  _loc5_ = false;
                  switch(this._3670.exportType)
                  {
                     case _720.EXPORT_TYPE_DRAGONBONES:
                        _11110.instance._11137._11139(_11105.ExportData_DataType,_11105.DataType_DragonBones_JSON);
                        _loc5_ = true;
                        break;
                     case _720.EXPORT_TYPE_BINARY:
                        _11110.instance._11137._11139(_11105.ExportData_DataType,_11105.DataType_DragonBones_BIN);
                        _loc5_ = true;
                        break;
                     case _720.EXPORT_TYPE_SPINE:
                        _11110.instance._11137._11139(_11105.ExportData_DataType,_11105.DataType_Spine);
                        switch(this._3670.version)
                        {
                           case _101.SPINE_VERSION_2_1:
                              _11110.instance._11137._11139(_11105.ExportData_DataVersion,_11105.DataVersion_Spine_2_1);
                              break;
                           case _101.SPINE_VERSION_3_3:
                              _11110.instance._11137._11139(_11105.ExportData_DataVersion,_11105.DataVersion_Spine_3_3);
                        }
                        break;
                     case _720.EXPORT_TYPE_MOVIECLIP:
                        _11110.instance._11137._11139(_11105.ExportData_DataType,_11105.DataType_EgretMC);
                        break;
                     case _720.EXPORT_TYPE_EGRETFAST:
                        _11110.instance._11137._11139(_11105.ExportData_DataType,_11105.DataType_EgretFast);
                  }
                  if(_loc5_)
                  {
                     switch(this._3670.version)
                     {
                        case _101.DATA_VERSION_4_0:
                           _11110.instance._11137._11139(_11105.ExportData_DataVersion,_11105.DataVersion_DB_4_0);
                           break;
                        case _101.DATA_VERSION_4_5:
                           _11110.instance._11137._11139(_11105.ExportData_DataVersion,_11105.DataVersion_DB_4_5);
                           break;
                        case _101.DATA_VERSION_5_0:
                           _11110.instance._11137._11139(_11105.ExportData_DataVersion,_11105.DataVersion_DB_5_0);
                     }
                  }
               }
               if(this._3670.exportTexture)
               {
                  _11110.instance._11137._11139(_11105.ExportData_Pack,this._3670.isZip ? _11105.PACK_Zip : _11105.PACK_Unpack);
                  if(this._3670.imageType == _720.IMAGE_TYPE_TEXTURE)
                  {
                     _11110.instance._11137._11139(_11105.ExportData_TextureType,_11105.TextureType_TextureAtlas);
                  }
                  else if(this._3670.imageType == _720.IMAGE_TYPE_FILES)
                  {
                     _11110.instance._11137._11139(_11105.ExportData_TextureType,_11105.TextureType_Images);
                  }
                  this._11140();
               }
               break;
            case _720.SUPERTYPE_IMAGE:
               if(this._3670.singleFrame)
               {
                  _11110.instance._11137._11139(_11105.ExportImage_ImageType,_11105.ImageType_Single);
               }
               else
               {
                  _11110.instance._11137._11139(_11105.ExportImage_ImageType,_11105.ImageType_Sequence);
               }
               if(this._3670.exportAnimations.length == 1 && this._3670.exportAnimations[0] == this._3670.curAnimation)
               {
                  _11110.instance._11137._11139(_11105.ExportImage_ContainAnimation,_11105.ContainAnimation_Current);
               }
               else if(this._3670.exportAnimations.length == this._3670.allAnimations.length)
               {
                  _11110.instance._11137._11139(_11105.ExportImage_ContainAnimation,_11105.ContainAnimation_All);
               }
               else
               {
                  _11110.instance._11137._11139(_11105.ExportImage_ContainAnimation,_11105.ContainAnimation_Custom);
               }
               switch(this._3670.imageFormat)
               {
                  case _720.IMAGES_FORMAT_PNG:
                     _11110.instance._11137._11139(_11105.ExportImage_ImageFormat,_11105.ImageFormat_Png);
                     this._11140();
                     break;
                  case _720.IMAGES_FORMAT_JPG:
                     _11110.instance._11137._11139(_11105.ExportImage_ImageFormat,_11105.ImageFormat_Jpg);
                     break;
                  case _720.IMAGES_FORMAT_GIF:
                     _11110.instance._11137._11139(_11105.ExportImage_ImageFormat,_11105.ImageFormat_Gif);
               }
               break;
            case _720.SUPERTYPE_HTML:
         }
         switch(this._3670.exportType)
         {
            case _720.EXPORT_TYPE_DRAGONBONES:
               _779.instance._3645(_779.PARAM_TYPE,_771.TYPE_DB);
               break;
            case _720.EXPORT_TYPE_MOVIECLIP:
               _779.instance._3645(_779.PARAM_TYPE,_771.TYPE_MC);
               break;
            case _720.EXPORT_TYPE_SPRITESHEET:
               _779.instance._3645(_779.PARAM_TYPE,_771.TYPE_PNGS);
         }
         if(this._3670.isZip && this._3670.exportType == _720.EXPORT_TYPE_DRAGONBONES)
         {
            _779.instance._3645(_779.PARAM_V3,_771.ZIP);
         }
         else
         {
            _779.instance._3645(_779.PARAM_V3,_771.UNPACK);
         }
         _779.instance._3645(_779.PARAM_DVER,this._3670.version);
         if(this._3670.imageType == _720.IMAGE_TYPE_TEXTURE)
         {
            _779.instance._3645(_779.PARAM_V4,_771.TEXTURE);
         }
         else if(this._3670.imageType == _720.IMAGE_TYPE_FILES)
         {
            _779.instance._3645(_779.PARAM_V4,_771.IMAGES);
         }
         if(this._3670.hasBackground)
         {
            _779.instance._3645(_779.PARAM_V5,this._3670.backgroundColor);
         }
         else
         {
            _779.instance._3645(_779.PARAM_V5,0);
         }
         _779.instance._3645(_779.PARAM_V6,this._3670.scale);
         _11110.instance._11137._11139(_11105.ExportData_Scale,this._3670.scale.toString());
         if(this._3670.exportAnimations.length == 1 && this._3670.exportAnimations[0] == this._3670.curAnimation)
         {
            _779.instance._3645(_771.KEY_ANI,_771.ANI_CUR);
         }
         else if(this._3670.exportAnimations.length == this._3670.allAnimations.length)
         {
            _779.instance._3645(_771.KEY_ANI,_771.ANI_ALL);
         }
         else
         {
            _779.instance._3645(_771.KEY_ANI,_771.ANI_CUS);
         }
         _loc3_ = 0;
         _loc4_ = int(this._3670.dragonBonesVO._2126.length);
         while(_loc3_ < _loc4_)
         {
            if(this._3670.dragonBonesVO._2126[_loc3_]._1811 == SymbolType.ARMATURE)
            {
               _loc1_++;
            }
            else
            {
               _loc2_++;
            }
            _loc3_++;
         }
         _779.instance._3645(_779.PARAM_V1,_loc2_);
         _779.instance._3645(_779.PARAM_V2,_loc1_);
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
      
      private function _3638(param1:_720) : void
      {
         _495.instance._3238 = param1;
         _621.instance.clear();
         _495.instance._3609 = _621.instance;
         var _loc2_:_50 = _2214._1844._2871._2865;
         var _loc3_:_123 = new _123();
         _loc3_._2389(new _501());
         _loc3_._2389(new _504(_loc2_.name));
         _loc3_._2389(new _480(_loc2_.name));
         _loc3_._2389(new _507());
         _loc3_._2389(new _502(this._3661._3664));
         _loc3_.addEventListener(_121.COMPLETE,this._3636);
         _loc3_.addEventListener(_121.FAIL,this._3657);
         _loc3_.run();
      }
      
      private function _3632(param1:_720, param2:Function = null) : void
      {
         var _loc5_:String = null;
         var _loc6_:int = 0;
         if(param1.imageType == _720.IMAGE_TYPE_FILES)
         {
            return;
         }
         _495.instance._3238 = param1;
         _621.instance.clear();
         _495.instance._3609 = _621.instance;
         var _loc3_:_50 = _2214._1844._2871._2865;
         var _loc4_:_123 = new _123();
         _loc4_._2389(new _501());
         if(param1.singleFrame)
         {
            _loc5_ = param1.singleFrameAnimation;
            _loc6_ = param1.singleFrameIndex;
            _loc4_._2389(new RenderCurrentFramesTask(_loc3_.name,_loc5_,_loc6_));
            _loc4_._2389(new _12459(_loc3_.name,_loc5_,_loc6_));
         }
         else
         {
            _loc4_._2389(new _12458(_loc3_.name,param1.exportAnimations));
         }
         _loc4_._2389(new AssemblySpriteSheetTextureTask(_loc3_.name,param1.exportAnimations));
         _loc4_._2389(new _507());
         _loc4_._2389(new _502(param2));
         _loc4_.addEventListener(_121.COMPLETE,this._3636);
         _loc4_.addEventListener(_121.FAIL,this._3657);
         _loc4_.run();
      }
      
      private function _3657(param1:_121) : void
      {
         param1.target.removeEventListener(_121.COMPLETE,this._3636);
         param1.target.removeEventListener(_121.FAIL,this._3657);
         this._3635(param1.data);
         if(param1.data.type == EXPORT_ERROR_TOO_LARGE)
         {
            this._3646(null);
         }
         this._3642();
      }
      
      public function _3635(param1:Object) : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         if(param1 == null)
         {
            _loc2_ = tr("Export.error.unknow");
            return;
         }
         switch(param1.type)
         {
            case EXPORT_ERROR_CLOSE:
               if(this._3661)
               {
                  this._3661.close();
               }
               break;
            case EXPORT_ERROR_TOO_LARGE_WH:
               _loc3_ = int(param1.data);
               _loc4_ = int(param1.data);
               _3639.autoSize = false;
               _3639.maxWidth = _loc3_;
               _3639.maxHeight = _loc4_;
               this._3670.backgroundColor = _3639.backgroundColor;
               this._3670.hasBackground = _3639.hasBackground;
               this._3633(this._3670);
               break;
            case EXPORT_ERROR_TOO_LARGE:
               _loc5_ = Number(param1.data);
               if(_loc5_ > 0)
               {
                  if(Boolean(_3639) && Boolean(this._3670))
                  {
                     _3639.scale *= _loc5_;
                     this._3670.scale = _3639.scale;
                     this._3670.backgroundColor = _3639.backgroundColor;
                     this._3670.hasBackground = _3639.hasBackground;
                  }
                  if(this._3661)
                  {
                     this._3661._14455({
                        "type":"scale",
                        "value":_3639.scale
                     });
                     this._3661.refresh();
                  }
                  _loc2_ = tr("Export.alert.2017");
                  if(this._3670._12582)
                  {
                     _loc2_ = tr("Export.error.smallSize");
                  }
               }
               break;
            case EXPORT_ERROR_SIZE_SMALL:
               _loc2_ = tr("Export.error.smallSize");
               break;
            case EXPORT_ERROR_PACK:
               _loc2_ = tr("Export.error.2016");
               if(this._3661)
               {
                  this._3661.close();
               }
               break;
            case EXPORT_ERROR_NO_DATA:
               if(_495.instance)
               {
                  _495.instance.dispose();
               }
               _loc2_ = tr("Export.error.noData");
               break;
            case EXPORT_ERROR_UNKNOW:
               _loc2_ = tr("Export.error.unknow");
               break;
            case EXPORT_ERROR_OPEN_FILE:
               _loc2_ = tr("");
               break;
            case EXPORT_ERROR_SAVE_FILE:
               _loc2_ = tr("Export.error.saveFile");
               break;
            case EXPORT_ERROR_NET:
               _loc2_ = tr("Export.error.net");
               if(this._3661)
               {
                  this._3661.close();
               }
               break;
            case EXPORT_ERROR_NAME_CONFLICT:
               if(this._3661)
               {
                  this._3661.close();
               }
               break;
            case EXPORT_OUT_MEMORY:
               _loc2_ = tr("Export.error.2016");
               if(_495.instance)
               {
                  _495.instance.dispose();
               }
         }
         if(_loc2_)
         {
            if(this._3670._12582)
            {
               FileUtil.save(_495.instance.ouputPath + "error.log",_loc2_);
               this._12579(1,_loc2_);
            }
            else
            {
               _1567(new TipNotification(TipNotification.TIP_ALERT,_loc2_));
            }
         }
         if(this._3661 == null)
         {
            this._12580();
         }
      }
      
      private function _3636(param1:_121) : void
      {
         param1.target.removeEventListener(_121.COMPLETE,this._3636);
         param1.target.removeEventListener(_121.FAIL,this._3657);
         this._3642();
         if(this._3661)
         {
            this._3661.previewImages();
         }
      }
      
      public function _3621(param1:_720, param2:Function) : void
      {
      }
      
      public function _13771(param1:_720, param2:Function) : void
      {
         _495.instance = new _495();
         _621.instance = new _621();
         _3639.autoSize = true;
         var _loc3_:Number = _3639.scale;
         var _loc4_:Number = param1.scale;
         _3639.scale = 1;
         param1.scale = 1;
         param1.version = _101.DATA_VERSION_5_0;
         _621.instance._3608 = _3639;
         _495.instance._3609 = _621.instance;
         _495.instance._3238 = param1;
         if(param1.dragonBonesVO._2126[0]._1811 == SymbolType.COMIC)
         {
            _3639.maxHeight = _605.MAX_COMIC_HEIGHT;
            _3639.maxWidth = _605.MAX_COMIC_WIDTH;
         }
         var _loc5_:_123 = new _123();
         _loc5_._2389(new _479());
         _loc5_._2389(new _485(_2214._1844._2871._2865.name));
         _loc5_._2389(new _13539());
         _loc5_._2389(new _496());
         _loc5_._2389(new _498());
         _loc5_._2389(new _497(param2));
         _loc5_.addEventListener(_121.COMPLETE,this._3622);
         _loc5_.addEventListener(_121.FAIL,this._3628);
         _loc5_.run();
         _3639.scale = _loc3_;
         param1.scale = _loc4_;
      }
      
      public function _3625(param1:_720, param2:Function) : void
      {
         _495.instance = new _495();
         _621.instance = new _621();
         _3639.autoSize = true;
         var _loc3_:Number = _3639.scale;
         var _loc4_:Number = param1.scale;
         _3639.scale = 1;
         param1.scale = 1;
         _621.instance._3608 = _3639;
         _495.instance._3609 = _621.instance;
         _495.instance._3238 = param1;
         if(param1.dragonBonesVO._2126[0]._1811 == SymbolType.COMIC)
         {
            _3639.maxHeight = _605.MAX_COMIC_HEIGHT;
            _3639.maxWidth = _605.MAX_COMIC_WIDTH;
         }
         var _loc5_:_123 = new _123();
         _loc5_._2389(new _479());
         _loc5_._2389(new _485(_2214._1844._2871._2865.name));
         _loc5_._2389(new _486());
         _loc5_._2389(new _496());
         _loc5_._2389(new _498());
         _loc5_._2389(new _497(param2));
         _loc5_.addEventListener(_121.COMPLETE,this._3622);
         _loc5_.addEventListener(_121.FAIL,this._3628);
         _loc5_.run();
         _3639.scale = _loc3_;
         param1.scale = _loc4_;
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
      
      public function _10725() : void
      {
         switch(this._3670.exportSuperType)
         {
            case _720.SUPERTYPE_DATA:
               switch(this._3670.exportType)
               {
                  case _720.EXPORT_TYPE_DRAGONBONES:
                     this._12569.callPaidFunction(1,this._3667,this._3670);
                     break;
                  case _720.EXPORT_TYPE_MOVIECLIP:
                     this._12569.callPaidFunction(1,this._3629,this._3670);
                     break;
                  case _720.EXPORT_TYPE_EGRETFAST:
                     this._12569.callPaidFunction(1,this._11582,this._3670);
                     break;
                  case _720.EXPORT_TYPE_SPINE:
                     this._12569.callPaidFunction(1,this._14452,this._3670);
                     break;
                  case _720.EXPORT_TYPE_BINARY:
                     this._12569.callPaidFunction(1,this._13264,this._3670);
               }
               break;
            case _720.SUPERTYPE_IMAGE:
               this._12569.callPaidFunction(1,this._3626,this._3670);
               break;
            case _720.SUPERTYPE_HTML:
               this._12569.callPaidFunction(1,this._14457,this._3670);
         }
      }
      
      public function _11580(param1:String = null) : void
      {
         var task:_11496 = null;
         var name:String = param1;
         if(_2214 && _2214._1844 && _2214._1844._2871 && Boolean(_2214._1844._2871.dragonBonesVO))
         {
            if(_495.instance == null)
            {
               _495.instance = new _495();
            }
            _495.instance._3238 = this._3670;
            this._3670.dragonBonesVO = _2214._1844._2871.dragonBonesVO;
            this._3670.ouputPath = !!_720._3650 ? _720._3650 : FileUtil.getDirectory(_2214._1844._2871.projectPath);
            this._3670.outputName = FileUtil.getFileName(_2214._1844._2871.projectPath);
            this._3670.exportAnimationName = name;
            this._3670.curArmature = !!_2214._1844._2871._2865 ? _2214._1844._2871._2865.name : null;
            task = new _11496();
            task.addEventListener(_121.COMPLETE,function(param1:_121):void
            {
               _495.instance = null;
            });
            task.run();
         }
      }
      
      public function _12551(param1:_12455) : void
      {
         var outputPath:String;
         var level:int;
         var animations:Array = null;
         var i:int = 0;
         var len:int = 0;
         var curArmature:_50 = null;
         var dargonbonesVO:_71 = null;
         var paramData:_12455 = param1;
         var dragonBonesVO:_71 = _2214._1844._2871.dragonBonesVO;
         this._13261(dragonBonesVO);
         if(_495.instance == null)
         {
            _495.instance = new _495();
         }
         if(_621.instance == null)
         {
            _621.instance = new _621();
         }
         _495.instance._3238 = this._3670;
         _621.instance.clear();
         this._10720(false);
         outputPath = paramData.outputpath;
         if(outputPath == null)
         {
            outputPath = FileUtil.getDirectory(_2214._1844._2871.projectPath) + _2214._1844.fileName + "/";
         }
         this._3670.ouputPath = outputPath;
         _495.instance.ouputPath = outputPath;
         this._3670.exportType = paramData.dataType;
         this._3651 = this._3670.exportType;
         _3639.exportType = this._3651;
         this._3670.version = paramData.dataversion;
         if(this._3670.exportType == _720.EXPORT_TYPE_SPINE)
         {
            if(this._3670.version != _101.SPINE_VERSION_2_1 && this._3670.version != _101.SPINE_VERSION_3_3)
            {
               this._3670.version = _101.SPINE_VERSION_3_3;
            }
         }
         else if(this._3670.version != _101.DATA_VERSION_4_0 && this._3670.version != _101.DATA_VERSION_4_5 && this._3670.version != _101.DATA_VERSION_5_0)
         {
            this._3670.version = _101.DATA_VERSION_5_0;
         }
         this._3670.imageType = paramData._12556 ? _720.IMAGE_TYPE_TEXTURE : _720.IMAGE_TYPE_FILES;
         this._3670.imagesPackageType = paramData._12556 ? _720.IMAGES_PACKAGE_TEXTURE : _720.IMAGES_PACKAGE_FILES;
         this._3670.exportData = paramData.exportData;
         this._3670.exportTexture = paramData._12558;
         this._3670.exportSuperType = paramData.exportSuperType;
         this._3670.scale = paramData.scale;
         this._3670.hasBackground = paramData.bgcolor != -1;
         this._3670.backgroundColor = paramData.bgcolor;
         this._3670.imageFormat = paramData.imageFormat;
         this._3670.singleFrame = paramData.singleFrame;
         this._3670.isZip = paramData._12563;
         if(this._3670.imageFormat != _720.IMAGES_FORMAT_PNG)
         {
            this._3670.hasBackground = true;
         }
         if(this._3670.backgroundColor == -1)
         {
            this._3670.backgroundColor = 16777215;
         }
         if(this._3670.singleFrame)
         {
            this._3670.singleFrameAnimation = paramData.aniname;
            this._3670.singleFrameIndex = paramData.frame;
         }
         if(this._3670.exportSuperType == _720.SUPERTYPE_IMAGE)
         {
            animations = [];
            curArmature = _2214._1844._2871._2865;
            dargonbonesVO = _2214._1844._2871.dragonBonesVO;
            if(paramData._12555 && paramData._12555.length == 1 && Boolean(dargonbonesVO))
            {
               curArmature = dargonbonesVO._2107(paramData._12555[0]);
               if(curArmature == null)
               {
                  curArmature = _2214._1844._2871._2865;
               }
            }
            if(paramData.aniname)
            {
               this._3670.exportAnimations.length = 0;
               animations = paramData.aniname.split(",");
               i = 0;
               len = int(animations.length);
               while(i < len)
               {
                  if(curArmature._1971(animations[i]))
                  {
                     this._3670.exportAnimations.push(animations[i]);
                  }
                  i++;
               }
            }
            if(this._3670.exportAnimations.length == 0)
            {
               i = 0;
               len = int(curArmature._1963.length);
               while(i < len)
               {
                  this._3670.exportAnimations.push(curArmature._1963[i].name);
                  i++;
               }
            }
         }
         this._3670._10711 = paramData._12555;
         if(this._3670._10711 == null)
         {
            this._3670._10711 = [];
         }
         if(this._3670._10711.length == 0)
         {
            this._3670.targetType = _720.TARGET_ALL;
         }
         else
         {
            this._3670.targetType = _720.TARGET_CUSTOM;
         }
         this._3670.exportFrameRate = paramData.fps;
         this._3670._12579 = paramData.callback;
         _3639._5953();
         _3639.dragonBonesVO = _2214._1844._2871.dragonBonesVO;
         if(paramData.hasTextureConfig)
         {
            _3639._5420 = paramData.stripWhitespace;
            _3639.autoSize = paramData.autoSize;
            _3639._2832 = paramData.powerofTwo;
            _3639.maxHeight = paramData.maxHeight;
            _3639.maxWidth = paramData.maxWidth;
            if(_3639.maxWidth <= 0 || _3639.maxHeight <= 0)
            {
               _3639.autoSize = true;
            }
            _3639.gapX = paramData.paddingX;
            _3639.gapY = paramData.paddingY;
            _3639._5416 = paramData.square;
            _3639.heuristic = paramData.heuristics;
         }
         _3639.scale = this._3670.scale;
         _3639.hasBackground = this._3670.hasBackground;
         _3639.backgroundColor = this._3670.backgroundColor;
         _3639.exportType = this._3670.exportType;
         _3639.smooth = this._3670.smooth;
         this._3619._3608 = _3639;
         _621.instance._3608 = _3639;
         _495.instance._3609 = _621.instance;
         this._3670._12582 = true;
         level = 1;
         level = 3;
         this._12569._12581(level,function(param1:int):void
         {
            switch(param1)
            {
               case 0:
                  _12579(2,"log_out");
                  break;
               case 1:
                  _12579(3,"low_level");
                  break;
               case 2:
                  _12579(4,"log_error");
            }
         },function():void
         {
            _10725();
         });
      }
      
      public function _12573() : void
      {
         var _loc1_:* = null;
         _loc1_ = FileUtil.getDirectory(_2214._1844._2871.projectPath) + _2214._1844.fileName + "/";
         this._3670.ouputPath = _loc1_;
         _495.instance.ouputPath = _loc1_;
         this._3670.exportType = _720.EXPORT_TYPE_DRAGONBONES;
         this._3651 = this._3670.exportType;
         _3639.exportType = this._3651;
         this._3670.version = _101.DATA_VERSION_5_5;
         this._3670.imageType = _720.IMAGE_TYPE_TEXTURE;
         this._3670.imagesPackageType = _720.IMAGES_PACKAGE_FILES;
         this._3670.exportData = true;
         this._3670.exportTexture = true;
         this._3670.exportSuperType = _720.SUPERTYPE_DATA;
         this._3670.scale = 1;
         this._3670.hasBackground = false;
         this._3670.backgroundColor = 16777215;
         this._3670.imageFormat = _720.IMAGES_FORMAT_PNG;
         this._3670.singleFrame = false;
         this._3670.isZip = false;
         this._3670.singleFrameAnimation = null;
         this._3670.singleFrameIndex = 0;
         this._3670._2000 = null;
         this._3670._13268 = null;
         if(this._3670.exportAnimations)
         {
            this._3670.exportAnimations.length = 0;
         }
         if(this._3670._10711)
         {
            this._3670._10711.length = 0;
         }
         this._3670.exportFrameRate = 24;
         this._3670._12579 = null;
         _3639._5953();
         _3639.dragonBonesVO = _2214._1844._2871.dragonBonesVO;
         _3639._5420 = true;
         _3639.autoSize = true;
         _3639._2832 = true;
         _3639.maxHeight = 0;
         _3639.maxWidth = 0;
         _3639.autoSize = true;
         _3639.gapX = 2;
         _3639.gapY = 2;
         _3639._5416 = false;
         _3639.heuristic = 2;
         _3639.scale = this._3670.scale;
         _3639.hasBackground = this._3670.hasBackground;
         _3639.backgroundColor = this._3670.backgroundColor;
         _3639.exportType = this._3670.exportType;
         _3639.smooth = this._3670.smooth;
         this._3670._12582 = false;
      }
      
      public function _12578(param1:_720) : void
      {
         var outputPath:String;
         var files:Array;
         var exportQueue:_123;
         var backHasBG:Boolean = false;
         var backupScale:Number = NaN;
         var backupVersion:String = null;
         var dragonBonesConfig:Object = null;
         var _3238:_720 = param1;
         var dragonBonesVO:_71 = _2214._1844._2871.dragonBonesVO;
         this._13261(dragonBonesVO);
         this._3618 = this._3443._1886;
         this._3617 = this._3443._3648;
         _3639.dragonBonesVO = _2214._1844._2871.dragonBonesVO;
         _3639.scale = this._3670.scale;
         _3639.hasBackground = this._3670.hasBackground;
         _3639.backgroundColor = this._3670.backgroundColor;
         _3639.exportType = this._3670.exportType;
         _3639.autoSize = true;
         _3639.smooth = this._3670.smooth;
         this._3619._3608 = _3639;
         _495.instance = new _495();
         _621.instance = new _621();
         _495.instance._3238 = this._3670;
         _621.instance._3608 = _3639;
         _495.instance._3609 = _621.instance;
         this._3651 = _720.EXPORT_TYPE_DRAGONBONES;
         if(_495.instance == null)
         {
            _495.instance = new _495();
         }
         if(_621.instance == null)
         {
            _621.instance = new _621();
            _621.instance._3608 = _3639;
         }
         this._3619._3608 = _3639;
         backHasBG = _3238.hasBackground;
         backupScale = _3238.scale;
         backupVersion = _3238.version;
         outputPath = FileUtil.escapePath(_3238.ouputPath + _3238.outputFolder);
         files = [];
         dragonBonesConfig = null;
         _3639.hasBackground = _3238.hasBackground = false;
         _3639.scale = 1;
         _3238.scale = 1;
         _3238.version = _101.DATA_VERSION_5_5;
         _495.instance._3238 = _3238;
         _495.instance._3609 = _621.instance;
         _495.instance.ouputPath = outputPath;
         exportQueue = new _123();
         exportQueue.setData(null);
         exportQueue._2389(new _485(_2214._1844._2871._2865.name));
         exportQueue._2389(new _486());
         exportQueue._2389(new _10601(function(param1:_119):void
         {
            dragonBonesConfig = JSON.parse(param1._11540.data);
         }));
         exportQueue._2389(new _479());
         exportQueue._2389(new _482());
         exportQueue._2389(new _507());
         exportQueue._2389(new _496(false));
         exportQueue._2389(new _10601(function(param1:_119):void
         {
            var _loc5_:* = undefined;
            var _loc6_:* = undefined;
            var _loc7_:* = undefined;
            var _loc2_:* = !!param1._11540 ? param1._11540.textureAtlases as Array : null;
            var _loc3_:* = !!param1._11540 ? param1._11540.textures as Array : null;
            var _loc4_:* = [];
            if(!dragonBonesConfig.textureAtlas)
            {
               dragonBonesConfig.textureAtlas = [];
            }
            if(_loc2_)
            {
               _loc5_ = 0;
               for each(_loc6_ in _loc2_)
               {
                  if(_loc6_)
                  {
                     dragonBonesConfig.textureAtlas.push(JSON.parse(_loc6_.data));
                     if(_loc3_)
                     {
                        _loc7_ = _loc3_[_loc5_].data;
                        if(_loc7_)
                        {
                           _loc4_.push(com.hurlant.util.Base64.encodeByteArray(_loc7_));
                        }
                        else
                        {
                           _loc4_.push("");
                        }
                     }
                  }
                  _loc5_++;
               }
            }
            param1._2222 = {
               "to":"viewer",
               "data":JSON.stringify(dragonBonesConfig),
               "textureAtlases":_loc4_,
               "config":{"isLocal":false}
            };
            _3639.hasBackground = _3238.hasBackground = backHasBG;
            _3639.scale = backupScale;
            _3238.scale = backupScale;
            _3238.version = backupVersion;
         }));
         exportQueue._2389(new _14069());
         exportQueue._2389(new _10601(function(param1:_119):void
         {
            var _loc5_:* = undefined;
            var _loc6_:* = undefined;
            var _loc2_:* = _2214._1844._2871._2865.name;
            var _loc3_:* = "";
            var _loc4_:* = _2852._13704;
            if((_loc4_) && _2220._2873 === _715.ANIMATE)
            {
               _loc3_ = _loc4_.name;
            }
            param1._2222 = "resource/viewer/output.html";
            var _loc7_:int = 0;
            var _loc8_:* = param1._11540;
            for each(_loc5_ in _loc8_)
            {
               _loc6_ = _14070.workingDirectory.resolvePath(param1._2222).nativePath;
               FileUtil.save(_loc6_,_loc5_.data);
            }
            navigateToURL(new URLRequest(_14070.serverURL + "/" + param1._2222 + "?armature=" + _loc2_ + (!!_loc3_ ? "&animation=" + _loc3_ : "") + "&showQRCode=1"),"dragonbones_pro_preview");
         }));
         exportQueue.run();
      }
      
      public function _13264(param1:_720) : void
      {
         var exportQueue:_123;
         var backupVersion:String = null;
         var outputPath:String = null;
         var files:Array = null;
         var dragonBonesConfig:Object = null;
         var _3238:_720 = param1;
         if(this._3661)
         {
            this._3661.close();
         }
         if(_495.instance == null)
         {
            _495.instance = new _495();
         }
         if(_621.instance == null)
         {
            _621.instance = new _621();
         }
         backupVersion = _3238.version;
         outputPath = FileUtil.escapePath(_3238.ouputPath + _3238.outputFolder);
         files = [];
         dragonBonesConfig = null;
         _3238.version = _101.DATA_VERSION_5_5;
         _495.instance._3238 = _3238;
         _495.instance._3609 = _621.instance;
         _495.instance.ouputPath = outputPath;
         exportQueue = new _123();
         exportQueue.setData(null);
         exportQueue._2389(new _486());
         exportQueue._2389(new _10601(function(param1:_119):void
         {
            dragonBonesConfig = param1._11540.data;
         }));
         exportQueue._2389(new _479());
         exportQueue._2389(new _482());
         exportQueue._2389(new _507());
         exportQueue._2389(new _496(false));
         exportQueue._2389(new _10601(function(param1:_119):void
         {
            var _loc4_:* = undefined;
            var _loc5_:* = undefined;
            var _loc2_:* = !!param1._11540 ? param1._11540.textureAtlases as Array : null;
            var _loc3_:* = !!param1._11540 ? param1._11540.textures as Array : null;
            if(_loc2_)
            {
               _loc4_ = 0;
               for each(_loc5_ in _loc2_)
               {
                  if(_loc5_)
                  {
                     files.push(_loc5_);
                     if(_loc3_ && Boolean(_loc3_[_loc4_]))
                     {
                        files.push(_loc3_[_loc4_]);
                     }
                  }
                  _loc4_++;
               }
            }
            param1._2222 = {
               "to":"binary",
               "data":dragonBonesConfig
            };
            _3238.version = backupVersion;
         }));
         exportQueue._2389(new _14069());
         exportQueue._2389(new _10601(function(param1:_119):void
         {
            var _loc2_:* = undefined;
            for each(_loc2_ in param1._11540)
            {
               files.push({
                  "path":outputPath + _loc2_.name + _loc2_.suffix,
                  "data":_loc2_.data
               });
            }
            param1._2222 = files;
         }));
         if(_3238.isZip)
         {
            exportQueue._2389(new CreateZipTask());
            exportQueue._2389(new _10601(function(param1:_119):void
            {
               param1._2222 = [{
                  "path":outputPath + _3238.outputName + ".zip",
                  "data":param1._2222
               }];
            }));
         }
         exportQueue._2389(new SaveFilesTask());
         exportQueue.addEventListener(_121.COMPLETE,this._3641);
         exportQueue.addEventListener(_121.FAIL,this._3660);
         exportQueue.run();
      }
      
      public function _14457(param1:_720) : void
      {
         var exportQueue:_123;
         var backupVersion:String = null;
         var outputPath:String = null;
         var files:Array = null;
         var dragonBonesConfig:Object = null;
         var _3238:_720 = param1;
         if(this._3661)
         {
            this._3661.close();
         }
         if(_495.instance == null)
         {
            _495.instance = new _495();
         }
         if(_621.instance == null)
         {
            _621.instance = new _621();
         }
         backupVersion = _3238.version;
         outputPath = FileUtil.escapePath(_3238.ouputPath + _3238.outputFolder);
         files = [];
         dragonBonesConfig = null;
         _3238.version = _101.DATA_VERSION_5_5;
         _495.instance._3238 = _3238;
         _495.instance._3609 = _621.instance;
         _495.instance.ouputPath = outputPath;
         exportQueue = new _123();
         exportQueue.setData(null);
         exportQueue._2389(new _486());
         exportQueue._2389(new _10601(function(param1:_119):void
         {
            dragonBonesConfig = JSON.parse(param1._11540.data);
         }));
         exportQueue._2389(new _479());
         exportQueue._2389(new _482());
         exportQueue._2389(new _507());
         exportQueue._2389(new _496(false));
         exportQueue._2389(new _10601(function(param1:_119):void
         {
            var _loc5_:* = undefined;
            var _loc6_:* = undefined;
            var _loc7_:* = undefined;
            var _loc2_:* = !!param1._11540 ? param1._11540.textureAtlases as Array : null;
            var _loc3_:* = !!param1._11540 ? param1._11540.textures as Array : null;
            var _loc4_:* = [];
            dragonBonesConfig.stage = _3238.exportArmatureName || _3238.curArmature;
            if(!dragonBonesConfig.textureAtlas)
            {
               dragonBonesConfig.textureAtlas = [];
            }
            if(_loc2_)
            {
               _loc5_ = 0;
               for each(_loc6_ in _loc2_)
               {
                  if(_loc6_)
                  {
                     dragonBonesConfig.textureAtlas.push(JSON.parse(_loc6_.data));
                     if(_loc3_)
                     {
                        _loc7_ = _loc3_[_loc5_].data;
                        if(_loc7_)
                        {
                           _loc4_.push(com.hurlant.util.Base64.encodeByteArray(_loc7_));
                        }
                        else
                        {
                           _loc4_.push("");
                        }
                     }
                  }
                  _loc5_++;
               }
            }
            if(Boolean(_3238._13266) && Boolean(_3238._13266["isRelease"]))
            {
               param1._2222 = {
                  "to":"player",
                  "data":JSON.stringify(dragonBonesConfig),
                  "textureAtlases":_loc4_,
                  "config":{
                     "isLocal":true,
                     "showFPS":_3238._13266["showFPS"],
                     "frameRate":_3238._13266["frameRate"],
                     "backgroundColor":(_3238._14462 ? _3238._12584 : -1),
                     "orientation":_3238._13266["orientation"],
                     "scaleMode":_3238._13266["scaleMode"]
                  }
               };
            }
            else
            {
               param1._2222 = {
                  "to":"viewer",
                  "data":JSON.stringify(dragonBonesConfig),
                  "textureAtlases":_loc4_,
                  "config":{"isLocal":true}
               };
            }
            _3238.version = backupVersion;
         }));
         exportQueue._2389(new _14069());
         exportQueue._2389(new _10601(function(param1:_119):void
         {
            var _loc2_:* = undefined;
            for each(_loc2_ in param1._11540)
            {
               files.push({
                  "path":outputPath + _loc2_.name + _loc2_.suffix,
                  "data":_loc2_.data
               });
            }
            param1._2222 = files;
         }));
         exportQueue._2389(new SaveFilesTask());
         exportQueue.addEventListener(_121.COMPLETE,this._3641);
         exportQueue.addEventListener(_121.FAIL,this._3660);
         exportQueue.run();
      }
      
      public function _14452(param1:_720) : void
      {
         var exportQueue:_123;
         var backupVersion:String = null;
         var outputPath:String = null;
         var files:Array = null;
         var dragonBonesConfig:Object = null;
         var _3238:_720 = param1;
         if(this._3661)
         {
            this._3661.close();
         }
         if(_495.instance == null)
         {
            _495.instance = new _495();
         }
         if(_621.instance == null)
         {
            _621.instance = new _621();
         }
         backupVersion = _3238.version;
         outputPath = FileUtil.escapePath(_3238.ouputPath + _3238.outputFolder);
         files = [];
         dragonBonesConfig = null;
         _3238.version = _101.DATA_VERSION_5_5;
         _495.instance._3238 = _3238;
         _495.instance._3609 = _621.instance;
         _495.instance.ouputPath = outputPath;
         exportQueue = new _123();
         exportQueue.setData(null);
         exportQueue._2389(new _486());
         exportQueue._2389(new _10601(function(param1:_119):void
         {
            dragonBonesConfig = JSON.parse(param1._11540.data);
         }));
         exportQueue._2389(new _479());
         exportQueue._2389(new _482());
         switch(_3238.imageType)
         {
            case _720.IMAGE_TYPE_FILES:
               exportQueue._2389(new _489(true));
               exportQueue._2389(new _10601(function(param1:_119):void
               {
                  var _loc3_:* = undefined;
                  var _loc2_:* = param1._11540 || null;
                  if(_loc2_)
                  {
                     for each(_loc3_ in _loc2_)
                     {
                        files.push(_loc3_);
                     }
                  }
               }));
               break;
            case _720.IMAGE_TYPE_TEXTURE:
               exportQueue._2389(new _507());
               exportQueue._2389(new _496(false));
               exportQueue._2389(new _10601(function(param1:_119):void
               {
                  var _loc4_:* = undefined;
                  var _loc5_:* = undefined;
                  if(!dragonBonesConfig.textureAtlas)
                  {
                     dragonBonesConfig.textureAtlas = [];
                  }
                  var _loc2_:* = !!param1._11540 ? param1._11540.textureAtlases as Array : null;
                  var _loc3_:* = !!param1._11540 ? param1._11540.textures as Array : null;
                  if(_loc2_)
                  {
                     _loc4_ = 0;
                     for each(_loc5_ in _loc2_)
                     {
                        if(_loc5_)
                        {
                           dragonBonesConfig.textureAtlas.push(JSON.parse(_loc5_.data));
                           if(_loc3_ && Boolean(_loc3_[_loc4_]))
                           {
                              files.push(_loc3_[_loc4_]);
                           }
                        }
                        _loc4_++;
                     }
                  }
               }));
         }
         exportQueue._2389(new _10601(function(param1:_119):void
         {
            param1._2222 = {
               "to":"spine",
               "data":JSON.stringify(dragonBonesConfig),
               "config":{"version":"3.6.0"}
            };
            _3238.version = backupVersion;
         }));
         exportQueue._2389(new _14069());
         exportQueue._2389(new _10601(function(param1:_119):void
         {
            var _loc2_:* = undefined;
            for each(_loc2_ in param1._11540)
            {
               if(Boolean(_loc2_.data) && _loc2_.data.length > 10)
               {
                  files.push({
                     "path":outputPath + _loc2_.name + _loc2_.suffix,
                     "data":_loc2_.data
                  });
               }
            }
            param1._2222 = files;
         }));
         if(_3238.isZip)
         {
            exportQueue._2389(new CreateZipTask());
            exportQueue._2389(new _10601(function(param1:_119):void
            {
               param1._2222 = [{
                  "path":outputPath + _3238.outputName + ".zip",
                  "data":param1._2222
               }];
            }));
         }
         exportQueue._2389(new SaveFilesTask());
         exportQueue.addEventListener(_121.COMPLETE,this._3641);
         exportQueue.addEventListener(_121.FAIL,this._3660);
         exportQueue.run();
      }
      
      public function _12575() : void
      {
         if(this._3670 == null)
         {
            return;
         }
         if(this._3670.exportSuperType == _720.SUPERTYPE_DATA && this._3670.exportType == _720.EXPORT_TYPE_EGRETFAST)
         {
            if(this._3670._10577())
            {
               Alert.show(tr("export.checkMesh"),"",null,function():void
               {
                  _3670.exportType = _720.EXPORT_TYPE_DRAGONBONES;
                  if(_3661)
                  {
                     _3661.refresh();
                  }
               });
            }
         }
      }
      
      public function get _3608() : _765
      {
         return _3639;
      }
      
      private function get _3443() : _596
      {
         return _1407.getInstance(_596) as _596;
      }
      
      private function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
      
      private function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
   }
}

