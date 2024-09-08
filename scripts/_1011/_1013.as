package _1011
{
   import _1033._12500;
   import _1038._1037;
   import _1045.Button;
   import _1045.CheckBox;
   import _1045.DropDownList;
   import _1045.Group;
   import _1045.Label;
   import _1045.TabBar;
   import _1045._1081;
   import _1045._1082;
   import _1045._1107;
   import _1177.UIEvent;
   import _1185._1189;
   import _1185._1197;
   import _127._128;
   import _127._14047;
   import _127._14048;
   import _127._171;
   import _1374.TextInput;
   import _1404._1407;
   import _14079._14078;
   import _14079._14080;
   import _14079._14081;
   import _14079._14083;
   import _14115._14114;
   import _14115._14116;
   import _14115._14118;
   import _1529._1528;
   import _1529._1530;
   import _472._12461;
   import _477.ExportController;
   import _51._50;
   import _636.ExportEvent;
   import _721._720;
   import _834._10620;
   import _97._125;
   import egret.utils.FileUtil;
   import egret.utils.SystemInfo;
   import egret.utils.tr;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.filesystem.File;
   import flash.text.TextFormat;
   
   public class _1013 extends _171
   {
      public static const _14765:int = 100;
      
      public static const MAX_EXPORT_NAME_LENGTH:int = 128;
      
      public static var _13166:int = 80;
      
      public static const PROJECT_DROP_INDEX:int = 0;
      
      public static const APPOINT_DROP_INDEX:int = 1;
      
      public static const UNAPPOINT_DROP_INDEX:int = 2;
      
      private const PREVIEW_DB:String = "preview_db";
      
      private const PREVIEW_IAMGES:String = "preview_images";
      
      private const PREVIEW_SINGLEIMAGE:String = "preview_singleImage";
      
      public var _7099:_1081;
      
      public var _5554:Button;
      
      public var _5555:Button;
      
      private var _7084:Label;
      
      private var _7061:_720;
      
      private var _7058:_14047;
      
      private var _14889:DropDownList;
      
      private var _14864:_14078;
      
      private var _14881:_14081;
      
      private var _14882:_14080;
      
      private var _14894:_14083;
      
      private var cacheDB:_14078;
      
      private var cacheIMG:_14081;
      
      private var cacheHTML:_14080;
      
      private var _10906:TabBar;
      
      private var _10899:_1107;
      
      private var _14891:ExportDBPanel;
      
      private var _10908:ExportImgPanel;
      
      private var _12827:_12488;
      
      private var _14888:_14114;
      
      private var _14885:_14116;
      
      private var _14883:_14118;
      
      private var _10907:Button;
      
      private var _10903:Label;
      
      private var _10905:Label;
      
      private var _10902:TextInput;
      
      private var _10901:Label;
      
      private var _7059:Button;
      
      private var _10873:CheckBox;
      
      private var _10875:CheckBox;
      
      private var _7115:_128;
      
      private var _12815:Group;
      
      private var _12812:Boolean;
      
      private var _2587:Group;
      
      private var _2585:Group;
      
      private var projectPath:String;
      
      private var _14896:int;
      
      private var _14895:int;
      
      private var _14892:int;
      
      private var w:int;
      
      private var _14890:String;
      
      public function _1013(param1:_720)
      {
         this._12569 = _1407.getInstance(_12461);
         super();
         if(_1528.language == _1530.en_US)
         {
            _13166 = 90;
         }
         else if(_1528.language == _1530.ru_RF)
         {
            _13166 = 120;
         }
         this.w = 550;
         this._14896 = 550;
         this._14895 = 740;
         this._14892 = 340;
         if(_1528.language == _1530.zh_CN)
         {
            if(SystemInfo.isMacOS)
            {
               this.w = this._14896 = 600;
            }
         }
         if(_1528.language == _1530.en_US)
         {
            this.w = this._14896 = SystemInfo.isMacOS ? 700 : 550;
         }
         else if(_1528.language == _1530.ru_RF)
         {
            this.w = this._14896 = SystemInfo.isMacOS ? 750 : 600;
            this._14895 = 740;
         }
         this.minWidth = this._14896;
         this.minHeight = this._14895;
         this.title = tr("ExportProjectWindow.Title");
         this.width = this.w;
         this.height = this._14895;
         this._7061 = param1;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         _2512 = _125._2402(new _1189());
         (_2512.layout as _1189).gap = 10;
         (_2512.layout as _1189)._2419 = 7;
         (_2512.layout as _1189)._2416 = 7;
         (_2512.layout as _1189)._2420 = 15;
         (_2512.layout as _1189)._2410 = 0;
         this._2587 = new Group();
         this._2587.left = 0;
         this._2587.width = this.w - 39;
         this._2587.percentHeight = 100;
         var _loc1_:_1082 = new _1082();
         _loc1_._2529 = 0;
         _loc1_._2564 = 1;
         _loc1_._2562 = 1;
         _loc1_._2563 = 1777701;
         _loc1_.top = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 58;
         this._2587.addElementAt(_loc1_,0);
         var _loc2_:_1197 = new _1197();
         _loc2_._2419 = 0;
         _loc2_._2416 = 0;
         _loc2_._2420 = 0;
         _loc2_._2410 = 0;
         var _loc3_:Group = new Group();
         _loc3_.percentWidth = 100;
         _loc3_.layout = _loc2_;
         this._2587.addElement(_loc3_);
         _2512.addElement(this._2587);
         this._10906 = new TabBar();
         this._10906.skinName = _10620;
         var _loc4_:_1037;
         (_loc4_ = new _1037()).source = [tr("Export.superType.data"),tr("Export.superType.image"),tr("Export.superType.webpage")];
         this._10906.dataProvider = _loc4_;
         this._10906.percentWidth = 100;
         _loc3_.addElement(this._10906);
         this._10906.selectedIndex = this._7061.exportSuperType;
         var _loc5_:Group = new Group();
         var _loc6_:_1197;
         (_loc6_ = new _1197())._2420 = 15;
         _loc6_._2419 = 16;
         _loc6_._2416 = 16;
         _loc6_.gap = 5;
         _loc5_.layout = _loc6_;
         _loc5_.percentWidth = 100;
         _loc3_.addElement(_loc5_);
         var _loc7_:Group;
         (_loc7_ = _125._2414(0)).percentWidth = 100;
         var _loc8_:Label;
         (_loc8_ = new Label()).width = _14765;
         _loc8_.text = tr("Export.target.label");
         var _loc9_:Group;
         (_loc9_ = new Group()).percentWidth = 100;
         this._10903 = new Label();
         this._10907 = new Button();
         this._10907.label = tr("Export.target.change");
         this._10907.right = 0;
         this._10907.width = _13166;
         _loc7_.addElement(_loc8_);
         _loc7_.addElement(this._10903);
         _loc9_.addElement(this._10907);
         _loc7_.addElement(_loc9_);
         _loc5_.addElement(_loc7_);
         var _loc10_:Group;
         (_loc10_ = new Group()).height = 2;
         _loc5_.addElement(_loc10_);
         var _loc11_:_12500 = new _12500();
         _loc5_.addElement(_loc11_);
         this._10899 = new _1107();
         this._10899.percentWidth = 100;
         this._10899.percentHeight = 100;
         this._14891 = new ExportDBPanel();
         this._10908 = new ExportImgPanel();
         this._12827 = new _12488();
         this._10899.addElement(this._14891);
         this._10899.addElement(this._10908);
         this._10899.addElement(this._12827);
         _loc5_.addElement(this._10899);
         this._10899.selectedIndex = this._7061.exportSuperType;
         var _loc12_:Group = _125._2414(0);
         var _loc13_:_1189;
         (_loc13_ = _loc12_.layout as _1189)._2416 = 10 + _1013._13166;
         _loc12_.percentWidth = 100;
         var _loc14_:Label;
         (_loc14_ = new Label()).width = _14765;
         _loc14_.text = tr("Export.export_to");
         var _loc15_:Array = [tr("Export.projectDic"),tr("Export.appointDic"),tr("Export.exportAppointDic")];
         this._14889 = new DropDownList();
         this._14889.percentWidth = 100;
         this._14889.dataProvider = new _1037(_loc15_);
         _loc12_.addElement(_loc14_);
         _loc12_.addElement(this._14889);
         _loc5_.addElement(_loc12_);
         var _loc16_:Group;
         (_loc16_ = _125._2414(0)).percentWidth = 100;
         var _loc17_:Label;
         (_loc17_ = new Label()).width = _14765;
         _loc17_.text = tr("Export.outputPath");
         this._7058 = new _14047();
         this._7058.skinName = _14048;
         this._7058.percentWidth = 100;
         this._7059 = _125._2405();
         this._7059.width = _13166;
         this._7059.right = 0;
         var _loc18_:Group = new Group();
         _loc18_.addElement(this._7059);
         _loc16_.addElement(_loc17_);
         _loc16_.addElement(this._7058);
         var _loc19_:Group;
         (_loc19_ = new Group()).width = 10;
         _loc16_.addElement(_loc19_);
         _loc16_.addElement(_loc18_);
         _loc5_.addElement(_loc16_);
         var _loc20_:Group = _125._2414(0);
         var _loc21_:_1189;
         (_loc21_ = _loc20_.layout as _1189)._2416 = 10 + _1013._13166;
         _loc20_.percentWidth = 100;
         this._10901 = new Label();
         this._10901.text = tr("Export.outFile.label");
         this._10901.width = _14765;
         this._10902 = new TextInput();
         this._10902.restrict = "^/\\:*?\"\'<>| .@#$%&!~^";
         this._10902.maxChars = MAX_EXPORT_NAME_LENGTH;
         this._10902.percentWidth = 100;
         _loc20_.addElement(this._10901);
         _loc20_.addElement(this._10902);
         _loc5_.addElement(_loc20_);
         var _loc22_:Label;
         (_loc22_ = new Label()).width = _14765;
         _loc22_.text = tr("Export.outFile.fileNames");
         this._10905 = new Label();
         this._10905.leading = 4;
         var _loc23_:TextFormat = this._10905._8054();
         var _loc24_:int = int(_loc23_.size);
         if(_loc24_ <= 0)
         {
            _loc24_ = 12;
         }
         this._10905.height = (_loc24_ + this._10905.leading + 2) * 3;
         this._10905.percentWidth = 100;
         this._10905._6541 = true;
         var _loc25_:Group;
         (_loc25_ = _125._2403(0)).percentWidth = 100;
         var _loc26_:_1189;
         (_loc26_ = _loc25_.layout as _1189)._2416 = 72;
         var _loc27_:Group;
         (_loc27_ = _125._2404()).percentWidth = 100;
         this._12815 = _125._2403(0);
         this._12815.percentWidth = 100;
         var _loc28_:_1189;
         (_loc28_ = this._12815.layout as _1189)._2419 = 0;
         _loc28_._2420 = 0;
         _loc28_._2410 = 0;
         _loc28_._2416 = 0;
         _loc28_.gap = 5;
         this._12815.percentWidth = 100;
         this._10873 = new CheckBox();
         this._10873.label = tr("Export.include.data");
         this._10875 = new CheckBox();
         this._10875.label = tr("Export.include.texture");
         this._7115 = new _128();
         this._7115.label = tr("Export.zip");
         this._12815.addElement(this._10873);
         this._12815.addElement(this._10875);
         this._12815.addElement(this._7115);
         _loc27_.addElement(this._12815);
         _loc27_.addElement(this._10905);
         _loc25_.addElement(_loc22_);
         _loc25_.addElement(_loc27_);
         _loc5_.addElement(_loc25_);
         this._7084 = new Label();
         this._7084.text = tr("Export.waiting");
         this._7084.visible = false;
         var _loc29_:Group;
         (_loc29_ = new Group()).height = 16;
         var _loc30_:Group;
         (_loc30_ = new Group()).height = 38;
         _loc5_.addElement(this._7084);
         _loc5_.addElement(_loc29_);
         _loc5_.addElement(_loc30_);
         this._2585 = new Group();
         this._2585.percentWidth = 100;
         this._2585.percentHeight = 100;
         this._14888 = new _14114();
         this._14885 = new _14116();
         this._14883 = new _14118();
         var _loc31_:Group;
         (_loc31_ = _125._11551()).percentWidth = 100;
         _loc31_.percentHeight = 100;
         var _loc32_:_1189;
         (_loc32_ = _loc31_.layout as _1189).padding = 20;
         _loc32_._2410 = 15;
         _loc32_.gap = 50;
         this._5554 = _125._2399();
         this._5555 = _125._2406();
         _loc31_.addElement(this._5554);
         _loc31_.addElement(this._5555);
         addElement(_loc31_);
         addElement(_2512);
         this._12826();
         this._12824();
         this.refresh();
         this.refreshTargetName();
         this.refreshOutputFiles();
      }
      
      private function _12826() : void
      {
         this.projectPath = new File(this._7061.ouputPath).nativePath;
         this._14864 = this._3602._14464;
         this._14881 = this._3602._14463;
         this._14882 = this._3602._14461;
         this._14891._14464 = this._14864;
         this._10908._14463 = this._14881;
         this._12827._14461 = this._14882;
         this._14891._3238 = this._7061;
         this._10908._3238 = this._7061;
         this._12827._3238 = this._7061;
         this._14888._4906();
         this._14885._4906();
         this._14883._4906();
         this._14888._14893(335,390);
         this._14885._14893(335,420);
         this._14883._14893(335,440);
         this._10902.text = this._7061.outputName;
      }
      
      public function _14454() : void
      {
         if(this._10906.selectedIndex == _720.SUPERTYPE_DATA)
         {
            if(this._14891)
            {
               this._14891._14454();
            }
         }
         else if(this._10906.selectedIndex == _720.SUPERTYPE_IMAGE)
         {
            if(this._10908)
            {
               this._10908._14454();
            }
         }
      }
      
      private function _12821(param1:Event) : void
      {
         this._12812 = true;
         this._7058.toolTip = this._7058.text;
      }
      
      private function _7100(param1:FocusEvent) : void
      {
         var newPath:String = null;
         var e:FocusEvent = param1;
         var index:int = 0;
         try
         {
            newPath = new File(this._7058.text).nativePath;
            if(newPath != this.projectPath)
            {
               index = APPOINT_DROP_INDEX;
            }
         }
         catch(e:Error)
         {
            index = PROJECT_DROP_INDEX;
            newPath = projectPath;
         }
         this._14884(index,newPath);
      }
      
      private function _14884(param1:int, param2:String) : void
      {
         this._14889.selectedIndex = param1;
         this._14894._14673 = param1;
         this._14894._14674 = param2;
         this._14887(param2);
      }
      
      private function _12824() : void
      {
         this._10906.addEventListener(UIEvent.CREATION_COMPLETE,this.ontabBarCreate);
         this._10906.addEventListener(Event.CHANGE,this.onTabBarChange);
         this._10907.addEventListener(MouseEvent.CLICK,this.onTargetClick);
         this._10902.addEventListener(Event.CHANGE,this._10898);
         this._5555.addEventListener(MouseEvent.CLICK,_2517);
         this._5554.addEventListener(MouseEvent.CLICK,this._7060);
         this._7059.addEventListener(MouseEvent.CLICK,this._7057);
         this._10873.addEventListener(Event.CHANGE,this._12810);
         this._10875.addEventListener(Event.CHANGE,this._12819);
         this._7115.addEventListener(Event.CHANGE,this._12825);
         this._14889.addEventListener(Event.CHANGE,this._14886);
         this._7058.addEventListener(Event.CHANGE,this._12821);
         this._7058.addEventListener(FocusEvent.FOCUS_OUT,this._7100);
         addEventListener(ExportEvent.GIF_REPEAT,this.onGifRepeatChange);
         addEventListener(ExportEvent.GIF_QUALITY,this.onGifQualityChange);
         addEventListener(ExportEvent.IS_PREVIEW,this.onIsPreViewChange);
         addEventListener(ExportEvent.HAS_BG_COLOR,this.onHasBgColor);
         addEventListener(ExportEvent.BG_COLOR_CHANGE,this.onBGColorChange);
         addEventListener(ExportEvent.SCALE_CHANGE,this._4316);
         addEventListener(ExportEvent.FRAME_RATE_CHANGE,this._4613);
         addEventListener(ExportEvent.IMAGE_TYPE_CHANGE,this._7095);
         addEventListener(ExportEvent.DATA_TYPE_CHANGE,this.onDataTypeChange);
         addEventListener(ExportEvent.DATA_VERSION_CHANGE,this._7091);
         addEventListener(ExportEvent.EXPORT_TYPE_CHANGE,this._3634);
         addEventListener(ExportEvent.IS_ZIP,this.onIsZip);
         addEventListener(ExportEvent.OPEN_TEXTURE_SETTING,this._7062);
         addEventListener(ExportEvent.ONLY_CUR_ANIMATION,this.onOnlyCurAnimation);
         addEventListener(ExportEvent.EXPORT_DATA,this._10869);
         addEventListener(ExportEvent.EXPORT_TEXTURE,this.onExportTextureChange);
         addEventListener(ExportEvent.IMAGE_PACKAGE_TYPE_CHANGE,this.onImagesPackageTypeChange);
         addEventListener(ExportEvent.IMAGE_FORMAT_CHANGE,this.onImagesFormatChange);
         addEventListener(ExportEvent.IMAGE_SINGLE_CHANGE,this.onImagesSingleChange,false,1);
         addEventListener(ExportEvent.SINGLE_FRAME_CHANGE,this._12809);
         addEventListener(ExportEvent.ANIMATIONS_CHANGE,this._4390);
         addEventListener(ExportEvent.REFRESH_PREVIEW_SINGLE,this._12813);
         addEventListener(ExportEvent.WEB_COLOR_CHANGE,this._12817);
         addEventListener(ExportEvent.WEB_SCALE_CHANGE,this._12816);
      }
      
      private function _12816(param1:ExportEvent) : void
      {
         this._7061.scale = Number(param1.data);
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function _12817(param1:ExportEvent) : void
      {
         this._7061._12584 = uint(param1.data);
      }
      
      private function _4390(param1:ExportEvent) : void
      {
         this.refreshOutputFiles();
      }
      
      private function _12809(param1:ExportEvent) : void
      {
         this._7061.singleFrameIndex = param1.data;
         this.refreshOutputFiles();
         dispatchEvent(new ExportEvent(ExportEvent.PREVIEW_SINGLE_IMAGE));
      }
      
      private function _12813(param1:ExportEvent) : void
      {
         dispatchEvent(new ExportEvent(ExportEvent.PREVIEW_SINGLE_IMAGE));
      }
      
      private function _12825(param1:Event) : void
      {
         this._14864.isZip = this._7115.selected;
         dispatchEvent(new ExportEvent(ExportEvent.IS_ZIP,this._7115.selected));
      }
      
      private function _12819(param1:Event) : void
      {
         this._14864._14493 = this._10875.selected;
         dispatchEvent(new ExportEvent(ExportEvent.EXPORT_TEXTURE,this._10875.selected));
      }
      
      private function _12810(param1:Event) : void
      {
         this._14864._14677 = this._10873.selected;
         dispatchEvent(new ExportEvent(ExportEvent.EXPORT_DATA,this._10873.selected));
      }
      
      private function _14886(param1:Event = null) : void
      {
         var _loc2_:String = "";
         var _loc3_:int = this._14889.selectedIndex;
         if(_loc3_ == 0)
         {
            _loc2_ = this.projectPath;
         }
         else if(_loc3_ == 1)
         {
            _loc2_ = this._7061._14674;
            if(!_loc2_)
            {
               _loc2_ = this.projectPath;
            }
            this._7058._2581();
         }
         this._14884(_loc3_,_loc2_);
      }
      
      private function _14887(param1:String) : void
      {
         this._7058.scrollH = 0;
         this._7058.text = param1;
         if(this._14889.selectedIndex == 0)
         {
            this._7058.enabled = false;
            this._7059.enabled = true;
         }
         else if(this._14889.selectedIndex == 1)
         {
            this._7058.enabled = true;
            this._7059.enabled = true;
            this._7058.toolTip = param1;
         }
         else
         {
            this._7058.enabled = false;
            this._7059.enabled = false;
         }
      }
      
      private function _10898(param1:Event) : void
      {
         this._7061.outputName = this._10902.text;
         if(this._7061.outputName.length > MAX_EXPORT_NAME_LENGTH)
         {
            this._7061.outputName = this._7061.outputName.substr(0,MAX_EXPORT_NAME_LENGTH);
         }
         this.refreshOutputFiles();
         if(this._10900(this._10902.text))
         {
            this._10905.textColor = 16724787;
            this._10905.text = tr("Export.illegal.fileName");
         }
         else
         {
            this._10905.textColor = 16777215;
         }
      }
      
      private function _10900(param1:String) : Boolean
      {
         var _loc2_:int = int(param1.search(/[\/\\:*?\"' <>|.@#$%\^&!~]/));
         return _loc2_ != -1;
      }
      
      private function onTargetClick(param1:MouseEvent) : void
      {
         var w:_10628 = null;
         var w1:_12486 = null;
         var e:MouseEvent = param1;
         if(this._7061.exportSuperType == _720.SUPERTYPE_DATA || this._7061.exportSuperType == _720.SUPERTYPE_HTML)
         {
            w = new _10628(this._7061,this.refreshTargetName);
            w.addEventListener(Event.CLOSE,function(param1:Event):void
            {
               dispatchEvent(new Event(Event.CHANGE));
            });
            w.addEventListener(Event.CLOSE,function(param1:Event):void
            {
               if(_7061.exportSuperType == _720.SUPERTYPE_HTML)
               {
                  refresh();
               }
            });
            w.open();
         }
         else if(this._7061.exportSuperType == _720.SUPERTYPE_IMAGE)
         {
            w1 = new _12486(this._7061,this.refreshTargetName);
            w1.addEventListener(Event.CLOSE,function(param1:Event):void
            {
               refresh();
               refreshOutputFiles();
               dispatchEvent(new ExportEvent(ExportEvent.PREVIEW_SINGLE_IMAGE));
            });
            w1.open();
         }
      }
      
      public function _12788(param1:int, param2:int) : void
      {
         if(this._10908)
         {
            this._10908._12788(param1,param2);
         }
      }
      
      private function onImagesSingleChange(param1:ExportEvent) : void
      {
         this._7061.singleFrame = Boolean(param1.data);
         this.refreshOutputFiles();
      }
      
      private function onImagesFormatChange(param1:ExportEvent) : void
      {
         this._7061.imageFormat = int(param1.data);
         this.refreshOutputFiles();
      }
      
      private function onImagesPackageTypeChange(param1:ExportEvent) : void
      {
         this._7061.imagesPackageType = int(param1.data);
         this.refreshOutputFiles();
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function onExportTextureChange(param1:ExportEvent) : void
      {
         this._7061.exportTexture = Boolean(param1.data);
         this.refreshOutputFiles();
      }
      
      private function _3634(param1:ExportEvent) : void
      {
         this.refreshTargetName();
         this.refreshOutputFiles();
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function _10869(param1:ExportEvent) : void
      {
         this._7061.exportData = Boolean(param1.data);
         this.refreshOutputFiles();
      }
      
      private function refreshBtns() : void
      {
         if(this._7061.exportSuperType == _720.SUPERTYPE_DATA)
         {
            this._5554.enabled = (this._7061.exportData || this._7061.exportTexture) && this._7061.outputName != null && this._7061.outputName != "" && !this._10900(this._7061.outputName);
         }
         else if(this._7061.exportSuperType == _720.SUPERTYPE_HTML)
         {
            this._5554.enabled = this._7061.outputName != null && this._7061.outputName != "" && !this._10900(this._7061.outputName);
         }
         else
         {
            this._5554.enabled = true;
         }
      }
      
      private function ontabBarCreate(param1:UIEvent) : void
      {
      }
      
      private function onTabBarChange(param1:Event) : void
      {
         this._10899.selectedIndex = this._10906.selectedIndex;
         this._7061.exportSuperType = this._10906.selectedIndex;
         if(this._10906.selectedIndex == _720.SUPERTYPE_DATA)
         {
            this._12815.visible = true;
            this._12815.includeInLayout = true;
         }
         else if(this._10906.selectedIndex == _720.SUPERTYPE_IMAGE)
         {
            this._12815.visible = false;
            this._12815.includeInLayout = false;
         }
         else if(this._10906.selectedIndex == _720.SUPERTYPE_HTML)
         {
            this._12815.visible = false;
            this._12815.includeInLayout = false;
         }
         this.switchTabBar();
         this.removePreviewUI();
         if(this._10906.selectedIndex == 2)
         {
            this._12827._3238 = this._7061;
         }
         else if(this._10906.selectedIndex == 1)
         {
            this._10908._14863 = this._14881.isPreview;
            this._10908.refresh();
         }
         else
         {
            this._14891._14863 = this._14864.isPreview;
            this._14891.refresh();
         }
         if(this._7061.exportSuperType == _720.SUPERTYPE_DATA)
         {
            this._10898(null);
         }
         else
         {
            this._7084.visible = false;
         }
         this.refreshTargetName();
         this.refreshOutputFiles();
         if(this._10906.selectedIndex != 0)
         {
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      private function onOnlyCurAnimation(param1:ExportEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1.data)
         {
            this._7061.exportAnimations.length = 0;
            if(this._7061.curAnimation)
            {
               this._7061.exportAnimations.push(this._7061.curAnimation);
            }
         }
         else
         {
            this._7061.exportAnimations.length = 0;
            _loc2_ = 0;
            _loc3_ = int(this._7061.allAnimations.length);
            while(_loc2_ < _loc3_)
            {
               this._7061.exportAnimations.push(this._7061.allAnimations[_loc2_]);
               _loc2_++;
            }
         }
         dispatchEvent(new Event(Event.CHANGE));
         this.refreshOutputFiles();
      }
      
      private function _7062(param1:ExportEvent) : void
      {
         (_1407.getInstance(ExportController) as ExportController)._3631();
      }
      
      private function onIsZip(param1:ExportEvent) : void
      {
         this._7061.isZip = Boolean(param1.data);
         this.refreshOutputFiles();
      }
      
      private function onDataTypeChange(param1:ExportEvent) : void
      {
         this._7061.dataType = param1.data as String;
      }
      
      private function _7091(param1:ExportEvent) : void
      {
         this._7061.version = param1.data;
      }
      
      private function _7095(param1:ExportEvent) : void
      {
         this._7061.imageType = param1.data as String;
         this.refreshOutputFiles();
         this.refreshPreviewUI(this._14864.isPreview);
      }
      
      private function _4613(param1:ExportEvent) : void
      {
         this._7061.exportFrameRate = int(param1.data);
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function _4316(param1:ExportEvent) : void
      {
         this._7061.scale = Number(param1.data);
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function onBGColorChange(param1:ExportEvent) : void
      {
         this._7061.backgroundColor = uint(param1.data);
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function onGifRepeatChange(param1:ExportEvent) : void
      {
         this._7061.repeat = int(param1.data);
      }
      
      private function onGifQualityChange(param1:ExportEvent) : void
      {
         this._7061.quality = int(param1.data);
      }
      
      private function onHasBgColor(param1:ExportEvent) : void
      {
         this._7061.hasBackground = Boolean(param1.data);
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function onIsPreViewChange(param1:ExportEvent) : void
      {
         var _loc2_:Object = param1.data as Object;
         if(!_loc2_.open)
         {
            this.removePreviewUI();
            return;
         }
         var _loc3_:Boolean = Boolean(_loc2_.isPreview);
         if(_loc2_.target == "ExportDBPanel")
         {
            this._14864.isPreview = _loc3_;
         }
         else
         {
            this._14881.isPreview = _loc3_;
         }
         this.refreshPreviewUI(_loc3_);
      }
      
      private function refreshPreviewUI(param1:Boolean) : void
      {
         if(param1)
         {
            if(this._7061.exportSuperType == _720.SUPERTYPE_DATA)
            {
               if(this._7061.imageType == _720.IMAGE_TYPE_FILES)
               {
                  this._14890 = this.PREVIEW_IAMGES;
               }
               else
               {
                  this._14890 = this.PREVIEW_DB;
               }
            }
            else
            {
               if(this._7061.exportSuperType != _720.SUPERTYPE_IMAGE)
               {
                  this.removePreviewUI();
                  return;
               }
               this._14890 = this.PREVIEW_SINGLEIMAGE;
            }
            this.changePreview();
         }
         else
         {
            this.removePreviewUI();
         }
      }
      
      private function removePreviewUI() : void
      {
         this.doubleClickEnabled = false;
         this.resizable = false;
         this.width = this.w - 8;
         this.minWidth = this.w - 8;
         if(this._2585.parent)
         {
            _2512.removeElement(this._2585);
         }
      }
      
      private function changePreview() : void
      {
         this.doubleClickEnabled = true;
         this.resizable = true;
         this.width = this.w + this._14892;
         this.minWidth = this.w + this._14892;
         this.height = this._14895;
         this._2585._2426();
         switch(this._14890)
         {
            case this.PREVIEW_IAMGES:
               this._2585.addElement(this._14885);
               dispatchEvent(new Event(Event.CHANGE));
               break;
            case this.PREVIEW_DB:
               if(this._8574)
               {
                  this._14891.open();
               }
               this._2585.addElement(this._14888);
               dispatchEvent(new Event(Event.CHANGE));
               break;
            case this.PREVIEW_SINGLEIMAGE:
               this._2585.addElement(this._14883);
               dispatchEvent(new ExportEvent(ExportEvent.PREVIEW_SINGLE_IMAGE));
         }
         _2512.addElement(this._2585);
         _7290();
      }
      
      public function previewImages() : void
      {
         switch(this._14890)
         {
            case this.PREVIEW_IAMGES:
               dispatchEvent(new ExportEvent(ExportEvent.PREVIEW_IMAGES));
         }
      }
      
      public function _3664(param1:Vector.<BitmapData>) : void
      {
         if(param1 == null || param1.length == 0)
         {
            return;
         }
         this._14888._2894(this._3602._3608,param1);
      }
      
      public function preViewImagesData(param1:Vector.<BitmapData>) : void
      {
         if(param1 == null || param1.length == 0)
         {
            return;
         }
         this._14885._2894(param1);
      }
      
      public function singleSingleImagePreview(param1:Vector.<BitmapData>) : void
      {
         if(param1 == null || param1.length == 0)
         {
            return;
         }
         var _loc2_:BitmapData = param1[0];
         if(_loc2_ == null)
         {
            return;
         }
         this._14883._2894(_loc2_);
      }
      
      private function _7057(param1:MouseEvent) : void
      {
         var p:String = null;
         var e:MouseEvent = param1;
         try
         {
            p = this._7058.text;
            if(!FileUtil.exists(p))
            {
               p = "";
            }
            FileUtil.browseForOpen(function(param1:File):void
            {
               if(!param1)
               {
                  return;
               }
               var _loc2_:String = FileUtil.escapeUrl(param1.nativePath);
               var _loc3_:int = PROJECT_DROP_INDEX;
               if(param1.nativePath != projectPath)
               {
                  _loc3_ = APPOINT_DROP_INDEX;
               }
               _14884(_loc3_,_loc2_);
            },3,null,null,p);
         }
         catch(e:Error)
         {
         }
      }
      
      public function _14455(param1:Object) : void
      {
         this._14894[param1.type] = param1.value;
      }
      
      override public function open(param1:Boolean = true) : void
      {
         super.open(param1);
         ExportController._14446 = false;
         if(this._7061.exportSuperType == _720.SUPERTYPE_DATA)
         {
            this._14891.open();
         }
      }
      
      public function refresh() : void
      {
         this.switchTabBar();
         if(this._7061.exportSuperType == _720.SUPERTYPE_DATA)
         {
            this._14891.refresh();
         }
         else if(this._7061.exportSuperType == _720.SUPERTYPE_IMAGE)
         {
            this._10908.refresh();
         }
         else if(this._7061.exportSuperType == _720.SUPERTYPE_HTML)
         {
            this._12827.refresh();
         }
         this._10873.selected = this._7061.exportData;
         this._10875.selected = this._7061.exportTexture;
         this._7115.selected = this._7061.isZip;
      }
      
      private function switchTabBar() : void
      {
         if(this._10906.selectedIndex == _720.SUPERTYPE_DATA)
         {
            this._14894 = this._14864;
            this._7061._14674 = this._14864._14438;
            this._7061._14673 = this._14864._14678;
            this._7061.exportData = this._14864._14677;
            this._7061.exportTexture = this._14864._14493;
            this._7061.isZip = this._14864.isZip;
            this._14891._14863 = this._14864.isPreview;
         }
         else if(this._10906.selectedIndex == _720.SUPERTYPE_IMAGE)
         {
            this._14894 = this._14881;
            this._7061._14674 = this._14881._14438;
            this._7061._14673 = this._14881._14678;
            this._10908._14863 = this._14881.isPreview;
         }
         else if(this._10906.selectedIndex == _720.SUPERTYPE_HTML)
         {
            this._14894 = this._14882;
            this._7061.scale = this._14882._12585;
            this._7061._14674 = this._14882._14438;
            this._7061._14673 = this._14882._14678;
            this._7061.hasBackground = this._14864._14679;
            this._7061.backgroundColor = this._14864.bgColor;
         }
         this._14889.selectedIndex = this._7061._14673;
         this._14886();
      }
      
      private function _7060(param1:MouseEvent) : void
      {
         var _14438:String = null;
         var e:MouseEvent = param1;
         var startExport:Function = function():void
         {
            _720._3650 = _12812 ? _7061.ouputPath : null;
            _2512.mouseChildren = false;
            _2512.mouseEnabled = false;
            _5554.enabled = false;
            _5555.enabled = false;
            _7084.text = "";
            _7084.visible = true;
            _7061._12582 = false;
            _3602._10725();
         };
         if(this._14894._14673 == UNAPPOINT_DROP_INDEX)
         {
            FileUtil.browseForOpen(function(param1:File):void
            {
               if(!param1)
               {
                  return;
               }
               var _loc2_:String = FileUtil.escapeUrl(param1.nativePath);
               _7061.ouputPath = _loc2_;
               startExport();
            },3,null,null);
         }
         else
         {
            this._7061.ouputPath = this._7058.text;
            startExport();
         }
      }
      
      public function _3659() : void
      {
         _2512.mouseChildren = true;
         _2512.mouseEnabled = true;
         this._5554.enabled = true;
         this._5555.enabled = true;
         this._7084.visible = false;
      }
      
      public function _3662(param1:Number) : void
      {
         if(this._7061.exportSuperType == _720.SUPERTYPE_IMAGE && this._7061.imageFormat == _720.IMAGES_FORMAT_GIF)
         {
            return;
         }
         this._7084.text = tr("Export.progress",int(param1 * 100));
      }
      
      private function get _3602() : ExportController
      {
         return _1407.getInstance(ExportController) as ExportController;
      }
      
      public function _5100(param1:String) : void
      {
         this._7084.text = param1;
      }
      
      private function refreshTargetName() : void
      {
         var _loc1_:String = null;
         var _loc2_:_50 = null;
         if(this._7061.exportSuperType == _720.SUPERTYPE_DATA || this._7061.exportSuperType == _720.SUPERTYPE_HTML)
         {
            this._10907.enabled = true;
            if(this._7061.exportType == _720.EXPORT_TYPE_MOVIECLIP)
            {
               this._10903.text = this._7061.openedArmatures[0];
               this._10907.enabled = false;
            }
            else if(this._7061._10711.length == 1)
            {
               this._10903.text = this._7061._10711[0];
            }
            else
            {
               switch(this._7061.targetType)
               {
                  case _720.TARGET_ALL:
                     this._10903.text = tr("Export.target.all");
                     break;
                  case _720.TARGET_OPENED:
                     this._10903.text = tr("Export.target.opened");
                     break;
                  case _720.TARGET_SELECTED:
                     this._10903.text = tr("Export.target.selected");
                     break;
                  case _720.TARGET_CUSTOM:
                     this._10903.text = tr("Export.target.custom");
               }
            }
         }
         else if(this._7061.exportSuperType == _720.SUPERTYPE_IMAGE)
         {
            _loc1_ = this._7061._10711.length == 1 ? this._7061._10711[0] : this._7061.openedArmatures[0];
            this._10903.text = _loc1_;
            if(this._7061.dragonBonesVO)
            {
               _loc2_ = this._7061.dragonBonesVO._2107(_loc1_);
               if(_loc2_)
               {
                  this._7061._2000 = _loc2_._2000;
               }
            }
            this._10907.enabled = true;
         }
      }
      
      private function refreshOutputFiles() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc1_:Array = [];
         if(this._7061.exportType == _720.EXPORT_TYPE_DRAGONBONES || this._7061.exportType == _720.EXPORT_TYPE_EGRETFAST || this._7061.exportType == _720.EXPORT_TYPE_BINARY)
         {
            this._7115.visible = true;
         }
         else
         {
            this._7115.visible = false;
         }
         if(this._10906.selectedIndex == 1)
         {
            this._10901.visible = this._10901.includeInLayout = false;
            this._10902.visible = this._10902.includeInLayout = false;
         }
         else
         {
            this._10901.visible = this._10901.includeInLayout = true;
            this._10902.visible = this._10902.includeInLayout = true;
         }
         if(this._7061.exportSuperType == _720.SUPERTYPE_DATA)
         {
            if(this._7061.exportType == _720.EXPORT_TYPE_DRAGONBONES)
            {
               if(this._7061.exportData)
               {
                  if(this._7061.isZip)
                  {
                     _loc1_.push(this._7061.outputName + ".zip");
                  }
                  else
                  {
                     _loc1_.push(this._7061.outputName + "_ske.json");
                  }
               }
               if(this._7061.exportTexture)
               {
                  if(this._7061.isZip)
                  {
                     if(_loc1_.indexOf(this._7061.outputName + ".zip") == -1)
                     {
                        _loc1_.push(this._7061.outputName + ".zip");
                     }
                  }
                  else if(this._7061.imageType == _720.IMAGE_TYPE_TEXTURE)
                  {
                     _loc1_.push(this._7061.outputName + "_tex.json");
                     _loc1_.push(this._7061.outputName + "_tex.png");
                  }
                  else
                  {
                     _loc1_.push(this._7061.outputName + "_texture/");
                  }
               }
            }
            else if(this._7061.exportType == _720.EXPORT_TYPE_SPINE)
            {
               if(this._7061.exportData)
               {
                  _loc1_.push(this._7061.outputName + ".json");
               }
               if(this._7061.exportTexture)
               {
                  if(this._7061.imageType == _720.IMAGE_TYPE_TEXTURE)
                  {
                     _loc1_.push(this._7061.outputName + ".atlas");
                     _loc1_.push(this._7061.outputName + ".png");
                  }
                  else
                  {
                     _loc1_.push(this._7061.outputName + "_texture/");
                  }
               }
            }
            else if(this._7061.exportType == _720.EXPORT_TYPE_EGRETFAST)
            {
               if(this._7061.exportData)
               {
                  if(this._7061.isZip)
                  {
                     _loc1_.push(this._7061.outputName + ".zip");
                  }
                  else
                  {
                     _loc1_.push(this._7061.outputName + "_ske.dbmv");
                  }
               }
               if(this._7061.exportTexture)
               {
                  if(this._7061.isZip)
                  {
                     if(_loc1_.indexOf(this._7061.outputName + ".zip") == -1)
                     {
                        _loc1_.push(this._7061.outputName + ".zip");
                     }
                  }
                  else
                  {
                     _loc1_.push(this._7061.outputName + "_tex.png");
                  }
               }
            }
            else if(this._7061.exportType == _720.EXPORT_TYPE_BINARY)
            {
               if(this._7061.exportData)
               {
                  if(this._7061.isZip)
                  {
                     _loc1_.push(this._7061.outputName + ".zip");
                  }
                  else
                  {
                     _loc1_.push(this._7061.outputName + "_ske.dbbin");
                  }
               }
               if(this._7061.exportTexture)
               {
                  if(this._7061.isZip)
                  {
                     if(_loc1_.indexOf(this._7061.outputName + ".zip") == -1)
                     {
                        _loc1_.push(this._7061.outputName + ".zip");
                     }
                  }
                  else
                  {
                     _loc1_.push(this._7061.outputName + "_tex.json");
                     _loc1_.push(this._7061.outputName + "_tex.png");
                  }
               }
            }
            else if(this._7061.exportType == _720.EXPORT_TYPE_MOVIECLIP)
            {
               if(this._7061.exportData)
               {
                  _loc1_.push(this._7061.outputName + "_mc.json");
               }
               if(this._7061.exportTexture)
               {
                  _loc1_.push(this._7061.outputName + "_tex.png");
               }
            }
         }
         else if(this._7061.exportSuperType == _720.SUPERTYPE_IMAGE)
         {
            _loc4_ = this._7061.curArmature;
            if(this._7061._10711.length == 1)
            {
               _loc4_ = this._7061._10711[0];
            }
            if(this._7061.imageFormat == _720.IMAGES_FORMAT_GIF)
            {
               if(this._7061.singleFrame)
               {
                  if(this._7061.curAnimation == null)
                  {
                     _loc1_.push(_loc4_ + ".gif");
                  }
                  else if(this._7061._13393())
                  {
                     _loc1_.push(_loc4_ + ".gif");
                  }
                  else
                  {
                     _loc1_.push(_loc4_ + "_" + this._7061.singleFrameAnimation + "_" + this._7061.singleFrameIndex + ".gif");
                  }
               }
               else if(this._7061._13393())
               {
                  _loc1_.push(_loc4_ + ".gif");
               }
               else
               {
                  _loc2_ = 0;
                  _loc3_ = int(this._7061.exportAnimations.length);
                  while(_loc2_ < _loc3_)
                  {
                     _loc1_.push(_loc4_ + "_" + this._7061.exportAnimations[_loc2_] + ".gif");
                     _loc2_++;
                  }
               }
            }
            else if(this._7061.imageFormat == _720.IMAGES_FORMAT_PNG)
            {
               if(this._7061.singleFrame)
               {
                  if(this._7061.singleFrameAnimation == null)
                  {
                     _loc1_.push(_loc4_ + ".png");
                  }
                  else if(this._7061._13393())
                  {
                     _loc1_.push(_loc4_ + ".png");
                  }
                  else
                  {
                     _loc1_.push(_loc4_ + "_" + this._7061.singleFrameAnimation + "_" + this._7061.singleFrameIndex + ".png");
                  }
               }
               else if(this._7061.imagesPackageType == _720.IMAGES_PACKAGE_TEXTURE)
               {
                  _loc1_.push(_loc4_ + "_tex.json");
                  _loc1_.push(_loc4_ + "_tex.png");
               }
               else if(this._7061._13393())
               {
                  _loc1_.push(_loc4_ + "_xx.png");
               }
               else
               {
                  _loc2_ = 0;
                  _loc3_ = int(this._7061.exportAnimations.length);
                  while(_loc2_ < _loc3_)
                  {
                     _loc1_.push(_loc4_ + "_" + this._7061.exportAnimations[_loc2_] + "_xx.png");
                     _loc2_++;
                  }
               }
            }
            else if(this._7061.imageFormat == _720.IMAGES_FORMAT_JPG)
            {
               if(this._7061.singleFrame)
               {
                  if(this._7061.curAnimation == null)
                  {
                     _loc1_.push(_loc4_ + ".jpg");
                  }
                  else if(this._7061._13393())
                  {
                     _loc1_.push(_loc4_ + ".jpg");
                  }
                  else
                  {
                     _loc1_.push(_loc4_ + "_" + this._7061.singleFrameAnimation + "_" + this._7061.singleFrameIndex + ".jpg");
                  }
               }
               else if(this._7061.imagesPackageType == _720.IMAGES_PACKAGE_TEXTURE)
               {
                  _loc1_.push(_loc4_ + "_tex.json");
                  _loc1_.push(_loc4_ + "_tex.jpg");
               }
               else if(this._7061._13393())
               {
                  _loc1_.push(_loc4_ + "_xx.jpg");
               }
               else
               {
                  _loc2_ = 0;
                  _loc3_ = int(this._7061.exportAnimations.length);
                  while(_loc2_ < _loc3_)
                  {
                     _loc1_.push(_loc4_ + "_" + this._7061.exportAnimations[_loc2_] + "_xx.jpg");
                     _loc2_++;
                  }
               }
            }
         }
         else if(this._7061.exportSuperType == _720.SUPERTYPE_HTML)
         {
            _loc1_.push(this._7061.outputName + ".html");
         }
         if(_loc1_.length > 3)
         {
            this._10905.text = _loc1_.join(", ");
         }
         else
         {
            this._10905.text = _loc1_.join("\n");
         }
         this.refreshBtns();
      }
      
      override public function close() : void
      {
         this._3602._1657();
         if(this._14891)
         {
            this._14891.close();
         }
         super.close();
      }
   }
}

