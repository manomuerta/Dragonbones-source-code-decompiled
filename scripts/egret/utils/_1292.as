package egret.utils
{
   import egret.core._1140;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   
   public class _1292
   {
      public function _1292()
      {
         super();
      }
      
      public static function _7685(param1:_1140, param2:Function, param3:Function, param4:Function) : void
      {
         var f:Function = null;
         var target:_1140 = param1;
         var handleDown:Function = param2;
         var handleDrag:Function = param3;
         var handleUp:Function = param4;
         f = function(param1:Event):void
         {
            var _loc2_:IEventDispatcher = null;
            switch(param1.type)
            {
               case MouseEvent.MOUSE_DOWN:
                  if(param1.isDefaultPrevented())
                  {
                     break;
                  }
                  handleDown(param1);
                  _loc2_ = target._1558.stage;
                  _loc2_.addEventListener(MouseEvent.MOUSE_MOVE,f,true);
                  _loc2_.addEventListener(MouseEvent.MOUSE_UP,f,true);
                  _loc2_.addEventListener(Event.MOUSE_LEAVE,f,true);
                  break;
               case MouseEvent.MOUSE_MOVE:
                  handleDrag(param1);
                  break;
               case MouseEvent.MOUSE_UP:
                  handleUp(param1);
                  _loc2_ = target._1558.stage;
                  _loc2_.removeEventListener(MouseEvent.MOUSE_MOVE,f,true);
                  _loc2_.removeEventListener(MouseEvent.MOUSE_UP,f,true);
                  _loc2_.removeEventListener(Event.MOUSE_LEAVE,f,true);
                  break;
               case "removeHandler":
                  target.removeEventListener("removeHandler",f);
                  target.removeEventListener(MouseEvent.MOUSE_DOWN,f);
                  _loc2_ = target._1558.stage;
                  _loc2_.removeEventListener(MouseEvent.MOUSE_MOVE,f,true);
                  _loc2_.removeEventListener(MouseEvent.MOUSE_UP,f,true);
                  _loc2_.removeEventListener(Event.MOUSE_LEAVE,f,true);
            }
         };
         target.addEventListener(MouseEvent.MOUSE_DOWN,f);
         target.addEventListener("removeHandler",f);
      }
   }
}

