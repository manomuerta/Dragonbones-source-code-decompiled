package _1177
{
   import flash.events.Event;
   
   public class IndexChangeEvent extends Event
   {
      public static const CHANGE:String = "change";
      
      public static const CHANGING:String = "changing";
      
      public var newIndex:int;
      
      public var oldIndex:int;
      
      public function IndexChangeEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:int = -1, param5:int = -1)
      {
         super(param1,param2,param3);
         this.oldIndex = param4;
         this.newIndex = param5;
      }
      
      override public function clone() : Event
      {
         return new IndexChangeEvent(type,bubbles,cancelable,this.oldIndex,this.newIndex);
      }
   }
}

