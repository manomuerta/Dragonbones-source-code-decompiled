package _636
{
   import flash.events.Event;
   
   public class LibraryEvent extends Event
   {
      public static var OPEN_IN_BROWSER:String = "LibraryEvent:OPEN_IN_BROWSER";
      
      public static var CHANGE_PATH:String = "LibraryEvent:CHANGE_PATH";
      
      public static var REFRESH:String = "LibraryEvent:REFRESH";
      
      public static var IMPORT:String = "LibraryEvent:IMPORT";
      
      public var data:*;
      
      public function LibraryEvent(param1:String, param2:* = null, param3:Boolean = true, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.data = param2;
      }
      
      override public function clone() : Event
      {
         return new LibraryEvent(this.type,this.data);
      }
   }
}

