package egret.managers
{
   import _1177.UIEvent;
   import flash.display.Stage;
   import flash.events.Event;
   
   public class _1218
   {
      private var _stage:Stage;
      
      private var contentsScaleFactor:Number = 1;
      
      public function _1218()
      {
         super();
      }
      
      public function get stage() : Stage
      {
         return this._stage;
      }
      
      public function set stage(param1:Stage) : void
      {
         if(this._stage == param1)
         {
            return;
         }
         if(this._stage)
         {
            this._stage.removeEventListener(Event.ENTER_FRAME,this._5071);
         }
         this._stage = param1;
         if(this._stage)
         {
            this.contentsScaleFactor = this._stage.contentsScaleFactor;
            this._stage.addEventListener(Event.ENTER_FRAME,this._5071);
         }
      }
      
      private function _5071(param1:Event) : void
      {
         if(this.contentsScaleFactor == this._stage.contentsScaleFactor)
         {
            return;
         }
         this.contentsScaleFactor = this._stage.contentsScaleFactor;
         this._stage.dispatchEvent(new UIEvent(UIEvent.SCREEN_DPI_CHANGED));
      }
   }
}

