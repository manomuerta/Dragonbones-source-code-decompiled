package _1011
{
   import _1033._12500;
   import _1038._1037;
   import _1045.Button;
   import _1045.DropDownList;
   import _1045.Group;
   import _1045.Label;
   import _1045.RadioButton;
   import _1177.UIEvent;
   import _1185._1189;
   import _1185._1197;
   import _127._128;
   import _1374.ColorPicker;
   import _1374.TextInput;
   import _14079._14078;
   import _636.ExportEvent;
   import _721._720;
   import _97._125;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   
   public class _12489 extends Group implements _1014
   {
      private const _14765:int = 80;
      
      private var _7108:RadioButton;
      
      private var _7112:_128;
      
      private var backgroundColor:ColorPicker;
      
      private var _7113:TextInput;
      
      private var _7065:Button;
      
      private var _7115:_128;
      
      private var _7121:RadioButton;
      
      private var _6643:Group;
      
      private var _14876:_128;
      
      private var _7061:_720;
      
      private var _14864:_14078;
      
      private var _10910:Boolean = true;
      
      private var _10909:Label;
      
      private var _10884:Label;
      
      private var _12830:DropDownList;
      
      private var _12829:_1037;
      
      private var _6647:Label;
      
      private var _13472:DropDownList;
      
      private var _13470:_1037;
      
      private var _14862:Boolean = true;
      
      private var _isOpen:Boolean = false;
      
      public function _12489()
      {
         this.TEXTURE_TYPES = [tr("Export.skin.texture"),tr("Export.skin.images")];
         this.TEXTURE_ONLY = [tr("Export.skin.texture")];
         this.COLOR_TYPES_CANVAS = [tr("Export.color.no"),tr("Export.color.canvas"),tr("Export.color.custom")];
         this.COLOR_TYPES = [tr("Export.color.no"),tr("Export.color.custom")];
         super();
         var _loc1_:_1197 = new _1197();
         _loc1_._2420 = 0;
         _loc1_._2419 = 0;
         _loc1_._2416 = 0;
         _loc1_._2410 = 0;
         _loc1_.gap = 5;
         this.layout = _loc1_;
         this.percentWidth = 100;
         this.percentHeight = 100;
      }
      
      private function _4321(param1:UIEvent) : void
      {
         removeEventListener(UIEvent.CREATION_COMPLETE,this._4321);
         if(this._7061)
         {
            this.refresh(this._7061);
         }
         this._10876 = this._10910;
      }
      
      override protected function _2438() : void
      {
         var _loc5_:Group = null;
         super._2438();
         this._10909 = new Label();
         this._10909.text = tr("Export.skin.type");
         this._10909.width = this._14765;
         this._12830 = new DropDownList();
         this._12829 = new _1037();
         this._12829.source = this.TEXTURE_TYPES;
         this._12830.dataProvider = this._12829;
         this._12830.percentWidth = 100;
         this._12830.selectedIndex = 0;
         var _loc1_:Group = new Group();
         this._7065 = new Button();
         this._7065.width = _1013._13166;
         this._7065.label = tr("Export.texture.setting");
         this._7065.toolTip = tr("Export.setting.tooltip");
         this._7065.right = 0;
         _loc1_.addElement(this._7065);
         var _loc2_:Group = _125._2414();
         _loc2_.percentWidth = 100;
         var _loc3_:_1189 = _loc2_.layout as _1189;
         _loc3_.gap = 0;
         _loc3_._2420 = 0;
         _loc3_._2410 = 0;
         _loc3_._2419 = 20;
         _loc3_._2416 = 0;
         _loc2_.addElement(this._10909);
         _loc2_.addElement(this._12830);
         var _loc4_:Group;
         (_loc4_ = new Group()).width = 10;
         _loc2_.addElement(_loc4_);
         _loc2_.addElement(_loc1_);
         addElement(_loc2_);
         this._10884 = new Label();
         this._10884.width = this._14765;
         this._10884.text = tr("Export.output.scale");
         this._10884.toolTip = tr("Export.scale.tooltip");
         this._7113 = new TextInput();
         this._7113.toolTip = tr("Export.scale.tooltip");
         this._7113.text = "100";
         this._7113.restrict = "0-9";
         this._7113.maxChars = 4;
         this._7113.width = 40;
         (_loc5_ = new Group()).percentWidth = 100;
         this._14876 = new _128();
         this._14876.right = 0;
         this._14876.width = _1013._13166;
         this._14876.label = tr("Export.image.preview");
         this._14876.selected = this._14862;
         _loc5_.addElement(this._14876);
         var _loc6_:Group;
         (_loc6_ = _125._2414()).percentWidth = 100;
         var _loc7_:_1189;
         (_loc7_ = _loc6_.layout as _1189).gap = 0;
         _loc7_._2420 = 0;
         _loc7_._2410 = 0;
         _loc7_._2419 = 20;
         _loc7_._2416 = 0;
         _loc6_.addElement(this._10884);
         _loc6_.addElement(this._7113);
         var _loc8_:Label;
         (_loc8_ = new Label()).text = "%";
         _loc6_.addElement(_loc8_);
         _loc6_.addElement(_loc5_);
         addElement(_loc6_);
         this._6647 = new Label();
         this._6647.text = tr("Export.background.color2");
         this._6647.width = this._14765;
         this._7112 = new _128();
         this.backgroundColor = new ColorPicker();
         this.backgroundColor.defaultColor = 16777215;
         this.backgroundColor._4061 = this.backgroundColor.defaultColor;
         this._13472 = new DropDownList();
         this._13470 = new _1037();
         this._13470.source = this.COLOR_TYPES;
         this._13472.dataProvider = this._13470;
         this._13472.percentWidth = 100;
         this._13472.selectedIndex = 0;
         var _loc9_:Group;
         (_loc9_ = _125._2414()).percentWidth = 100;
         var _loc10_:_1189;
         (_loc10_ = _loc9_.layout as _1189).gap = 0;
         _loc10_._2420 = 0;
         _loc10_._2410 = 5;
         _loc10_._2419 = 20;
         _loc10_._2416 = 0;
         _loc9_.addElement(this._6647);
         _loc9_.addElement(this._13472);
         var _loc11_:Group = new Group();
         _loc11_.addElement(this.backgroundColor);
         this.backgroundColor.left = 10;
         _loc11_.width = _1013._13166 + 10;
         _loc9_.addElement(_loc11_);
         addElement(_loc9_);
         var _loc12_:_12500 = new _12500();
         addElement(_loc12_);
         var _loc13_:Group;
         (_loc13_ = new Group()).height = 2;
         addElement(_loc13_);
         this._7115 = new _128();
         this._7115.label = tr("Export.zip");
         this._7115.toolTip = tr("Export.zip.tooltip");
         this._10877();
      }
      
      private function _10877() : void
      {
         this._12830.addEventListener(Event.CHANGE,this._7095);
         this._7113.addEventListener(FocusEvent.FOCUS_OUT,this._4316);
         this._7112.addEventListener(Event.CHANGE,this._7117);
         this.backgroundColor.addEventListener(UIEvent.CONFIRM,this._4052);
         this.backgroundColor.addEventListener(Event.CLEAR,this._4052);
         this._7065.addEventListener(MouseEvent.CLICK,this._7062);
         this._7115.addEventListener(MouseEvent.CLICK,this._7122);
         this._13472.addEventListener(Event.CHANGE,this._13468);
         this._14876.addEventListener(Event.CHANGE,this._14924);
      }
      
      private function _14924(param1:Event = null) : void
      {
         this._14878(true);
      }
      
      private function _14878(param1:Boolean) : void
      {
         if(!this._isOpen)
         {
            return;
         }
         dispatchEvent(new ExportEvent(ExportEvent.IS_PREVIEW,{
            "target":"ExportDBPanel",
            "open":param1,
            "isPreview":this._14876.selected
         }));
      }
      
      public function open() : void
      {
         this._isOpen = true;
         this._14878(true);
      }
      
      public function close() : void
      {
         this._isOpen = false;
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
               _loc2_ = true;
               this.backgroundColor._4061 = this._7061._2000.bgColor;
               dispatchEvent(new ExportEvent(ExportEvent.HAS_BG_COLOR,_loc2_));
               dispatchEvent(new ExportEvent(ExportEvent.BG_COLOR_CHANGE,this.backgroundColor._4061));
               break;
            case this.COLOR_TYPES_CANVAS[2]:
               _loc2_ = true;
               dispatchEvent(new ExportEvent(ExportEvent.HAS_BG_COLOR,_loc2_));
         }
         this._14864._14679 = _loc2_;
         this.backgroundColor.visible = _loc2_;
      }
      
      public function refresh(param1:_720) : void
      {
         this._7061 = param1;
         if(initialized)
         {
            this._7061.hasBackground = this._14864._14679;
            this._7061.scale = this._14864._14676;
            this._7061.backgroundColor = this._14864.bgColor;
            this._7113.text = int(this._7061.scale * 100).toString();
            this.backgroundColor.visible = this._7061.hasBackground;
            this.backgroundColor._4061 = this._7061.backgroundColor;
            this._7115.selected = this._7061.isZip;
            this._12830.selectedIndex = this._7061.imageType == _720.IMAGE_TYPE_TEXTURE ? 0 : 1;
            if(this._7061.imageType == _720.IMAGE_TYPE_FILES)
            {
               this.backgroundColor.visible = false;
            }
            this._13472.visible = this._7061.imageType == _720.IMAGE_TYPE_TEXTURE;
            this._7112.visible = this._7061.imageType == _720.IMAGE_TYPE_TEXTURE;
            this._6647.visible = this._7061.imageType == _720.IMAGE_TYPE_TEXTURE;
            this._7065.visible = this._12830.selectedIndex == 0;
            if(this._7061._2000 && this._7061._2000.opened && this._7061._2000.hasBackground)
            {
               this._13470.source = this.COLOR_TYPES_CANVAS;
            }
            else
            {
               this._13470.source = this.COLOR_TYPES;
            }
            this._13472.dataProvider = this._13470;
            this._13472._2484 = param1.hasBackground ? this.COLOR_TYPES[1] : this.COLOR_TYPES[0];
         }
         else
         {
            addEventListener(UIEvent.CREATION_COMPLETE,this._4321);
         }
         this._14878(true);
      }
      
      private function _7122(param1:MouseEvent) : void
      {
         dispatchEvent(new ExportEvent(ExportEvent.IS_ZIP,this._7115.selected));
      }
      
      private function _7062(param1:MouseEvent) : void
      {
         dispatchEvent(new ExportEvent(ExportEvent.OPEN_TEXTURE_SETTING));
      }
      
      private function _4052(param1:Event) : void
      {
         this._14864.bgColor = this.backgroundColor._4061;
         dispatchEvent(new ExportEvent(ExportEvent.BG_COLOR_CHANGE,this.backgroundColor._4061));
         this._13472._2484 = this.COLOR_TYPES_CANVAS[2];
      }
      
      private function _7117(param1:Event) : void
      {
         this._14864._14679 = this._7112.selected;
         this.backgroundColor.visible = this._7112.selected;
         dispatchEvent(new ExportEvent(ExportEvent.HAS_BG_COLOR,this._7112.selected));
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
         this._14864._14676 = _loc2_ / 100;
         dispatchEvent(new ExportEvent(ExportEvent.SCALE_CHANGE,_loc2_ / 100));
      }
      
      private function _7095(param1:Event) : void
      {
         var _loc2_:String = null;
         if(this._12830.selectedIndex == 0)
         {
            _loc2_ = _720.IMAGE_TYPE_TEXTURE;
            this._7112.enabled = this.backgroundColor.enabled = true;
            this._7112.visible = true;
            this._6647.visible = true;
            this._13472.visible = true;
            this.backgroundColor.visible = this._14864._14679;
            this._7065.visible = true;
         }
         else
         {
            _loc2_ = _720.IMAGE_TYPE_FILES;
            this._7112.enabled = this.backgroundColor.enabled = false;
            this._7112.visible = false;
            this._6647.visible = false;
            this._13472.visible = false;
            this.backgroundColor.visible = false;
            this._7065.visible = false;
         }
         this._14864._14675 = _loc2_;
         dispatchEvent(new ExportEvent(ExportEvent.IMAGE_TYPE_CHANGE,_loc2_));
      }
      
      public function _7110() : String
      {
         var _loc1_:String = null;
         if(this._7108 == null)
         {
            return _720.IMAGE_TYPE_TEXTURE;
         }
         if(this._7108.selected)
         {
            _loc1_ = _720.IMAGE_TYPE_TEXTURE;
         }
         else
         {
            _loc1_ = _720.IMAGE_TYPE_FILES;
         }
         return _loc1_;
      }
      
      public function set _10876(param1:Boolean) : void
      {
         this._10910 = param1;
         if(initialized)
         {
            this._12830.enabled = param1;
            this._7065.enabled = param1;
            this._7113.enabled = param1;
            this._7112.enabled = param1;
            this._7115.enabled = param1;
            this.backgroundColor.enabled = param1;
            this._10909.enabled = param1;
            this._10884.enabled = param1;
         }
      }
      
      public function _12774() : void
      {
         this._12829.source = this.TEXTURE_TYPES;
         if(this._7061)
         {
            if(this._7061.imageType == _720.IMAGE_TYPE_TEXTURE)
            {
               this._12830.selectedIndex = 0;
            }
            else
            {
               this._12830.selectedIndex = 1;
            }
            this._7112.visible = this._7061.imageType == _720.IMAGE_TYPE_TEXTURE;
            this._6647.visible = this._7061.imageType == _720.IMAGE_TYPE_TEXTURE;
         }
      }
      
      public function _12775() : void
      {
         this._12829.source = this.TEXTURE_TYPES;
         if(this._7061)
         {
            if(this._7061.imageType == _720.IMAGE_TYPE_TEXTURE)
            {
               this._12830.selectedIndex = 0;
            }
            else
            {
               this._12830.selectedIndex = 1;
            }
         }
      }
      
      public function _12777() : void
      {
         this._12829.source = this.TEXTURE_ONLY;
         this._12830.selectedIndex = 0;
      }
      
      public function _12776() : void
      {
         this._12829.source = this.TEXTURE_ONLY;
         this._12830.selectedIndex = 0;
      }
      
      public function set _14464(param1:_14078) : void
      {
         this._14864 = param1;
      }
      
      public function set _14863(param1:Boolean) : void
      {
         this._14862 = param1;
      }
      
      public function _14454() : void
      {
         this._7113.text = int(this._7061.scale * 100).toString();
      }
   }
}

