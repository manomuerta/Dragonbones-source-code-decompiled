package _1177
{
   import egret.core._1111;
   import flash.display.InteractiveObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class DragEvent extends MouseEvent
   {
      public static const DRAG_START:String = "dragStart";
      
      public static const DRAG_COMPLETE:String = "dragComplete";
      
      public static const DRAG_DROP:String = "dragDrop";
      
      public static const DRAG_ENTER:String = "dragEnter";
      
      public static const DRAG_EXIT:String = "dragExit";
      
      public static const DRAG_OVER:String = "dragOver";
      
      public var dragInitiator:InteractiveObject;
      
      public var _1611:_1111;
      
      public function DragEvent(param1:String, param2:Boolean = false, param3:Boolean = true, param4:InteractiveObject = null, param5:_1111 = null, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param2,param3);
         this.dragInitiator = param4;
         this._1611 = param5;
         this.ctrlKey = param6;
         this.altKey = param7;
         this.shiftKey = param8;
      }
      
      override public function clone() : Event
      {
         var _loc1_:DragEvent = new DragEvent(type,bubbles,cancelable,this.dragInitiator,this._1611,ctrlKey,altKey,shiftKey);
         _loc1_.relatedObject = this.relatedObject;
         _loc1_.localX = this.localX;
         _loc1_.localY = this.localY;
         return _loc1_;
      }
   }
}

