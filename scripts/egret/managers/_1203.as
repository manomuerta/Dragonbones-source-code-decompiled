package egret.managers
{
   import egret.core._1111;
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   
   public interface _1203
   {
      function get isDragging() : Boolean;
      
      function doDrag(param1:InteractiveObject, param2:_1111, param3:DisplayObject = null, param4:Number = 0, param5:Number = 0, param6:Number = 0.5) : void;
      
      function acceptDragDrop(param1:InteractiveObject) : void;
      
      function endDrag() : void;
   }
}

