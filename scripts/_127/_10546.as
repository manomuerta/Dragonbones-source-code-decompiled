package _127
{
   import _1045._1070;
   import _1088.ItemRenderer;
   import _1373._787;
   import _1404._1405;
   import egret.managers.DragManager;
   import egret.managers._1198;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class _10546 extends _787
   {
      private var flag:int = 0;
      
      public function _10546()
      {
         super();
      }
      
      override protected function _5991(param1:MouseEvent = null) : void
      {
         var _loc2_:_1070 = null;
         var _loc3_:String = null;
         var _loc4_:_10547 = null;
         var _loc5_:_10547 = null;
         _6018.graphics.clear();
         _6018.visible = false;
         _6019 = false;
         if(_3597 != null && _6027)
         {
            if(!DragManager.isDragging)
            {
               if(_1198.cursor != _1405.DESKTOP_DISABLE)
               {
                  _1198.setCursor(_1405.DESKTOP_DISABLE,1);
               }
            }
            if(param1 != null)
            {
               _6009 = param1.currentTarget as ItemRenderer;
            }
            if(!_6009)
            {
               return;
            }
            if(_6011 != null)
            {
               _6017 = _6011(_6009.data);
            }
            else
            {
               _6017 = _6009.data;
            }
            if(_6017 != null)
            {
               _6030 = true;
               if(_3576 != null)
               {
                  if(!_3576(_6017,_3597))
                  {
                     _6030 = false;
                     if(!DragManager.isDragging)
                     {
                        if(_1198.cursor != _1405.DESKTOP_DISABLE)
                        {
                           _1198.setCursor(_1405.DESKTOP_DISABLE,1);
                        }
                     }
                  }
               }
               if(_6030)
               {
                  _6030 = !_6007(_3597,_6017);
               }
               _6021 = true;
               if(_3573 != null)
               {
                  if(_3573.length == 2)
                  {
                     if(!_3573(_6009.data,_3597))
                     {
                        _6021 = false;
                     }
                  }
                  else if(_3573.length == 3)
                  {
                     _loc3_ = "in";
                     if(_6017 == _6009.data && _6029)
                     {
                        if(DisplayObject(_6009).mouseY < DisplayObject(_6009).height / 3 && _6021)
                        {
                           _loc3_ = "top";
                        }
                        else if(DisplayObject(_6009).mouseY > DisplayObject(_6009).height / 3 * 2 && _6021)
                        {
                           _loc3_ = "bottom";
                        }
                     }
                     if(!_3573(_6009.data,_3597,_loc3_))
                     {
                        _6021 = false;
                     }
                  }
               }
               if(_6021)
               {
                  _6021 = !_6007(_3597,_6017);
               }
               if(_6017 == _6009.data && !_6029 && _6030)
               {
                  _loc2_ = _6013(_6017);
                  if(_loc2_ != null && _loc2_ is DisplayObject)
                  {
                     _6024(_loc2_);
                     DragManager.acceptDragDrop(_6036);
                     if(!DragManager.isDragging)
                     {
                        if(_1198.cursor != _1405.DESKTOP_DRAG)
                        {
                           _1198.setCursor(_1405.DESKTOP_DRAG,1);
                        }
                     }
                     _6019 = false;
                  }
               }
               else if(_6017 == _6009.data && _6029)
               {
                  _loc2_ = _6013(_6017);
                  if(_loc2_ != null && _loc2_ is DisplayObject)
                  {
                     if(DisplayObject(_6009).mouseY < DisplayObject(_6009).height / 3 && _6021)
                     {
                        _6014(_loc2_,true);
                        _6019 = true;
                        _6034 = true;
                        DragManager.acceptDragDrop(_6036);
                        if(!DragManager.isDragging)
                        {
                           if(_1198.cursor != _1405.DESKTOP_DRAG)
                           {
                              _1198.setCursor(_1405.DESKTOP_DRAG,1);
                           }
                        }
                        _6020 = _6009.data;
                        if(this.flag != 1)
                        {
                           this.flag = 1;
                           (_loc4_ = new _10547(_10547.ITEMS_DRAG_UP_REFRESH))._3597 = _3597;
                           _loc4_._4137 = _6009.data;
                           _loc4_._4136 = true;
                           this._6036.dispatchEvent(_loc4_);
                        }
                     }
                     else if(DisplayObject(_6009).mouseY > DisplayObject(_6009).height / 3 * 2 && _6021)
                     {
                        _6014(_loc2_,false);
                        _6019 = true;
                        _6034 = false;
                        DragManager.acceptDragDrop(_6036);
                        if(!DragManager.isDragging)
                        {
                           if(_1198.cursor != _1405.DESKTOP_DRAG)
                           {
                              _1198.setCursor(_1405.DESKTOP_DRAG,1);
                           }
                        }
                        _6020 = _6009.data;
                        if(this.flag != 2)
                        {
                           this.flag = 2;
                           (_loc5_ = new _10547(_10547.ITEMS_DRAG_DOWN_REFRESH))._3597 = _3597;
                           _loc5_._4137 = _6009.data;
                           _loc5_._4136 = false;
                           this._6036.dispatchEvent(_loc5_);
                        }
                     }
                     else if(_6030)
                     {
                        _6024(_loc2_);
                        _6019 = false;
                        DragManager.acceptDragDrop(_6036);
                        if(!DragManager.isDragging)
                        {
                           if(_1198.cursor != _1405.DESKTOP_DRAG)
                           {
                              _1198.setCursor(_1405.DESKTOP_DRAG,1);
                           }
                        }
                     }
                  }
               }
               else if(_6017 != _6009.data && !_6029 && _6030)
               {
                  _loc2_ = _6013(_6017);
                  if(_loc2_ != null && _loc2_ is DisplayObject)
                  {
                     _6024(_loc2_);
                     _6019 = false;
                     DragManager.acceptDragDrop(_6036);
                     if(!DragManager.isDragging)
                     {
                        if(_1198.cursor != _1405.DESKTOP_DRAG)
                        {
                           _1198.setCursor(_1405.DESKTOP_DRAG,1);
                        }
                     }
                  }
               }
               else if(_6017 != _6009.data && _6029 && _6021)
               {
                  if(DisplayObject(_6009).mouseY > DisplayObject(_6009).height / 2)
                  {
                     _6034 = false;
                     _6014(_loc2_,false);
                  }
                  else
                  {
                     _6034 = true;
                     _6014(_loc2_,true);
                  }
                  DragManager.acceptDragDrop(_6036);
                  _6019 = true;
                  _6020 = _6009.data;
               }
            }
         }
      }
      
      override protected function _5998(param1:MouseEvent) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Boolean = false;
         if(_6009 == null)
         {
            _6026.removeEventListener(MouseEvent.MOUSE_UP,this._5998);
            if(!DragManager.isDragging)
            {
               _1198._1602(_1405.DESKTOP_DISABLE);
               _1198._1602(_1405.DESKTOP_DRAG);
            }
            _6026 = null;
            _6027 = false;
            _6017 = null;
            _3597 = null;
            return;
         }
         var _loc2_:_10547 = new _10547(_10547.ITEMS_DRAG_RESET_REFRESH);
         _loc2_._3597 = _3597;
         _loc2_._4137 = _6009.data;
         _loc2_._4136 = true;
         this._6036.dispatchEvent(_loc2_);
         _6026.removeEventListener(MouseEvent.MOUSE_UP,this._5998);
         if(!DragManager.isDragging)
         {
            _1198._1602(_1405.DESKTOP_DISABLE);
            _1198._1602(_1405.DESKTOP_DRAG);
         }
         _6026 = null;
         _6018.graphics.clear();
         _6018.visible = false;
         _6008.graphics.clear();
         _6008.visible = false;
         if(_3597 != null && _6027 == true && _6012 && _6017 != null)
         {
            if(!_6017.children)
            {
               _loc3_ = [];
               _6017.children = _loc3_;
            }
            if(_3597)
            {
               if(_6019 == true && _6021 == true)
               {
                  if(_6000 != null && Boolean(_6020.parent))
                  {
                     _6000(_6020,_3597,_6034);
                  }
               }
               else if(_6030 == true)
               {
                  _loc4_ = _6015(_6017,_3597);
                  if(!_loc4_)
                  {
                     if(_6005 != null)
                     {
                        _6005(_6017,_3597);
                     }
                  }
               }
            }
         }
         _6027 = false;
         _6017 = null;
         _3597 = null;
         if(_14011 != null)
         {
            _14011();
         }
      }
   }
}

