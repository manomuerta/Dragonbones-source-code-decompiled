package _636
{
   import flash.events.Event;
   
   public class ComicEvent extends Event
   {
      public static var OVER_TRACK:String = "ComicEvent:OVER_TRACK";
      
      public static var OUT_TRACK:String = "ComicEvent:OUT_TRACK";
      
      public static var SELECT_TRACK:String = "ComicEvent:SELECT_TRACK";
      
      public static var OVER_SLOT:String = "ComicEvent:OVER_SLOT";
      
      public static var OUT_SLOT:String = "ComicEvent:OUT_SLOT";
      
      public static var SELECT_SLOT:String = "ComicEvent:SELECT_SLOT";
      
      public static var OPEN_ANIMATION:String = "ComicEvent:OPEN_ANIMATION";
      
      public static var ADD_ANIMATION:String = "ComicEvent:ADD_ANIMATION";
      
      public static const DRAG_DROP_MOVE:String = "ComicEvent:DRAG_DROP_MOVE";
      
      public static const DRAG_DROP_MERGE:String = "ComicEvent:DRAG_DROP_MERGE";
      
      public var data:*;
      
      public function ComicEvent(param1:String, param2:* = null, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.data = param2;
      }
      
      override public function clone() : Event
      {
         return new ComicEvent(this.type,this.data,this.bubbles,this.cancelable);
      }
   }
}

