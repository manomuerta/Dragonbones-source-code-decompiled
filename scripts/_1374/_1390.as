package _1374
{
   import _1045.VSlider;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.utils.setTimeout;
   
   public class _1390 extends VSlider
   {
      private var _9747:Boolean = false;
      
      public function _1390()
      {
         super();
      }
      
      override protected function _8455(param1:MouseEvent) : void
      {
         super._8455(param1);
         this._9747 = true;
         (_1558 as DisplayObject).addEventListener(MouseEvent.MOUSE_UP,this._8543);
         setTimeout(this._9746,50,param1);
      }
      
      private function _9746(param1:MouseEvent) : void
      {
         if(this._9747)
         {
            _8454(param1);
         }
      }
      
      private function _8543(param1:MouseEvent) : void
      {
         (_1558 as DisplayObject).removeEventListener(MouseEvent.MOUSE_UP,this._8543);
         this._9747 = false;
      }
   }
}

