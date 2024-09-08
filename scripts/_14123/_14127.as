package _14123
{
   import _1045.Button;
   import _1045.Group;
   import _1185._1189;
   import _97._125;
   import egret.utils.tr;
   import flash.events.MouseEvent;
   
   public class _14127 extends _14126
   {
      public var _11718:Button;
      
      public var _14957:Button;
      
      public var _5613:Button;
      
      public function _14127()
      {
         this._11718 = new Button();
         this._14957 = new Button();
         this._5613 = new Button();
         super();
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Group = null;
         super._2438();
         _loc1_ = _125._2414();
         this._14957.label = tr("Setting.export.defalut");
         _loc1_.addElement(this._14957);
         this._5613.label = tr("Setting.Reset");
         _loc1_.addElement(this._5613);
         var _loc2_:Group = _125._2414();
         this._11718.label = tr("Setting.logger.set");
         _loc2_.addElement(this._11718);
         _1189(_loc1_.layout)._2419 = 15;
         _1189(_loc2_.layout)._2419 = 15;
         _2512.addElement(_12890(tr("Setting.preset")));
         _2512.addElement(_loc1_);
         _2512.addElement(_14328());
         _2512.addElement(_12890(tr("Setting.logger")));
         _2512.addElement(_loc2_);
         this._5613.addEventListener(MouseEvent.CLICK,this._5605);
         this._11718.addEventListener(MouseEvent.CLICK,this.onLogClickHandler);
         this._14957.addEventListener(MouseEvent.CLICK,this._14654);
      }
      
      private function _5605(param1:MouseEvent) : void
      {
         dispatchEvent(new SettingEvent(SettingEvent.SYSTEM_RESET_SETTING));
      }
      
      private function onLogClickHandler(param1:MouseEvent) : void
      {
         dispatchEvent(new SettingEvent(SettingEvent.SYSTEM_LOG_SETTING));
      }
      
      private function _14654(param1:MouseEvent) : void
      {
         dispatchEvent(new SettingEvent(SettingEvent.SYSTEM_EXPORTDEFAULT));
      }
   }
}

