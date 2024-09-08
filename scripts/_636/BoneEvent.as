package _636
{
   import flash.events.Event;
   
   public class BoneEvent extends Event
   {
      public static var CONFIRM_CHANGE_BONESYMBOL_COLOR:String = "BoneEvent:CONFIRM_CHANGE_BONESYMBOL_COLOR";
      
      public static var CHANGE_BONESYMBOL_COLOR:String = "BoneEvent:CHANGE_BONESYMBOL_COLOR";
      
      public static var CANCEL_CHANGE_BONESYMBOL_COLOR:String = "BoneEvent:CANCEL_CHANGE_BONESYMBOL_COLOR";
      
      public static var RESET_BONESYMBOL_COLOR:String = "BoneEvent:RESET_BONESYMBOL_COLOR";
      
      public var data:*;
      
      public function BoneEvent(param1:String, param2:* = null, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.data = param2;
      }
      
      override public function clone() : Event
      {
         return new BoneEvent(this.type,this.data);
      }
   }
}

