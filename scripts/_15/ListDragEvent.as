package _15
{
   import _1045._1070;
   import _1177.DragEvent;
   import egret.core._1111;
   import flash.display.InteractiveObject;
   import flash.events.Event;
   
   public class ListDragEvent extends DragEvent
   {
      public static const ITEM_DRAG_ENTER:String = "itemDragEnter";
      
      public var item:Object;
      
      public var itemRenderer:_1070;
      
      public var itemIndex:int;
      
      public function ListDragEvent(param1:String, param2:Boolean = false, param3:Boolean = true, param4:InteractiveObject = null, param5:_1111 = null, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:int = -1, param10:Object = null, param11:_1070 = null)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8);
         this.itemIndex = param9;
         this.item = param10;
         this.itemRenderer = param11;
      }
      
      override public function clone() : Event
      {
         var _loc1_:ListDragEvent = new ListDragEvent(type,bubbles,cancelable,dragInitiator,_1611,ctrlKey,altKey,shiftKey,this.itemIndex,this.item,this.itemRenderer);
         _loc1_.relatedObject = this.relatedObject;
         return _loc1_;
      }
   }
}

