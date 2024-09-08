package _1177
{
   import flash.events.Event;
   
   public class MoveEvent extends Event
   {
      public static const MOVE:String = "move";
      
      public var _3147:Number;
      
      public var _3146:Number;
      
      public function MoveEvent(param1:String, param2:Number = NaN, param3:Number = NaN, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         this._3147 = param2;
         this._3146 = param3;
      }
      
      override public function clone() : Event
      {
         return new MoveEvent(type,this._3147,this._3146,bubbles,cancelable);
      }
   }
}

