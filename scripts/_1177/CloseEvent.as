package _1177
{
   import flash.events.Event;
   
   public class CloseEvent extends Event
   {
      public static const CLOSE:String = "close";
      
      public var detail:Object;
      
      public function CloseEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:Object = -1)
      {
         super(param1,param2,param3);
         this.detail = param4;
      }
      
      override public function clone() : Event
      {
         return new CloseEvent(type,bubbles,cancelable,this.detail);
      }
   }
}

