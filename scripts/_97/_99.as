package _97
{
   public function _99(param1:Function) : void
   {
      var func:Function = param1;
      var timer:Timer = new Timer(0,1);
      timer.addEventListener(TimerEvent.TIMER,function(param1:TimerEvent):void
      {
         func();
      });
      timer.start();
   }
}

