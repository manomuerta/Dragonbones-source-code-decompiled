package _1177
{
   import flash.events.Event;
   
   public class GridCaretEvent extends Event
   {
      public static const CARET_CHANGE:String = "caretChange";
      
      public var _7749:int;
      
      public var _7727:int;
      
      public var _7750:int;
      
      public var _7726:int;
      
      public function GridCaretEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:int = -1, param5:int = -1, param6:int = -1, param7:int = -1)
      {
         super(param1,param2,param3);
         this._7749 = param4;
         this._7727 = param5;
         this._7750 = param6;
         this._7726 = param7;
      }
      
      override public function clone() : Event
      {
         return new GridCaretEvent(type,bubbles,cancelable,this._7749,this._7727,this._7750,this._7726);
      }
   }
}

