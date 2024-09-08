package _472
{
   import _1404._1407;
   import _521._532;
   import _6._7;
   import _783.StageNotification;
   import _97._99;
   import flash.events.MouseEvent;
   
   public class _607 extends _7
   {
      public static var instance:_607 = _1407.getInstance(_607) as _607;
      
      private var _2226:_532;
      
      private var _5408:Boolean = false;
      
      public function _607()
      {
         this._2226 = _1407.getInstance(_532) as _532;
         super();
      }
      
      public function _4355() : void
      {
         _1567(new StageNotification(StageNotification.START_TRANSFORM));
      }
      
      public function _5059(param1:Boolean = false) : void
      {
         if(param1)
         {
            stage.addEventListener(MouseEvent.CLICK,this._3825);
            this._5408 = false;
            _99(this._3825);
         }
         else
         {
            _1567(new StageNotification(StageNotification.STOP_TRANSFORM));
            this._2226._2984 = true;
         }
      }
      
      protected function _3825(param1:MouseEvent = null) : void
      {
         if(!this._5408)
         {
            this._5408 = true;
            stage.removeEventListener(MouseEvent.CLICK,this._3825);
            _1567(new StageNotification(StageNotification.STOP_TRANSFORM));
         }
      }
   }
}

