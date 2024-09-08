package _18
{
   import flash.events.Event;
   
   public class DBHistoryEvent extends Event
   {
      public static const UNDOABLE_CHANGED:String = "DBHistoryEvent:UNDOABLE_CHANGED";
      
      public static const REDOABLE_CHANGED:String = "DBHistoryEvent:REDOABLE_CHANGED";
      
      public static const SAVEABLE_CHANGED:String = "DBHistoryEvent:SAVEABLE_CHANGED";
      
      public function DBHistoryEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}

