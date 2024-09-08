package egret.managers.impl
{
   import _1200._1199;
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
   
   public class _1207 implements _1203
   {
      private var dragInitiator:InteractiveObject;
      
      private var _1612:_1199;
      
      private var _1610:Boolean = false;
      
      public function _1207()
      {
         super();
      }
      
      public function get isDragging() : Boolean
      {
         return this._1610;
      }
      
      public function doDrag(param1:InteractiveObject, param2:_1111, param3:DisplayObject = null, param4:Number = 0, param5:Number = 0, param6:Number = 0.5) : void
      {
         if(this._1610)
         {
            return;
         }
         this._1610 = true;
         this.dragInitiator = param1;
         this._1612 = new _1199(param1,param2);
         var _loc7_:Stage = param1.stage;
         if(!_loc7_)
         {
            _loc7_ = _1141.ns_egret::_1615[0];
         }
         if(!_loc7_)
         {
            return;
         }
         _loc7_.addChild(this._1612);
         if(param3)
         {
            this._1612.ns_egret::_1607(param3);
            if(param3 is _1205)
            {
               _1141.ns_egret::_1609._1608(_1205(param3),true);
            }
         }
         this._1612.alpha = param6;
         var _loc8_:Number = _loc7_.mouseX;
         var _loc9_:Number = _loc7_.mouseY;
         var _loc10_:Point = param1.localToGlobal(new Point(-param4,-param5));
         this._1612.xOffset = _loc8_ - _loc10_.x;
         this._1612.yOffset = _loc9_ - _loc10_.y;
         this._1612.x = _loc10_.x;
         this._1612.y = _loc10_.y;
         this._1612._1614 = this._1612.x;
         this._1612._1617 = this._1612.y;
         if(param3)
         {
            param3.cacheAsBitmap = true;
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

