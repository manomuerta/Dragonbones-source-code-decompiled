package _14123
{
   import _1045.Group;
   import _1045.Label;
   import _1185._1189;
   import _127._128;
   import _1374.ColorPicker;
   import _24._26;
   import _639.HotkeysModel;
   import _97._100;
   import _97._125;
   import egret.utils.tr;
   import flash.events.Event;
   
   public class _14125 extends _14126
   {
      public var rulerCheckBox:_128;
      
      public var rlineCheckBox:_128;
      
      public var rLineSelectCheckBox:_128;
      
      public var _14950:ColorPicker;
      
      public function _14125()
      {
         this.rulerCheckBox = new _128();
         this.rlineCheckBox = new _128();
         this.rLineSelectCheckBox = new _128();
         this._14950 = new ColorPicker();
         super();
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Group = null;
         var _loc2_:Group = null;
         var _loc3_:Group = null;
         var _loc4_:Label = null;
         super._2438();
         this.rulerCheckBox = new _128();
         this.rulerCheckBox.label = tr("Setting.export.rulerselect");
         _loc1_ = _125._2414();
         _loc1_.addElement(this.rulerCheckBox);
         this.rlineCheckBox.label = tr("Setting.export.rlineshow") + HotkeysModel.getInstance()._11726(_26.HIDE_RULERLINE);
         _loc2_ = _125._2414();
         _loc2_.addElement(this.rlineCheckBox);
         this.rLineSelectCheckBox.label = tr("Setting.export.rlineselect") + HotkeysModel.getInstance()._11726(_26.ENABLE_RULERLINE);
         _loc3_ = _125._2414();
         _loc3_.addElement(this.rLineSelectCheckBox);
         (_loc4_ = new Label()).width = 103;
         _loc4_.text = tr("Setting.export.rlinecolor");
         _loc4_.alpha = _7319;
         this._14950._6193 = true;
         this._14950.defaultColor = _100.assistLine;
         var _loc5_:Group;
         (_loc5_ = _125._2414()).percentWidth = 100;
         _loc5_.addElement(_loc4_);
         _loc5_.addElement(this._14950);
         _1189(_loc1_.layout)._2419 = 15;
         _1189(_loc2_.layout)._2419 = 15;
         _1189(_loc3_.layout)._2419 = 15;
         _1189(_loc5_.layout)._2419 = 15;
         _2512.addElement(_12890(tr("Setting.Color")));
         _2512.addElement(_loc5_);
         _2512.addElement(_14328());
         _2512.addElement(_12890(tr("Setting.Convention")));
         _2512.addElement(_loc1_);
         _2512.addElement(_loc2_);
         _2512.addElement(_loc3_);
         this.rulerCheckBox.addEventListener(Event.CHANGE,this._2493);
         this.rlineCheckBox.addEventListener(Event.CHANGE,this._2493);
         this.rLineSelectCheckBox.addEventListener(Event.CHANGE,this._2493);
      }
      
      private function _2493(param1:Event) : void
      {
         switch(param1.currentTarget)
         {
            case this.rulerCheckBox:
               this.rlineCheckBox.enabled = this.rulerCheckBox.selected;
               this.rLineSelectCheckBox.enabled = this.rulerCheckBox.selected;
               this.rLineSelectCheckBox.enabled = this.rulerCheckBox.selected;
               this._14950.enabled = this.rulerCheckBox.selected;
               dispatchEvent(new SettingEvent(SettingEvent.RULER_SETTING,{
                  "type":"rulerCheckBox",
                  "value":this.rulerCheckBox.selected
               }));
               break;
            case this.rlineCheckBox:
               dispatchEvent(new SettingEvent(SettingEvent.RULER_SETTING,{
                  "type":"rlineCheckBox",
                  "value":this.rlineCheckBox.selected
               }));
               break;
            case this.rLineSelectCheckBox:
               dispatchEvent(new SettingEvent(SettingEvent.RULER_SETTING,{
                  "type":"rLineSelectCheckBox",
                  "value":this.rLineSelectCheckBox.selected
               }));
         }
      }
   }
}

