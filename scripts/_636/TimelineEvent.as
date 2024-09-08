package _636
{
   import flash.events.Event;
   
   public class TimelineEvent extends Event
   {
      public static var UPDATE:String = "TimelineEvent:TIMELINE_UPDATE";
      
      public static var _5619:String = "TimelineEvent:TIMELINE_INDEX_CHANGE";
      
      public static var FRAME_CHANGE:String = "TimelineEvent:TIMELINE_FRAME_CHANGE";
      
      public static var FRAME_RATE_CHANGE:String = "TimelineEvent:TIMELINE_FRAME_RATE_CHANGE";
      
      public static var SCALE_CHANGE:String = "TimelineEvent:TIMELINE_SCALE_CHANGE";
      
      public static var LAST_FRAME_CHANGE:String = "TimelineEvent:LAST_FRAME_CHANGE";
      
      public static var GOTO_FIRST_FRAME:String = "TimelineEvent:GOTO_FIRST_FRAME";
      
      public static var SELECT_TIMELINE:String = "TimelineEvent:SELECT_TIMELINE";
      
      public static var SELECT_TIMELINES:String = "TimelineEvent:SELECT_TIMELINES";
      
      public static var SELECT_FRAMES:String = "TimelineEvent:SELECT_FRAMES";
      
      public static var _4636:String = "TimelineEvent:TIMELINE_SELECT_FRAME_ONE";
      
      public static var SELECT_FRAME_LINE:String = "TimelineEvent:TIMELINE_SELECT_FRAME_LINE";
      
      public static var _4622:String = "TimelineEvent:TIMELINE_SELECT_FRAME_NONE";
      
      public static var MOVE_KEY_FRAME:String = "TimelineEvent:MOVE_KEY_FRAME";
      
      public static var SCALE_KEY_FRAME:String = "TimelineEvent:SCALE_KEY_FRAME";
      
      public static var MOVE_FRAME:String = "TimelineEvent:MOVE_FRAME";
      
      public static var MOVE_FRAME_START:String = "TimelineEvent:MOVE_FRAME_START";
      
      public static var MOVE_FRAME_END:String = "TimelineEvent:MOVE_FRAME_END";
      
      public static var VISIBLE_CHANGE:String = "TimelineEvent:VISIBLE_CHANGE";
      
      public static var LOCK_CHANGE:String = "TimelineEvent:LOCK_CHANGE";
      
      public static var ONION_CHANGE:String = "TimelineEvent:ONION_CHANGE";
      
      public static var SELECT_RECT_START:String = "TimelineEvent:SELECT_RECT_START";
      
      public static var SELECT_RECT:String = "TimelineEvent:SELECT_RECT";
      
      public static var SELECT_RECT_END:String = "TimelineEvent:SELECT_RECT_END";
      
      public static var SCALE_FRAME:String = "TimelineEvent:SCALE_FRAME";
      
      public static var ADD_LAYER:String = "TimelineEvent:ADD_LAYER";
      
      public static var DEL_LAYER:String = "TimelineEvent:DEL_LAYER";
      
      public static var CHANGE_LAYER_NAME:String = "TimelineEvent:CHANGE_LAYER_NAME";
      
      public static var STOP_ANIMATION:String = "TimelineEvent:STOP_ANIMATION";
      
      public static var RIGHT_DOWN_FRAME:String = "TimelineEvent:RIGHT_DOWN_FRAME";
      
      public static const SHOW_ALL:String = "TimelineEvent:SHOW_ALL";
      
      public static const ANIMATION_TREE_OPEN:String = "TimelineEvent:ANIMATION_TREE_OPEN";
      
      public var data:*;
      
      public function TimelineEvent(param1:String, param2:* = null, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.data = param2;
      }
      
      override public function clone() : Event
      {
         return new TimelineEvent(this.type,this.data);
      }
   }
}

