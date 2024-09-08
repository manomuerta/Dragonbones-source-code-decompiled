package _636
{
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      public static var DRAGONBONES_PROJECT:String = "WindowEvent:DRAGONBONES_PROJECT";
      
      public static var COMIC_PROJECT:String = "WindowEvent:COMIC_PROJECT";
      
      public static var LOG_OUT:String = "WindowEvent:LOG_OUT";
      
      public var data:*;
      
      public function WindowEvent(param1:String, param2:* = null, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.data = param2;
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(this.type,this.data,this.bubbles,this.cancelable);
      }
   }
}

