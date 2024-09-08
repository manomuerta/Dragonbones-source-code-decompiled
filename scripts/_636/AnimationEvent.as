package _636
{
   import flash.events.Event;
   
   public class AnimationEvent extends Event
   {
      public static const PICK_BONE:String = "AnimationEvent:PICK_BONE";
      
      public static var MODIFY_SLOT_DISPLAY_INDEX:String = "AnimationEvent:MODIFY_SLOT_DISPLAY_INDEX";
      
      public static var MODIFY_SLOT_COLOR:String = "AnimationEvent:MODIFY_SLOT_COLOR";
      
      public static var MODIFY_SLOT_ALPHA:String = "AnimationEvent:MODIFY_SLOT_ALPHA";
      
      public static var MODIFY_SLOT_COMIC_ALPHA:String = "AnimationEvent:MODIFY_SLOT_COMIC_ALPHA";
      
      public static var CHANGE_SLOT_ALPHA:String = "AnimationEvent:CHANGE_SLOT_ALPHA";
      
      public static var CHANGE_SLOT_COMIC_ALPHA:String = "AnimationEvent:CHANGE_SLOT_COMIC_ALPHA";
      
      public static var CHANGE_SLOT_COLOR:String = "AnimationEvent:CHANGE_SLOT_COLOR";
      
      public static var CHANGE_SLOT_BLENDMODE:String = "AnimationEvent:CHANGE_SLOT_BLENDMODE";
      
      public static var CANCEL_SLOT_COLOR:String = "AnimationEvent:CANCEL_SLOT_COLOR";
      
      public static var MODIFY_SLOT_PIVOT:String = "AnimationEvent:MODIFY_SLOT_PIVOT";
      
      public static var MODIFY_CANVAS:String = "AnimationEvent:MODIFY_CANVAS";
      
      public static var MODIFY_IKCONSTRAINT_NAME:String = "AnimationEvent:MODIFY_IKCONSTRAINT_NAME";
      
      public static var MODIFY_ARMATURE_ANIMATION:String = "AnimationEvent:MODIFY_ARMATURE_ANIMATION";
      
      public static var MODIFY_FRAMES_TWEEN_TYPE:String = "AnimationEvent:MODIFY_FRAMES_TWEEN_TYPE";
      
      public static var MODIFY_FRAMES_TWEEN_ROTATE:String = "AnimationEvent:MODIFY_FRAMES_TWEEN_ROTATE";
      
      public static var MODIFY_FRAMES_TWEEN_CURVE:String = "AnimationEvent:MODIFY_FRAMES_TWEEN_CURVE";
      
      public static var ADD_FRAME_ACTION:String = "AnimationEvent:ADD_FRAME_ACTION";
      
      public static var MODIFY_FRAME_ACTION:String = "AnimationEvent:MODIFY_FRAME_ACTION";
      
      public static var MODIFY_FRAME_EVENT:String = "AnimationEvent:MODIFY_FRAME_EVENT";
      
      public static var DEL_FRAME_ACTION:String = "AnimationEvent:DEL_FRAME_ACTION";
      
      public static var ADD_EVENT_FRAME:String = "AnimationEvent:ADD_EVENT_FRAME";
      
      public static var KEY_COLOR:String = "AnimationEvent:KEY_COLOR";
      
      public static var KEY_DISPLAY:String = "AnimationEvent:KEY_DISPLAY";
      
      public static var KEY_VISIBLE:String = "AnimationEvent:KEY_VISIBLE";
      
      public static var KEY_IK_BEND:String = "AnimationEvent:KEY_IK_BEND";
      
      public static var KEY_IK_WEIGHT:String = "AnimationEvent:KEY_IK_WEIGHT";
      
      public static var KEY_GOTO:String = "AnimationEvent:KEY_GOTO";
      
      public static var KEY_FFD:String = "AnimationEvent:KEY_FFD";
      
      public var data:*;
      
      public function AnimationEvent(param1:String, param2:* = null, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.data = param2;
      }
      
      override public function clone() : Event
      {
         return new AnimationEvent(this.type,this.data);
      }
   }
}

