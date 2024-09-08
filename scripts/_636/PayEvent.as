package _636
{
   import flash.events.Event;
   
   public class PayEvent extends Event
   {
      public static var NEVER_TIP_LOGIN:String = "PayEvent:NEVER_TIP_LOGIN";
      
      public static var APPLY_ENTERPRISE:String = "PayEvent:APPLY_ENTERPRISE";
      
      public static var SHOW_ENTERPRISE:String = "PayEvent:SHOW_ENTERPRISE";
      
      public var data:*;
      
      public function PayEvent(param1:String, param2:* = null, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.data = param2;
      }
      
      override public function clone() : Event
      {
         return new PayEvent(this.type,this.data);
      }
   }
}

