package _472
{
   import _1374.Application;
   import _1404._1407;
   import _783.StageNotification;
   import _872._871;
   import _93._94;
   import flash.events.Event;
   
   public class _519 extends _94
   {
      public var application:Application;
      
      private var _3768:_871;
      
      private var _3212:_577;
      
      public function _519()
      {
         this._3212 = _1407.getInstance(_577);
         super();
      }
      
      override public function start() : void
      {
         super.start();
         this._3212._3768 = this._3768;
         this._3212.start();
      }
      
      override protected function init() : void
      {
         this._3768 = new _871();
         this.application.addElement(this._3768);
         this._3768.addEventListener("GPU_READY",this._3767);
      }
      
      private function _3767(param1:Event) : void
      {
         _1567(new StageNotification(StageNotification.GPU_READY));
      }
   }
}

