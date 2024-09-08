package _1177
{
   import _1045._1070;
   import flash.display.InteractiveObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ListEvent extends MouseEvent
   {
      public static const ITEM_ROLL_OUT:String = "itemRollOut";
      
      public static const ITEM_ROLL_OVER:String = "itemRollOver";
      
      public static const ITEM_MOUSE_DOWN:String = "itemMouseDown";
      
      public static const ITEM_RIGHT_MOUSE_DOWN:String = "itemRightMouseDown";
      
      public static const ITEM_MOUSE_UP:String = "itemMouseUp";
      
      public static const ITEM_CLICK:String = "itemClick";
      
      public static const ITEM_RIGHT_CLICK:String = "itemRightClick";
      
      public static const ITEM_DOUBLE_CLICK:String = "itemDoubleClick";
      
      public var _2489:Boolean = false;
      
      public var item:Object;
      
      public var itemRenderer:_1070;
      
      public var itemIndex:int;
      
      public function ListEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:Number = NaN, param5:Number = NaN, param6:InteractiveObject = null, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:int = 0, param12:int = -1, param13:Object = null, param14:_1070 = null)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         this.itemIndex = param12;
         this.item = param13;
         this.itemRenderer = param14;
      }
      
      override public function clone() : Event
      {
         var _loc1_:ListEvent = new ListEvent(type,bubbles,cancelable,localX,localY,relatedObject,ctrlKey,altKey,shiftKey,buttonDown,delta,this.itemIndex,this.item,this.itemRenderer);
         _loc1_.relatedObject = this.relatedObject;
         return _loc1_;
      }
      
      override public function stopPropagation() : void
      {
         super.stopPropagation();
         this._2489 = true;
      }
   }
}

