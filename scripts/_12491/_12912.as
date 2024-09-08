package _12491
{
   import _1045.Button;
   import _1045.Group;
   import _1045._1105;
   import _127._171;
   import _636.PayEvent;
   import _97._125;
   import egret.utils.tr;
   import flash.display.NativeWindowType;
   import flash.events.MouseEvent;
   
   public class _12912 extends _171
   {
      private static var _13048:Class = _12912__13048;
      
      public function _12912()
      {
         super();
         this.title = tr("Pay.pay.success");
         this.width = 400;
         this.maximizable = false;
         this.minimizable = false;
         this.resizable = false;
         this.type = NativeWindowType.UTILITY;
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Group = null;
         var _loc2_:Group = null;
         super._2438();
         closeButton.visible = true;
         _2512.top = _2512.bottom = 10;
         _2512.left = _2512.right = 15;
         _loc1_ = _125._2397(15);
         _loc1_.percentWidth = 100;
         _loc1_.addElement(new _1105(_13048));
         _loc1_.addElement(_125._12836(tr("Pay.pay.levelup")));
         _2512.addElement(_loc1_);
         _loc2_ = _125._12511();
         var _loc3_:Button = _125._12513(tr("Pay.level.company"));
         _loc3_.width = undefined;
         _loc3_.addEventListener(MouseEvent.CLICK,this._3753);
         _loc2_.addElement(_loc3_);
         _2512.addElement(_loc2_);
      }
      
      private function _3753(param1:MouseEvent) : void
      {
         dispatchEvent(new PayEvent(PayEvent.SHOW_ENTERPRISE));
         close();
      }
   }
}

