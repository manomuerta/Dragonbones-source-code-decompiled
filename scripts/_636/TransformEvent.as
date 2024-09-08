package _636
{
   import flash.events.Event;
   
   public class TransformEvent extends Event
   {
      public static var ROTATION_COMPLETE:String = "TransformEvent:ROTATION_COMPLETE";
      
      public static var ROTATION_CHANGE:String = "TransformEvent:ROTATION_CHANGE";
      
      public static var X_CHANGE:String = "TransformEvent:X_CHANGE";
      
      public static var Y_CHANGE:String = "TransformEvent:Y_CHANGE";
      
      public static var SCALE_X_CHANGE:String = "TransformEvent:SCALE_X_CHANGE";
      
      public static var SCALE_Y_CHANGE:String = "TransformEvent:SCALE_Y_CHANGE";
      
      public static var HEIGHT_CHANGE:String = "TransformEvent:HEIGHT_CHANGE";
      
      public static var WIDTH_CHANGE:String = "TransformEvent:WIDTH_CHANGE";
      
      public static var PIVOT_X_CHANGE:String = "TransformEvent:PIVOT_X_CHANGE";
      
      public static var PIVOT_Y_CHANGE:String = "TransformEvent:PIVOT_Y_CHANGE";
      
      public static var PIVOT_CHANGE:String = "TransformEvent:PIVOT_CHANGE";
      
      public static var FLIPX_CHANGE:String = "TransformEvent:FLIPX_CHANGE";
      
      public static var FLIPY_CHANGE:String = "TransformEvent:FLIPY_CHANGE";
      
      public static var KEY_TRANSLATE:String = "TransformEvent:KEY_TRANSLATE";
      
      public static var KEY_ROTATE:String = "TransformEvent:KEY_ROTATE";
      
      public static var KEY_SCALE:String = "TransformEvent:KEY_SCALE";
      
      public static var TRANSFORM_MODEL_CHANGE:String = "TransformEvent:TRANSFORM_MODEL_CHANGE";
      
      public static var LOCK_WIDTH_HEIGHT_CHANGE:String = "TransformEvent:LOCK_WIDTH_HEIGHT_CHANGE";
      
      public var data:*;
      
      public function TransformEvent(param1:String, param2:* = null, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.data = param2;
      }
      
      override public function clone() : Event
      {
         return new TransformEvent(this.type,this.data);
      }
   }
}

