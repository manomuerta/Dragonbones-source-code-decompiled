package _1009
{
   import _1033._12500;
   import _1033._14129;
   import _1033._14131;
   import _1038._1037;
   import _1045.Button;
   import _1045.DropDownList;
   import _1045.Group;
   import _1045.Label;
   import _1045._1105;
   import _1177.UIEvent;
   import _1185._1188;
   import _1185._1189;
   import _1185._1196;
   import _1185._1197;
   import _127._128;
   import _127._14038;
   import _127._14040;
   import _127._14044;
   import _127._171;
   import _1343._839;
   import _1374.ColorPicker;
   import _1374.IconButton;
   import _1374.TextInput;
   import _1404._1407;
   import _1529._1528;
   import _1529._1530;
   import _477.ExportController;
   import _721._765;
   import _822._14093;
   import _834._14091;
   import _97._125;
   import egret.utils.tr;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.text.TextFormatAlign;
   
   public class _1036 extends _171
   {
      public static var _7364:Number = 800;
      
      public static var _7361:Number = 630;
      
      private static const _14765:int = 80;
      
      private static const IMAGE_WIDTH:int = 400;
      
      private static const IMAGE_HEIGHT:int = 400;
      
      private static var _7345:_765 = new _765();
      
      private var _3639:_765;
      
      public var _7369:Button;
      
      public var image:_1105;
      
      public var _7112:_128;
      
      public var _7344:_128;
      
      public var backgroundColor:ColorPicker;
      
      public var _7113:TextInput;
      
      public var _7363:Label;
      
      public var _7373:TextInput;
      
      public var _7372:TextInput;
      
      public var _5554:Button;
      
      public var _5555:Button;
      
      public var _7358:_128;
      
      public var _7357:_128;
      
      public var _7353:Label;
      
      public var _7347:_128;
      
      public var _7359:TextInput;
      
      public var _7356:TextInput;
      
      public var _7362:Button;
      
      public var _7090:IconButton;
      
      public var _7089:IconButton;
      
      public var _7083:Label;
      
      public var _7082:Group;
      
      public var _14898:Label;
      
      public var _14908:IconButton;
      
      public var _14907:IconButton;
      
      public var _14963:Group;
      
      public var _14965:Group;
      
      public var _14961:_14038;
      
      public var _14960:_14038;
      
      public var _14911:_14044;
      
      private var _callback:Function;
      
      private var _7086:int;
      
      private var _7081:int;
      
      private var _7077:Vector.<BitmapData>;
      
      private var _7367:int;
      
      private var _7360:int;
      
      private var _14964:Boolean = false;
      
      private var _7346:Boolean;
      
      private var _7371:int;
      
      private var _7370:int;
      
      private var _1857:int;
      
      private var _14905:Group;
      
      private var _7374:_14040;
      
      private var _11202:DropDownList;
      
      private var _14962:_14093;
      
      private var scale:int = 100;
      
      public function _1036(param1:_765, param2:Boolean)
      {
         this._7369 = new Button();
         this.image = new _1105();
         this._7353 = new Label();
         this._7362 = new Button();
         this._7090 = new IconButton();
         this._7089 = new IconButton();
         this._7083 = new Label();
         this._7082 = _125._2414(3);
         this._14898 = new Label();
         this._14908 = new IconButton();
         this._14907 = new IconButton();
         this._14963 = new Group();
         this._14965 = new Group();
         this._14961 = new _14038();
         this._14960 = new _14038();
         this._14911 = new _14044();
         this._14905 = new Group();
         this._7374 = new _14040();
         super();
         if(_1528.language == _1530.zh_CN)
         {
            _7364 = 800;
            _7361 = 630;
         }
         else if(_1528.language == _1530.ru_RF)
         {
            _7361 = 730;
            _7364 = 815;
         }
         else
         {
            _7361 = 650;
            _7364 = 815;
         }
         this.minWidth = _7364;
         this.minHeight = _7361;
         this.width = _7364;
         this.height = _7361;
         this.title = tr("TexturePackertWindow.Title");
         this._7346 = param2;
         this._3639 = param1;
         _7345.copyFrom(this._3639);
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         this._7371 = param2 - 110;
         if(_1528.language == _1530.zh_CN)
         {
            this._7370 = param1 - 285;
         }
         else
         {
            this._7370 = param1 - 300;
         }
         this._14893();
         this._7348();
         _7364 = param1;
         _7361 = param2;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         var _loc1_:int = 88;
         if(_1528.language != _1530.zh_CN)
         {
            _loc1_ = 120;
         }
         var _loc2_:Group = _125._2403();
         _loc2_.percentWidth = 100;
         _loc2_.percentHeight = 100;
         var _loc3_:Group = _125._2413(10);
         if(_1528.language == _1530.zh_CN)
         {
            _loc3_.width = 210;
         }
         else
         {
            _loc3_.width = 245;
         }
         var _loc4_:Group;
         (_loc4_ = _125._2395(8)).percentWidth = 100;
         var _loc5_:_14129;
         (_loc5_ = new _14129()).percentHeight = 100;
         var _loc6_:Group;
         (_loc6_ = _125._2414()).percentWidth = 100;
         var _loc7_:Label;
         (_loc7_ = new Label()).width = _14765;
         _loc7_.text = tr("Export.output.scale");
         _loc7_.toolTip = tr("Export.scale.tooltip");
         this._7113 = new TextInput();
         this._7113.toolTip = tr("Export.scale.tooltip");
         this._7113.text = "100";
         this._7113.restrict = "0-9.";
         this._7113.maxChars = 4;
         this._7113.width = _loc1_;
         var _loc8_:Label;
         (_loc8_ = new Label()).text = "%";
         _loc6_.addElement(_loc7_);
         _loc6_.addElement(this._7113);
         _loc6_.addElement(_loc8_);
         var _loc9_:Group;
         (_loc9_ = _125._2414()).percentWidth = 100;
         var _loc10_:Label;
         (_loc10_ = new Label()).text = tr("Export.output.size");
         _loc10_.width = _14765;
         _loc9_.addElement(_loc10_);
         _loc9_.addElement(this._7353);
         var _loc11_:Group;
         (_loc11_ = _125._2414()).percentWidth = 100;
         this._7112 = new _128();
         this._7112.width = _14765;
         this._7112.label = tr("Export.background.color");
         this._7112.toolTip = tr("Export.background.tooltip");
         this.backgroundColor = new ColorPicker();
         this.backgroundColor.defaultColor = 16777215;
         this.backgroundColor._4061 = this.backgroundColor.defaultColor;
         this.backgroundColor.skinName = _14131;
         this.backgroundColor.visible = false;
         _loc11_.addElement(this._7112);
         _loc11_.addElement(this.backgroundColor);
         var _loc12_:Array = [tr("Export.heuristic.BestShortSideFit"),tr("Export.heuristic.BestLongSideFit"),tr("Export.heuristic.BestAreaFit"),tr("Export.heuristic.BottomLeftRule"),tr("Export.heuristic.ContactPointRule")];
         var _loc13_:Group;
         (_loc13_ = _125._2414()).percentWidth = 100;
         var _loc14_:Label;
         (_loc14_ = new Label()).text = tr("Export.heuristic.label");
         _loc14_.width = _14765;
         this._11202 = new DropDownList();
         this._11202.dataProvider = new _1037(_loc12_);
         this._11202.selectedIndex = 2;
         this._11202.width = _loc1_;
         _loc13_.addElement(_loc14_);
         _loc13_.addElement(this._11202);
         this._7344 = new _128();
         this._7344.label = tr("Export.texture.stipWhiteSpace");
         this._7344.toolTip = tr("Export.stipWhiteSpace.tooltip");
         var _loc15_:Group = _125._2414();
         var _loc16_:Label;
         (_loc16_ = new Label()).text = tr("Export.texture.gapX");
         _loc16_.toolTip = tr("Export.gapX.tooltip");
         _loc16_.width = _14765;
         this._7373 = new TextInput();
         this._7373.toolTip = tr("Export.gapX.tooltip");
         this._7373.restrict = "0-9";
         this._7373.maxChars = 2;
         this._7373.width = _loc1_;
         this._7373.text = "1";
         _loc15_.addElement(_loc16_);
         _loc15_.addElement(this._7373);
         var _loc17_:Group = _125._2414();
         var _loc18_:Label;
         (_loc18_ = new Label()).text = tr("Export.texture.gapY");
         _loc18_.width = _14765;
         _loc18_.toolTip = tr("Export.gapY.tooltip");
         this._7372 = new TextInput();
         this._7372.toolTip = tr("Export.gapY.tooltip");
         this._7372.width = _loc1_;
         this._7372.text = "1";
         this._7372.restrict = "0-9";
         this._7372.maxChars = 2;
         _loc17_.addElement(_loc18_);
         _loc17_.addElement(this._7372);
         this._7358 = new _128();
         this._7358.label = tr("Export.texture.pow2");
         this._7358.toolTip = tr("Export.pow2.tooltip");
         this._7357 = new _128();
         this._7357.label = tr("Export.texture.square");
         this._7357.toolTip = tr("Export.square.tooltip");
         var _loc19_:Group = _125._2414();
         var _loc20_:Group;
         (_loc20_ = _125._2414()).width = 10;
         var _loc21_:Label;
         (_loc21_ = new Label()).text = tr("Export.texture.maxWidth");
         _loc21_.toolTip = tr("Export.maxWidth.tooltip");
         _loc21_.width = 64;
         this._7359 = new TextInput();
         this._7359.toolTip = tr("Export.maxWidth.tooltip");
         this._7359.restrict = "0-9";
         this._7359.maxChars = 4;
         this._7359.width = _loc1_;
         this._7359.text = "";
         this._7359.enabled = false;
         _loc19_.addElement(_loc20_);
         _loc19_.addElement(_loc21_);
         _loc19_.addElement(this._7359);
         var _loc22_:Group = _125._2414();
         (_loc20_ = _125._2414()).width = 10;
         var _loc23_:Label;
         (_loc23_ = new Label()).text = tr("Export.texture.maxHeight");
         _loc23_.toolTip = tr("Export.maxHeight.tooltip");
         _loc23_.width = 64;
         this._7356 = new TextInput();
         this._7356.toolTip = tr("Export.maxHeight.tooltip");
         this._7356.restrict = "0-9";
         this._7356.maxChars = 4;
         this._7356.width = _loc1_;
         this._7356.text = "";
         this._7356.enabled = false;
         _loc22_.addElement(_loc20_);
         _loc22_.addElement(_loc23_);
         _loc22_.addElement(this._7356);
         this._7347 = new _128();
         this._7347.label = tr("Export.texture.autoSize");
         this._7347.selected = true;
         var _loc24_:Group = _125._2413();
         _loc24_.addElement(this._7347);
         _loc24_.addElement(_loc19_);
         _loc24_.addElement(_loc22_);
         var _loc25_:Label;
         (_loc25_ = new Label()).text = tr("Export.texture.area");
         _loc3_.addElement(_loc25_);
         var _loc26_:Group = this._11201();
         var _loc27_:_128;
         (_loc27_ = new _128()).label = tr("Export.texture.rotateEnable");
         _loc27_.enabled = false;
         _loc26_.addElement(this._7344);
         var _loc28_:_12500;
         (_loc28_ = new _12500()).percentWidth = 100;
         _loc28_.top = 35;
         _loc3_.addElement(_loc26_);
         _loc3_.addElement(_loc28_);
         var _loc29_:Label;
         (_loc29_ = new Label()).text = tr("Export.texture.areaFill");
         _loc3_.addElement(_loc29_);
         var _loc30_:Group = this._11201();
         _loc30_.addElement(_loc15_);
         _loc30_.addElement(_loc17_);
         var _loc31_:_128;
         (_loc31_ = new _128()).label = tr("Export.texture.fillNeighbor");
         _loc31_.enabled = false;
         (_loc28_ = new _12500()).percentWidth = 100;
         _loc28_.top = 35;
         _loc3_.addElement(_loc30_);
         _loc3_.addElement(_loc28_);
         var _loc32_:Label;
         (_loc32_ = new Label()).text = tr("Export.texture.page");
         var _loc33_:Group = this._11201();
         _loc3_.addElement(_loc32_);
         _loc33_.addElement(this._7358);
         _loc33_.addElement(this._7357);
         _loc33_.addElement(_loc11_);
         if(this._7346)
         {
            _loc33_.addElement(_loc24_);
         }
         (_loc28_ = new _12500()).percentWidth = 100;
         _loc3_.addElement(_loc33_);
         _loc3_.addElement(_loc28_);
         var _loc34_:Label;
         (_loc34_ = new Label()).text = tr("Export.texture.out");
         _loc3_.addElement(_loc34_);
         var _loc35_:Group = this._11201();
         _loc35_.addElement(_loc6_);
         _loc35_.addElement(_loc13_);
         _loc35_.addElement(_loc9_);
         _loc3_.addElement(_loc35_);
         var _loc36_:Group;
         (_loc36_ = new Group()).width = _loc3_.width;
         _loc36_.height = 50;
         var _loc37_:_1189;
         (_loc37_ = new _1189()).verticalAlign = _1196.MIDDLE;
         _loc37_._2401 = _1188.CENTER;
         _loc36_.layout = _loc37_;
         this._7362.skinName = _839;
         this._7362.label = tr("Export.setting.default");
         _loc36_.addElement(this._7362);
         _loc3_.addElement(_loc36_);
         this._7369.label = tr("preview");
         this._7369.bottom = 0;
         this._7363 = new Label();
         this._7363.text = "Export.texture.out";
         this._14963.percentWidth = 100;
         this._7089.icon = "/assets/button/texture_next.png";
         this._7090.icon = "/assets/button/texture_prev.png";
         this._7082.left = 0;
         this._7082.addElement(this._7090);
         this._7082.addElement(this._7083);
         this._7082.addElement(this._7089);
         this._14963.addElement(this._7082);
         this._14898.text = tr("Export.setting.percent");
         this._14898.textAlign = TextFormatAlign.RIGHT;
         this._14898.width = 70;
         this._14962 = new _14093();
         this._14962.skinName = _14091;
         this._14962.dataProvider = new _1037(["25%","50%","100%",tr("ZoomList.fit")]);
         this._14962.width = 70;
         this._14962.selectedIndex = 3;
         this._14908.icon = "/assets/button/zoom_in.png";
         this._14907.icon = "/assets/button/zoom_out.png";
         var _loc38_:Group;
         (_loc38_ = _125._2414(3)).right = 0;
         _loc38_.addElement(this._14898);
         _loc38_.addElement(this._14962);
         _loc38_.addElement(this._14908);
         _loc38_.addElement(this._14907);
         this._14963.addElement(_loc38_);
         this._14961.type = _14038.LEFT;
         this._14961.left = 16;
         this._14961.verticalCenter = 0;
         this._14960.type = _14038.RIGHT;
         this._14960.right = 16;
         this._14960.verticalCenter = 0;
         this._14965.percentHeight = 100;
         this._14965.percentWidth = 100;
         this._14965.addElement(this._14961);
         this._14965.addElement(this._14960);
         this._14965.visible = false;
         this._14911.bottom = 20;
         this._14911.horizontalCenter = 0;
         this._5554 = _125._2399();
         this._5554.width = 82;
         this._5555 = _125._2406();
         this._5555.width = 82;
         (_loc20_ = _125._2414()).width = 25;
         _2632.addElement(this._5554);
         _2632.addElement(_loc20_);
         _2632.addElement(this._5555);
         _2632.bottom = 10;
         if(_1528.language == _1530.zh_CN)
         {
            _2632.right = 13;
         }
         else
         {
            _2632.right = 20;
         }
         addElement(_2632);
         this._7374._14339(this.image);
         this._14905.addElement(this._7374);
         this._14905.addElement(this._14965);
         this._14905.addElement(this._14911);
         _loc4_.addElement(this._14905);
         _loc4_.addElement(this._14963);
         _loc2_.addElement(_loc4_);
         _loc2_.addElement(_loc5_);
         _loc2_.addElement(_loc3_);
         _2512.addElement(_loc2_);
         this._7344.addEventListener(Event.CHANGE,this.onCut);
         this._7112.addEventListener(Event.CHANGE,this._7111);
         this._7113.addEventListener(FocusEvent.FOCUS_OUT,this._4316);
         this.backgroundColor.addEventListener(UIEvent.CONFIRM,this._4052);
         this.backgroundColor.addEventListener(Event.CLEAR,this._4052);
         this._7362.addEventListener(MouseEvent.CLICK,this._7365);
         this._5555.addEventListener(MouseEvent.CLICK,this.onCancel);
         this._5554.addEventListener(MouseEvent.CLICK,this._2517);
         this._7373.addEventListener(Event.CHANGE,this._7355);
         this._7372.addEventListener(Event.CHANGE,this._7354);
         this._7358.addEventListener(Event.CHANGE,this._7350);
         this._7357.addEventListener(Event.CHANGE,this._7351);
         this._11202.addEventListener(Event.CHANGE,this._11200);
         this._7089.addEventListener(MouseEvent.CLICK,this._7072);
         this._7090.addEventListener(MouseEvent.CLICK,this._7071);
         this._14960.addEventListener(MouseEvent.CLICK,this._7072);
         this._14961.addEventListener(MouseEvent.CLICK,this._7071);
         this._7347.addEventListener(Event.CHANGE,this._7352);
         this._14907.addEventListener(MouseEvent.CLICK,this._14920);
         this._14908.addEventListener(MouseEvent.CLICK,this._14919);
         this._7374.addEventListener(Event.CHANGE,this._14918);
         this._14962.addEventListener(Event.CHANGE,this._14918);
         this._14911.addEventListener(Event.CHANGE,this._14897);
         if(this._3639)
         {
            this._7113.text = (this._3639.scale * 100).toString();
            this._7112.selected = this._3639.hasBackground;
            this.backgroundColor.visible = this._7112.selected;
            this.backgroundColor._4061 = this._3639.backgroundColor;
            this._7373.text = this._3639.gapX.toString();
            this._7372.text = this._3639.gapY.toString();
            this._7358.selected = this._3639._2832;
            this._7357.selected = this._3639._5416;
            this._7344.selected = this._3639._5420;
            this._7344.enabled = this._3639._3620;
            this._7347.selected = this._3639.autoSize;
            this._11202.selectedIndex = this._3639.heuristic;
            if(!this._3639.autoSize)
            {
               this._7356.text = this._3639.maxHeight.toString();
               this._7359.text = this._3639.maxWidth.toString();
               this._7356.enabled = true;
               this._7359.enabled = true;
            }
         }
         this._7082.visible = false;
         this._14911.visible = false;
      }
      
      override public function open(param1:Boolean = true) : void
      {
         super.open(param1);
         this._14905.addEventListener(MouseEvent.ROLL_OVER,this._14959);
         this._14905.addEventListener(MouseEvent.ROLL_OUT,this._14958);
         this._7374.addEventListener(MouseEvent.MOUSE_WHEEL,this._14922);
      }
      
      override public function close() : void
      {
         super.close();
         this._14905.removeEventListener(MouseEvent.ROLL_OVER,this._14959);
         this._14905.removeEventListener(MouseEvent.ROLL_OUT,this._14958);
         this._7374.removeEventListener(MouseEvent.MOUSE_WHEEL,this._14922);
      }
      
      private function _11201() : Group
      {
         var _loc1_:Group = _125._2413(6);
         _1197(_loc1_.layout)._2419 = 20;
         return _loc1_;
      }
      
      private function _14920(param1:MouseEvent) : void
      {
         this._14754(this.scale - _14093.MINSCALE);
      }
      
      private function _14919(param1:MouseEvent) : void
      {
         this._14754(this.scale + _14093.MINSCALE);
      }
      
      private function _14922(param1:MouseEvent) : void
      {
         if(param1.isDefaultPrevented())
         {
            return;
         }
         this._14754(this.scale + param1.delta);
      }
      
      private function _3989() : void
      {
         if(this.scale <= _14093.MINSCALE)
         {
            this._14907.enabled = false;
            this._14908.enabled = true;
         }
         else if(this.scale >= 1000)
         {
            this._14907.enabled = true;
            this._14908.enabled = false;
         }
         else
         {
            this._14907.enabled = true;
            this._14908.enabled = true;
         }
      }
      
      private function _14754(param1:int) : void
      {
         if(param1 < _14093.MINSCALE)
         {
            param1 = _14093.MINSCALE;
         }
         if(param1 > _14093.MAXSCALE)
         {
            param1 = _14093.MAXSCALE;
         }
         this._14962.selectedIndex = -1;
         this._14962._14754(param1);
      }
      
      private function _14918(param1:Event) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         this._14962.noFresh = false;
         if(this._14962.selectedIndex == 3)
         {
            this._14962.noFresh = true;
            _loc2_ = this._7374.showAll();
            this.scale = int(_loc2_ * 100);
            this._14962._14754(this.scale,false);
            return;
         }
         if(!this._14962.prompt)
         {
            return;
         }
         _loc3_ = int(this._14962.prompt.indexOf("%"));
         if(_loc3_ != -1)
         {
            this.scale = int(this._14962.prompt.substring(0,_loc3_));
         }
         else
         {
            this.scale = int(this._14962.prompt);
         }
         if(this.image)
         {
            this._7374.scale = this.scale / 100;
            this._3989();
         }
      }
      
      private function _7352(param1:Event) : void
      {
         this._3639.autoSize = this._7347.selected;
         if(this._7347.selected)
         {
            this._7356.text = "";
            this._7359.text = "";
            this._7359.enabled = false;
            this._7356.enabled = false;
            this._7356.removeEventListener(FocusEvent.FOCUS_OUT,this._7349);
            this._7359.removeEventListener(FocusEvent.FOCUS_OUT,this._7349);
            if(this._3639._5412)
            {
               this._7366();
            }
         }
         else
         {
            this._7356.text = this._3639.maxHeight.toString();
            this._7359.text = this._3639.maxWidth.toString();
            this._7359.enabled = true;
            this._7356.enabled = true;
            this._7356.addEventListener(FocusEvent.FOCUS_OUT,this._7349);
            this._7359.addEventListener(FocusEvent.FOCUS_OUT,this._7349);
         }
      }
      
      private function _7349(param1:FocusEvent) : void
      {
         this._3639.maxWidth = int(this._7359.text);
         this._3639.maxHeight = int(this._7356.text);
         this._7359.text = this._3639.maxWidth.toString();
         this._7356.text = this._3639.maxHeight.toString();
         if(this._3639._5412)
         {
            this._7366();
         }
      }
      
      public function _5425() : void
      {
         if(this._7113)
         {
            this._7113.text = (this._3639.scale * 100).toString();
         }
      }
      
      private function _7351(param1:Event) : void
      {
         this._3639._5416 = this._7357.selected;
         this._7366();
      }
      
      private function _11200(param1:Event) : void
      {
         this._3639.heuristic = this._11202.selectedIndex;
         this._7366();
      }
      
      private function _7350(param1:Event) : void
      {
         this._3639._2832 = this._7358.selected;
         this._5950();
         this._7366();
      }
      
      private function _7354(param1:Event) : void
      {
         this._3639.gapY = int(this._7372.text);
         this._5950();
         this._7366();
      }
      
      private function _7355(param1:Event) : void
      {
         this._3639.gapX = int(this._7373.text);
         this._5950();
         this._7366();
      }
      
      private function _5950() : void
      {
         if(!this._7347.selected)
         {
            this._7356.text = this._3639.maxHeight.toString();
            this._7359.text = this._3639.maxWidth.toString();
         }
      }
      
      private function onCut(param1:Event) : void
      {
         this._3639._5420 = this._7344.selected;
         this._3639._5412 = true;
         this._3639._5411 = true;
         this._7366();
      }
      
      private function _7366() : void
      {
         if(this._callback != null)
         {
            this._callback();
         }
      }
      
      private function _4052(param1:Event) : void
      {
         this._3639.backgroundColor = this.backgroundColor._4061;
         this._7366();
      }
      
      private function _7071(param1:MouseEvent) : void
      {
         --this._7086;
         this._7087(this._7086);
      }
      
      private function _7072(param1:MouseEvent) : void
      {
         ++this._7086;
         this._7087(this._7086);
      }
      
      private function _14959(param1:MouseEvent) : void
      {
         if(this._7081 > 1 && !this._14965.visible)
         {
            this._14965.visible = true;
         }
      }
      
      private function _14958(param1:MouseEvent) : void
      {
         if(this._7081 > 1 && this._14965.visible)
         {
            this._14965.visible = false;
         }
      }
      
      public function set _5421(param1:Vector.<BitmapData>) : void
      {
         if(param1 == null || param1.length == 0)
         {
            this._7082.visible = false;
            this._14911.visible = false;
            this.image.source = null;
            return;
         }
         this._14964 = true;
         this._7081 = param1.length;
         this._7086 = 0;
         this._7077 = param1;
         this._14911._14368(this._7081);
         this._7087(this._7086);
      }
      
      private function _14897(param1:Event) : void
      {
         this._7086 = this._14911._14317;
         this._7087(this._7086);
      }
      
      private function _7087(param1:int) : void
      {
         if(this._7081 <= 0 || param1 < 0)
         {
            this._14911.visible = false;
            this._7082.visible = false;
            return;
         }
         if(this._7081 > 1)
         {
            this._14911.visible = true;
            this._7082.visible = true;
            this._7083.text = tr("Export.setting.page",param1 + 1,this._7081);
            this._7090.enabled = param1 > 0;
            this._7089.enabled = param1 < this._7081 - 1;
            this._14961.enabled = param1 > 0;
            this._14960.enabled = param1 < this._7081 - 1;
            this._14911._14367(param1);
         }
         else
         {
            this._14911.visible = false;
            this._7082.visible = false;
         }
         this._7066(this._7077[param1]);
      }
      
      private function _7066(param1:BitmapData) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:Number = param1.width;
         var _loc3_:Number = param1.height;
         this.image.source = param1;
         this._7360 = _loc3_;
         this._7367 = _loc2_;
         this._7353.text = _loc2_ + " x " + _loc3_;
         this._7348();
         if(this._14962)
         {
            this._14962._14754(this.scale);
         }
      }
      
      private function _7348() : void
      {
         if(this._7370 == 0 || this._7371 == 0)
         {
            return;
         }
         this._7374._14343(this._7370,this._7371);
         if(this._14964)
         {
            this._14964 = false;
            this._7374._2894(this._7367,this._7360);
         }
         else
         {
            this._7374._2894(this._7367,this._7360,this.scale / 100);
         }
      }
      
      private function _14893() : void
      {
         if(this._7370 == 0 || this._7371 == 0)
         {
            return;
         }
         this._7374.width = this._7370;
         this._7374.height = this._7371;
      }
      
      public function set callback(param1:Function) : void
      {
         this._callback = param1;
         if(this._callback != null)
         {
            this._callback();
         }
      }
      
      private function _4316(param1:Event) : void
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
         if(this._1857 == _loc2_)
         {
            return;
         }
         this._1857 = _loc2_;
         this._7113.text = this._1857.toString();
         this._3639.scale = this._1857 / 100;
         this._5950();
         this._7366();
      }
      
      private function _7111(param1:Event) : void
      {
         this.backgroundColor.visible = this._7112.selected;
         this._3639.hasBackground = this._7112.selected;
         this._7366();
      }
      
      private function _7365(param1:MouseEvent) : void
      {
         this._3639._5953();
         this._14455();
         this._7113.text = (this._3639.scale * 100).toString();
         this._7112.selected = this._3639.hasBackground;
         this.backgroundColor.visible = this._7112.selected;
         this.backgroundColor._4061 = this._3639.backgroundColor;
         this._7373.text = this._3639.gapX.toString();
         this._7372.text = this._3639.gapY.toString();
         this._7358.selected = this._3639._2832;
         this._7357.selected = this._3639._5416;
         this._7347.selected = this._3639.autoSize;
         this._7344.selected = this._3639._5420;
         this._11202.selectedIndex = this._3639.heuristic;
         this._3639._5411 = true;
         this._3639._5412 = true;
         this._14966();
         this._7366();
      }
      
      private function onCancel(param1:MouseEvent) : void
      {
         this._3639.copyFrom(_7345);
         this._14455();
         this._7113.text = (this._3639.scale * 100).toString();
         this._7112.selected = this._3639.hasBackground;
         this.backgroundColor.visible = this._7112.selected;
         this.backgroundColor._4061 = this._3639.backgroundColor;
         this._7373.text = this._3639.gapX.toString();
         this._7372.text = this._3639.gapY.toString();
         this._7358.selected = this._3639._2832;
         this._7357.selected = this._3639._5416;
         this._7344.selected = this._3639._5420;
         this._11202.selectedIndex = _7345.heuristic;
         this._3639._5411 = true;
         this._3639._5412 = true;
         this._7366();
         this.close();
      }
      
      override protected function _2517(param1:MouseEvent = null) : void
      {
         this._14455();
         this._3602._14454(this._3639.scale);
         super.close();
      }
      
      private function _14966() : void
      {
         this._7356.text = "";
         this._7359.text = "";
         this._7359.enabled = false;
         this._7356.enabled = false;
         this._7356.removeEventListener(FocusEvent.FOCUS_OUT,this._7349);
         this._7359.removeEventListener(FocusEvent.FOCUS_OUT,this._7349);
      }
      
      private function _14455() : void
      {
         this._3602._14455({
            "type":"scale",
            "value":this._3639.scale
         });
         this._3602._14455({
            "type":"hasBackground",
            "value":this._3639.hasBackground
         });
         this._3602._14455({
            "type":"backgroundColor",
            "value":this._3639.backgroundColor
         });
      }
      
      private function get _3602() : ExportController
      {
         return _1407.getInstance(ExportController) as ExportController;
      }
   }
}

