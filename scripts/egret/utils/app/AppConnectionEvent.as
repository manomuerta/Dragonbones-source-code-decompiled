package egret.utils.app
{
   import flash.events.Event;
   
   public class AppConnectionEvent extends Event
   {
      public static const RECEIVE:String = "receive";
      
      public static const SEND:String = "send";
      
      public var appID:String;
      
      public var result:Boolean = true;
      
      public var messageName:String;
      
      public var args:Array;
      
      public function AppConnectionEvent(param1:String, param2:String, param3:Array = null)
      {
         super(param1,bubbles,cancelable);
         this.messageName = param2;
         this.args = param3;
      }
   }
}

