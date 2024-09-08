package _872
{
   import _1045.Group;
   import _880._879;
   import flash.events.Event;
   
   public class _871 extends Group
   {
      public function _871()
      {
         super();
         this.left = this.right = this.top = this.bottom = 0;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         addEventListener(Event.ADDED_TO_STAGE,this._4333);
      }
      
      private function _4333(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this._4333);
         _879.init(this.stage);
         this.stage.addEventListener("GPU_READY",this._3767);
      }
      
      private function _3767(param1:Event) : void
      {
         dispatchEvent(param1);
      }
   }
}

