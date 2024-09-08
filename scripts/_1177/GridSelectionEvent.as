package _1177
{
   import _1049._1050;
   import flash.events.Event;
   
   public class GridSelectionEvent extends Event
   {
      public static const SELECTION_CHANGE:String = "selectionChange";
      
      public static const SELECTION_CHANGING:String = "selectionChanging";
      
      public var kind:String;
      
      public var selectionChange:_1050;
      
      public function GridSelectionEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:String = null, param5:_1050 = null)
      {
         super(param1,param2,param3);
         this.kind = param4;
         this.selectionChange = param5;
      }
      
      override public function toString() : String
      {
         return formatToString("GridSelectionEvent","type","bubbles","cancelable","eventPhase","kind","selectionChange");
      }
      
      override public function clone() : Event
      {
         return new GridSelectionEvent(type,bubbles,cancelable,this.kind,this.selectionChange);
      }
   }
}

