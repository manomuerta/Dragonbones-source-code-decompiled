package _1011
{
   import _1033._12500;
   import _1038._1037;
   import _1045.CheckBox;
   import _1045.Group;
   import _1045.Label;
   import _1045.RadioButton;
   import _1045._1081;
   import _1045._1107;
   import _1177.UIEvent;
   import _1185._1189;
   import _1185._1197;
   import _1374.DropDownList;
   import _1374.TextInput;
   import _14079._14078;
   import _636.ExportEvent;
   import _721._720;
   import _97._101;
   import _97._125;
   import egret.utils.tr;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class ExportDBPanel extends Group
   {
      private var _2565:_1107;
      
      public const _14765:int = 80;
      
      private var _7058:TextInput;
      
      private var _7114:_1014;
      
      private var _7097:RadioButton;
      
      private var _7102:RadioButton;
      
      private var _10594:RadioButton;
      
      private var _10596:RadioButton;
      
      private var _11193:RadioButton;
      
      private var _12771:_12489;
      
      private var _7086:int;
      
      private var _7081:int;
      
      private var _7077:Vector.<BitmapData>;
      
      private var _10873:CheckBox;
      
      private var _10875:CheckBox;
      
      private var _7119:RadioButton;
      
      private var _7118:RadioButton;
      
      private var _11483:RadioButton;
      
      private var _10871:_1081;
      
      private var _11482:RadioButton;
      
      private var _11191:RadioButton;
      
      private var _11190:_1081;
      
      private var _2585:Group;
      
      private var _10872:Label;
      
      private var _6546:Label;
      
      private var _12772:DropDownList;
      
      private var _12770:DropDownList;
      
      private var _12769:DropDownList;
      
      private var _14862:Boolean = true;
      
      private var _7061:_720;
      
      private var _14864:_14078;
      
      public function ExportDBPanel()
      {
         this.typeList = [tr("Export.type.dragonbones"),tr("Export.type.Binary"),tr("Export.type.egret"),tr("Export.type.movieClip"),tr("Export.type.Spine")];
         this.dbVersionList = [_101.DATA_VERSION_5_5,_101.DATA_VERSION_5_0,_101.DATA_VERSION_4_5,_101.DATA_VERSION_4_0];
         this.spVersionList = [_101.SPINE_VERSION_3_3,_101.SPINE_VERSION_2_1];
         super();
         var _loc1_:_1197 = new _1197();
         _loc1_._2420 = 8;
         _loc1_._2419 = 0;
         _loc1_._2416 = 0;
         _loc1_._2410 = 0;
         _loc1_.gap = 5;
         this.layout = _loc1_;
         this.percentWidth = 100;
         this.percentHeight = 100;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._10873 = new CheckBox();
         var _loc1_:Label = new Label();
         _loc1_.text = tr("Export.setting.data");
         addElement(_loc1_);
         this._6546 = new Label();
         this._6546.text = tr("Export.type");
         this._6546.width = this._14765;
         this._12772 = new DropDownList();
         var _loc2_:_1037 = new _1037(this.typeList);
         this._12772.dataProvider = _loc2_;
         this._12772.percentWidth = 100;
         this._12772.selectedIndex = 0;
         var _loc3_:Group = _125._2414();
         _loc3_.percentWidth = 100;
         var _loc4_:_1189;
         (_loc4_ = _loc3_.layout as _1189).gap = 0;
         _loc4_._2420 = 0;
         _loc4_._2410 = 0;
         _loc4_._2419 = 20;
         _loc4_._2416 = 10 + _1013._13166;
         _loc3_.addElement(this._6546);
         _loc3_.addElement(this._12772);
         addElement(_loc3_);
         this._10872 = new Label();
         this._10872.text = tr("Export.output.dataVersion");
         this._10872.width = this._14765;
         this._12770 = new DropDownList();
         var _loc5_:_1037 = new _1037(this.dbVersionList);
         this._12770.dataProvider = _loc5_;
         this._12770.percentWidth = 100;
         this._12770.selectedIndex = 0;
         this._12769 = new DropDownList();
         var _loc6_:_1037 = new _1037(this.spVersionList);
         this._12769.dataProvider = _loc6_;
         this._12769.percentWidth = 100;
         this._12769.selectedIndex = 0;
         var _loc7_:Group;
         (_loc7_ = _125._2414()).percentWidth = 100;
         var _loc8_:_1189;
         (_loc8_ = _loc7_.layout as _1189).gap = 0;
         _loc8_._2420 = 0;
         _loc8_._2410 = 5;
         _loc8_._2419 = 20;
         _loc8_._2416 = 10 + _1013._13166;
         _loc7_.addElement(this._10872);
         _loc7_.addElement(this._12770);
         _loc7_.addElement(this._12769);
         addElement(_loc7_);
         var _loc9_:_12500 = new _12500();
         addElement(_loc9_);
         var _loc10_:Group;
         (_loc10_ = new Group()).height = 2;
         addElement(_loc10_);
         this._10875 = new CheckBox();
         var _loc11_:Label;
         (_loc11_ = new Label()).text = tr("Export.setting.texture");
         addElement(_loc11_);
         this._12771 = new _12489();
         this._12771.percentWidth = 100;
         this._12771._14863 = this._14862;
         addElement(this._12771);
         this._10877();
         this.refresh();
      }
      
      private function _12774() : void
      {
         this._12769.includeInLayout = false;
         this._12769.visible = false;
         this._12770.includeInLayout = true;
         this._12770.visible = true;
         this._10872.visible = true;
         this._12772.selectedIndex = 0;
         if(this._7061)
         {
            switch(this._7061.version)
            {
               case _101.DATA_VERSION_5_5:
                  this._12770.selectedIndex = 0;
                  break;
               case _101.DATA_VERSION_5_0:
                  this._12770.selectedIndex = 1;
                  break;
               case _101.DATA_VERSION_4_5:
                  this._12770.selectedIndex = 2;
                  break;
               case _101.DATA_VERSION_4_0:
                  this._12770.selectedIndex = 3;
                  break;
               default:
                  this._12770.selectedIndex = 0;
            }
         }
         this._12771._12774();
      }
      
      public function _12776() : void
      {
         this._12769.visible = false;
         this._12770.visible = false;
         this._10872.visible = false;
         this._12772.selectedIndex = 2;
         this._12771._12776();
      }
      
      public function _13465() : void
      {
         this._12769.visible = false;
         this._12770.visible = false;
         this._10872.visible = false;
         this._12772.selectedIndex = 1;
         this._12771._12776();
      }
      
      public function _12777() : void
      {
         this._12769.visible = false;
         this._12770.visible = false;
         this._10872.visible = false;
         this._12772.selectedIndex = 3;
         this._12771._12777();
      }
      
      public function _12775() : void
      {
         this._12769.includeInLayout = true;
         this._12769.visible = true;
         this._12770.includeInLayout = false;
         this._12770.visible = false;
         this._10872.visible = true;
         this._12772.selectedIndex = 4;
         if(this._7061)
         {
            switch(this._7061.version)
            {
               case _101.SPINE_VERSION_3_3:
                  this._12769.selectedIndex = 0;
                  break;
               case _101.SPINE_VERSION_2_1:
                  this._12769.selectedIndex = 1;
                  break;
               default:
                  this._12769.selectedIndex = 0;
            }
         }
         this._12771._12775();
      }
      
      private function _10877() : void
      {
         this._10873.addEventListener(Event.CHANGE,this._10869);
         this._10875.addEventListener(Event.CHANGE,this._10874);
         this._12770.addEventListener(Event.CHANGE,this._7091);
         this._12769.addEventListener(Event.CHANGE,this._12768);
         this._12772.addEventListener(Event.CHANGE,this._7107);
         addEventListener(ExportEvent.IMAGE_TYPE_CHANGE,this._7095);
         addEventListener(UIEvent.CREATION_COMPLETE,this._4321);
      }
      
      private function _4321(param1:UIEvent) : void
      {
         removeEventListener(UIEvent.CREATION_COMPLETE,this._4321);
         this.refresh();
      }
      
      public function refresh() : void
      {
         if(!this._7061 || !this._14864)
         {
            return;
         }
         this._7061.exportType = this._14864.dataType;
         this._7061.version = this._14864.dataVersion;
         this._7061.imageType = this._14864._14675;
         if(!initialized)
         {
            return;
         }
         switch(this._7061.exportType)
         {
            case _720.EXPORT_TYPE_DRAGONBONES:
               if(_101.DATA_VERSIONS.indexOf(this._7061.version) < 0)
               {
                  this._7061.version = _101.DATA_VERSION;
                  this._14864.dataVersion = _101.DATA_VERSION;
               }
               this._12774();
               break;
            case _720.EXPORT_TYPE_SPINE:
               if(this._7061.version != _101.SPINE_VERSION_2_1 && this._7061.version != _101.SPINE_VERSION_3_3)
               {
                  this._7061.version = _101.SPINE_VERSION_3_3;
                  this._14864.dataVersion = _101.SPINE_VERSION_3_3;
               }
               this._12775();
               break;
            case _720.EXPORT_TYPE_EGRETFAST:
               this._12776();
               break;
            case _720.EXPORT_TYPE_BINARY:
               this._13465();
               break;
            case _720.EXPORT_TYPE_MOVIECLIP:
               this._12777();
         }
         this._12771._14464 = this._14864;
         this._12771.refresh(this._7061);
      }
      
      public function open() : void
      {
         this._12771.open();
      }
      
      public function close() : void
      {
         this._12771.close();
      }
      
      private function _7095(param1:ExportEvent) : void
      {
      }
      
      private function _10869(param1:Event) : void
      {
         dispatchEvent(new ExportEvent(ExportEvent.EXPORT_DATA,this._10873.selected));
         this._10870();
      }
      
      private function _10874(param1:Event) : void
      {
         dispatchEvent(new ExportEvent(ExportEvent.EXPORT_TEXTURE,this._10875.selected));
         this._10870();
      }
      
      private function _10870() : void
      {
         this._7097.enabled = this._7061.exportData;
         this._10596.enabled = this._7061.exportData && !this._7061._10577();
         this._7102.enabled = this._7061.exportData;
         this._11193.enabled = this._7061.exportData;
         this._7119.enabled = this._7061.exportData;
         this._7118.enabled = this._7061.exportData;
         this._11483.enabled = this._7061.exportData;
         this._11482.enabled = this._7061.exportData;
         this._11191.enabled = this._7061.exportData;
         this._6546.enabled = this._7061.exportData;
         this._10872.enabled = this._7061.exportData;
      }
      
      private function _7107(param1:Event) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = this._12772.selectedIndex;
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         switch(_loc2_)
         {
            case 0:
               _loc3_ = _720.EXPORT_TYPE_DRAGONBONES;
               break;
            case 1:
               _loc3_ = _720.EXPORT_TYPE_BINARY;
               break;
            case 2:
               _loc3_ = _720.EXPORT_TYPE_EGRETFAST;
               break;
            case 3:
               _loc3_ = _720.EXPORT_TYPE_MOVIECLIP;
               break;
            case 4:
               _loc3_ = _720.EXPORT_TYPE_SPINE;
         }
         this._14864.dataType = _loc3_;
         dispatchEvent(new ExportEvent(ExportEvent.EXPORT_TYPE_CHANGE,_loc3_));
         this.refresh();
         if(_loc2_ == 2)
         {
            dispatchEvent(new ExportEvent(ExportEvent.CHECK_MESH_EGRET));
         }
      }
      
      private function _7091(param1:Event) : void
      {
         var _loc2_:String = this.dbVersionList[this._12770.selectedIndex];
         this._14864.dataVersion = _loc2_;
         dispatchEvent(new ExportEvent(ExportEvent.DATA_VERSION_CHANGE,_loc2_));
      }
      
      private function _12768(param1:Event) : void
      {
         var _loc2_:String = this.spVersionList[this._12769.selectedIndex];
         this._14864.dataVersion = _loc2_;
         dispatchEvent(new ExportEvent(ExportEvent.DATA_VERSION_CHANGE,_loc2_));
      }
      
      public function set _3238(param1:_720) : void
      {
         this._7061 = param1;
         if(initialized)
         {
            this.refresh();
         }
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
         if(this._12771)
         {
            this._12771._14454();
         }
      }
   }
}

