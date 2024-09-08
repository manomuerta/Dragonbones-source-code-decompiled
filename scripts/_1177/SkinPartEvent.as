package _1177
{
   import flash.events.Event;
   
   public class SkinPartEvent extends Event
   {
      public static const PART_ADDED:String = "partAdded";
      
      public static const PART_REMOVED:String = "partRemoved";
      
      public var instance:Object;
      
      public var _2518:String;
      
      public function SkinPartEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:String = null, param5:Object = null)
      {
         super(param1,param2,param3);
         this._2518 = param4;
         this.instance = param5;
      }
      
      override public function clone() : Event
      {
         return new SkinPartEvent(type,bubbles,cancelable,this._2518,this.instance);
      }
   }
}

