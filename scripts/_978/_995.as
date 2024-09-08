package _978
{
   import _1038._1039;
   import _1038._1041;
   import _1045.Tree;
   import _1045._1046;
   import _1045._1070;
   import _1177.RendererExistenceEvent;
   import _1404._1405;
   import egret.core.ns_egret;
   import egret.managers.DragManager;
   import egret.managers._1198;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   use namespace ns_egret;
   
   public class _995
   {
      private static const rootSelectOffsetY:int = 20;
      
      public var _6005:Function;
      
      public var _6000:Function;
      
      private var _stage:Stage;
      
      private var _6036:Tree;
      
      private var _6032:Boolean = false;
      
      private var _6018:Shape;
      
      private var _6008:Shape;
      
      public var _6011:Function;
      
      public var _4500:Function;
      
      public var _3576:Function;
      
      public var _3573:Function;
      
      public var _6022:Function;
      
      private var _6029:Boolean = false;
      
      private var _6028:_1046;
      
      private var _6001:Boolean = false;
      
      private var _6012:Boolean = false;
      
      private var _3597:Array;
      
      private var _6027:Boolean = false;
      
      private var _6026:Stage;
      
      private var _6017:Object;
      
      private var _6016:Number = 0;
      
      private var _6009:_982;
      
      private var _6019:Boolean = false;
      
      private var _6034:Boolean = false;
      
      private var _6020:Object;
      
      private var _6030:Boolean = true;
      
      private var _6021:Boolean = true;
      
      private var _6010:Vector.<_1070>;
      
      public function _995()
      {
         this._6010 = new Vector.<_1070>();
         super();
      }
      
      public function init(param1:Tree) : void
      {
         this._6036 = param1;
         this._6018 = new Shape();
         this._6018.visible = false;
         this._6008 = new Shape();
         this._6008.visible = false;
         this._6036.ns_egret::_1607(this._6008);
         this._6036.ns_egret::_1607(this._6018);
      }
      
      public function _6023(param1:_1046) : void
      {
         this._6028 = param1;
         param1.ns_egret::_1607(this._6018);
         param1.addEventListener(RendererExistenceEvent.RENDERER_ADD,this._2603);
         param1.addEventListener(RendererExistenceEvent.RENDERER_REMOVE,this._2601);
         this._6028.addEventListener(MouseEvent.ROLL_OVER,this._5992);
         this._6028.addEventListener(MouseEvent.ROLL_OUT,this._5994);
      }
      
      protected function _5992(param1:MouseEvent) : void
      {
         this._6001 = true;
         this._6006();
      }
      
      protected function _5994(param1:MouseEvent) : void
      {
         this._6001 = false;
         this._6006();
      }
      
      public function get _6033() : Boolean
      {
         return this._6032;
      }
      
      public function set _6033(param1:Boolean) : void
      {
         this._6032 = param1;
         if(this._6032)
         {
            if(this._6036.stage)
            {
               this._stage = this._6036.stage;
               this._6036.stage.addEventListener(MouseEvent.MOUSE_MOVE,this._5990);
            }
            else
            {
               this._6036.addEventListener(Event.ADDED_TO_STAGE,this._5996);
            }
         }
         else
         {
            this._6036.removeEventListener(Event.ADDED_TO_STAGE,this._5996);
            if(this._stage)
            {
               this._stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._5990);
            }
         }
      }
      
      protected function _5996(param1:Event) : void
      {
         this._6036.removeEventListener(Event.ADDED_TO_STAGE,this._5996);
         this._6036.stage.addEventListener(MouseEvent.MOUSE_MOVE,this._5990);
         this._stage = this._6036.stage;
      }
      
      protected function _5990(param1:MouseEvent) : void
      {
         if(this._6036.mouseX < 0 || this._6036.mouseX > this._6036.width || this._6036.mouseY < -rootSelectOffsetY || this._6036.mouseY > this._6036.height + rootSelectOffsetY)
         {
            this._6012 = false;
            this._6018.graphics.clear();
            this._6018.visible = false;
            this._6008.graphics.clear();
            this._6008.visible = false;
         }
         else
         {
            this._6012 = true;
         }
         this._6006();
      }
      
      private function _6006() : void
      {
         this._6008.visible = false;
         this._6008.graphics.clear();
         if(Boolean(this._3597) && this._6027)
         {
            if(!this._6012)
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
         if(this._6012 == true && this._6001 == false)
         {
            this._6019 = false;
            if(Boolean(this._3597) && this._6027)
            {
               this._6030 = true;
               this._6017 = Object(this._6036.dataProvider).source;
               if(this._3576 != null)
               {
                  if(!this._3576(this._6017,this._3597))
                  {
                     this._6030 = false;
                  }
               }
               if(this._6030)
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
                     DragManager.acceptDragDrop(this._6036);
                  }
                  this._6018.graphics.clear();
                  this._6018.visible = false;
                  this._6008.visible = true;
                  this._6008.graphics.beginFill(3762325);
                  this._6008.graphics.drawRect(0,0,this._6036.width,this._6036.height);
                  this._6008.graphics.drawRect(2,2,this._6036.width - 4,this._6036.height - 4);
                  this._6008.graphics.endFill();
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
      
      public function get _6031() : Boolean
      {
         return this._6029;
      }
      
      public function set _6031(param1:Boolean) : void
      {
         this._6029 = param1;
      }
      
      protected function _5995(param1:MouseEvent) : void
      {
         if(!this._6033)
         {
            return;
         }
         this._6036.addEventListener(MouseEvent.MOUSE_MOVE,this._6004);
         if(this._6036.stage)
         {
            this._6036.stage.addEventListener(MouseEvent.MOUSE_UP,this._5999);
         }
      }
      
      protected function _5999(param1:MouseEvent) : void
      {
         param1.currentTarget.removeEventListener(MouseEvent.MOUSE_UP,this._5999);
         this._6036.removeEventListener(MouseEvent.MOUSE_MOVE,this._6004);
         this._6036.removeEventListener(Event.ENTER_FRAME,this._6002);
      }
      
      protected function _6004(param1:MouseEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         this._6036.removeEventListener(MouseEvent.MOUSE_MOVE,this._6004);
         if(this._6036._2889.length > 0 && this._6036.stage != null)
         {
            this._6026 = this._6036.stage;
            this._6026.addEventListener(MouseEvent.MOUSE_UP,this._5998);
            _loc2_ = [];
            _loc3_ = 0;
            while(_loc3_ < this._6036._2889.length)
            {
               _loc2_.push(this._6036._2889[_loc3_]);
               _loc3_++;
            }
            _loc2_ = this._6003(_loc2_);
            this._3597 = _loc2_;
            if(this._4500 != null)
            {
               if(!this._4500(this._3597))
               {
                  this._3597 = null;
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
            if(this._6022 != null)
            {
               this._6022(this._3597);
            }
            this._6027 = true;
         }
         if(this._3597 != null && this._6027)
         {
            this._6016 = this._6036.mouseY;
            this._6036.addEventListener(Event.ENTER_FRAME,this._6002);
         }
      }
      
      private function _6003(param1:Array) : Array
      {
         var newItems:Array = null;
         var items:Array = param1;
         var sort:Function = function(param1:_1039):void
         {
            var _loc3_:Object = null;
            if(!param1)
            {
               return;
            }
            var _loc2_:int = 0;
            while(_loc2_ < param1.length)
            {
               _loc3_ = param1.getItemAt(_loc2_);
               if(items.indexOf(_loc3_) != -1)
               {
                  newItems.push(_loc3_);
               }
               _loc2_++;
            }
         };
         newItems = [];
         sort(this._6036.dataProvider);
         return newItems;
      }
      
      protected function _6002(param1:Event) : void
      {
         var _loc2_:Number = NaN;
         if(Boolean(this._6036) && Boolean(this._6036._2490))
         {
            if(this._6036.mouseY > this._6016 && this._6036.mouseY < this._6036.height + rootSelectOffsetY && this._6036.mouseX > 0 && this._6036.mouseX < this._6036.width)
            {
               _loc2_ = Math.pow(1 - (this._6036.height - this._6036.mouseY) / (this._6036.height - this._6016),4);
               if(_loc2_ > 1)
               {
                  _loc2_ = 1;
               }
               _loc2_ = Math.round(_loc2_);
               this._6036._2490.verticalScrollPosition += _loc2_ * 15;
               this._6036._2490._2449();
               this._6036._2449();
            }
            else if(this._6036.mouseY < this._6016 && this._6036.mouseY > -rootSelectOffsetY && this._6036.mouseX > 0 && this._6036.mouseX < this._6036.width)
            {
               _loc2_ = Math.pow(1 - this._6036.mouseY / this._6016,4);
               if(_loc2_ > 1)
               {
                  _loc2_ = 1;
               }
               _loc2_ = Math.round(_loc2_);
               this._6036._2490.verticalScrollPosition -= _loc2_ * 15;
               this._6036._2490._2449();
               this._6036._2449();
            }
         }
      }
      
      protected function _5991(param1:MouseEvent = null) : void
      {
         var _loc2_:_1070 = null;
         var _loc3_:String = null;
         this._6018.graphics.clear();
         this._6018.visible = false;
         this._6019 = false;
         if(this._3597 != null && this._6027)
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
               this._6009 = param1.currentTarget as _982;
            }
            if(!this._6009)
            {
               return;
            }
            if(this._6011 != null)
            {
               this._6017 = this._6011(this._6009.data);
            }
            else
            {
               this._6017 = this._6009.data;
            }
            if(this._6017 != null)
            {
               this._6030 = true;
               if(this._3576 != null)
               {
                  if(!this._3576(this._6017,this._3597))
                  {
                     this._6030 = false;
                     if(!DragManager.isDragging)
                     {
                        if(_1198.cursor != _1405.DESKTOP_DISABLE)
                        {
                           _1198.setCursor(_1405.DESKTOP_DISABLE,1);
                        }
                     }
                  }
               }
               if(this._6030)
               {
                  this._6030 = !this._6007(this._3597,this._6017);
               }
               this._6021 = true;
               if(this._3573 != null)
               {
                  if(this._3573.length == 2)
                  {
                     if(!this._3573(this._6009.data,this._3597))
                     {
                        this._6021 = false;
                     }
                  }
                  else if(this._3573.length == 3)
                  {
                     _loc3_ = "in";
                     if(this._6017 == this._6009.data && this._6029)
                     {
                        if(DisplayObject(this._6009).mouseY < DisplayObject(this._6009).height / 3 && this._6021)
                        {
                           _loc3_ = "top";
                        }
                        else if(DisplayObject(this._6009).mouseY > DisplayObject(this._6009).height / 3 * 2 && this._6021)
                        {
                           _loc3_ = "bottom";
                        }
                     }
                     if(!this._3573(this._6009.data,this._3597,_loc3_))
                     {
                        this._6021 = false;
                     }
                  }
               }
               if(this._6021)
               {
                  this._6021 = !this._6007(this._3597,this._6017);
               }
               if(this._6017 == this._6009.data && !this._6029 && this._6030)
               {
                  _loc2_ = this._6013(this._6017);
                  if(_loc2_ != null && _loc2_ is DisplayObject)
                  {
                     this._6024(_loc2_);
                     DragManager.acceptDragDrop(this._6036);
                     if(!DragManager.isDragging)
                     {
                        if(_1198.cursor != _1405.DESKTOP_DRAG)
                        {
                           _1198.setCursor(_1405.DESKTOP_DRAG,1);
                        }
                     }
                     this._6019 = false;
                  }
               }
               else if(this._6017 == this._6009.data && this._6029)
               {
                  _loc2_ = this._6013(this._6017);
                  if(_loc2_ != null && _loc2_ is DisplayObject)
                  {
                     if(DisplayObject(this._6009).mouseY < DisplayObject(this._6009).height / 3 && this._6021)
                     {
                        this._6014(_loc2_,true);
                        this._6019 = true;
                        this._6034 = true;
                        DragManager.acceptDragDrop(this._6036);
                        if(!DragManager.isDragging)
                        {
                           if(_1198.cursor != _1405.DESKTOP_DRAG)
                           {
                              _1198.setCursor(_1405.DESKTOP_DRAG,1);
                           }
                        }
                        this._6020 = this._6009.data;
                     }
                     else if(DisplayObject(this._6009).mouseY > DisplayObject(this._6009).height / 3 * 2 && this._6021)
                     {
                        this._6014(_loc2_,false);
                        this._6019 = true;
                        this._6034 = false;
                        DragManager.acceptDragDrop(this._6036);
                        if(!DragManager.isDragging)
                        {
                           if(_1198.cursor != _1405.DESKTOP_DRAG)
                           {
                              _1198.setCursor(_1405.DESKTOP_DRAG,1);
                           }
                        }
                        this._6020 = this._6009.data;
                     }
                     else if(this._6030)
                     {
                        this._6024(_loc2_);
                        this._6019 = false;
                        DragManager.acceptDragDrop(this._6036);
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
               else if(this._6017 != this._6009.data && !this._6029 && this._6030)
               {
                  _loc2_ = this._6013(this._6017);
                  if(_loc2_ != null && _loc2_ is DisplayObject)
                  {
                     this._6024(_loc2_);
                     this._6019 = false;
                     DragManager.acceptDragDrop(this._6036);
                     if(!DragManager.isDragging)
                     {
                        if(_1198.cursor != _1405.DESKTOP_DRAG)
                        {
                           _1198.setCursor(_1405.DESKTOP_DRAG,1);
                        }
                     }
                  }
               }
               else if(this._6017 != this._6009.data && this._6029 && this._6021)
               {
                  if(DisplayObject(this._6009).mouseY > DisplayObject(this._6009).height / 2)
                  {
                     this._6034 = false;
                     this._6014(_loc2_,false);
                  }
                  else
                  {
                     this._6034 = true;
                     this._6014(_loc2_,true);
                  }
                  DragManager.acceptDragDrop(this._6036);
                  this._6019 = true;
                  this._6020 = this._6009.data;
               }
            }
         }
      }
      
      private function _5989(param1:_1070) : Number
      {
         var itemRenderers:Array;
         var i:int;
         var h:Number;
         var dataArr:Array = null;
         var treeCollection:_1041 = null;
         var item:_1070 = null;
         var itemRenderer:_1070 = param1;
         var getChild:Function = function(param1:Object):void
         {
            var _loc2_:int = 0;
            if(Boolean(param1.children) && treeCollection._4530(param1))
            {
               _loc2_ = 0;
               while(_loc2_ < param1.children.length)
               {
                  getChild(param1.children[_loc2_]);
                  _loc2_++;
               }
            }
            dataArr.push(param1);
         };
         dataArr = [];
         treeCollection = this._6036.dataProvider as _1041;
         getChild(itemRenderer.data);
         itemRenderers = [];
         i = 0;
         while(i < dataArr.length)
         {
            item = this._5997(dataArr[i]);
            if(item)
            {
               itemRenderers.push(item);
            }
            i++;
         }
         h = 0;
         i = 0;
         while(i < itemRenderers.length)
         {
            h += DisplayObject(itemRenderers[i]).height;
            i++;
         }
         return h;
      }
      
      private function _5997(param1:Object) : _1070
      {
         var _loc2_:int = 0;
         while(_loc2_ < this._6010.length)
         {
            if(this._6010[_loc2_].data == param1)
            {
               return this._6010[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      protected function _5993(param1:MouseEvent) : void
      {
      }
      
      protected function _5998(param1:MouseEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Boolean = false;
         this._6026.removeEventListener(MouseEvent.MOUSE_UP,this._5998);
         if(!DragManager.isDragging)
         {
            _1198._1602(_1405.DESKTOP_DISABLE);
            _1198._1602(_1405.DESKTOP_DRAG);
         }
         this._6026 = null;
         this._6018.graphics.clear();
         this._6018.visible = false;
         this._6008.graphics.clear();
         this._6008.visible = false;
         if(this._3597 != null && this._6027 == true && this._6012 && this._6017 != null)
         {
            if(!this._6017.children)
            {
               _loc2_ = [];
               this._6017.children = _loc2_;
            }
            if(this._3597)
            {
               if(this._6019 == true && this._6021 == true)
               {
                  if(this._6000 != null && Boolean(this._6020.parent))
                  {
                     this._6000(this._6020,this._3597,this._6034);
                  }
               }
               else if(this._6030 == true)
               {
                  _loc3_ = this._6015(this._6017,this._3597);
                  if(!_loc3_)
                  {
                     if(this._6005 != null)
                     {
                        this._6005(this._6017,this._3597);
                     }
                  }
               }
            }
         }
         this._6027 = false;
         this._6017 = null;
         this._3597 = null;
      }
      
      public function doDrag(param1:Object, param2:Array) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this._6025(param2[_loc3_].parent.children,param2[_loc3_]);
            param1.children.push(param2[_loc3_]);
            param2[_loc3_].parent = param1;
            _loc3_++;
         }
         Object(this._6036.dataProvider).refresh();
         this._6036._2449();
      }
      
      public function _6035(param1:Object, param2:Array, param3:Boolean) : void
      {
         var _loc9_:Object = null;
         if(!param1.parent)
         {
            return;
         }
         var _loc4_:Object = param1.parent;
         var _loc5_:int = int(_loc4_.children.indexOf(param1));
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         while(_loc7_ < param2.length)
         {
            if(param2[_loc7_].parent == _loc4_ && _loc4_.children.indexOf(param2[_loc7_]) <= _loc5_)
            {
               if(_loc4_.children.indexOf(param2[_loc7_]) == _loc5_ && !param3 || _loc4_.children.indexOf(param2[_loc7_]) != _loc5_)
               {
                  _loc6_++;
               }
            }
            _loc7_++;
         }
         _loc5_ -= _loc6_;
         _loc7_ = 0;
         while(_loc7_ < param2.length)
         {
            this._6025(param2[_loc7_].parent.children,param2[_loc7_]);
            _loc7_++;
         }
         if(param3 == true)
         {
            _loc5_--;
         }
         var _loc8_:Vector.<Object> = new Vector.<Object>();
         while(param2.length > 0)
         {
            _loc9_ = param2.pop();
            _loc8_.push(_loc9_);
            _loc4_.children.push(_loc9_);
            _loc7_ = _loc4_.children.length - 1;
            while(_loc7_ > _loc5_ + 1)
            {
               _loc4_.children[_loc7_] = _loc4_.children[_loc7_ - 1];
               _loc7_--;
            }
            _loc4_.children[_loc5_ + 1] = _loc9_;
            _loc9_.parent = _loc4_;
         }
         Object(this._6036.dataProvider).refresh();
         this._6036._2449();
         this._6036._2889 = _loc8_;
      }
      
      private function _6015(param1:Object, param2:Array) : Boolean
      {
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         while(_loc4_ < param2.length)
         {
            if(param1 == param2[_loc4_])
            {
               _loc3_ = true;
               break;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      private function _6025(param1:Array, param2:Object) : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            if(param1[_loc3_] == param2)
            {
               _loc4_ = _loc3_;
               while(_loc4_ < param1.length - 1)
               {
                  param1[_loc4_] = param1[_loc4_ + 1];
                  _loc4_++;
               }
               param1.pop();
               break;
            }
            _loc3_++;
         }
      }
      
      protected function _2601(param1:RendererExistenceEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1._2487 is _982)
         {
            _982(param1._2487)._6928.removeEventListener(MouseEvent.MOUSE_DOWN,this._5995);
            _982(param1._2487)._6928.removeEventListener(MouseEvent.ROLL_OUT,this._5993);
            param1._2487.removeEventListener(MouseEvent.MOUSE_MOVE,this._5991);
            _loc2_ = 0;
            while(_loc2_ < this._6010.length)
            {
               if(this._6010[_loc2_] == _982(param1._2487))
               {
                  _loc3_ = _loc2_;
                  while(_loc3_ < this._6010.length - 1)
                  {
                     this._6010[_loc3_] = this._6010[_loc3_ + 1];
                     _loc3_++;
                  }
                  this._6010.pop();
                  break;
               }
               _loc2_++;
            }
         }
      }
      
      protected function _2603(param1:RendererExistenceEvent) : void
      {
         if(param1._2487 is _982)
         {
            _982(param1._2487)._6928.addEventListener(MouseEvent.MOUSE_DOWN,this._5995);
            _982(param1._2487)._6928.addEventListener(MouseEvent.ROLL_OUT,this._5993);
            param1._2487.addEventListener(MouseEvent.MOUSE_MOVE,this._5991);
            this._6010.push(_982(param1._2487));
         }
      }
      
      private function _6013(param1:Object) : _1070
      {
         var _loc2_:_1070 = null;
         var _loc3_:int = 0;
         while(_loc3_ < this._6010.length)
         {
            if(this._6010[_loc3_].data == param1)
            {
               _loc2_ = this._6010[_loc3_];
               break;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function _6007(param1:Array, param2:Object) : Boolean
      {
         var parents:Array = param1;
         var child:Object = param2;
         var checkNode:Function = function(param1:Object, param2:Object):Boolean
         {
            var _loc4_:int = 0;
            var _loc3_:Boolean = false;
            if(param1.children)
            {
               _loc4_ = 0;
               while(_loc4_ < param1.children.length)
               {
                  if(param1.children[_loc4_] == param2)
                  {
                     _loc3_ = true;
                  }
                  else if(param1.children[_loc4_].children)
                  {
                     _loc3_ = Boolean(checkNode(param1.children[_loc4_],param2));
                  }
                  _loc4_++;
               }
            }
            return _loc3_;
         };
         var result:Boolean = false;
         var i:int = 0;
         while(i < parents.length)
         {
            if(checkNode(parents[i],child))
            {
               result = true;
               break;
            }
            i++;
         }
         return result;
      }
      
      private function _6024(param1:_1070) : void
      {
         this._6018.graphics.beginFill(3762325);
         this._6018.graphics.drawRect(0,0,this._6036.width,DisplayObject(param1).height);
         this._6018.graphics.drawRect(2,2,this._6036.width - 4,DisplayObject(param1).height - 4);
         this._6018.graphics.endFill();
         this._6018.visible = true;
         var _loc2_:Point = DisplayObject(param1).localToGlobal(new Point(0,0));
         _loc2_ = this._6018.parent.globalToLocal(_loc2_);
         this._6018.x = _loc2_.x;
         this._6018.y = _loc2_.y;
         this._6028.ns_egret::_1607(this._6018);
      }
      
      private function _6014(param1:_1070, param2:Boolean = false) : void
      {
         var _loc3_:Point = null;
         if(param1 is _982)
         {
            this._6018.graphics.beginFill(3762325);
            this._6018.graphics.drawRect(0,0,Timeline.FRAME_NAME_WIDTH,2);
            this._6018.graphics.endFill();
            this._6018.visible = true;
            _loc3_ = DisplayObject(param1).localToGlobal(new Point(0,0));
            _loc3_ = this._6018.parent.globalToLocal(_loc3_);
            this._6018.x = _loc3_.x;
            if(param2)
            {
               this._6018.y = _loc3_.y - 1;
            }
            else
            {
               this._6018.y = _loc3_.y - 1 + this._5989(param1);
            }
            this._6036.ns_egret::_1607(this._6018);
         }
      }
   }
}

