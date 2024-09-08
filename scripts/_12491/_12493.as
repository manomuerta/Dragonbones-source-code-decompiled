package _12491
{
   import _1045.Button;
   import _1045.Group;
   import _127._128;
   import _127._171;
   import _636.PayEvent;
   import _97._125;
   import egret.utils.tr;
   import flash.display.NativeWindowType;
   import flash.events.MouseEvent;
   
   public class _12493 extends _171
   {
      private var _5789:Function;
      
      private var _12875:_128;
      
      public function _12493(param1:Function = null)
      {
         super();
         this.title = tr("Pay.tip.title");
         this.width = 480;
         this.maximizable = false;
         this.minimizable = false;
         this.resizable = false;
         this.type = NativeWindowType.UTILITY;
         this._5789 = param1;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         closeButton.visible = true;
         _2512.top = _2512.bottom = 10;
         _2512.left = _2512.right = 15;
         this._12875 = new _128();
         this._12875.label = tr("Pay.noTip");
         _2512.addElement(_125._12946(tr("Pay.launch.tip")));
         _2512.addElement(this._12875);
         var _loc1_:Group = _125._12511();
         var _loc2_:Button = _125._12513(tr("Pay.say.no"));
         _loc2_.addEventListener(MouseEvent.CLICK,this._12876);
         var _loc3_:Button = _125._12513(tr("Pay.go.login"));
         _loc3_.addEventListener(MouseEvent.CLICK,this._12874);
         _loc1_.addElement(_loc2_);
         _loc1_.addElement(_loc3_);
         _2512.addElement(_loc1_);
      }
      
      private function _12876(param1:MouseEvent) : void
      {
         if(this._12875.selected)
         {
            dispatchEvent(new PayEvent(PayEvent.NEVER_TIP_LOGIN));
         }
         this.close();
      }
      
      private function _12874(param1:MouseEvent) : void
      {
         this.close();
         if(this._5789 != null)
         {
            this._5789();
         }
      }
   }
}

