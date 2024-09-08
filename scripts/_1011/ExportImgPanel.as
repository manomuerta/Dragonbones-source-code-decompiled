package _1011
{
   import _1033._12500;
   import _1038._1037;
   import _1045.Button;
   import _1045.DropDownList;
   import _1045.Group;
   import _1045.HSlider;
   import _1045.Label;
   import _1045.RadioButton;
   import _1045._1081;
   import _1045._1105;
   import _1177.UIEvent;
   import _1185._1189;
   import _1185._1197;
   import _127._128;
   import _127._14042;
   import _127._151;
   import _127._159;
   import _1374.ColorPicker;
   import _1374.TextInput;
   import _14079._14081;
   import _51._50;
   import _636.DBPanelEvent;
   import _636.ExportEvent;
   import _721._720;
   import _73.SymbolType;
   import _822._10616;
   import _97._125;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class ExportImgPanel extends Group
   {
      private const _14765:int = 100;
      
      private var _7061:_720;
      
      private var _14881:_14081;
      
      private var _7123:Boolean;
      
      private var _7113:TextInput;
      
      private var _7112:_128;
      
      private var backgroundColor:ColorPicker;
      
      private var _7065:Button;
      
      private var _10881:_1081;
      
      private var _10875:_128;
      
      private var _10885:TextInput;
      
      private var _10882:RadioButton;
      
      private var _10883:RadioButton;
      
      private var _10880:_1081;
      
      private var _10886:RadioButton;
      
      private var _10887:RadioButton;
      
      private var _10888:RadioButton;
      
      private var _11195:_1081;
      
      private var _11196:RadioButton;
      
      private var _11197:RadioButton;
      
      private var _11198:Label;
      
      private var _14876:_128;
      
      private var _12793:DropDownList;
      
      private var _12772:DropDownList;
      
      private var _12796:DropDownList;
      
      private var _12787:DropDownList;
      
      private var _12773:Label;
      
      private var _12779:Button;
      
      private var _12780:Button;
      
      private var _7085:_1105;
      
      private var _7068:Label;
      
      private var _12792:int;
      
      private var _12744:Group;
      
      private var _12802:HSlider;
      
      private var _12797:TextInput;
      
      private var _12800:int;
      
      private var _12790:Group;
      
      private var _12801:Group;
      
      private var _12803:Group;
      
      private var _12784:_1037;
      
      private var _12791:_1037;
      
      private var _13476:Group;
      
      private var _13474:DropDownList;
      
      private var _13471:_1037;
      
      private var _13413:_10616;
      
      private var _13414:_10616;
      
      private var _4786:_10616;
      
      private var _4785:_10616;
      
      private var _13411:Group;
      
      private var _13472:DropDownList;
      
      private var _13470:_1037;
      
      private var _13267:Boolean;
      
      private var _14879:Group;
      
      private var _14877:Group;
      
      private var _14875:TextInput;
      
      private var _14873:_159;
      
      private var _14874:HSlider;
      
      private var _14862:Boolean = true;
      
      public function ExportImgPanel()
      {
         this.AINATION_NONE = tr("Export.image.animationNone");
         this.AINATION_CURR = tr("Export.image.animationCur");
         this.AINATION_CUST = tr("Export.image.custom");
         this.AINATION_ALL = tr("Export.image.animationAll");
         this.FORMAT_DATA = [tr("Export.image.png"),tr("Export.image.jpg"),tr("Export.image.gif")];
         this.TYPE_DATA = [tr("Export.image.sheets"),tr("Export.image.single")];
         this.TYPE_ANIM = [this.AINATION_ALL,this.AINATION_CUST];
         this.TYPE_ANIM_2 = [this.AINATION_ALL,this.AINATION_CURR,this.AINATION_CUST];
         this.SINGLE_ANIM_SKE = [this.AINATION_NONE,this.AINATION_CUST];
         this.SINGLE_ANIM_ANI = [this.AINATION_NONE,this.AINATION_CURR,this.AINATION_CUST];
         this.SINGLE_ANIM_ANI_2 = [this.AINATION_NONE,this.AINATION_CURR];
         this.SINGLE_ANIM_ANI_3 = [this.AINATION_CURR,this.AINATION_CUST];
         this.AREA_TYPE = [tr("Export.image.areaMin"),tr("Export.image.areaCanvas"),tr("Export.image.areaCustom")];
         this.COLOR_TYPES_CANVAS = [tr("Export.color.no"),tr("Export.color.canvas"),tr("Export.color.custom")];
         this.COLOR_TYPES = [tr("Export.color.no"),tr("Export.color.custom")];
         this.COLOR_JPG_CANVAS = [tr("Export.color.canvas"),tr("Export.color.custom")];
         this.COLOR_JPG = [tr("Export.color.custom")];
         super();
         var _loc1_:_1197 = new _1197();
         _loc1_._2420 = 8;
         _loc1_._2419 = 0;
         _loc1_._2416 = 0;
         _loc1_._2410 = 10;
         _loc1_.gap = 5;
         this.layout = _loc1_;
         this.percentWidth = 100;
         this.percentHeight = 100;
      }
      
      override protected function _2438() : void
      {
         var _loc8_:Group = null;
         super._2438();
         var _loc1_:Group = this._2414(-_1013._13166);
         addElement(_loc1_);
         var _loc2_:Label = new Label();
         _loc2_.width = this._14765;
         _loc2_.text = tr("Export.image.type");
         this._12772 = new DropDownList();
         this._12772.percentWidth = 100;
         var _loc3_:_1037 = new _1037();
         _loc3_.source = this.TYPE_DATA;
         this._12772.dataProvider = _loc3_;
         this._12772.selectedIndex = 0;
         this._14876 = new _128();
         this._14876.left = 10;
         this._14876.width = _1013._13166;
         this._14876.label = tr("Export.image.preview");
         this._14876.selected = this._14862;
         var _loc4_:Group = new Group();
         _loc4_.addElement(this._14876);
         _loc1_.addElement(_loc2_);
         _loc1_.addElement(this._12772);
         _loc1_.addElement(_loc4_);
         var _loc5_:Group = this._2414();
         addElement(_loc5_);
         var _loc6_:Label;
         (_loc6_ = new Label()).width = this._14765;
         _loc6_.text = tr("Export.image.format");
         this._12793 = new DropDownList();
         this._12793.percentWidth = 100;
         var _loc7_:_1037;
         (_loc7_ = new _1037()).source = this.FORMAT_DATA;
         this._12793.dataProvider = _loc7_;
         this._12793.selectedIndex = 0;
         _loc5_.addElement(_loc6_);
         _loc5_.addElement(this._12793);
         (_loc8_ = new Group()).height = 3;
         addElement(_loc8_);
         var _loc9_:_12500 = new _12500();
         addElement(_loc9_);
         var _loc10_:Group;
         (_loc10_ = new Group()).height = 3;
         addElement(_loc10_);
         this._12801 = this._2414(-_1013._13166);
         addElement(this._12801);
         var _loc11_:Label;
         (_loc11_ = new Label()).width = this._14765;
         _loc11_.text = tr("Export.image.animations");
         this._12796 = new DropDownList();
         this._12796.percentWidth = 100;
         this._12791 = new _1037();
         this._12791.source = this.TYPE_ANIM;
         this._12796.dataProvider = this._12791;
         this._12796.selectedIndex = 0;
         this._12780 = new Button();
         this._12780.width = _1013._13166;
         this._12780.left = 10;
         this._12780.right = 0;
         this._12780.label = tr("Export.btn.animationSingle");
         var _loc12_:Group = new Group();
         _loc12_.addElement(this._12780);
         this._12801.addElement(_loc11_);
         this._12801.addElement(this._12796);
         this._12801.addElement(_loc12_);
         this._12790 = this._2414(-_1013._13166);
         addElement(this._12790);
         var _loc13_:Label;
         (_loc13_ = new Label()).width = this._14765;
         _loc13_.text = tr("Export.image.animationSingle");
         this._12787 = new DropDownList();
         this._12787.percentWidth = 100;
         this._12784 = new _1037();
         this._12784.source = this.SINGLE_ANIM_SKE;
         this._12787.dataProvider = this._12784;
         this._12787.selectedIndex = 0;
         this._12779 = new Button();
         this._12779.width = _1013._13166;
         this._12779.left = 10;
         this._12779.right = 0;
         this._12779.label = tr("Export.btn.animation");
         var _loc14_:Group = new Group();
         _loc14_.addElement(this._12779);
         this._12790.addElement(_loc13_);
         this._12790.addElement(this._12787);
         this._12790.addElement(_loc14_);
         this._12803 = this._2414();
         addElement(this._12803);
         var _loc15_:Label;
         (_loc15_ = new Label()).width = this._14765;
         _loc15_.text = tr("Export.image.fps");
         this._10885 = new TextInput();
         this._10885.text = "24";
         this._10885.restrict = "0-9";
         this._10885.maxChars = 2;
         this._10885.width = 40;
         this._11198 = new Label();
         this._11198.alpha = 0.5;
         this._11198.percentWidth = 100;
         this._11198.text = tr("Export.image.fpsTip",24);
         this._12803.addElement(_loc15_);
         this._12803.addElement(this._10885);
         this._12803.addElement(this._11198);
         this._12744 = this._2414();
         addElement(this._12744);
         var _loc16_:Label;
         (_loc16_ = new Label()).text = tr("Export.image.frame");
         _loc16_.width = this._14765;
         this._12802 = new HSlider();
         this._12802.skinName = _151;
         this._12802.maximum = 100;
         this._12802.minimum = 0;
         this._12802.value = 0;
         this._12797 = new TextInput();
         this._12797.percentWidth = 100;
         this._12797.text = "0";
         this._12797.restrict = "0-9";
         this._12797.maxChars = 4;
         this._12797.width = 40;
         this._12744.addElement(_loc16_);
         this._12744.addElement(this._12802);
         var _loc17_:Group;
         (_loc17_ = new Group()).width = 10;
         this._12744.addElement(_loc17_);
         this._12744.addElement(this._12797);
         this._12794 = 0;
         var _loc18_:Group;
         (_loc18_ = new Group()).height = 3;
         addElement(_loc18_);
         var _loc19_:_12500 = new _12500();
         addElement(_loc19_);
         var _loc20_:Group;
         (_loc20_ = new Group()).height = 3;
         addElement(_loc20_);
         this._13476 = this._2414();
         addElement(this._13476);
         var _loc21_:Label;
         (_loc21_ = new Label()).width = this._14765;
         _loc21_.text = tr("Export.image.area");
         this._13474 = new DropDownList();
         this._13474.percentWidth = 100;
         this._13471 = new _1037();
         this._13471.source = this.AREA_TYPE;
         this._13474.dataProvider = this._13471;
         this._13474.selectedIndex = 0;
         this._13476.addElement(_loc21_);
         this._13476.addElement(this._13474);
         this._13411 = _125._2413();
         var _loc22_:Group = _125._2414();
         var _loc23_:int = 24;
         var _loc24_:int = 40;
         var _loc25_:Group;
         (_loc25_ = new Group()).width = this._14765;
         _loc22_.addElement(_loc25_);
         var _loc26_:Label;
         (_loc26_ = new Label()).text = tr("Canvas.x");
         _loc26_.width = _loc23_;
         this._13413 = new _10616();
         this._13413.maximum = 999999;
         this._13413.minimum = -999999;
         this._13413.width = _loc24_;
         this._13413._11442 = 0;
         var _loc27_:Label;
         (_loc27_ = new Label()).text = tr("Canvas.y");
         _loc27_.width = _loc23_;
         this._13414 = new _10616();
         this._13414.maximum = 999999;
         this._13414.minimum = -999999;
         this._13414.width = _loc24_;
         this._13414._11442 = 0;
         _loc22_.addElement(_loc26_);
         _loc22_.addElement(this._13413);
         _loc22_.addElement(_loc27_);
         _loc22_.addElement(this._13414);
         var _loc28_:Group = _125._2414();
         var _loc29_:Group;
         (_loc29_ = new Group()).width = this._14765;
         var _loc30_:Label;
         (_loc30_ = new Label()).text = tr("Canvas.width");
         _loc30_.width = _loc23_;
         this._4786 = new _10616();
         this._4786.maximum = 999999;
         this._4786.minimum = 1;
         this._4786.width = _loc24_;
         this._4786._11442 = 0;
         var _loc31_:Label;
         (_loc31_ = new Label()).text = tr("Canvas.height");
         _loc31_.width = _loc23_;
         this._4785 = new _10616();
         this._4785.maximum = 999999;
         this._4785.minimum = 1;
         this._4785.width = _loc24_;
         this._4785._11442 = 0;
         _loc28_.addElement(_loc29_);
         _loc28_.addElement(_loc30_);
         _loc28_.addElement(this._4786);
         _loc28_.addElement(_loc31_);
         _loc28_.addElement(this._4785);
         this._13411.addElement(_loc22_);
         this._13411.addElement(_loc28_);
         addElement(this._13411);
         var _loc32_:Group = this._2414();
         addElement(_loc32_);
         var _loc33_:Label;
         (_loc33_ = new Label()).width = this._14765;
         _loc33_.text = tr("Export.output.scale");
         this._7113 = new TextInput();
         this._7113.toolTip = tr("Export.scale.tooltip");
         this._7113.text = "1";
         this._7113.restrict = "0-9";
         this._7113.maxChars = 4;
         this._7113.width = 40;
         _loc32_.addElement(_loc33_);
         _loc32_.addElement(this._7113);
         var _loc34_:Label;
         (_loc34_ = new Label()).text = "%";
         _loc32_.addElement(_loc34_);
         var _loc35_:Group = this._2414(-_1013._13166);
         addElement(_loc35_);
         var _loc36_:Label;
         (_loc36_ = new Label()).width = this._14765;
         _loc36_.text = tr("Export.background.color2");
         this._13472 = new DropDownList();
         this._13470 = new _1037();
         this._13470.source = this.COLOR_TYPES;
         this._13472.dataProvider = this._13470;
         this._13472.percentWidth = 100;
         this._13472.selectedIndex = 0;
         this._7112 = new _128();
         this.backgroundColor = new ColorPicker();
         this.backgroundColor.defaultColor = 16777215;
         this.backgroundColor._4061 = this.backgroundColor.defaultColor;
         this.backgroundColor.visible = false;
         _loc35_.addElement(_loc36_);
         _loc35_.addElement(this._13472);
         var _loc37_:Group = new Group();
         _loc37_.addElement(this.backgroundColor);
         this.backgroundColor.left = 10;
         _loc37_.width = _1013._13166 + 10;
         _loc35_.addElement(_loc37_);
         this._14879 = _125._2413();
         addElement(this._14879);
         var _loc38_:Group = this._2414(-_1013._13166);
         var _loc39_:Label;
         (_loc39_ = new Label()).width = this._14765;
         _loc39_.text = tr("Export.gif.repeat");
         this._14875 = new TextInput();
         this._14875.toolTip = tr("Export.gif.repeatTip");
         this._14875.text = "0";
         this._14875.restrict = "0-9";
         this._14875.maxChars = 3;
         this._14875.width = 40;
         _loc38_.addElement(_loc39_);
         _loc38_.addElement(this._14875);
         var _loc40_:Group = this._2414(-_1013._13166);
         var _loc41_:Label;
         (_loc41_ = new Label()).width = this._14765;
         _loc41_.text = tr("Export.gif.quality");
         this._14873 = new _159();
         this._14873.toolTip = tr("Export.gif.qualityTip");
         this._14873.text = "1";
         this._14873.restrict = "0-9";
         this._14873.maxChars = 2;
         this._14873.width = 40;
         this._14874 = new HSlider();
         this._14874.skinName = _14042;
         this._14874.maximum = 20;
         this._14874.minimum = 1;
         this._14874.value = 20;
         _loc40_.addElement(_loc41_);
         _loc40_.addElement(this._14874);
         _loc40_.addElement(this._14873);
         this._14879.addElement(_loc38_);
         this._14879.addElement(_loc40_);
         this._14877 = this._2414();
         addElement(this._14877);
         this._12773 = new Label();
         this._12773.width = this._14765;
         this._12773.text = tr("Export.image.texture");
         this._10875 = new _128();
         this._7065 = new Button();
         this._7065.label = tr("Export.texture.setting");
         this._7065.toolTip = tr("Export.setting.tooltip");
         this._7065.visible = false;
         this._14877.addElement(this._12773);
         this._14877.addElement(this._10875);
         this._14877.addElement(this._7065);
         var _loc42_:Group;
         (_loc42_ = new Group()).height = 5;
         addElement(_loc42_);
         var _loc43_:_12500 = new _12500();
         addElement(_loc43_);
         this._7085 = new _1105();
         this._7085.graphics.beginFill(10066329);
         this._7085.graphics.drawRect(0,0,150,200);
         this._7085.graphics.endFill();
         this._7085.includeInLayout = false;
         this._7085.x = 320;
         this._7085.y = 40;
         this._10877();
      }
      
      public function refresh() : void
      {
         var _loc1_:int = 0;
         var _loc2_:SymbolType = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(!this._7061 || !this._14881)
         {
            return;
         }
         this._7061.imageFormat = this._14881._14684;
         this._7061.scale = this._14881._14676;
         this._7061.singleFrame = this._14881._14685 == 0 ? false : true;
         this._7061.backgroundColor = this._14881.bgColor;
         this._7061.repeat = this._14881.repeat;
         this._7061.quality = this._14881.quality;
         this._7061.imagesPackageType = this._14881._14683;
         this._7061.hasBackground = this._14881._14679;
         if(this._7113 == null)
         {
            this._7123 = true;
         }
         else
         {
            this._7123 = false;
            this._7113.text = int(this._7061.scale * 100).toString();
            _loc1_ = 0;
            if(this._7061.imageFormat == _720.IMAGES_FORMAT_GIF)
            {
               _loc1_ = 2;
               this._7061.hasBackground = this._7061.hasBackground;
            }
            else if(this._7061.imageFormat == _720.IMAGES_FORMAT_JPG)
            {
               _loc1_ = 1;
               this._7061.hasBackground = true;
            }
            else if(this._7061.imageFormat == _720.IMAGES_FORMAT_PNG)
            {
               _loc1_ = 0;
               this._7061.hasBackground = this._7061.hasBackground;
            }
            this._12793.selectedIndex = _loc1_;
            if(this._7061.singleFrame)
            {
               this._12772.selectedIndex = 1;
               this._12790.visible = true;
               this._12790.includeInLayout = true;
               this._12744.visible = true;
               this._12744.includeInLayout = true;
               this._12801.visible = false;
               this._12801.includeInLayout = false;
               this._12803.visible = false;
               this._12803.includeInLayout = false;
               this._12796.enabled = true;
               if(this._7061.curAnimation)
               {
                  if(this._7061.allAnimations.length == 0)
                  {
                     this._12784.source = this.SINGLE_ANIM_ANI;
                     this._12787.selectedIndex = 0;
                     this._12787.enabled = false;
                  }
                  else if(this._7061.allAnimations.length == 1)
                  {
                     this._12784.source = this.SINGLE_ANIM_ANI_2;
                     if(this._7061.singleFrameAnimation == null)
                     {
                        this._12787.selectedIndex = 0;
                     }
                     else
                     {
                        this._12787.selectedIndex = 1;
                     }
                  }
                  else
                  {
                     this._12784.source = this.SINGLE_ANIM_ANI;
                     if(this._7061.singleFrameAnimation == null)
                     {
                        this._12787.selectedIndex = 0;
                     }
                     else if(this._7061.singleFrameAnimation == this._7061.curAnimation)
                     {
                        this._12787.selectedIndex = 1;
                     }
                     else
                     {
                        this._12787.selectedIndex = 2;
                     }
                  }
               }
               else
               {
                  this._12784.source = this.SINGLE_ANIM_SKE;
                  if(this._7061.allAnimations.length == 0)
                  {
                     this._12787.selectedIndex = 0;
                     this._12787.enabled = false;
                  }
                  else if(this._7061.singleFrameAnimation == null || this._7061.singleFrameAnimation == this._7061.curAnimation)
                  {
                     this._12787.selectedIndex = 0;
                  }
                  else
                  {
                     this._12787.selectedIndex = 1;
                  }
               }
               if(this._7061.singleFrameAnimation)
               {
                  this._13267 = this._13467() == SymbolType.SHEET;
                  _loc3_ = int(this._7061.allAnimations.indexOf(this._7061.singleFrameAnimation));
                  if(_loc3_ >= 0)
                  {
                     _loc4_ = int(this._7061.allAnimationDurings[_loc3_]);
                     _loc5_ = 0;
                     if(this._7061.singleFrameAnimation == this._7061.curAnimation)
                     {
                        _loc5_ = this._7061.curFrameIndex;
                     }
                     this._12788(_loc4_,_loc5_);
                  }
               }
               else
               {
                  this._12788(0,0);
               }
               this._12779.visible = this._12787._2484 == this.AINATION_CUST;
            }
            else
            {
               if(this._7061.curAnimation)
               {
                  this._12791.source = this.TYPE_ANIM_2;
                  if(this._7061.exportAnimations.length == 1 && this._7061.exportAnimations[0] == this._7061.curAnimation)
                  {
                     this._12796.selectedIndex = 1;
                  }
                  else if(this._7061.exportAnimations.length == this._7061.allAnimations.length)
                  {
                     this._12796.selectedIndex = 0;
                  }
                  else
                  {
                     this._12796.selectedIndex = 2;
                  }
               }
               else
               {
                  this._12791.source = this.TYPE_ANIM;
                  if(this._7061.exportAnimations.length == this._7061.allAnimations.length)
                  {
                     this._12796.selectedIndex = 0;
                  }
                  else
                  {
                     this._12796.selectedIndex = 1;
                  }
               }
               this._12780.visible = this._12796._2484 == this.AINATION_CUST;
               this._12772.selectedIndex = 0;
               this._12790.visible = false;
               this._12790.includeInLayout = false;
               this._12744.visible = false;
               this._12744.includeInLayout = false;
               this._12801.visible = true;
               this._12801.includeInLayout = true;
               this._12803.visible = true;
               this._12803.includeInLayout = true;
               this._12779.visible = false;
            }
            this._13411.includeInLayout = this._13411.visible = this._13474._2484 != this.AREA_TYPE[0];
            this._14879.includeInLayout = this._14879.visible = this._12793._2484 == this.FORMAT_DATA[2];
            this._14877.includeInLayout = this._14877.visible = !this._13411.visible;
            this._14875.text = this._7061.repeat.toString();
            this._14873.text = this._7061.quality.toString();
            this._14874.value = this._7061.quality;
            this.backgroundColor.visible = this._7112.selected = this._7061.hasBackground;
            this.backgroundColor._4061 = this._7061.backgroundColor;
            this._13466(true);
            this._13472.dataProvider = this._13470;
            this._13472._2484 = this._7061.hasBackground ? this.COLOR_TYPES[1] : this.COLOR_TYPES[0];
            this._13474._2484 = this._7061._13268 == null ? this.AREA_TYPE[0] : this.AREA_TYPE[2];
            this._10885.text = this._7061.exportFrameRate.toString();
            this._11198.text = tr("Export.image.fpsTip",this._7061.currentFPS);
            this._10879();
            _loc2_ = this._13467();
            if(_loc2_ == SymbolType.SHEET)
            {
               this._12796.enabled = false;
               this._12796.alpha = 0.5;
               this._12787.enabled = false;
               this._12787.alpha = 0.5;
               this._12779.enabled = false;
               this._12784.source = this.SINGLE_ANIM_ANI_3;
               this._12787._2484 = this.AINATION_CURR;
            }
            else
            {
               this._12796.enabled = true;
               this._12796.alpha = 1;
               this._12787.enabled = true;
               this._12787.alpha = 1;
               this._12779.enabled = true;
            }
            if(_loc2_ == SymbolType.MC)
            {
               this._12784.source = this.SINGLE_ANIM_ANI_3;
               if(this._7061.singleFrameAnimation == this._7061.curAnimation)
               {
                  this._12787.selectedIndex = 0;
               }
               else
               {
                  this._12787.selectedIndex = 1;
               }
            }
         }
      }
      
      private function _13467() : SymbolType
      {
         var _loc1_:String = null;
         var _loc2_:_50 = null;
         if(this._7061._10711.length == 1)
         {
            _loc1_ = this._7061._10711[0];
         }
         else
         {
            _loc1_ = this._7061.curArmature;
         }
         if(Boolean(_loc1_) && Boolean(this._7061.dragonBonesVO))
         {
            _loc2_ = this._7061.dragonBonesVO._2107(_loc1_);
            if(_loc2_)
            {
               return _loc2_._1811;
            }
         }
         return null;
      }
      
      private function _13466(param1:Boolean) : void
      {
         if(param1)
         {
            if(this._7061._2000 && this._7061._2000.opened && this._7061._2000.hasBackground)
            {
               this._13470.source = this.COLOR_TYPES_CANVAS;
            }
            else
            {
               this._13470.source = this.COLOR_TYPES;
            }
         }
         else if(this._7061._2000 && this._7061._2000.opened && this._7061._2000.hasBackground)
         {
            this._13470.source = this.COLOR_JPG_CANVAS;
         }
         else
         {
            this._13470.source = this.COLOR_JPG;
         }
      }
      
      private function _10877() : void
      {
         addEventListener(UIEvent.CREATION_COMPLETE,this._3991);
         this._7113.addEventListener(FocusEvent.FOCUS_OUT,this._4316);
         this._10885.addEventListener(FocusEvent.FOCUS_OUT,this._4613);
         this._7112.addEventListener(Event.CHANGE,this._7117);
         this.backgroundColor.addEventListener(UIEvent.CONFIRM,this._4052);
         this.backgroundColor.addEventListener(Event.CLEAR,this._4052);
         this._7065.addEventListener(MouseEvent.CLICK,this._7062);
         this._10875.addEventListener(Event.CHANGE,this._7095);
         this._12793.addEventListener(Event.CHANGE,this._10878);
         this._12772.addEventListener(Event.CHANGE,this._11194);
         this._12796.addEventListener(Event.CHANGE,this._6494);
         this._14876.addEventListener(Event.CHANGE,this._12795);
         this._12802.addEventListener(Event.CHANGE,this._12789);
         this._12797.addEventListener(FocusEvent.FOCUS_OUT,this._4654);
         this._12787.addEventListener(Event.CHANGE,this._12786);
         this._12779.addEventListener(MouseEvent.CLICK,this._12781);
         this._12780.addEventListener(MouseEvent.CLICK,this._12783);
         this._13474.addEventListener(Event.CHANGE,this._13475);
         this._13413.addEventListener(Event.CHANGE,this._13469);
         this._13414.addEventListener(Event.CHANGE,this._13469);
         this._4786.addEventListener(Event.CHANGE,this._13469);
         this._4785.addEventListener(Event.CHANGE,this._13469);
         this._13472.addEventListener(Event.CHANGE,this._13468);
         this._14875.addEventListener(FocusEvent.FOCUS_OUT,this._14871);
         this._14873.addEventListener(FocusEvent.FOCUS_OUT,this._14870);
         this._14874.addEventListener(Event.CHANGE,this._14872);
      }
      
      private function _14871(param1:FocusEvent) : void
      {
         var _loc2_:int = int(this._14875.text);
         this._14881.repeat = _loc2_;
         dispatchEvent(new ExportEvent(ExportEvent.GIF_REPEAT,_loc2_));
      }
      
      private function _14870(param1:FocusEvent) : void
      {
         var _loc2_:int = int(this._14873.text);
         if(_loc2_ > 20)
         {
            _loc2_ = 20;
            this._14873.text = _loc2_.toString();
         }
         else if(_loc2_ == 0)
         {
            _loc2_ = 1;
            this._14873.text = _loc2_.toString();
         }
         this._14881.quality = _loc2_;
         this._14874.value = _loc2_;
         dispatchEvent(new ExportEvent(ExportEvent.GIF_QUALITY,_loc2_));
      }
      
      private function _14872(param1:Event) : void
      {
         this._14881.quality = this._14874.value;
         this._14873.text = this._14874.value.toString();
         dispatchEvent(new ExportEvent(ExportEvent.GIF_QUALITY,this._14874.value));
      }
      
      private function _13468(param1:Event) : void
      {
         var _loc2_:Boolean = false;
         switch(this._13472._2484)
         {
            case this.COLOR_TYPES_CANVAS[0]:
               _loc2_ = false;
               dispatchEvent(new ExportEvent(ExportEvent.HAS_BG_COLOR,_loc2_));
               break;
            case this.COLOR_TYPES_CANVAS[1]:
               this.backgroundColor._4061 = this._7061._2000.bgColor;
               _loc2_ = true;
               dispatchEvent(new ExportEvent(ExportEvent.HAS_BG_COLOR,_loc2_));
               dispatchEvent(new ExportEvent(ExportEvent.BG_COLOR_CHANGE,this.backgroundColor._4061));
               break;
            case this.COLOR_TYPES_CANVAS[2]:
               _loc2_ = true;
               dispatchEvent(new ExportEvent(ExportEvent.HAS_BG_COLOR,_loc2_));
         }
         this._14881._14679 = _loc2_;
         this.backgroundColor.visible = _loc2_;
         dispatchEvent(new ExportEvent(ExportEvent.REFRESH_PREVIEW_SINGLE));
      }
      
      private function _13469(param1:Event) : void
      {
         this._13474._2484 = this.AREA_TYPE[2];
         this._13473(true);
      }
      
      private function _13475(param1:Event) : void
      {
         switch(this._13474._2484)
         {
            case this.AREA_TYPE[0]:
               this._13411.includeInLayout = this._13411.visible = false;
               this._13473(false);
               break;
            case this.AREA_TYPE[1]:
               if(Boolean(this._7061._2000) && this._7061._2000.opened)
               {
                  this._13413.value = this._7061._2000.x;
                  this._13414.value = this._7061._2000.y;
                  this._4786.value = this._7061._2000.width;
                  this._4785.value = this._7061._2000.height;
                  this._13411.includeInLayout = this._13411.visible = true;
                  this._13473(true);
               }
               else
               {
                  this._13411.includeInLayout = this._13411.visible = false;
                  dispatchEvent(new DBPanelEvent(DBPanelEvent.PANEL_ALERT,tr("Export.canvas.noCanvas")));
                  this._13474._2484 = this.AREA_TYPE[0];
                  this._13473(false);
               }
               break;
            case this.AREA_TYPE[2]:
               this._13411.includeInLayout = this._13411.visible = true;
               this._13473(true);
         }
      }
      
      private function _13473(param1:Boolean) : void
      {
         if(this._7061)
         {
            if(param1)
            {
               if(this._7061._13268 == null)
               {
                  this._7061._13268 = new Rectangle();
               }
               this._7061._13268.x = this._13413.value - this._4786.value / 2;
               this._7061._13268.y = this._13414.value - this._4785.value / 2;
               this._7061._13268.width = this._4786.value;
               this._7061._13268.height = this._4785.value;
            }
            else
            {
               this._7061._13268 = null;
            }
         }
      }
      
      private function _12783(param1:MouseEvent) : void
      {
         this._12785();
      }
      
      private function _12781(param1:MouseEvent) : void
      {
         this._12782();
      }
      
      private function _12786(param1:Event) : void
      {
         var _loc2_:String = this._12787._2484;
         this._12779.visible = false;
         switch(_loc2_)
         {
            case this.AINATION_CURR:
               this._7061.singleFrameAnimation = this._7061.curAnimation;
               this._7061.curFrameIndex = this._7061.curFrameIndex;
               break;
            case this.AINATION_CUST:
               this._12779.visible = true;
               this._12782();
               break;
            case this.AINATION_NONE:
               this._7061.singleFrameAnimation = null;
         }
         this.refresh();
         dispatchEvent(new ExportEvent(ExportEvent.SINGLE_FRAME_CHANGE,this._7061.singleFrameIndex));
      }
      
      private function _12782() : void
      {
         var w:_12487 = new _12487(this._7061,null);
         w.addEventListener(Event.CLOSE,function(param1:Event):void
         {
            refresh();
            _7061.singleFrameIndex = 0;
            dispatchEvent(new ExportEvent(ExportEvent.SINGLE_FRAME_CHANGE,_7061.singleFrameIndex));
         });
         w.open();
      }
      
      private function _12785() : void
      {
         var w:_12485 = null;
         w = new _12485(this._7061,null);
         w.addEventListener(Event.CLOSE,function(param1:Event):void
         {
            var _loc3_:int = 0;
            var _loc4_:int = 0;
            var _loc2_:Array = w._12766;
            if(_loc2_.length > 0)
            {
               _7061.exportAnimations.length = 0;
               _loc3_ = 0;
               _loc4_ = int(_loc2_.length);
               while(_loc3_ < _loc4_)
               {
                  _7061.exportAnimations.push(_loc2_[_loc3_]);
                  _loc3_++;
               }
            }
            refresh();
            dispatchEvent(new ExportEvent(ExportEvent.ANIMATIONS_CHANGE));
            if(_7061.imagesPackageType == _720.IMAGES_PACKAGE_TEXTURE)
            {
               dispatchEvent(new Event(Event.CHANGE,true));
            }
         });
         w.open();
      }
      
      private function _4654(param1:FocusEvent) : void
      {
         var _loc2_:int = int(this._12797.text);
         if(_loc2_ > this._12792)
         {
            _loc2_ = this._12792;
         }
         this._12797.text = this._12800.toString();
         if(this._13267)
         {
            if(this._12800 + 1 != _loc2_)
            {
               this._12802.value = _loc2_;
               this._12800 = _loc2_ - 1;
               dispatchEvent(new ExportEvent(ExportEvent.SINGLE_FRAME_CHANGE,this._12800));
            }
         }
         else if(this._12800 != _loc2_)
         {
            this._12802.value = _loc2_;
            this._12800 = _loc2_;
            dispatchEvent(new ExportEvent(ExportEvent.SINGLE_FRAME_CHANGE,this._12800));
         }
      }
      
      private function _12789(param1:Event) : void
      {
         if(this._13267)
         {
            if(this._12800 + 1 != this._12802.value)
            {
               this._12797.text = this._12802.value.toString();
               this._12800 = this._12802.value - 1;
               dispatchEvent(new ExportEvent(ExportEvent.SINGLE_FRAME_CHANGE,this._12800));
            }
         }
         else if(this._12800 != this._12802.value)
         {
            this._12797.text = this._12802.value.toString();
            this._12800 = this._12802.value;
            dispatchEvent(new ExportEvent(ExportEvent.SINGLE_FRAME_CHANGE,this._12800));
         }
      }
      
      private function _12795(param1:Event = null) : void
      {
         this._14878(true);
      }
      
      private function _14878(param1:Boolean) : void
      {
         dispatchEvent(new ExportEvent(ExportEvent.IS_PREVIEW,{
            "target":"ExportImgPanel",
            "open":param1,
            "isPreview":this._14876.selected
         }));
      }
      
      private function _11194(param1:Event) : void
      {
         this._14881._14685 = this._12772.selectedIndex;
         dispatchEvent(new ExportEvent(ExportEvent.IMAGE_SINGLE_CHANGE,this._12772.selectedIndex == 1));
         this._10879();
         this.refresh();
      }
      
      private function _10878(param1:Event) : void
      {
         var _loc2_:int = _720.IMAGES_FORMAT_PNG;
         if(this._12793.selectedIndex == 0)
         {
            _loc2_ = _720.IMAGES_FORMAT_PNG;
         }
         else if(this._12793.selectedIndex == 1)
         {
            _loc2_ = _720.IMAGES_FORMAT_JPG;
         }
         else if(this._12793.selectedIndex == 2)
         {
            _loc2_ = _720.IMAGES_FORMAT_GIF;
         }
         this._14881._14684 = _loc2_;
         dispatchEvent(new ExportEvent(ExportEvent.IMAGE_FORMAT_CHANGE,_loc2_));
         this.refresh();
      }
      
      private function _10879() : void
      {
         if(this._12772.selectedIndex == 1)
         {
            this.backgroundColor.visible = false;
            this._7112.visible = true;
            this._14877.includeInLayout = this._14877.visible = false;
            this.backgroundColor.visible = this._7112.selected = this._7061.hasBackground;
            this.backgroundColor._4061 = this._7061.backgroundColor;
            this._13472._2484 = this._7061.hasBackground ? this.COLOR_TYPES[1] : this.COLOR_TYPES[0];
            this._10885.enabled = false;
            if(this._12793.selectedIndex == 2)
            {
               this._7112.selected = true;
               this._7112.enabled = false;
               this._7112.mouseEnabled = false;
               this.backgroundColor.visible = this._7112.selected = this._7061.hasBackground;
               this.backgroundColor._4061 = this._7061.backgroundColor;
               this._13466(true);
               this._13472._2484 = this._7061.hasBackground ? this.COLOR_TYPES[1] : this.COLOR_TYPES[0];
            }
            else if(this._12793.selectedIndex == 1)
            {
               this._7112.selected = true;
               this._7112.enabled = false;
               this._7112.mouseEnabled = false;
               this.backgroundColor.visible = true;
               this.backgroundColor._4061 = this._7061.backgroundColor;
               this._13466(false);
               this._13472._2484 = this.COLOR_TYPES[1];
            }
            else if(this._12793.selectedIndex == 0)
            {
               this._7112.mouseEnabled = true;
               this._7112.enabled = true;
               this.backgroundColor.visible = this._7112.selected = this._7061.hasBackground;
               this.backgroundColor._4061 = this._7061.backgroundColor;
               this._13466(true);
               this._13472._2484 = this._7061.hasBackground ? this.COLOR_TYPES[1] : this.COLOR_TYPES[0];
            }
            this._14876.visible = true;
            this._14878(true);
         }
         else
         {
            this._14876.visible = false;
            this._14878(false);
            this._10885.enabled = true;
            this.backgroundColor.visible = true;
            this._7112.visible = true;
            this._14877.includeInLayout = this._14877.visible = true;
            this._7065.visible = true;
            if(this._12793.selectedIndex == 2)
            {
               this._14877.includeInLayout = this._14877.visible = false;
               this._7112.selected = true;
               this._7112.enabled = false;
               this._7112.mouseEnabled = false;
               this.backgroundColor.visible = this._7061.hasBackground;
               this.backgroundColor._4061 = this._7061.backgroundColor;
               this._13466(true);
               this._13472._2484 = this._7061.hasBackground ? this.COLOR_TYPES[1] : this.COLOR_TYPES[0];
            }
            else if(this._12793.selectedIndex == 1)
            {
               this._7112.selected = true;
               this._7112.enabled = false;
               this._7112.mouseEnabled = false;
               this.backgroundColor.visible = true;
               this.backgroundColor._4061 = this._7061.backgroundColor;
               this._10875.enabled = true;
               this._10875.selected = this._7061.imagesPackageType == _720.IMAGES_PACKAGE_TEXTURE;
               this._7065.visible = this._10875.selected;
               this._13466(false);
               this._13472._2484 = this.COLOR_TYPES[1];
            }
            else if(this._12793.selectedIndex == 0)
            {
               this._7112.mouseEnabled = true;
               this._7112.enabled = true;
               this._10875.enabled = true;
               this._10875.selected = this._7061.imagesPackageType == _720.IMAGES_PACKAGE_TEXTURE;
               this._7065.visible = this._10875.selected;
               this.backgroundColor.visible = this._7112.selected = this._7061.hasBackground;
               this.backgroundColor._4061 = this._7061.backgroundColor;
               this._13466(true);
               this._13472._2484 = this._7061.hasBackground ? this.COLOR_TYPES[1] : this.COLOR_TYPES[0];
            }
         }
      }
      
      private function _7095(param1:Event) : void
      {
         this._7065.visible = this._10875.selected;
         var _loc2_:int = this._10875.selected ? _720.IMAGES_PACKAGE_TEXTURE : _720.IMAGES_PACKAGE_FILES;
         this._14881._14683 = _loc2_;
         dispatchEvent(new ExportEvent(ExportEvent.IMAGE_PACKAGE_TYPE_CHANGE,_loc2_));
         if(this._10875.selected)
         {
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function _7110() : String
      {
         var _loc1_:String = null;
         if(this._10875 == null)
         {
            return _720.IMAGE_TYPE_FILES;
         }
         if(this._10875.selected)
         {
            _loc1_ = _720.IMAGE_TYPE_TEXTURE;
         }
         else
         {
            _loc1_ = _720.IMAGE_TYPE_FILES;
         }
         return _loc1_;
      }
      
      private function _6494(param1:Event) : void
      {
         this._12780.visible = false;
         if(this._12796._2484 == this.AINATION_CURR)
         {
            dispatchEvent(new ExportEvent(ExportEvent.ONLY_CUR_ANIMATION,true));
            this.refresh();
         }
         else if(this._12796._2484 == this.AINATION_ALL)
         {
            dispatchEvent(new ExportEvent(ExportEvent.ONLY_CUR_ANIMATION,false));
            this.refresh();
         }
         else
         {
            this._12780.visible = true;
            this._12785();
         }
      }
      
      private function _3991(param1:UIEvent) : void
      {
         removeEventListener(UIEvent.CREATION_COMPLETE,this._3991);
         if(this._7123)
         {
            this.refresh();
         }
      }
      
      private function _7062(param1:MouseEvent) : void
      {
         this._7095(null);
         dispatchEvent(new ExportEvent(ExportEvent.OPEN_TEXTURE_SETTING));
      }
      
      private function _4052(param1:Event) : void
      {
         this._14881.bgColor = this.backgroundColor._4061;
         dispatchEvent(new ExportEvent(ExportEvent.BG_COLOR_CHANGE,this.backgroundColor._4061));
         dispatchEvent(new ExportEvent(ExportEvent.REFRESH_PREVIEW_SINGLE));
         this._13472._2484 = this.COLOR_TYPES_CANVAS[2];
      }
      
      private function _7117(param1:Event) : void
      {
         this._14881._14679 = this._7112.selected;
         this.backgroundColor.visible = this._7112.selected;
         dispatchEvent(new ExportEvent(ExportEvent.HAS_BG_COLOR,this._7112.selected));
         dispatchEvent(new ExportEvent(ExportEvent.REFRESH_PREVIEW_SINGLE));
      }
      
      private function _4613(param1:FocusEvent) : void
      {
         var _loc2_:int = int(this._10885.text);
         if(_loc2_ < 1)
         {
            _loc2_ = 1;
         }
         if(_loc2_ > 60)
         {
            _loc2_ = 60;
         }
         this._10885.text = _loc2_.toString();
         dispatchEvent(new ExportEvent(ExportEvent.FRAME_RATE_CHANGE,_loc2_));
      }
      
      private function _4316(param1:FocusEvent) : void
      {
         var _loc2_:Number = Number(this._7113.text);
         if(isNaN(_loc2_) || _loc2_ == 0)
         {
            _loc2_ = 100;
         }
         if(_loc2_ > 1000)
         {
            _loc2_ = 1000;
         }
         this._14881._14676 = _loc2_ / 100;
         dispatchEvent(new ExportEvent(ExportEvent.SCALE_CHANGE,_loc2_ / 100));
         dispatchEvent(new ExportEvent(ExportEvent.REFRESH_PREVIEW_SINGLE));
      }
      
      public function set _3238(param1:_720) : void
      {
         this._7061 = param1;
         this.refresh();
      }
      
      public function set _12794(param1:int) : void
      {
         if(this._13267)
         {
            this._12792 = param1;
            this._12802.maximum = this._12792;
            this._12802.value = 1;
            this._12800 = 0;
            this._12797.text = "1";
            this._12802.enabled = this._12797.enabled = this._12792 > 0;
         }
         else
         {
            this._12792 = param1;
            this._12802.maximum = this._12792;
            this._12802.value = 0;
            this._12800 = 0;
            this._12797.text = "0";
            this._12802.enabled = this._12797.enabled = this._12792 > 0;
         }
      }
      
      public function _12788(param1:int, param2:int) : void
      {
         if(this._13267)
         {
            this._12802.minimum = 1;
            this._12794 = param1;
            this._12802.value = param2 + 1;
            this._12800 = param2;
            this._12797.text = (param2 + 1).toString();
         }
         else
         {
            this._12802.minimum = 0;
            this._12794 = param1;
            this._12802.value = param2;
            this._12800 = param2;
            this._12797.text = param2.toString();
         }
      }
      
      private function _2414(param1:int = 10) : Group
      {
         var _loc2_:Group = _125._2414();
         _loc2_.percentWidth = 100;
         var _loc3_:_1189 = _loc2_.layout as _1189;
         _loc3_.gap = 0;
         _loc3_._2420 = 0;
         _loc3_._2410 = 0;
         _loc3_._2419 = 0;
         _loc3_._2416 = param1 + _1013._13166;
         return _loc2_;
      }
      
      public function set _14463(param1:_14081) : void
      {
         this._14881 = param1;
      }
      
      public function set _14863(param1:Boolean) : void
      {
         this._14862 = param1;
      }
      
      public function _14454() : void
      {
         if(this._7113)
         {
            this._7113.text = int(this._7061.scale * 100).toString();
         }
      }
   }
}

