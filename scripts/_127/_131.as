package _127
{
   import _1038._1037;
   import _1045.List;
   import _1045._1070;
   import _1177.ListEvent;
   import _1177.RendererExistenceEvent;
   import _1185._1186;
   import egret.core._1133;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class _131 extends List
   {
      private static const TYPE_MAP:Object = {
         "rollOver":ListEvent.ITEM_ROLL_OVER,
         "rollOut":ListEvent.ITEM_ROLL_OUT,
         "mouseDown":ListEvent.ITEM_MOUSE_DOWN,
         "mouseUp":ListEvent.ITEM_MOUSE_UP,
         "rightClick":ListEvent.ITEM_RIGHT_CLICK
      };
      
      public function _131()
      {
         super();
         addEventListener(RendererExistenceEvent.RENDERER_ADD,this._2472);
         addEventListener(RendererExistenceEvent.RENDERER_REMOVE,this._2463);
         this.layout = new _1186();
         this.skinName = _132;
      }
      
      protected function _2472(param1:RendererExistenceEvent) : void
      {
         var _loc2_:DisplayObject = param1._2487 as DisplayObject;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.addEventListener(MouseEvent.ROLL_OVER,this._2458);
         _loc2_.addEventListener(MouseEvent.ROLL_OUT,this._2458);
         _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,this._2458);
         _loc2_.addEventListener(MouseEvent.MOUSE_UP,this._2458);
         _loc2_.addEventListener(MouseEvent.RIGHT_CLICK,this._2458);
      }
      
      protected function _2463(param1:RendererExistenceEvent) : void
      {
         var _loc2_:DisplayObject = param1._2487 as DisplayObject;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.removeEventListener(MouseEvent.ROLL_OVER,this._2458);
         _loc2_.removeEventListener(MouseEvent.ROLL_OUT,this._2458);
         _loc2_.removeEventListener(MouseEvent.MOUSE_DOWN,this._2458);
         _loc2_.removeEventListener(MouseEvent.MOUSE_UP,this._2458);
         _loc2_.removeEventListener(MouseEvent.RIGHT_CLICK,this._2458);
      }
      
      private function _2458(param1:MouseEvent) : void
      {
         var _loc3_:ListEvent = null;
         var _loc2_:String = param1.type;
         _loc2_ = TYPE_MAP[_loc2_];
         if(hasEventListener(_loc2_))
         {
            _loc3_ = this._2473(param1,_loc2_,param1.currentTarget as _1070);
            if(_loc3_._2489)
            {
               param1.stopPropagation();
            }
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
         var _loc5_:ListEvent = new ListEvent(param2,false,false,param1.localX,param1.localY,param1.relatedObject,param1.ctrlKey,param1.altKey,param1.shiftKey,param1.buttonDown,param1.delta,_loc4_,dataProvider.getItemAt(_loc4_),param3);
         dispatchEvent(_loc5_);
         return _loc5_;
      }
      
      public function _2474(param1:Object) : _1133
      {
         var _loc2_:int = (dataProvider as _1037).getItemIndex(param1);
         if(_loc2_ < 0)
         {
            return null;
         }
         return _2490.getElementAt(_loc2_);
      }
   }
}

