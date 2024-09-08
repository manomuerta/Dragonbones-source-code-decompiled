package _1177
{
   import _1045._1072;
   import flash.events.Event;
   
   public class TreeEvent extends Event
   {
      public static const ITEM_CLOSE:String = "itemClose";
      
      public static const ITEM_OPEN:String = "itemOpen";
      
      public static const ITEM_OPENING:String = "itemOpening";
      
      public var item:Object;
      
      public var itemRenderer:_1072;
      
      public var itemIndex:int;
      
      public var opening:Boolean;
      
      public function TreeEvent(param1:String, param2:Boolean = false, param3:Boolean = true, param4:int = -1, param5:Object = null, param6:_1072 = null)
      {
         super(param1,param2,param3);
         this.item = param5;
         this.itemRenderer = param6;
         this.itemIndex = param4;
      }
      
      override public function clone() : Event
      {
         var _loc1_:TreeEvent = new TreeEvent(type,bubbles,cancelable,this.itemIndex,this.item,this.itemRenderer);
         _loc1_.opening = this.opening;
         return _loc1_;
      }
   }
}

