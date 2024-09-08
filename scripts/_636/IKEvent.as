package _636
{
   import flash.events.Event;
   
   public class IKEvent extends Event
   {
      public static var BEND_CHANGE:String = "IKEvent:BEND_CHANGE";
      
      public static var WEIGHT_CHANGE:String = "IKEvent:WEIGHT_CHANGE";
      
      public static var WEIGHT_CHANGE_CONFIRM:String = "IKEvent:WEIGHT_CHANGE_CONFIRM";
      
      public static var WEIGHT_CHANGE_END:String = "IKEvent:WEIGHT_CHANGE_END";
      
      public var data:*;
      
      public function IKEvent(param1:String, param2:* = null, param3:Boolean = true, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.data = param2;
      }
      
      override public function clone() : Event
      {
         return new IKEvent(this.type,this.data);
      }
   }
}

