package _14106
{
   import flash.events.Event;
   
   public class RulerEvent extends Event
   {
      public static var _14622:String = "RulerEvent:ADD_RULE";
      
      public static var _14618:String = "RulerEvent:MOVE_RULE";
      
      public static var _14615:String = "RulerEvent:DELETE_RULE";
      
      public var data:*;
      
      public function RulerEvent(param1:String, param2:* = null, param3:Boolean = true, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.data = param2;
      }
      
      override public function clone() : Event
      {
         return new RulerEvent(this.type,this.data);
      }
   }
}

