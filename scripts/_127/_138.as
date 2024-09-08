package _127
{
   import _1045.Button;
   import _1376._1378;
   import _1421._1422;
   import flash.events.MouseEvent;
   
   public class _138 extends _1378
   {
      public var closeButton:Button;
      
      public function _138()
      {
         super();
         mouseChildren = true;
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.closeButton)
         {
            this.closeButton.addEventListener(MouseEvent.CLICK,this._2517);
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this.closeButton)
         {
            this.closeButton.removeEventListener(MouseEvent.CLICK,this._2517);
         }
      }
      
      private function _2517(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         dispatchEvent(new _1422(_1422.CLOSE,true));
      }
   }
}

