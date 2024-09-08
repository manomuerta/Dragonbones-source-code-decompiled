package _1374
{
   import _1045.TabBarButton;
   import _1045._1070;
   import _1376.BoxElement;
   import _1376._1379;
   import _1376._1380;
   import _1376._1381;
   import _1404._1403;
   import _1404._1405;
   import _1421.BoxContainerEvent;
   import _1495._1494;
   import egret.core._1133;
   import egret.core._1134;
   import egret.core._1140;
   import egret.core._1141;
   import egret.core.ns_egret;
   import egret.managers._1198;
   import egret.utils._99;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   use namespace ns_egret;
   
   public class _1382 extends _1140 implements _1379
   {
      private static const EDGE_SIZE:Number = 21;
      
      public static const MIN_SIZE:Number = 21;
      
      private var _9578:int = -1;
      
      private var _9627:Boolean = false;
      
      private var _9601:TabGroup;
      
      private var _9612:int = -1;
      
      private var _9591:Boolean;
      
      private var _9621:Shape;
      
      private var _5140:Point;
      
      private var _9622:Boolean = false;
      
      private var _9623:Rectangle;
      
      private var _4831:_1379;
      
      private var _9604:String = "";
      
      private var _9618:int = -1;
      
      public var _6483:Boolean = false;
      
      private var _9580:_1379;
      
      private var _9569:Boolean = true;
      
      private var _9574:Number = 250;
      
      private var _9571:Number = 250;
      
      private var _9579:_1380;
      
      private var _minimized:Boolean = false;
      
      private var _9600:Boolean = true;
      
      private var offsetX:Number = 0;
      
      private var offsetY:Number = 0;
      
      private var _9616:Boolean;
      
      private var _9610:Boolean;
      
      private var isVertical:Boolean;
      
      private var _9628:BoxElement;
      
      private var _9611:_1382;
      
      private var _9624:_1379;
      
      private var _7007:Number = -1;
      
      public function _1382(param1:Boolean = false)
      {
         this._9621 = new Shape();
         super();
         this.addEventListener(MouseEvent.MOUSE_DOWN,this._4063);
         this._9627 = param1;
      }
      
      public function get _2250() : int
      {
         return this._9578;
      }
      
      public function set _2250(param1:int) : void
      {
         this._9578 = param1;
      }
      
      public function get _9629() : Boolean
      {
         return this._9627;
      }
      
      public function set _9629(param1:Boolean) : void
      {
         this._9627 = param1;
      }
      
      private function _4063(param1:MouseEvent) : void
      {
         var _loc3_:TabGroup = null;
         var _loc4_:_1070 = null;
         var _loc2_:DisplayObject = param1.target as DisplayObject;
         if(Boolean(this._9611) && this._9611.contains(_loc2_))
         {
            return;
         }
         if(_loc2_ is _1381)
         {
            this._9595(_loc2_ as _1381);
         }
         else
         {
            while(Boolean(_loc2_) && _loc2_ != this)
            {
               if(_loc2_ is _1070)
               {
                  _loc4_ = _loc2_ as _1070;
               }
               if(_loc2_ is TabGroup)
               {
                  _loc3_ = _loc2_ as TabGroup;
                  break;
               }
               _loc2_ = _loc2_.parent;
            }
            if(_loc3_)
            {
               _loc2_ = param1.target as DisplayObject;
               if(Boolean(_loc3_._2515) && _loc3_._2515.contains(_loc2_))
               {
                  if(_loc4_)
                  {
                     this._9603(_loc3_,_loc4_.itemIndex);
                  }
               }
               else if(_loc3_._2567)
               {
                  if(_loc3_._2567 == _loc2_ || _loc3_._2567 is DisplayObjectContainer && DisplayObjectContainer(_loc3_._2567).contains(_loc2_))
                  {
                     this._9603(_loc3_);
                  }
               }
            }
         }
      }
      
      private function _9603(param1:TabGroup, param2:int = -1) : void
      {
         if(this._9611)
         {
            this._9591 = this._9611.mouseChildren;
            this._9611.mouseChildren = false;
         }
         this._9601 = param1;
         this._9612 = param2;
         var _loc3_:Point = localToGlobal(new Point());
         this._9621.x = _loc3_.x;
         this._9621.y = _loc3_.y;
         stage.addChild(this._9621);
         this._5140 = new Point(stage.mouseX,stage.mouseY);
         var _loc4_:DisplayObject = _1558 as DisplayObject;
         _loc4_.addEventListener(MouseEvent.MOUSE_MOVE,this._9599);
         _loc4_.stage.addEventListener(MouseEvent.MOUSE_UP,this._9607);
         _loc4_.addEventListener(Event.MOUSE_LEAVE,this._9607);
         _loc4_.addEventListener(MouseEvent.RIGHT_MOUSE_UP,this._9607);
      }
      
      private function _9607(param1:Event) : void
      {
         var _loc3_:TabGroup = null;
         var _loc4_:TabGroup = null;
         var _loc5_:String = null;
         var _loc6_:Class = null;
         var _loc7_:_1396 = null;
         var _loc8_:BoxContainerEvent = null;
         var _loc2_:DisplayObject = _1558 as DisplayObject;
         _loc2_.removeEventListener(MouseEvent.MOUSE_MOVE,this._9599);
         _loc2_.stage.removeEventListener(MouseEvent.MOUSE_UP,this._9607);
         _loc2_.removeEventListener(Event.MOUSE_LEAVE,this._9607);
         _loc2_.removeEventListener(MouseEvent.RIGHT_MOUSE_UP,this._9607);
         if(this._9611)
         {
            this._9611.mouseChildren = this._9591;
         }
         if(this._9612 > -1)
         {
            _loc3_ = this._9601;
            if(this._4831 == _loc3_ || _loc3_._2249 > 1)
            {
               _loc3_ = null;
            }
         }
         if(this._9604)
         {
            _loc4_ = this._9601;
            if(this._9612 > -1)
            {
               _loc5_ = getQualifiedClassName(this._9601);
               _loc6_ = getDefinitionByName(_loc5_) as Class;
               _loc4_ = new _loc6_();
               _loc7_ = this._9601.getElementAt(this._9612);
               _loc4_.addElement(_loc7_);
               (_loc8_ = new BoxContainerEvent(BoxContainerEvent.DRAG_PANEL_OUT))._9619 = _loc7_;
               _loc8_._9605 = this._9612;
               _loc8_._9626 = _loc4_;
               dispatchEvent(_loc8_);
            }
            _loc4_.width = NaN;
            _loc4_.height = NaN;
            this._4831.width = NaN;
            this._4831.height = NaN;
            this.addElementAt(_loc4_,this._4831,this._9604);
            (_loc8_ = new BoxContainerEvent(BoxContainerEvent.DRAG_GROUP_MOVED))._9620 = _loc4_;
            _loc8_._9626 = this._4831;
            _loc8_._9597 = this._9604;
            dispatchEvent(_loc8_);
            _loc8_ = new BoxContainerEvent(BoxContainerEvent.BOX_DRAG_COMPLETE);
            dispatchEvent(_loc8_);
         }
         else if(this._9618 >= 0)
         {
            if(this._9612 > -1)
            {
               _loc7_ = this._9601.getElementAt(this._9612);
               TabGroup(this._4831).addElementAt(_loc7_,this._9618);
               TabGroup(this._4831).selectedIndex = this._9618;
               (_loc8_ = new BoxContainerEvent(BoxContainerEvent.DRAG_PANEL_MOVED))._9619 = _loc7_;
               _loc8_._9605 = this._9612;
               _loc8_._9620 = this._9601;
               _loc8_._9625 = _loc7_;
               _loc8_._9614 = this._9618;
               _loc8_._9626 = this._4831;
               dispatchEvent(_loc8_);
               _loc8_ = new BoxContainerEvent(BoxContainerEvent.BOX_DRAG_COMPLETE);
               dispatchEvent(_loc8_);
            }
            else if(this._9601 != this._4831)
            {
               while(this._9601._2249 > 0)
               {
                  TabGroup(this._4831).addElement(this._9601.removeElementAt(0));
               }
               (_loc8_ = new BoxContainerEvent(BoxContainerEvent.DRAG_GROUP_IN))._9620 = this._9601;
               _loc8_._9626 = this._4831;
               dispatchEvent(_loc8_);
               _loc8_ = new BoxContainerEvent(BoxContainerEvent.BOX_DRAG_COMPLETE);
               dispatchEvent(_loc8_);
               _loc3_ = this._9601;
            }
         }
         else
         {
            _loc3_ = null;
         }
         if(_loc3_)
         {
            this.removeElement(_loc3_);
         }
         this._9601 = null;
         this._9612 = -1;
         this._4831 = null;
         this._9623 = null;
         this._9604 = "";
         this._9618 = -1;
         this._9621.graphics.clear();
         stage.removeChild(this._9621);
      }
      
      private function _9599(param1:MouseEvent) : void
      {
         if(this._9622)
         {
            return;
         }
         if(this._5140)
         {
            if(this._5140.subtract(new Point(param1.stageX,param1.stageY)).length <= 2)
            {
               return;
            }
            this._5140 = null;
         }
         this._9622 = true;
         _2466();
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this._9622)
         {
            this._9622 = false;
            this._9598();
         }
      }
      
      private function _9598() : void
      {
         var _loc3_:DisplayObject = null;
         var _loc4_:Rectangle = null;
         var _loc7_:int = 0;
         var _loc8_:Rectangle = null;
         var _loc9_:Rectangle = null;
         var _loc10_:TabGroup = null;
         var _loc11_:Number = NaN;
         this._9604 = "";
         this._9618 = -1;
         var _loc1_:Graphics = this._9621.graphics;
         _loc1_.clear();
         var _loc2_:int = numChildren;
         var _loc5_:Number = mouseX;
         var _loc6_:Number = mouseY;
         if(_loc5_ >= 0 && _loc5_ <= width && _loc6_ >= -2 && _loc6_ <= height)
         {
            _loc7_ = 0;
            while(_loc7_ < _loc2_)
            {
               _loc3_ = getChildAt(_loc7_);
               if(!(_loc3_ is _1381))
               {
                  if(_loc3_.x <= _loc5_ && _loc3_.x + _loc3_.width >= _loc5_ && _loc3_.y - 2 <= _loc6_ && _loc3_.y + _loc3_.height >= _loc6_)
                  {
                     _loc4_ = new Rectangle(_loc3_.x,_loc3_.y,_loc3_.width,_loc3_.height);
                     break;
                  }
               }
               _loc7_++;
            }
            if(!_loc4_)
            {
               return;
            }
            _loc8_ = _loc4_.clone();
            this._4831 = _loc3_ as _1379;
            if(_loc3_ is TabGroup)
            {
               _loc10_ = _loc3_ as TabGroup;
               if(this._9612 > -1)
               {
                  _loc9_ = this._9588(_loc10_);
               }
               if(_loc9_)
               {
                  _loc4_ = _loc9_;
               }
               else if(Boolean(this._9601) && !this._6483)
               {
                  _loc8_.inflate(-EDGE_SIZE,-EDGE_SIZE);
                  if((_loc10_._2249 > 1 && this._9612 > -1 || _loc10_ != this._9601) && !_loc8_.contains(_loc5_,_loc6_))
                  {
                     this._9617(_loc4_,_loc8_,_loc5_,_loc6_,0.5);
                  }
                  else if(_loc10_ != this._9601)
                  {
                     this._9618 = _loc10_._2249;
                  }
               }
            }
            else
            {
               _loc8_.inflate(-_loc4_.width * 0.5,-_loc4_.height * 0.5);
               this._9617(_loc4_,_loc8_,_loc5_,_loc6_,0.25);
            }
            if(!_loc4_)
            {
               return;
            }
         }
         else
         {
            this._4831 = this._9624;
            _loc4_ = new Rectangle(0,0,width,height);
            _loc11_ = 0.5;
            if(this._9611)
            {
               _loc11_ = 0.25;
            }
            if(numChildren > 1)
            {
               this._9617(_loc4_,_loc4_.clone(),_loc5_,_loc6_,_loc11_);
            }
         }
         this._9623 = _loc4_;
         _loc1_.lineStyle(2,3762325);
         _loc1_.drawRect(_loc4_.x,_loc4_.y,_loc4_.width,_loc4_.height);
         _loc1_.endFill();
      }
      
      private function _9617(param1:Rectangle, param2:Rectangle, param3:Number, param4:Number, param5:Number) : void
      {
         if(param3 < param2.x && param4 > param3 - param1.x + param1.y && param4 < -param3 + param1.x + param1.bottom)
         {
            this._9604 = _1403.LEFT;
            param1.width *= param5;
         }
         else if(param3 > param2.right && param4 > -param3 + param1.right + param1.y && param4 < param3 + param1.bottom - param1.right)
         {
            this._9604 = _1403.RIGHT;
            param1.x += param1.width * (1 - param5);
            param1.width *= param5;
         }
         else if(param4 < param2.y && param4 < param3 - param1.x + param1.y && param4 < -param3 + param1.right + param1.y)
         {
            this._9604 = _1403.TOP;
            param1.height *= param5;
         }
         else
         {
            this._9604 = _1403.BOTTOM;
            param1.y += param1.height * (1 - param5);
            param1.height *= param5;
         }
      }
      
      private function _9588(param1:TabGroup) : Rectangle
      {
         var _loc2_:Rectangle = null;
         var _loc5_:TabBarButton = null;
         var _loc6_:Point = null;
         var _loc3_:Array = stage.getObjectsUnderPoint(new Point(stage.mouseX,stage.mouseY));
         var _loc4_:DisplayObject = _loc3_[_loc3_.length - 1];
         if(!_loc4_)
         {
            return null;
         }
         _loc4_ = _loc3_[_loc3_.length - 1];
         if(Boolean(param1._2515) && param1._2515.contains(_loc4_))
         {
            while(Boolean(_loc4_) && _loc4_ != param1)
            {
               if(_loc4_ is _1070)
               {
                  this._9618 = _1070(_loc4_).itemIndex;
               }
               _loc4_ = _loc4_.parent;
            }
            _loc5_ = param1._2515._2490.getElementAt(this._9618) as TabBarButton;
            _loc6_ = _loc5_.localToGlobal(new Point());
            _loc6_ = globalToLocal(_loc6_);
            _loc2_ = new Rectangle(_loc6_.x,_loc6_.y,_loc5_.width,_loc5_.height);
         }
         else if(Boolean(param1._2567) && !this._6483)
         {
            if(param1._2567 == _loc4_ || param1._2567 is DisplayObjectContainer && DisplayObjectContainer(param1._2567).contains(_loc4_))
            {
               this._9618 = param1._2249 - 1;
               _loc5_ = param1._2515._2490.getElementAt(this._9618) as TabBarButton;
               if(_loc5_)
               {
                  _loc6_ = _loc5_.localToGlobal(new Point());
                  _loc6_ = globalToLocal(_loc6_);
                  _loc2_ = new Rectangle(_loc6_.x,_loc6_.y,_loc5_.width,_loc5_.height);
                  if(param1 != this._9601)
                  {
                     ++this._9618;
                     _loc2_.x += _loc5_.width;
                     _loc2_.width = 30;
                  }
               }
            }
         }
         return _loc2_;
      }
      
      public function get _9581() : _1379
      {
         return this._9580;
      }
      
      public function set _9581(param1:_1379) : void
      {
         this._9580 = param1;
      }
      
      public function get _9570() : Boolean
      {
         return this._9569;
      }
      
      public function set _9570(param1:Boolean) : void
      {
         this._9569 = param1;
      }
      
      public function _9575(param1:Number, param2:Number) : void
      {
         super._7599(param1,param2);
      }
      
      public function get _7656() : Number
      {
         return this._9574;
      }
      
      public function set _7656(param1:Number) : void
      {
         this._9574 = param1;
      }
      
      public function get _7652() : Number
      {
         return this._9571;
      }
      
      public function set _7652(param1:Number) : void
      {
         this._9571 = param1;
      }
      
      public function get _4835() : _1380
      {
         return this._9579;
      }
      
      public function get minimized() : Boolean
      {
         return this._minimized;
      }
      
      public function set minimized(param1:Boolean) : void
      {
         if(this._minimized == param1)
         {
            return;
         }
         this._minimized = param1;
         var _loc2_:Boolean = super.visible;
         if(param1)
         {
            super.visible = false;
         }
         else
         {
            super.visible = this._9600;
         }
         if(visible != _loc2_)
         {
            dispatchEvent(new Event("visibleChanged"));
         }
      }
      
      override public function set visible(param1:Boolean) : void
      {
         this._9600 = param1;
         if(super.visible == param1)
         {
            return;
         }
         super.visible = param1;
         dispatchEvent(new Event("visibleChanged"));
      }
      
      public function _9568(param1:_1380, param2:Boolean = true) : void
      {
         if(param2 && Boolean(this._9579))
         {
            if(this._9570)
            {
               this._9579._2247 = null;
            }
            else
            {
               this._9579._2241 = null;
            }
         }
         this._9579 = param1;
      }
      
      public function addElement(param1:_1379, param2:String = "right") : _1379
      {
         if(!param1 || param1 == this._9624)
         {
            return param1;
         }
         if(param1._9581)
         {
            _1382(param1._9581).removeElement(param1);
         }
         if(this._9624)
         {
            this.addElementAt(param1,this._9624,param2);
         }
         else
         {
            this._9624 = param1;
            this._9608(param1);
         }
         invalidateDisplayList();
         return param1;
      }
      
      public function addElementAt(param1:_1379, param2:_1379, param3:String = "right") : _1379
      {
         var _loc4_:BoxElement = null;
         if(!param1 || param1 == param2)
         {
            return param1;
         }
         if(param1._4835 == param2)
         {
            param2 = param1._9570 ? _1380(param2)._2241 : _1380(param2)._2247;
         }
         if(_1382(param1._9581))
         {
            _1382(param1._9581).removeElement(param1);
         }
         var _loc5_:Boolean = param2._9570;
         var _loc6_:BoxElement = param2._4835 as BoxElement;
         if(!_loc6_ && param2 != this._9624)
         {
            return param1;
         }
         switch(param3)
         {
            case _1403.TOP:
               (_loc4_ = new BoxElement(true))._2250 = _1494._1848();
               _loc4_._2247 = param1;
               _loc4_._2241 = param2;
               break;
            case _1403.BOTTOM:
               (_loc4_ = new BoxElement(true))._2250 = _1494._1848();
               _loc4_._2247 = param2;
               _loc4_._2241 = param1;
               break;
            case _1403.LEFT:
               (_loc4_ = new BoxElement())._2250 = _1494._1848();
               _loc4_._2247 = param1;
               _loc4_._2241 = param2;
               break;
            default:
               (_loc4_ = new BoxElement())._2250 = _1494._1848();
               _loc4_._2247 = param2;
               _loc4_._2241 = param1;
         }
         if(param2 == this._9624)
         {
            this._9624 = _loc4_;
         }
         else if(_loc5_)
         {
            _loc6_._2247 = _loc4_;
         }
         else
         {
            _loc6_._2241 = _loc4_;
         }
         this._9608(param1);
         _loc4_._9581 = this;
         this.initSeparator(_loc4_.separator);
         invalidateDisplayList();
         return param1;
      }
      
      public function removeElement(param1:_1379) : _1379
      {
         var _loc2_:BoxElement = null;
         var _loc3_:_1379 = null;
         if(!param1)
         {
            return param1;
         }
         if(param1 == this._9624)
         {
            this._9624 = null;
         }
         else
         {
            if(!param1._4835)
            {
               return param1;
            }
            _loc2_ = param1._4835 as BoxElement;
            if(param1._9570)
            {
               _loc3_ = _loc2_._2241;
            }
            else
            {
               _loc3_ = _loc2_._2247;
            }
            if(_loc2_ == this._9624)
            {
               this._9624 = _loc3_;
            }
            else if(_loc2_._9570)
            {
               BoxElement(_loc2_._4835)._2247 = _loc3_;
            }
            else
            {
               BoxElement(_loc2_._4835)._2241 = _loc3_;
            }
            _loc2_._9581 = null;
            this._9594(_loc2_.separator);
         }
         this._9593(param1);
         invalidateDisplayList();
         if(param1 is TabGroup)
         {
         }
         return param1;
      }
      
      private function _9608(param1:_1379) : void
      {
         if(param1)
         {
            if(param1 is IEventDispatcher)
            {
               IEventDispatcher(param1).addEventListener("visibleChanged",this._9592);
            }
            param1._9581 = this;
         }
         if(param1 is DisplayObject)
         {
            if(Boolean(DisplayObject(param1).parent) && DisplayObject(param1).parent is _1134)
            {
               _1134(DisplayObject(param1).parent).removeElement(param1 as _1133);
            }
            ns_egret::_1607(DisplayObject(param1));
         }
         else if(param1 is BoxElement)
         {
            this._9608(BoxElement(param1)._2247);
            this._9608(BoxElement(param1)._2241);
            this.initSeparator(BoxElement(param1).separator);
         }
         if(param1 is TabGroup)
         {
            TabGroup(param1)._2449();
         }
      }
      
      private function _9592(param1:Event) : void
      {
         invalidateDisplayList();
      }
      
      private function initSeparator(param1:DisplayObject) : void
      {
         ns_egret::_1607(param1);
         param1.addEventListener(MouseEvent.ROLL_OVER,this._9609);
         param1.addEventListener(MouseEvent.ROLL_OUT,this._9613);
      }
      
      private function _9593(param1:_1379) : void
      {
         if(param1)
         {
            if(param1 is IEventDispatcher)
            {
               IEventDispatcher(param1).removeEventListener("visibleChanged",this._9592);
            }
            param1._9581 = null;
         }
         if(param1 is DisplayObject)
         {
            if(DisplayObject(param1).parent == this)
            {
               ns_egret::removeFromDisplayList(DisplayObject(param1));
            }
         }
         else if(param1 is BoxElement)
         {
            this._9593(BoxElement(param1)._2247);
            this._9593(BoxElement(param1)._2241);
            this._9594(BoxElement(param1).separator);
         }
      }
      
      private function _9594(param1:DisplayObject) : void
      {
         ns_egret::removeFromDisplayList(param1);
         param1.removeEventListener(MouseEvent.ROLL_OVER,this._9609);
         param1.removeEventListener(MouseEvent.ROLL_OUT,this._9613);
      }
      
      private function _9595(param1:_1381) : void
      {
         this._9628 = param1.target;
         this._9616 = this._9615(param1.target._2247);
         this._9610 = this._9615(param1.target._2241);
         this.isVertical = param1.target.isVertical;
         this.offsetX = param1.x - stage.mouseX;
         this.offsetY = param1.y - stage.mouseY;
         var _loc2_:DisplayObject = _1558 as DisplayObject;
         _loc2_.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         _loc2_.stage.addEventListener(MouseEvent.MOUSE_UP,this._4083);
         _loc2_.addEventListener(Event.MOUSE_LEAVE,this._4083);
         _loc2_.addEventListener(MouseEvent.RIGHT_MOUSE_UP,this._4083);
         mouseChildren = false;
      }
      
      private function _4083(param1:Event) : void
      {
         var sm:DisplayObject;
         var event:Event = param1;
         _99(function():void
         {
            _1198.setCursor(_1405.AUTO);
         });
         this._9628 = null;
         mouseChildren = true;
         sm = _1558 as DisplayObject;
         sm.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         sm.stage.removeEventListener(MouseEvent.MOUSE_UP,this._4083);
         sm.removeEventListener(Event.MOUSE_LEAVE,this._4083);
         sm.removeEventListener(MouseEvent.RIGHT_MOUSE_UP,this._4083);
         this.dispatchEvent(new BoxContainerEvent(BoxContainerEvent.BOX_DRAG_COMPLETE));
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         if(!this._9628._2247 || !this._9628._2241)
         {
            return;
         }
         var _loc2_:Number = 0;
         var _loc3_:_1379 = this._9628._2247;
         var _loc4_:_1379 = this._9628._2241;
         var _loc5_:Boolean = this._9615(_loc3_);
         var _loc6_:Boolean = this._9615(_loc4_);
         if(this.isVertical)
         {
            _loc2_ = Math.round(this.offsetY + param1.stageY - this._9628.separator.y);
            _loc7_ = Math.min(_loc3_.height + _loc2_,this._9628.height - this._7007 - MIN_SIZE);
            _loc7_ = Math.max(MIN_SIZE,_loc7_);
            if(_loc6_)
            {
               _loc3_._7652 = _loc7_;
            }
            if(isNaN(_loc3_.explicitHeight))
            {
               _loc3_._9575(_loc3_.width,_loc7_);
            }
            else
            {
               this._9590(_loc3_,_loc7_);
            }
            _loc9_ = Math.max(MIN_SIZE,this._9628.height - _loc7_ - this._7007);
            if(_loc5_)
            {
               _loc4_._7652 = _loc9_;
            }
            if(isNaN(_loc4_.explicitHeight))
            {
               _loc4_._9575(_loc4_.width,_loc9_);
            }
            else
            {
               this._9590(_loc4_,_loc9_);
            }
            this._9628.percentSize = _loc7_ / this._9628.height;
         }
         else
         {
            _loc2_ = Math.round(this.offsetX + param1.stageX - this._9628.separator.x);
            _loc8_ = Math.min(_loc3_.width + _loc2_,this._9628.width - this._7007 - MIN_SIZE);
            _loc8_ = Math.max(MIN_SIZE,_loc8_);
            if(_loc6_)
            {
               _loc3_._7656 = _loc8_;
            }
            if(isNaN(_loc3_.explicitWidth))
            {
               _loc3_._9575(_loc8_,_loc3_.height);
            }
            else
            {
               this._9596(_loc3_,_loc8_);
            }
            _loc10_ = Math.max(MIN_SIZE,this._9628.width - _loc8_ - this._7007);
            if(_loc5_)
            {
               _loc4_._7656 = _loc10_;
            }
            if(isNaN(_loc4_.explicitWidth))
            {
               _loc4_._9575(_loc10_,_loc4_.height);
            }
            else
            {
               this._9596(_loc4_,_loc10_);
            }
            this._9628.percentSize = _loc8_ / this._9628.width;
         }
         this.ns_egret::_9589(this._9628);
         _1141.ns_egret::_1609._2449();
         param1.updateAfterEvent();
      }
      
      private function _9596(param1:_1379, param2:Number) : void
      {
         var _loc3_:TabGroup = param1 as TabGroup;
         if(Boolean(_loc3_) && isNaN(_loc3_.ns_egret::_9606))
         {
            _loc3_._4827.width = param2;
            _loc3_._9575(param2,_loc3_.height);
         }
         else
         {
            param1.width = param2;
         }
      }
      
      private function _9590(param1:_1379, param2:Number) : void
      {
         var _loc3_:TabGroup = param1 as TabGroup;
         if(Boolean(_loc3_) && isNaN(_loc3_.ns_egret::_9602))
         {
            _loc3_._4827.height = param2;
            _loc3_._9575(_loc3_.width,param2);
         }
         else
         {
            param1.height = param2;
         }
      }
      
      private function _9609(param1:MouseEvent) : void
      {
         if(param1.buttonDown)
         {
            return;
         }
         var _loc2_:BoxElement = param1.target.target;
         _1198.setCursor(_loc2_.isVertical ? _1405.DESKTOP_RESIZE_NS : _1405.DESKTOP_RESIZE_EW);
      }
      
      private function _9613(param1:MouseEvent) : void
      {
         if(param1.buttonDown)
         {
            return;
         }
         _1198.setCursor(_1405.AUTO);
      }
      
      public function get _4833() : _1382
      {
         return this._9611;
      }
      
      public function set _4833(param1:_1382) : void
      {
         if(this._9611 == param1)
         {
            return;
         }
         if(this._9611)
         {
            this.removeElement(this._9611);
         }
         this._9611 = param1;
         this.addElement(this._9611);
         invalidateDisplayList();
      }
      
      public function get _4837() : _1379
      {
         return this._9624;
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         if(this._9624)
         {
            this._9624._9575(param1,param2);
            this._9624.x = 0;
            this._9624.y = 0;
            this.ns_egret::_9589(this._9624);
         }
      }
      
      public function get gap() : Number
      {
         return this._7007;
      }
      
      public function set gap(param1:Number) : void
      {
         if(this._7007 == param1)
         {
            return;
         }
         this._7007 = param1;
         invalidateDisplayList();
      }
      
      ns_egret function _9589(param1:_1379) : void
      {
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:* = false;
         var _loc2_:BoxElement = param1 as BoxElement;
         if(!_loc2_ || !_loc2_._2247 || !_loc2_._2241)
         {
            return;
         }
         if(!_loc2_._2247.visible || !_loc2_._2241.visible)
         {
            _loc2_.separator.visible = false;
         }
         else
         {
            _loc2_.separator.visible = true;
         }
         _loc2_._2247.x = _loc2_._2241.x = _loc2_.x;
         _loc2_._2247.y = _loc2_._2241.y = _loc2_.y;
         var _loc3_:Boolean = this._9615(_loc2_._2247);
         var _loc4_:Boolean = this._9615(_loc2_._2241);
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         var _loc7_:Number = 0;
         var _loc8_:Number = 0;
         var _loc9_:DisplayObject = _loc2_.separator;
         if(!_loc2_._2247.visible && _loc2_._2241.visible)
         {
            _loc7_ = _loc2_.height;
            _loc8_ = _loc2_.width;
         }
         if(_loc2_._2247.visible && !_loc2_._2241.visible)
         {
            _loc5_ = _loc2_.height;
            _loc6_ = _loc2_.width;
         }
         else if(_loc2_._2241.visible && _loc2_._2247.visible)
         {
            if(_loc2_.isVertical)
            {
               if(!_loc3_ && !_loc4_)
               {
                  _loc3_ = isNaN(_loc2_._2247.explicitHeight);
                  _loc4_ = isNaN(_loc2_._2241.explicitHeight);
                  if(_loc3_ && _loc4_)
                  {
                     _loc3_ = _loc4_ = false;
                  }
               }
               _loc10_ = _loc2_._2247 is BoxElement && BoxElement(_loc2_._2247).isVertical ? 2 * MIN_SIZE : MIN_SIZE;
               _loc11_ = _loc2_._2241 is BoxElement && BoxElement(_loc2_._2241).isVertical ? 2 * MIN_SIZE : MIN_SIZE;
               _loc12_ = _loc2_._2247 is BoxElement;
               _loc6_ = _loc8_ = _loc2_.width;
               _loc9_.x = _loc2_.x;
               _loc9_.width = _loc2_.width;
               _loc9_.height = 3;
               if(_loc3_)
               {
                  _loc7_ = Math.ceil(_loc2_._2241.explicitHeight);
                  if(isNaN(_loc7_))
                  {
                     _loc7_ = Math.ceil(_loc2_._2241._7652);
                  }
                  _loc5_ = Math.max(_loc10_,_loc2_.height - _loc7_ - this._7007);
                  _loc7_ = Math.max(_loc11_,_loc2_.height - _loc5_ - this._7007);
               }
               else if(_loc4_)
               {
                  _loc5_ = Math.ceil(_loc2_._2247.explicitHeight);
                  if(isNaN(_loc5_))
                  {
                     _loc5_ = Math.ceil(_loc2_._2247._7652);
                  }
                  _loc7_ = Math.max(_loc11_,_loc2_.height - _loc5_ - this._7007);
                  _loc5_ = Math.max(_loc10_,_loc2_.height - _loc7_ - this._7007);
               }
               else
               {
                  if(!isNaN(_loc2_._2247.explicitHeight))
                  {
                     _loc5_ = Math.max(MIN_SIZE,_loc2_._2247.explicitHeight);
                  }
                  else
                  {
                     _loc5_ = Math.ceil(_loc2_.height * _loc2_.percentSize);
                  }
                  _loc7_ = _loc2_.height - _loc5_ - this._7007;
               }
               _loc2_._2241.y += _loc5_ + this._7007;
               _loc9_.y = _loc2_._2241.y - 1;
            }
            else
            {
               if(!_loc3_ && !_loc4_)
               {
                  _loc3_ = isNaN(_loc2_._2247.explicitWidth);
                  _loc4_ = isNaN(_loc2_._2241.explicitWidth);
                  if(_loc3_ && _loc4_)
                  {
                     _loc3_ = _loc4_ = false;
                  }
               }
               _loc10_ = _loc2_._2247 is BoxElement && !BoxElement(_loc2_._2247).isVertical ? 2 * MIN_SIZE : MIN_SIZE;
               _loc11_ = _loc2_._2241 is BoxElement && !BoxElement(_loc2_._2241).isVertical ? 2 * MIN_SIZE : MIN_SIZE;
               _loc5_ = _loc7_ = _loc2_.height;
               _loc9_.y = _loc2_.y;
               _loc9_.height = _loc2_.height;
               _loc9_.width = 3;
               if(_loc3_)
               {
                  _loc8_ = Math.ceil(_loc2_._2241.explicitWidth);
                  if(isNaN(_loc8_))
                  {
                     _loc8_ = Math.ceil(_loc2_._2241._7656);
                  }
                  _loc6_ = Math.max(_loc10_,_loc2_.width - _loc8_ - this._7007);
                  _loc8_ = Math.max(_loc11_,_loc2_.width - _loc6_ - this._7007);
               }
               else if(_loc4_)
               {
                  _loc6_ = Math.ceil(_loc2_._2247.explicitWidth);
                  if(isNaN(_loc6_))
                  {
                     _loc6_ = Math.ceil(_loc2_._2247._7656);
                  }
                  _loc8_ = Math.max(_loc11_,_loc2_.width - _loc6_ - this._7007);
                  _loc6_ = Math.max(_loc10_,_loc2_.width - _loc8_ - this._7007);
               }
               else
               {
                  if(!isNaN(_loc2_._2247.explicitWidth))
                  {
                     _loc6_ = Math.max(MIN_SIZE,_loc2_._2247.explicitWidth);
                  }
                  else
                  {
                     _loc6_ = Math.ceil(_loc2_.width * _loc2_.percentSize);
                  }
                  _loc8_ = _loc2_.width - _loc6_ - this._7007;
               }
               _loc2_._2241.x += _loc6_ + this._7007;
               _loc9_.x = _loc2_._2241.x - 1;
            }
         }
         _loc2_._2247._9575(_loc6_,_loc5_);
         _loc2_._2241._9575(_loc8_,_loc7_);
         this.ns_egret::_9589(_loc2_._2247);
         this.ns_egret::_9589(_loc2_._2241);
      }
      
      private function _9615(param1:_1379) : Boolean
      {
         var _loc2_:_1379 = this._4833;
         while(_loc2_)
         {
            if(param1 == _loc2_)
            {
               return true;
            }
            _loc2_ = _loc2_._4835;
         }
         return false;
      }
   }
}

