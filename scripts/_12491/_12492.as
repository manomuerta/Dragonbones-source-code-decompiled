package _12491
{
   import _1045.Button;
   import _1045.Group;
   import _1045._1105;
   import _127._171;
   import _12908._12910;
   import _97._125;
   import egret.utils.tr;
   import flash.display.NativeWindowType;
   import flash.events.MouseEvent;
   
   public class _12492 extends _171
   {
      private static var _12837:Class = _12492__12837;
      
      private var _5789:Function;
      
      public function _12492(param1:Function = null)
      {
         super();
         this.title = tr("Pay.tip.title");
         this.width = 400;
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
         var _loc1_:Group = _125._2414(15);
         _loc1_.addElement(new _1105(_12837));
         _loc1_.addElement(_125._12946(tr("Pay.tip")));
         _2512.addElement(_loc1_);
         var _loc2_:Group = _125._2395();
         _loc2_.percentWidth = 100;
         _loc2_.addElement(new _12910());
         _2512.addElement(_loc2_);
         var _loc3_:Group = _125._12511();
         var _loc4_:Button;
         (_loc4_ = _125._12513(tr("Pay.vip.pay"))).width = undefined;
         _loc4_.addEventListener(MouseEvent.CLICK,this._3753);
         _loc3_.addElement(_loc4_);
         _2512.addElement(_loc3_);
      }
      
      private function _3753(param1:MouseEvent) : void
      {
         close();
         if(this._5789 != null)
         {
            this._5789();
         }
      }
   }
}

