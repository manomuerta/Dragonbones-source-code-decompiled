package _1177
{
   import _1049._1053;
   import flash.events.Event;
   
   public class GridSortEvent extends Event
   {
      public static const SORT_CHANGE:String = "sortChange";
      
      public static const SORT_CHANGING:String = "sortChanging";
      
      public var column:_1053;
      
      public function GridSortEvent(param1:String, param2:Boolean, param3:Boolean, param4:_1053)
      {
         super(param1,param2,param3);
         this.column = param4;
      }
      
      override public function clone() : Event
      {
         return new GridSortEvent(type,bubbles,cancelable,this.column);
      }
   }
}

