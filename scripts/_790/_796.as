package _790
{
   import _1045._1046;
   import _1045._1070;
   import _1088.ItemRenderer;
   import _1088.TreeItemRenderer;
   import _1373._787;
   import _1404._1405;
   import _54._57;
   import _54._67;
   import _636.ComicEvent;
   import _799._798;
   import _799._801;
   import egret.core.ns_egret;
   import egret.managers.DragManager;
   import egret.managers._1198;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   use namespace ns_egret;
   
   public class _796 extends _787
   {
      public var _6059:Boolean = false;
      
      protected var position:_789;
      
      public function _796()
      {
         super();
      }
      
      override public function _6023(param1:_1046) : void
      {
         super._6023(param1);
      }
      
      override protected function _5991(param1:MouseEvent = null) : void
      {
         var _loc2_:_1070 = null;
         _6018.graphics.clear();
         _6018.visible = false;
         _6030 = false;
         _6021 = false;
         _6020 = param1.currentTarget.data;
         if(!_3597 || _3597.length == 0 || !_6027)
         {
            return;
         }
         _6009 = param1.currentTarget as ItemRenderer;
         _6017 = _6009.data;
         if(_6011 != null)
         {
            _6017 = _6011(_6017);
         }
         if(_6017 == null)
         {
            return;
         }
         _loc2_ = _6013(_6017);
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:Number = (_6009 as DisplayObject).mouseY;
         var _loc4_:Number = (_6009 as DisplayObject).height;
         var _loc5_:int = int(_6017.parent.children.indexOf(_6017));
         if(_3573 != null)
         {
            if((_loc5_ == 0 || _loc5_ == _6017.parent.children.length - 1) && _6009.data is _67)
            {
               if(_loc3_ < 4)
               {
                  _6019 = true;
                  _6034 = true;
                  if(_3597.length == 1)
                  {
                     if(!this._6061(_3597[0] as _67,_6009.data as _67))
                     {
                        return;
                     }
                  }
                  this._6062();
                  this.position = _789.MIDDLE;
                  _6021 = _3573(_6009.data,_3597,_6034,this.position);
                  if(_6021)
                  {
                     _6020 = _6009.data;
                     this._6060(_loc2_,_6017.parent as _57,_6034);
                     return;
                  }
               }
               else if(_loc3_ > _loc4_ - 4)
               {
                  _6019 = true;
                  _6034 = false;
                  if(_3597.length == 1)
                  {
                     if(!this._6061(_3597[0] as _67,_6009.data as _67))
                     {
                        return;
                     }
                  }
                  this._6062();
                  this.position = _789.MIDDLE;
                  _6021 = _3573(_6009.data,_3597,_6034,this.position);
                  if(_6021)
                  {
                     _6020 = _6009.data;
                     this._6060(_loc2_,_6017.parent as _57,_6034);
                     return;
                  }
               }
            }
            if(_3576 != null)
            {
               if(_6009.data is _67)
               {
                  _6019 = false;
                  this.position = _789.INSIDE;
                  _6034 = false;
                  _6030 = _3576(_6009.data,_3597,_6034,this.position);
                  if(_6030)
                  {
                     this._6062();
                     _6020 = _6009.data;
                     this._6024(_6009);
                     return;
                  }
               }
            }
            if(_6009.data is _67)
            {
               this.position = _789.INSIDE;
               if(_loc3_ < _loc4_ / 3)
               {
                  _6019 = true;
                  _6034 = true;
                  if(_3597.length == 1)
                  {
                     if(!this._6061(_3597[0] as _67,_6009.data as _67))
                     {
                        return;
                     }
                  }
                  _6021 = _3573(_6009.data,_3597,_6034,this.position);
                  if(_6021)
                  {
                     this._6062();
                     _6020 = _6009.data;
                     this._6014(_loc2_,true);
                  }
               }
               else if(_loc3_ > _loc4_ / 3 * 2)
               {
                  _6019 = true;
                  _6034 = false;
                  if(_3597.length == 1)
                  {
                     if(!this._6061(_3597[0] as _67,_6009.data as _67))
                     {
                        return;
                     }
                  }
                  _6021 = _3573(_6009.data,_3597,_6034,this.position);
                  if(_6021)
                  {
                     this._6062();
                     _6020 = _6009.data;
                     this._6014(_loc2_,false);
                  }
               }
            }
         }
         else
         {
            _1198.setCursor(_1405.DESKTOP_DISABLE,0);
         }
      }
      
      protected function _6061(param1:_67, param2:_67) : Boolean
      {
         var _loc4_:_67 = null;
         var _loc5_:_798 = null;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         return true;
      }
      
      protected function _6062() : void
      {
         if(!DragManager.isDragging)
         {
            if(_1198.cursor != _1405.DESKTOP_DRAG)
            {
               _1198.setCursor(_1405.DESKTOP_DRAG,1);
            }
         }
         DragManager.acceptDragDrop(_6036);
      }
      
      override protected function _5998(param1:MouseEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Boolean = false;
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
               _loc2_ = [];
               _6017.children = _loc2_;
            }
            if(_3597)
            {
               if(_6019 == true)
               {
                  if(_6000 != null && _6020.parent && _6021)
                  {
                     _6000(_6020,_3597,_6034);
                  }
               }
               else if(!_6019)
               {
                  _loc3_ = _6015(_6017,_3597);
                  if(!_loc3_)
                  {
                     if(_6005 != null && _6030)
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
      }
      
      override protected function _6006() : void
      {
         _6008.visible = false;
         _6008.graphics.clear();
         if(Boolean(_3597) && _6027)
         {
            if(!_6012)
            {
               if(!DragManager.isDragging)
               {
                  if(_1198.cursor != _1405.DESKTOP_DISABLE)
                  {
                     _1198.setCursor(_1405.DESKTOP_DISABLE,1);
                  }
               }
            }
         }
         if(_6012 == true && _6001 == false)
         {
            _6019 = false;
            if(Boolean(_3597) && _6027)
            {
               _6030 = true;
               _6017 = Object(_6036.dataProvider).source;
               if(_3576 != null)
               {
                  if(!_3576(_6017,_3597,false,this.position))
                  {
                     _6030 = false;
                  }
               }
               if(_6030)
               {
                  if(!DragManager.isDragging)
                  {
                     if(_1198.cursor != _1405.DESKTOP_DRAG)
                     {
                        _1198.setCursor(_1405.DESKTOP_DRAG,1);
                     }
                  }
                  if(DragManager.isDragging)
                  {
                     DragManager.acceptDragDrop(_6036);
                  }
                  _6018.graphics.clear();
                  _6018.visible = false;
                  _6008.visible = false;
                  _6008.graphics.beginFill(3762325);
                  _6008.graphics.drawRect(0,0,_6036.width,_6036.height);
                  _6008.graphics.drawRect(2,2,_6036.width - 4,_6036.height - 4);
                  _6008.graphics.endFill();
               }
               else if(!DragManager.isDragging)
               {
                  if(_1198.cursor != _1405.DESKTOP_DISABLE)
                  {
                     _1198.setCursor(_1405.DESKTOP_DISABLE,1);
                  }
               }
            }
         }
      }
      
      override protected function _5990(param1:MouseEvent) : void
      {
         super._5990(param1);
      }
      
      override public function doDrag(param1:Object, param2:Array) : void
      {
         _6036.dispatchEvent(new ComicEvent(ComicEvent.DRAG_DROP_MERGE,{
            "dragTargets":param2,
            "responseTarget":param1,
            "position":this.position,
            "isTop":false
         }));
      }
      
      override public function _6035(param1:Object, param2:Array, param3:Boolean) : void
      {
         _6036.dispatchEvent(new ComicEvent(ComicEvent.DRAG_DROP_MOVE,{
            "dragTargets":param2,
            "responseTarget":param1,
            "position":this.position,
            "isTop":param3
         }));
      }
      
      override protected function _5995(param1:MouseEvent) : void
      {
         if(!_6033)
         {
            return;
         }
         if(param1.currentTarget is _801)
         {
            return;
         }
         _6036.addEventListener(MouseEvent.MOUSE_MOVE,this._6004);
         if(_6036.stage)
         {
            _6036.stage.addEventListener(MouseEvent.MOUSE_UP,_5999);
         }
         if(!this._6059 && _6036._2889.length > 1)
         {
            _6036._2889 = new Vector.<Object>(_6036._2889[0]);
         }
      }
      
      override protected function _6004(param1:MouseEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         _6036.removeEventListener(MouseEvent.MOUSE_MOVE,this._6004);
         if(_6036._2889.length > 0 && _6036.stage != null)
         {
            _6026 = _6036.stage;
            _6026.addEventListener(MouseEvent.MOUSE_UP,this._5998);
            _loc2_ = [];
            _loc3_ = 0;
            while(_loc3_ < _6036._2889.length)
            {
               if(_6036._2889[_loc3_] is _67)
               {
                  _loc2_.push(_6036._2889[_loc3_]);
               }
               _loc3_++;
            }
            _loc2_ = _6003(_loc2_);
            _3597 = _loc2_;
            if(_4500 != null)
            {
               if(!_4500(_3597))
               {
                  _3597 = null;
                  if(!DragManager.isDragging)
                  {
                     if(_1198.cursor != _1405.DESKTOP_DISABLE)
                     {
                        _1198.setCursor(_1405.DESKTOP_DISABLE,1);
                     }
                  }
                  return;
               }
            }
            if(_6022 != null)
            {
               _6022(_3597);
            }
            _6027 = true;
         }
         if(_3597 != null && _6027)
         {
            _6016 = _6036.mouseY;
            _6036.addEventListener(Event.ENTER_FRAME,_6002);
         }
      }
      
      override protected function _6024(param1:_1070) : void
      {
         var _loc7_:_798 = null;
         var _loc8_:_67 = null;
         var _loc9_:int = 0;
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         if(param1 is _798)
         {
            _loc7_ = param1 as _798;
            _loc2_ = _loc7_.comicTree._6057;
            _loc8_ = param1.data as _67;
            _loc9_ = int(_loc8_.parent.children.indexOf(_loc8_));
            _loc4_ = _loc7_.width - _loc7_.comicTree._6057;
            _loc5_ = _loc8_.parent.children.length * _loc7_.height;
         }
         else if(param1 is _801)
         {
            return;
         }
         _6018.graphics.beginFill(3762325);
         _6018.graphics.drawRect(_loc2_,_loc3_,_loc4_,_loc5_);
         _6018.graphics.drawRect(_loc2_ + 2,2,_loc4_ - 4,_loc5_ - 4);
         _6018.graphics.endFill();
         _6018.visible = true;
         var _loc6_:Point = DisplayObject(param1).localToGlobal(new Point(0,0));
         _loc6_ = _6018.parent.globalToLocal(_loc6_);
         _6018.x = _loc6_.x;
         _6018.y = _loc6_.y;
         if(_loc9_)
         {
            _6018.y += -_loc9_ * _loc7_.height;
         }
         _6028.ns_egret::_1607(_6018);
      }
      
      protected function _6060(param1:_1070, param2:_57, param3:Boolean = true) : void
      {
         var _loc9_:Object = null;
         var _loc14_:int = 0;
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         var _loc7_:Number = 2;
         var _loc8_:Boolean = true;
         var _loc10_:_1070 = param1 as _1070;
         var _loc11_:_798 = param1 as _798;
         var _loc12_:int = int(_loc11_.comicTree._3562._3591.indexOf(param1.data));
         if(!param3)
         {
            _loc10_ = _6013(param1.data.parent.children[0]);
            if(!_loc10_)
            {
               return;
            }
            _loc14_ = int(param1.data.parent.children.indexOf(param1.data));
            _loc9_ = _loc11_.comicTree._3562._3591[_loc12_ + 1];
            _loc5_ = (_loc10_ as DisplayObject).height * (_loc14_ + 1);
         }
         else
         {
            _loc9_ = _loc11_.comicTree._3562._3591[_loc12_ - 1];
         }
         _loc6_ = (_loc10_ as DisplayObject).width;
         if(Boolean(_loc9_) && _loc9_.parent == param1.data.parent)
         {
            _loc6_ -= _loc11_.comicTree._6057;
            _loc4_ += _loc11_.comicTree._6057;
         }
         _6018.graphics.beginFill(3762325);
         _6018.graphics.drawRect(_loc4_,_loc5_,_loc6_,_loc7_);
         _6018.graphics.endFill();
         _6018.visible = true;
         var _loc13_:Point = DisplayObject(_loc10_).localToGlobal(new Point(0,0));
         _loc13_ = _6018.parent.globalToLocal(_loc13_);
         _6018.x = _loc13_.x;
         _6018.y = _loc13_.y;
         _6028.ns_egret::_1607(_6018);
      }
      
      protected function _6058(param1:_1070) : void
      {
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         var _loc5_:Number = 1;
         _loc3_ = (param1 as DisplayObject).height * 0.5;
         _loc4_ = (param1 as DisplayObject).width;
         _6018.graphics.beginFill(3762325);
         _6018.graphics.drawRect(_loc2_,_loc3_,_loc4_,_loc5_);
         _6018.graphics.endFill();
         _6018.visible = true;
         var _loc6_:Point = DisplayObject(param1).localToGlobal(new Point(0,0));
         _loc6_ = _6018.parent.globalToLocal(_loc6_);
         _6018.x = _loc6_.x;
         _6018.y = _loc6_.y;
         _6028.ns_egret::_1607(_6018);
      }
      
      override protected function _6014(param1:_1070, param2:Boolean = false) : void
      {
         var _loc7_:_798 = null;
         var _loc8_:_801 = null;
         var _loc9_:Point = null;
         var _loc3_:Number = 0;
         var _loc4_:Number = 6;
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         if(!param2)
         {
            _loc4_ = DisplayObject(param1).height - 8;
         }
         if(param1 is _798)
         {
            _loc7_ = param1 as _798;
            _loc3_ = _loc7_.comicTree._6057;
            _loc5_ = _loc7_.width;
            _loc6_ = 2;
         }
         else if(param1 is _801)
         {
            _loc8_ = param1 as _801;
            _loc5_ = _loc8_.tree.width;
         }
         if(param1 is TreeItemRenderer)
         {
            _6018.graphics.beginFill(3762325);
            _6018.graphics.drawRect(_loc3_,_loc4_,_loc5_,_loc6_);
            _6018.graphics.endFill();
            _6018.visible = true;
            _loc9_ = DisplayObject(param1).localToGlobal(new Point(0,0));
            _loc9_ = _6018.parent.globalToLocal(_loc9_);
            _6018.x = _loc9_.x;
            _6018.y = _loc9_.y - 1;
            _6028.ns_egret::_1607(_6018);
         }
      }
   }
}

