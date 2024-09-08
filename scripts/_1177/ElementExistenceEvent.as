package _1177
{
   import egret.core._1133;
   import flash.events.Event;
   
   public class ElementExistenceEvent extends Event
   {
      public static const ELEMENT_ADD:String = "elementAdd";
      
      public static const ELEMENT_REMOVE:String = "elementRemove";
      
      public var index:int;
      
      public var element:_1133;
      
      public function ElementExistenceEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:_1133 = null, param5:int = -1)
      {
         super(param1,param2,param3);
         this.element = param4;
         this.index = param5;
      }
      
      override public function clone() : Event
      {
         return new ElementExistenceEvent(type,bubbles,cancelable,this.element,this.index);
      }
   }
}

