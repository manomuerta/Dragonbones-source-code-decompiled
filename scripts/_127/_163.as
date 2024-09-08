package _127
{
   import _1045._1070;
   import _1177.DragEvent;
   import _1177.ListEvent;
   import _1177.RendererExistenceEvent;
   import _1373._787;
   import _1374.Tree;
   import _15.ListDragEvent;
   import egret.core._1133;
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   
   public class _163 extends Tree
   {
      private static const TYPE_MAP:Object = {
         "doubleClick":ListEvent.ITEM_DOUBLE_CLICK,
         "mouseDown":ListEvent.ITEM_MOUSE_DOWN,
         "dragEnter":ListDragEvent.ITEM_DRAG_ENTER,
         "rightMouseDown":ListEvent.ITEM_RIGHT_MOUSE_DOWN,
         "rightClick":ListEvent.ITEM_RIGHT_CLICK
      };
      
      private var _2605:_787;
      
      public function _163()
      {
         super();
         itemRenderer = _165;
         this.removeEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
      }
      
      public function get _2606() : _787
      {
         return this._2605;
      }
      
      public function set _2606(param1:_787) : void
      {
         this._2605 = param1;
         _2607 = this._2606;
      }
      
      override protected function _2603(param1:RendererExistenceEvent) : void
      {
         super._2603(param1);
         var _loc2_:DisplayObject = param1._2487 as DisplayObject;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.addEventListener(MouseEvent.DOUBLE_CLICK,this._2458);
         _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,this._2458);
         _loc2_.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this._2458);
         _loc2_.addEventListener(MouseEvent.RIGHT_CLICK,this._2458);
         _loc2_.addEventListener(DragEvent.DRAG_ENTER,this._2602);
      }
      
      override protected function _2601(param1:RendererExistenceEvent) : void
      {
         super._2601(param1);
         var _loc2_:DisplayObject = param1._2487 as DisplayObject;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.removeEventListener(MouseEvent.DOUBLE_CLICK,this._2458);
         _loc2_.removeEventListener(MouseEvent.MOUSE_DOWN,this._2458);
         _loc2_.removeEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this._2458);
         _loc2_.removeEventListener(MouseEvent.RIGHT_CLICK,this._2458);
         _loc2_.removeEventListener(DragEvent.DRAG_ENTER,this._2602);
      }
      
      private function _2458(param1:MouseEvent) : void
      {
         var _loc3_:ListEvent = null;
         var _loc2_:String = TYPE_MAP[param1.type];
         if(hasEventListener(_loc2_))
         {
            _loc3_ = this._2473(param1,_loc2_,param1.currentTarget as _1070);
            if(_loc3_._2489)
            {
               param1.stopPropagation();
            }
         }
      }
      
      private function _2602(param1:DragEvent) : void
      {
         var _loc2_:String = TYPE_MAP[param1.type];
         if(hasEventListener(_loc2_))
         {
            this._2604(param1,_loc2_,param1.currentTarget as _1070);
         }
      }
      
      protected function _2473(param1:MouseEvent, param2:String, param3:_1070) : ListEvent
      {
         var _loc4_:int = -1;
         if(param3)
         {
            _loc4_ = param3.itemIndex;
         }
         else
         {
            _loc4_ = _2490.getElementIndex(param1.currentTarget as _1133);
         }
         var _loc5_:ListEvent = new ListEvent(param2,false,false,param1.localX,param1.localY,param1.target as InteractiveObject,param1.ctrlKey,param1.altKey,param1.shiftKey,param1.buttonDown,param1.delta,_loc4_,dataProvider.getItemAt(_loc4_),param3);
         dispatchEvent(_loc5_);
         return _loc5_;
      }
      
      protected function _2604(param1:DragEvent, param2:String, param3:_1070) : void
      {
         var _loc4_:int = -1;
         if(param3)
         {
            _loc4_ = param3.itemIndex;
         }
         else
         {
            _loc4_ = _2490.getElementIndex(param1.currentTarget as _1133);
         }
         var _loc5_:ListDragEvent = new ListDragEvent(param2,param1.bubbles,param1.cancelable,param1.dragInitiator,param1._1611,param1.ctrlKey,param1.altKey,param1.shiftKey,_loc4_,dataProvider.getItemAt(_loc4_),param3);
         dispatchEvent(_loc5_);
      }
   }
}

