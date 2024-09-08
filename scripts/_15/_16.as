package _15
{
   import _1200._1199;
   import _13._14;
   import _1404._1405;
   import egret.core._1111;
   import egret.core._1141;
   import egret.core.ns_egret;
   import egret.managers._1203;
   import egret.managers._1205;
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.display.Stage;
   import flash.geom.Point;
   
   use namespace ns_egret;
   
   public class _16 implements _1203
   {
      private var dragInitiator:InteractiveObject;
      
      private var _1612:_1199;
      
      private var _1610:Boolean = false;
      
      public function _16()
      {
         super();
      }
      
      public function get isDragging() : Boolean
      {
         return this._1610;
      }
      
      public function doDrag(param1:InteractiveObject, param2:_1111, param3:DisplayObject = null, param4:Number = 0, param5:Number = 0, param6:Number = 0.5) : void
      {
         var stage:Stage;
         var mouseX:Number;
         var mouseY:Number;
         var proxyOrigin:Point;
         var dragInitiator:InteractiveObject = param1;
         var _1611:_1111 = param2;
         var dragImage:DisplayObject = param3;
         var xOffset:Number = param4;
         var yOffset:Number = param5;
         var imageAlpha:Number = param6;
         if(this._1610)
         {
            return;
         }
         this._1610 = true;
         this.dragInitiator = dragInitiator;
         this._1612 = new _1199(dragInitiator,_1611);
         this._1612._1606 = function():void
         {
            _14._1602(_1405.DESKTOP_DISABLE);
            _14.setCursor(_1405.DESKTOP_DRAG,1);
         };
         this._1612._1605 = function():void
         {
            _14._1602(_1405.DESKTOP_DRAG);
            _14.setCursor(_1405.DESKTOP_DISABLE,1);
         };
         this._1612._1616 = function():void
         {
            _14._1602(_1405.DESKTOP_DRAG);
            _14._1602(_1405.DESKTOP_DISABLE);
         };
         stage = dragInitiator.stage;
         if(!stage)
         {
            stage = _1141.ns_egret::_1615[0];
         }
         if(!stage)
         {
            return;
         }
         stage.addChild(this._1612);
         if(dragImage)
         {
            this._1612.ns_egret::_1607(dragImage);
            if(dragImage is _1205)
            {
               _1141.ns_egret::_1609._1608(_1205(dragImage),true);
            }
         }
         this._1612.alpha = imageAlpha;
         mouseX = stage.mouseX;
         mouseY = stage.mouseY;
         proxyOrigin = dragInitiator.localToGlobal(new Point(-xOffset,-yOffset));
         this._1612.xOffset = mouseX - proxyOrigin.x;
         this._1612.yOffset = mouseY - proxyOrigin.y;
         this._1612.x = proxyOrigin.x;
         this._1612.y = proxyOrigin.y;
         this._1612._1614 = this._1612.x;
         this._1612._1617 = this._1612.y;
         if(dragImage)
         {
            dragImage.cacheAsBitmap = true;
         }
      }
      
      public function acceptDragDrop(param1:InteractiveObject) : void
      {
         if(this._1612)
         {
            this._1612.target = param1;
         }
      }
      
      public function endDrag() : void
      {
         if(this._1612)
         {
            this._1612.parent.removeChild(this._1612);
            if(this._1612.numChildren > 0)
            {
               this._1612.ns_egret::_1604(0);
            }
            this._1612 = null;
         }
         this.dragInitiator = null;
         this._1610 = false;
      }
   }
}

