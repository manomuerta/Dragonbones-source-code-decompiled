package _14123
{
   import _1038._1037;
   import _1045.Button;
   import _1045.DropDownList;
   import _1045.Group;
   import _1045.Label;
   import _1045._1105;
   import _1185._1189;
   import _127._128;
   import _97._125;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class _14124 extends _14126
   {
      private var _14949:Class;
      
      public var deleteCheckBox:_128;
      
      public var imageCheckBox:_128;
      
      public var boneCheckBox:_128;
      
      public var _11716:DropDownList;
      
      public var _11717:Button;
      
      public var _11711:Button;
      
      public function _14124()
      {
         this._14949 = _14124__14949;
         this.deleteCheckBox = new _128();
         this.imageCheckBox = new _128();
         this.boneCheckBox = new _128();
         this._11716 = new DropDownList();
         this._11717 = new Button();
         this._11711 = new Button();
         super();
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Group = null;
         var _loc2_:Group = null;
         var _loc3_:Group = null;
         super._2438();
         this.deleteCheckBox.label = tr("Setting.DeleteConfirmation");
         _loc1_ = _125._2414();
         _loc1_.addElement(this.deleteCheckBox);
         _loc1_.toolTip = tr("Setting.DeleteConfirmationTips");
         this.imageCheckBox.label = tr("Setting.ImageSmooth");
         _loc2_ = _125._2414();
         _loc2_.addElement(this.imageCheckBox);
         _loc2_.toolTip = tr("Setting.ImageSmoothTips");
         this.boneCheckBox.label = tr("Setting.BoneBinding");
         _loc3_ = _125._2414();
         _loc3_.addElement(this.boneCheckBox);
         _loc3_.toolTip = tr("Setting.BoneBindingTips");
         var _loc4_:Group = _125._2414();
         var _loc5_:Label;
         (_loc5_ = new Label()).text = tr("Setting.lang");
         var _loc6_:_1037 = new _1037([tr("Setting.lang.zh"),tr("Setting.lang.en"),tr("Setting.lang.ru")]);
         this._11716.width = 138;
         this._11716.dataProvider = _loc6_;
         this._11716.selectedIndex = 0;
         _loc4_.addElement(_loc5_);
         _loc4_.addElement(this._11716);
         var _loc7_:Group = _125._2414();
         this._11717.label = tr("Setting.hotkey.set");
         this._11717.minWidth = _14948;
         this._11711.label = tr("Setting.hotkey.default");
         _loc7_.addElement(this._11717);
         _loc7_.addElement(this._11711);
         var _loc8_:Group = _125._2414();
         var _loc9_:_1105;
         (_loc9_ = new _1105()).source = new this._14949();
         var _loc10_:Label;
         (_loc10_ = new Label())._6080 = 1;
         _loc10_.text = tr("Setting.hotkey.tip");
         _loc8_.addElement(_loc9_);
         _loc8_.addElement(_loc10_);
         _1189(_loc1_.layout)._2419 = 15;
         _1189(_loc2_.layout)._2419 = 15;
         _1189(_loc3_.layout)._2419 = 15;
         _1189(_loc7_.layout)._2419 = 15;
         _1189(_loc8_.layout)._2419 = 15;
         _2512.addElement(_loc4_);
         _2512.addElement(_14328());
         _2512.addElement(_12890(tr("Setting.hotkey")));
         _2512.addElement(_loc7_);
         _2512.addElement(_loc8_);
         _2512.addElement(_14328());
         _2512.addElement(_12890(tr("Setting.Convention")));
         _2512.addElement(_loc1_);
         _2512.addElement(_loc2_);
         _2512.addElement(_loc3_);
         this._11717.addEventListener(MouseEvent.CLICK,this.onHotKeyClickHandler);
         this._11711.addEventListener(MouseEvent.CLICK,this._11704);
         this._11716.addEventListener(Event.CHANGE,this.onLanguageChange);
         this.deleteCheckBox.addEventListener(Event.CHANGE,this._2493);
         this.imageCheckBox.addEventListener(Event.CHANGE,this._2493);
         this.boneCheckBox.addEventListener(Event.CHANGE,this._2493);
      }
      
      private function onHotKeyClickHandler(param1:MouseEvent) : void
      {
         dispatchEvent(new SettingEvent(SettingEvent.NORMAL_HOTKEY_SETTING));
      }
      
      private function _11704(param1:MouseEvent) : void
      {
         dispatchEvent(new SettingEvent(SettingEvent.NORMAL_HOTKEYDEFAULT));
      }
      
      private function onLanguageChange(param1:Event) : void
      {
         dispatchEvent(new SettingEvent(SettingEvent.NORMAL_LANGDROPLIST_SETTING,this._11716.selectedIndex));
      }
      
      private function _2493(param1:Event) : void
      {
         switch(param1.currentTarget)
         {
            case this.deleteCheckBox:
               dispatchEvent(new SettingEvent(SettingEvent.NORMAL_SETTING,{
                  "type":"deleteCheckBox",
                  "value":this.deleteCheckBox.selected
               }));
               break;
            case this.imageCheckBox:
               dispatchEvent(new SettingEvent(SettingEvent.NORMAL_SETTING,{
                  "type":"imageCheckBox",
                  "value":this.imageCheckBox.selected
               }));
               break;
            case this.boneCheckBox:
               dispatchEvent(new SettingEvent(SettingEvent.NORMAL_SETTING,{
                  "type":"boneCheckBox",
                  "value":this.boneCheckBox.selected
               }));
         }
      }
   }
}

