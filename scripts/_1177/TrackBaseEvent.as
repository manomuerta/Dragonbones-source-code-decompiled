package _1177
{
   import flash.events.Event;
   
   public class TrackBaseEvent extends Event
   {
      public static const THUMB_DRAG:String = "thumbDrag";
      
      public static const THUMB_PRESS:String = "thumbPress";
      
      public static const THUMB_RELEASE:String = "thumbRelease";
      
      public function TrackBaseEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         return new TrackBaseEvent(type,bubbles,cancelable);
      }
   }
}

