package _1045
{
   import _1088._1093;
   import _1177.DragEvent;
   import _1177.ElementExistenceEvent;
   import egret.core._1116;
   import egret.core._1133;
   import egret.core._1134;
   import egret.core.ns_egret;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   use namespace ns_egret;
   
   public class Group extends _1093 implements _1134
   {
      private static const errorStr:String = "在此组件中不可用，若此组件为容器类，请使用";
      
      private var _8029:Boolean = false;
      
      private var _8028:int;
      
      private var _8026:Boolean = true;
      
      private var _7405:Boolean = false;
      
      private var _7404:Boolean = false;
      
      private var _7410:Array;
      
      public function Group()
      {
         this._7410 = [];
         super();
      }
      
      private function set _8030(param1:Boolean) : void
      {
         if(this._8026)
         {
            ns_egret::_8025();
         }
         this._8029 = param1;
      }
      
      public function get _8027() : Boolean
      {
         return this._8026;
      }
      
      public function set _8027(param1:Boolean) : void
      {
         if(param1 == this._8026)
         {
            return;
         }
         this._8026 = param1;
         if(this._8029)
         {
            ns_egret::_8025();
         }
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         super.addEventListener(param1,param2,param3,param4,param5);
         switch(param1)
         {
            case MouseEvent.CLICK:
            case MouseEvent.DOUBLE_CLICK:
            case MouseEvent.MOUSE_DOWN:
            case MouseEvent.MOUSE_MOVE:
            case MouseEvent.MOUSE_OVER:
            case MouseEvent.MOUSE_OUT:
            case MouseEvent.ROLL_OUT:
            case MouseEvent.ROLL_OVER:
            case MouseEvent.MOUSE_UP:
            case MouseEvent.MOUSE_WHEEL:
            case DragEvent.DRAG_ENTER:
            case DragEvent.DRAG_OVER:
            case DragEvent.DRAG_DROP:
            case DragEvent.DRAG_EXIT:
               if(++this._8028 > 0)
               {
                  this._8030 = true;
                  break;
               }
         }
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         super.removeEventListener(param1,param2,param3);
         switch(param1)
         {
            case MouseEvent.CLICK:
            case MouseEvent.DOUBLE_CLICK:
            case MouseEvent.MOUSE_DOWN:
            case MouseEvent.MOUSE_MOVE:
            case MouseEvent.MOUSE_OVER:
            case MouseEvent.MOUSE_OUT:
            case MouseEvent.ROLL_OUT:
            case MouseEvent.ROLL_OVER:
            case MouseEvent.MOUSE_UP:
            case MouseEvent.MOUSE_WHEEL:
               if(--this._8028 == 0)
               {
                  this._8030 = false;
                  break;
               }
         }
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         this._8031();
      }
      
      private function _8031() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(!this._8026 || !this._8029)
         {
            return;
         }
         graphics.clear();
         if(width == 0 || height == 0)
         {
            return;
         }
         graphics.beginFill(16777215,0);
         if(Boolean(layout) && layout.clipAndEnableScrolling)
         {
            graphics.drawRect(layout.horizontalScrollPosition,layout.verticalScrollPosition,width,height);
         }
         else
         {
            _loc1_ = 4096;
            _loc2_ = 0;
            while(_loc2_ < width)
            {
               _loc3_ = 0;
               while(_loc3_ < height)
               {
                  _loc4_ = Math.min(width - _loc2_,_loc1_);
                  _loc5_ = Math.min(height - _loc3_,_loc1_);
                  graphics.drawRect(_loc2_,_loc3_,_loc4_,_loc5_);
                  _loc3_ += _loc1_;
               }
               _loc2_ += _loc1_;
            }
         }
         graphics.endFill();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._7405 = true;
         if(this._7404)
         {
            this._7404 = false;
            this._7408(this._7410);
         }
      }
      
      ns_egret function _7409() : Array
      {
         return this._7410;
      }
      
      public function set elementsContent(param1:Array) : void
      {
         var _loc2_:int = 0;
         if(param1 == null)
         {
            param1 = [];
         }
         if(param1 == this._7410)
         {
            return;
         }
         if(this._7405)
         {
            this._7408(param1);
         }
         else
         {
            this._7404 = true;
            _loc2_ = int(this._7410.length - 1);
            while(_loc2_ >= 0)
            {
               this.ns_egret::elementRemoved(this._7410[_loc2_],_loc2_);
               _loc2_--;
            }
            this._7410 = param1;
         }
      }
      
      private function _7408(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:_1133 = null;
         _loc2_ = int(this._7410.length - 1);
         while(_loc2_ >= 0)
         {
            this.ns_egret::elementRemoved(this._7410[_loc2_],_loc2_);
            _loc2_--;
         }
         this._7410 = param1.concat();
         var _loc3_:int = int(this._7410.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._7410[_loc2_];
            if(Boolean(_loc4_.parent) && _loc4_.parent != this)
            {
               throw new Error(_loc4_ + "不能有多个父级");
            }
            this.ns_egret::elementAdded(_loc4_,_loc2_);
            _loc2_++;
         }
      }
      
      override public function get _2249() : int
      {
         return this._7410.length;
      }
      
      override public function getElementAt(param1:int) : _1133
      {
         this._7407(param1);
         return this._7410[param1];
      }
      
      private function _7407(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:int = int(this._7410.length - 1);
         if(param2)
         {
            _loc3_++;
         }
         if(param1 < 0 || param1 > _loc3_)
         {
            throw new RangeError("索引:\"" + param1 + "\"超出可视元素索引范围");
         }
      }
      
      public function addElement(param1:_1133) : _1133
      {
         var _loc2_:int = this._2249;
         if(param1.parent == this)
         {
            _loc2_ = this._2249 - 1;
         }
         return this.addElementAt(param1,_loc2_);
      }
      
      public function addElementAt(param1:_1133, param2:int) : _1133
      {
         if(param1 == this)
         {
            return param1;
         }
         this._7407(param2,true);
         var _loc3_:Object = param1.owner;
         if(_loc3_ == this || param1.parent == this)
         {
            this.setElementIndex(param1,param2);
            return param1;
         }
         if(_loc3_ is _1116)
         {
            _1116(_loc3_).removeElement(param1);
         }
         this._7410.splice(param2,0,param1);
         if(!this._7404)
         {
            this.ns_egret::elementAdded(param1,param2);
         }
         return param1;
      }
      
      public function removeElement(param1:_1133) : _1133
      {
         return this.removeElementAt(this.getElementIndex(param1));
      }
      
      public function removeElementAt(param1:int) : _1133
      {
         this._7407(param1);
         var _loc2_:_1133 = this._7410[param1];
         if(!this._7404)
         {
            this.ns_egret::elementRemoved(_loc2_,param1);
         }
         this._7410.splice(param1,1);
         return _loc2_;
      }
      
      public function _2426() : void
      {
         var _loc1_:int = this._2249 - 1;
         while(_loc1_ >= 0)
         {
            this.removeElementAt(_loc1_);
            _loc1_--;
         }
      }
      
      override public function getElementIndex(param1:_1133) : int
      {
         return this._7410.indexOf(param1);
      }
      
      public function setElementIndex(param1:_1133, param2:int) : void
      {
         this._7407(param2);
         var _loc3_:int = this.getElementIndex(param1);
         if(_loc3_ == -1 || _loc3_ == param2)
         {
            return;
         }
         if(!this._7404)
         {
            this.ns_egret::elementRemoved(param1,_loc3_,false);
         }
         this._7410.splice(_loc3_,1);
         this._7410.splice(param2,0,param1);
         if(!this._7404)
         {
            this.ns_egret::elementAdded(param1,param2,false);
         }
      }
      
      public function swapElements(param1:_1133, param2:_1133) : void
      {
         this.swapElementsAt(this.getElementIndex(param1),this.getElementIndex(param2));
      }
      
      public function swapElementsAt(param1:int, param2:int) : void
      {
         var _loc5_:int = 0;
         this._7407(param1);
         this._7407(param2);
         if(param1 > param2)
         {
            _loc5_ = param2;
            param2 = param1;
            param1 = _loc5_;
         }
         else if(param1 == param2)
         {
            return;
         }
         var _loc3_:_1133 = this._7410[param1];
         var _loc4_:_1133 = this._7410[param2];
         if(!this._7404)
         {
            this.ns_egret::elementRemoved(_loc3_,param1,false);
            this.ns_egret::elementRemoved(_loc4_,param2,false);
         }
         this._7410.splice(param2,1);
         this._7410.splice(param1,1);
         this._7410.splice(param1,0,_loc4_);
         this._7410.splice(param2,0,_loc3_);
         if(!this._7404)
         {
            this.ns_egret::elementAdded(_loc4_,param1,false);
            this.ns_egret::elementAdded(_loc3_,param2,false);
         }
      }
      
      ns_egret function elementAdded(param1:_1133, param2:int, param3:Boolean = true) : void
      {
         if(param1 is DisplayObject)
         {
            ns_egret::addToDisplayListAt(DisplayObject(param1),param2);
         }
         if(param3)
         {
            if(hasEventListener(ElementExistenceEvent.ELEMENT_ADD))
            {
               dispatchEvent(new ElementExistenceEvent(ElementExistenceEvent.ELEMENT_ADD,false,false,param1,param2));
            }
         }
         invalidateSize();
         invalidateDisplayList();
      }
      
      ns_egret function elementRemoved(param1:_1133, param2:int, param3:Boolean = true) : void
      {
         if(param3)
         {
            if(hasEventListener(ElementExistenceEvent.ELEMENT_REMOVE))
            {
               dispatchEvent(new ElementExistenceEvent(ElementExistenceEvent.ELEMENT_REMOVE,false,false,param1,param2));
            }
         }
         var _loc4_:DisplayObject = param1 as DisplayObject;
         if((Boolean(_loc4_)) && _loc4_.parent == this)
         {
            ns_egret::removeFromDisplayList(_loc4_);
         }
         invalidateSize();
         invalidateDisplayList();
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         throw new Error("addChild()" + errorStr + "addElement()代替");
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         throw new Error("addChildAt()" + errorStr + "addElementAt()代替");
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         throw new Error("removeChild()" + errorStr + "removeElement()代替");
      }
      
      override public function removeChildAt(param1:int) : DisplayObject
      {
         throw new Error("removeChildAt()" + errorStr + "removeElementAt()代替");
      }
      
      override public function setChildIndex(param1:DisplayObject, param2:int) : void
      {
         throw new Error("setChildIndex()" + errorStr + "setElementIndex()代替");
      }
      
      override public function swapChildren(param1:DisplayObject, param2:DisplayObject) : void
      {
         throw new Error("swapChildren()" + errorStr + "swapElements()代替");
      }
      
      override public function swapChildrenAt(param1:int, param2:int) : void
      {
         throw new Error("swapChildrenAt()" + errorStr + "swapElementsAt()代替");
      }
   }
}

