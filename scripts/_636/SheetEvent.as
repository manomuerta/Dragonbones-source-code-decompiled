package _636
{
   import flash.events.Event;
   
   public class SheetEvent extends Event
   {
      public static var DELETE_FRAME:String = "SheetEvent:NEVER_TIP_LOGIN";
      
      public var data:*;
      
      public function SheetEvent(param1:String, param2:* = null, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.data = param2;
      }
      
      override public function clone() : Event
      {
         return new SheetEvent(this.type,this.data);
      }
   }
}

