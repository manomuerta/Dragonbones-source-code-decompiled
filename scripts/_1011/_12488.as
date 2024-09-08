package _1011
{
   import _1033._12500;
   import _1038._1037;
   import _1045.DropDownList;
   import _1045.Group;
   import _1045.Label;
   import _1177.UIEvent;
   import _1185._1189;
   import _1185._1197;
   import _127._128;
   import _1374.Alert;
   import _1374.ColorPicker;
   import _1374.TextInput;
   import _1404._1407;
   import _14079._14080;
   import _51._50;
   import _555.LibraryPanelController;
   import _636.ExportEvent;
   import _721._720;
   import _73.SymbolType;
   import _822._10616;
   import _97._125;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.FocusEvent;
   
   public class _12488 extends Group
   {
      private const _14765:int = 100;
      
      private var _14880:Group;
      
      private var _12803:Group;
      
      private var _13478:Group;
      
      private var _13480:Group;
      
      private var _12772:DropDownList;
      
      private var _13477:DropDownList;
      
      private var _13479:DropDownList;
      
      private var _7113:TextInput;
      
      private var _13472:DropDownList;
      
      private var _13470:_1037;
      
      private var backgroundColor:ColorPicker;
      
      private var _10885:TextInput;
      
      private var _11198:Label;
      
      private var _13484:_128;
      
      private var _13413:_10616;
      
      private var _13414:_10616;
      
      private var _4786:_10616;
      
      private var _4785:_10616;
      
      private var _7061:_720;
      
      private var _14882:_14080;
      
      public function _12488()
      {
         this.COLOR_TYPES = [tr("Export.color.no"),tr("Export.color.custom")];
         this.ORIENTATION_VALUE = ["auto","portrait","landscape","landscapeFlipped"];
         this.SCALE_VALUE = ["showAll","noScale","noBorder","exactFit","fixedWidth","fixedHeight","fixedNarrow","fixedWide"];
         this.TYPE_SOURCE = [tr("Export.web.preview"),tr("Export.web.publish")];
         this.ORIENTATION_SOURCE = [tr("ExportEgret.ScreenAuto"),tr("ExportEgret.ScreenVertical"),tr("ExportEgret.ScreenHorizonta"),tr("ExportEgret.ScreenHorizontaFlipped")];
         this.SCREEN_SCALE_SOURCE = [tr("ExportEgret.ScreenShowAll"),tr("ExportEgret.ScreenNoScale"),tr("ExportEgret.ScreenNoBorder"),tr("ExportEgret.ScreenExactFit"),tr("ExportEgret.ScreenFixedWidth"),tr("ExportEgret.ScreenFixedHeight"),tr("ExportEgret.ScreenFixedNarrow"),tr("ExportEgret.ScreenFixedWide")];
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         var _loc1_:_1197 = new _1197();
         _loc1_._2420 = 8;
         _loc1_._2419 = 0;
         _loc1_._2416 = 0;
         _loc1_._2410 = 0;
         _loc1_.gap = 5;
         this.layout = _loc1_;
         this.percentWidth = 100;
         this.percentHeight = 100;
         var _loc2_:Group = this._2414();
         addElement(_loc2_);
         var _loc3_:Label = new Label();
         _loc3_.width = this._14765;
         _loc3_.text = tr("Export.web.type");
         this._12772 = new DropDownList();
         this._12772.percentWidth = 100;
         var _loc4_:_1037;
         (_loc4_ = new _1037()).source = this.TYPE_SOURCE;
         this._12772.dataProvider = _loc4_;
         this._12772.selectedIndex = 0;
         _loc2_.addElement(_loc3_);
         _loc2_.addElement(this._12772);
         var _loc5_:Group = this._2414();
         addElement(_loc5_);
         var _loc6_:Label;
         (_loc6_ = new Label()).width = _1013._14765;
         _loc6_.text = tr("Export.output.webscale");
         this._7113 = new TextInput();
         this._7113.text = "1";
         this._7113.restrict = "0-9";
         this._7113.maxChars = 4;
         this._7113.width = 40;
         _loc5_.addElement(_loc6_);
         _loc5_.addElement(this._7113);
         var _loc7_:Label;
         (_loc7_ = new Label()).text = "%";
         _loc5_.addElement(_loc7_);
         this._14880 = this._2414(-_1013._13166);
         addElement(this._14880);
         var _loc8_:Label;
         (_loc8_ = new Label()).width = _1013._14765;
         _loc8_.text = tr("Export.background.color2");
         this._13472 = new DropDownList();
         this._13470 = new _1037();
         this._13470.source = this.COLOR_TYPES;
         this._13472.dataProvider = this._13470;
         this._13472.percentWidth = 100;
         this._13472.selectedIndex = 0;
         this.backgroundColor = new ColorPicker();
         this.backgroundColor.defaultColor = 16777215;
         this.backgroundColor._4061 = this.backgroundColor.defaultColor;
         this.backgroundColor.visible = false;
         this._14880.addElement(_loc8_);
         this._14880.addElement(this._13472);
         var _loc9_:Group = new Group();
         _loc9_.addElement(this.backgroundColor);
         this.backgroundColor.left = 10;
         _loc9_.width = _1013._13166 + 10;
         this._14880.addElement(_loc9_);
         var _loc10_:Label;
         (_loc10_ = new Label()).text = tr("export.web.grid");
         _loc10_.width = _1013._14765;
         this._12803 = this._2414();
         addElement(this._12803);
         var _loc11_:Label;
         (_loc11_ = new Label()).width = this._14765;
         _loc11_.text = tr("ExportEgret.maxFps");
         this._10885 = new TextInput();
         this._10885.text = "30";
         this._10885.restrict = "0-9";
         this._10885.maxChars = 2;
         this._10885.width = 40;
         this._13484 = new _128();
         this._13484.label = tr("ExportEgret.showFps");
         this._12803.addElement(_loc11_);
         this._12803.addElement(this._10885);
         this._12803.addElement(this._13484);
         this._13478 = this._2414();
         this._13480 = this._2414();
         addElement(this._13478);
         addElement(this._13480);
         this._13477 = new DropDownList();
         this._13479 = new DropDownList();
         this._13477.percentWidth = 100;
         this._13479.percentWidth = 100;
         var _loc12_:_1037;
         (_loc12_ = new _1037()).source = this.ORIENTATION_SOURCE;
         this._13477.dataProvider = _loc12_;
         this._13477.selectedIndex = 0;
         var _loc13_:_1037;
         (_loc13_ = new _1037()).source = this.SCREEN_SCALE_SOURCE;
         this._13479.dataProvider = _loc13_;
         this._13479.selectedIndex = 6;
         var _loc14_:Label;
         (_loc14_ = new Label()).width = _1013._14765;
         _loc14_.text = tr("ExportEgret.screenDirection");
         this._13478.addElement(_loc14_);
         this._13478.addElement(this._13477);
         var _loc15_:Label;
         (_loc15_ = new Label()).width = _1013._14765;
         _loc15_.text = tr("ExportEgret.screenMate");
         this._13480.addElement(_loc15_);
         this._13480.addElement(this._13479);
         var _loc16_:Group;
         (_loc16_ = new Group()).height = 122;
         addElement(_loc16_);
         var _loc17_:_12500 = new _12500();
         addElement(_loc17_);
         var _loc18_:Group;
         (_loc18_ = new Group()).height = 5;
         addElement(_loc18_);
         this._10877();
         this._13482();
      }
      
      private function _10877() : void
      {
         addEventListener(UIEvent.CREATION_COMPLETE,this._3991);
         this._12772.addEventListener(Event.CHANGE,this._13481);
         this._13472.addEventListener(Event.CHANGE,this._13481);
         this._7113.addEventListener(FocusEvent.FOCUS_OUT,this._4316);
         this.backgroundColor.addEventListener(UIEvent.CONFIRM,this._4052);
         this.backgroundColor.addEventListener(Event.CLEAR,this._4052);
         this._10885.addEventListener(Event.CHANGE,this._13481);
         this._13484.addEventListener(Event.CHANGE,this._13481);
         this._13477.addEventListener(Event.CHANGE,this._13481);
         this._13479.addEventListener(Event.CHANGE,this._13481);
      }
      
      private function _13481(param1:Event) : void
      {
         switch(param1.target)
         {
            case this._12772:
               this.refresh();
               break;
            case this._10885:
               this._14882._14681 = int(Number(this._10885.text)) || 30;
               this._7061._13266.frameRate = Number(this._10885.text) || 30;
               break;
            case this._13484:
               this._14882._14682 = this._13484.selected;
               this._7061._13266.showFPS = this._13484.selected;
               break;
            case this._13477:
               this._14882._3241 = this._13477.selectedIndex;
               this._7061._13266.orientation = this.ORIENTATION_VALUE[this._13477.selectedIndex];
               break;
            case this._13479:
               this._14882._14680 = this._13479.selectedIndex;
               this._7061._13266.scaleMode = this.SCALE_VALUE[this._13479.selectedIndex];
               break;
            case this._13472:
               if(this._13472.selectedIndex == 0)
               {
                  this._14882._14462 = false;
                  this._7061._14462 = false;
                  this.backgroundColor.visible = false;
               }
               else
               {
                  this._14882._14462 = true;
                  this._7061._14462 = true;
                  this.backgroundColor.visible = true;
               }
         }
      }
      
      private function _13482() : void
      {
         if(this._12772.selectedIndex === 0)
         {
            this._14880.includeInLayout = false;
            this._14880.visible = false;
            this._12803.includeInLayout = false;
            this._12803.visible = false;
            this._13478.includeInLayout = false;
            this._13478.visible = false;
            this._13480.includeInLayout = false;
            this._13480.visible = false;
         }
         else
         {
            this._14880.includeInLayout = true;
            this._14880.visible = true;
            this._12803.includeInLayout = true;
            this._12803.visible = true;
            this._13478.includeInLayout = true;
            this._13478.visible = true;
            this._13480.includeInLayout = true;
            this._13480.visible = true;
            this.backgroundColor.visible = this._7061._14462;
            this._13472._2484 = this._7061._14462 ? this.COLOR_TYPES[1] : this.COLOR_TYPES[0];
            this._10885.text = this._14882._14681.toString();
            this._13484.selected = this._14882._14682;
            this._13477.selectedIndex = this._14882._3241;
            this._13479.selectedIndex = this._14882._14680;
         }
      }
      
      private function _3991(param1:UIEvent) : void
      {
         removeEventListener(UIEvent.CREATION_COMPLETE,this._3991);
         this.refresh();
      }
      
      private function _4052(param1:Event) : void
      {
         this._14882._12584 = this.backgroundColor._4061;
         dispatchEvent(new ExportEvent(ExportEvent.WEB_COLOR_CHANGE,this.backgroundColor._4061));
      }
      
      private function _4316(param1:FocusEvent = null) : void
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
         this._7113.text = String(_loc2_);
         this._14882._12585 = _loc2_ / 100;
         dispatchEvent(new ExportEvent(ExportEvent.WEB_SCALE_CHANGE,_loc2_ / 100));
      }
      
      public function set _3238(param1:_720) : void
      {
         this._7061 = param1;
         this.refresh();
      }
      
      public function set _14461(param1:_14080) : void
      {
         this._14882 = param1;
      }
      
      public function refresh() : void
      {
         var _loc1_:Array = null;
         var _loc2_:String = null;
         var _loc3_:_50 = null;
         var _loc4_:_50 = null;
         if(!this._7061 || !this._14882)
         {
            return;
         }
         this._7061.scale = this._14882._12585;
         this._7061._12584 = this._14882._14462 ? int(this._14882._12584) : -1;
         this._7061._14462 = this._14882._14462;
         if(initialized)
         {
            this._7113.text = int(this._7061.scale * 100).toString();
            this.backgroundColor._4061 = this._7061._12584;
            this._7061._13266 = {
               "isRelease":false,
               "frameRate":this._14882._14681,
               "showFPS":this._14882._14682,
               "orientation":this.ORIENTATION_VALUE[this._14882._3241],
               "scaleMode":this.SCALE_VALUE[this._14882._14680]
            };
            if(this._12772.selectedIndex === 1)
            {
               _loc1_ = this._2861.getSelectedArmatures();
               if(this._7061.exportType === _720.TARGET_SELECTED && _loc1_.length === 1)
               {
                  _loc3_ = this._7061.dragonBonesVO._2107(_loc1_[0]);
                  if(!_loc3_._2000 && _loc3_._1811 !== SymbolType.STAGE)
                  {
                     _loc3_ = null;
                  }
               }
               else if(this._7061._10711.length === 1)
               {
                  _loc3_ = this._7061.dragonBonesVO._2107(this._7061._10711[0]);
                  if(!_loc3_._2000 && _loc3_._1811 !== SymbolType.STAGE)
                  {
                     _loc3_ = null;
                  }
               }
               else
               {
                  if(this._7061._10711.length <= 1)
                  {
                     Alert.show("No armatures.");
                     this._12772.selectedIndex = 0;
                     return;
                  }
                  _loc4_ = null;
                  for each(_loc2_ in this._7061._10711)
                  {
                     _loc3_ = this._7061.dragonBonesVO._2107(_loc2_);
                     if(_loc3_._2000)
                     {
                        break;
                     }
                     if(_loc3_._1811 === SymbolType.STAGE)
                     {
                        _loc4_ = _loc3_;
                     }
                     _loc3_ = null;
                  }
               }
               _loc3_ ||= _loc4_;
               if(!_loc3_)
               {
                  Alert.show(tr("Export.canvas.noCanvas"));
                  this._12772.selectedIndex = 0;
                  return;
               }
               this._7061.exportArmatureName = _loc3_.name;
               this._7061._10711 = [this._7061.exportArmatureName];
               _loc3_ = this._7061.dragonBonesVO._2107(this._7061.exportArmatureName);
               for each(_loc2_ in _loc3_._10664())
               {
                  this._7061._10711.push(_loc2_);
               }
               if(Boolean(_loc3_._2000) && _loc3_._2000.hasBackground)
               {
                  this.backgroundColor._4061 = _loc3_._2000.bgColor;
                  this._4052(null);
               }
            }
            this._13482();
            this._7061._13266.isRelease = this._12772.selectedIndex === 1;
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
      
      private function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
   }
}

