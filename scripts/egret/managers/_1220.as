package egret.managers
{
   import _1045.Group;
   import _1185._1186;
   import _1193._1192;
   import egret.core._1116;
   import egret.core._1133;
   import egret.core._1134;
   import egret.core._1141;
   import egret.core.ns_egret;
   import flash.display.StageAlign;
   import flash.display.StageScaleMode;
   import flash.events.Event;
   import flash.events.EventPhase;
   import flash.events.FullScreenEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import locales._1298;
   
   use namespace ns_egret;
   
   public class _1220 extends Group implements _1211
   {
      private var locale:_1298;
      
      private var _9046:Boolean = true;
      
      private var _9038:_1219;
      
      private var _9035:_1219;
      
      private var _9037:_1219;
      
      private var _9040:int = 0;
      
      private var _9042:int = 0;
      
      private var _9043:int = 0;
      
      private var _9045:int = 0;
      
      public function _1220()
      {
         super();
         _1298.init();
         _8027 = false;
         this.addEventListener(Event.ADDED_TO_STAGE,this._9044);
         this.addEventListener(Event.REMOVED_FROM_STAGE,this._8064);
         this.addEventListener(KeyboardEvent.KEY_DOWN,this._2575,true,1000);
         this.addEventListener(MouseEvent.MOUSE_WHEEL,this._2456,true,1000);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this._2456,true,1000);
      }
      
      private function _9044(param1:Event = null) : void
      {
         stage.scaleMode = StageScaleMode.NO_SCALE;
         stage.align = StageAlign.TOP_LEFT;
         stage.stageFocusRect = false;
         _1141.ns_egret::_8712(this);
         if(this._9046)
         {
            stage.addEventListener(Event.RESIZE,this.onResize);
            stage.addEventListener(FullScreenEvent.FULL_SCREEN,this.onResize);
            this.onResize();
         }
      }
      
      private function _8064(param1:Event) : void
      {
         _1141.ns_egret::_8709(this);
         if(this._9046)
         {
            stage.removeEventListener(Event.RESIZE,this.onResize);
            stage.removeEventListener(FullScreenEvent.FULL_SCREEN,this.onResize);
         }
      }
      
      private function onResize(param1:Event = null) : void
      {
         super.width = stage.stageWidth;
         super.height = stage.stageHeight;
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = true) : void
      {
         super.addEventListener(param1,param2,param3,param4,param5);
      }
      
      private function _2456(param1:MouseEvent) : void
      {
         var _loc2_:MouseEvent = null;
         var _loc3_:Class = null;
         if(!param1.cancelable && param1.eventPhase != EventPhase.BUBBLING_PHASE)
         {
            param1.stopImmediatePropagation();
            _loc2_ = null;
            if("clickCount" in param1)
            {
               _loc3_ = MouseEvent;
               _loc2_ = new _loc3_(param1.type,param1.bubbles,true,param1.localX,param1.localY,param1.relatedObject,param1.ctrlKey,param1.altKey,param1.shiftKey,param1.buttonDown,param1.delta,param1["commandKey"],param1["controlKey"],param1["clickCount"]);
            }
            else
            {
               _loc2_ = new MouseEvent(param1.type,param1.bubbles,true,param1.localX,param1.localY,param1.relatedObject,param1.ctrlKey,param1.altKey,param1.shiftKey,param1.buttonDown,param1.delta);
            }
            param1.target.dispatchEvent(_loc2_);
         }
      }
      
      private function _2575(param1:KeyboardEvent) : void
      {
         var _loc2_:KeyboardEvent = null;
         if(!param1.cancelable)
         {
            switch(param1.keyCode)
            {
               case Keyboard.UP:
               case Keyboard.DOWN:
               case Keyboard.PAGE_UP:
               case Keyboard.PAGE_DOWN:
               case Keyboard.HOME:
               case Keyboard.END:
               case Keyboard.LEFT:
               case Keyboard.RIGHT:
               case Keyboard.ENTER:
                  param1.stopImmediatePropagation();
                  _loc2_ = new KeyboardEvent(param1.type,param1.bubbles,true,param1.charCode,param1.keyCode,param1.keyLocation,param1.ctrlKey,param1.altKey,param1.shiftKey);
                  param1.target.dispatchEvent(_loc2_);
            }
         }
      }
      
      public function get _9047() : Boolean
      {
         return this._9046;
      }
      
      public function set _9047(param1:Boolean) : void
      {
         if(this._9046 == param1)
         {
            return;
         }
         this._9046 = param1;
         if(!stage)
         {
            return;
         }
         if(this._9046)
         {
            stage.addEventListener(Event.RESIZE,this.onResize);
            stage.addEventListener(FullScreenEvent.FULL_SCREEN,this.onResize);
         }
         else
         {
            stage.removeEventListener(Event.RESIZE,this.onResize);
            stage.removeEventListener(FullScreenEvent.FULL_SCREEN,this.onResize);
         }
      }
      
      override public function set x(param1:Number) : void
      {
         if(this._9046)
         {
            return;
         }
         super.x = param1;
      }
      
      override public function set y(param1:Number) : void
      {
         if(this._9046)
         {
            return;
         }
         super.y = param1;
      }
      
      override public function set width(param1:Number) : void
      {
         if(this._9046)
         {
            return;
         }
         super.width = param1;
      }
      
      override public function set height(param1:Number) : void
      {
         if(this._9046)
         {
            return;
         }
         super.height = param1;
      }
      
      override public function set scaleX(param1:Number) : void
      {
         if(this._9046)
         {
            return;
         }
         super.scaleX = param1;
      }
      
      override public function set scaleY(param1:Number) : void
      {
         if(this._9046)
         {
            return;
         }
         super.scaleY = param1;
      }
      
      override public function setActualSize(param1:Number, param2:Number) : void
      {
         if(this._9046)
         {
            return;
         }
         super.setActualSize(param1,param2);
      }
      
      override public function _7777(param1:Number, param2:Number) : void
      {
         if(this._9046)
         {
            return;
         }
         super._7777(param1,param2);
      }
      
      override public function _7599(param1:Number, param2:Number) : void
      {
         if(this._9046)
         {
            return;
         }
         super._7599(param1,param2);
      }
      
      override public function get layout() : _1192
      {
         return super.layout;
      }
      
      override public function set layout(param1:_1192) : void
      {
         if(param1 is _1186)
         {
            super.layout = param1;
         }
      }
      
      public function get _8969() : _1116
      {
         if(!this._9038)
         {
            this._9038 = new _1219(this,new QName(ns_egret,"noTopMostIndex"),new QName(ns_egret,"topMostIndex"));
         }
         return this._9038;
      }
      
      public function get _8988() : _1116
      {
         if(!this._9035)
         {
            this._9035 = new _1219(this,new QName(ns_egret,"topMostIndex"),new QName(ns_egret,"toolTipIndex"));
         }
         return this._9035;
      }
      
      public function get _9013() : _1116
      {
         if(!this._9037)
         {
            this._9037 = new _1219(this,new QName(ns_egret,"toolTipIndex"),new QName(ns_egret,"cursorIndex"));
         }
         return this._9037;
      }
      
      ns_egret function get noTopMostIndex() : int
      {
         return this._9040;
      }
      
      ns_egret function set noTopMostIndex(param1:int) : void
      {
         var _loc2_:int = param1 - this._9040;
         this._9040 = param1;
         this.ns_egret::topMostIndex += _loc2_;
      }
      
      ns_egret function get topMostIndex() : int
      {
         return this._9042;
      }
      
      ns_egret function set topMostIndex(param1:int) : void
      {
         var _loc2_:int = param1 - this._9042;
         this._9042 = param1;
         this.ns_egret::toolTipIndex += _loc2_;
      }
      
      ns_egret function get toolTipIndex() : int
      {
         return this._9043;
      }
      
      ns_egret function set toolTipIndex(param1:int) : void
      {
         var _loc2_:int = param1 - this._9043;
         this._9043 = param1;
         this.ns_egret::cursorIndex += _loc2_;
      }
      
      ns_egret function get cursorIndex() : int
      {
         return this._9045;
      }
      
      ns_egret function set cursorIndex(param1:int) : void
      {
         var _loc2_:int = param1 - this._9045;
         this._9045 = param1;
      }
      
      override public function addElement(param1:_1133) : _1133
      {
         var _loc2_:int = this._9040;
         if(param1.parent == this)
         {
            _loc2_--;
         }
         return this.addElementAt(param1,_loc2_);
      }
      
      override public function addElementAt(param1:_1133, param2:int) : _1133
      {
         var _loc3_:int = 0;
         if(param1.parent == this)
         {
            _loc3_ = getElementIndex(param1);
            if(_loc3_ < this._9040)
            {
               --this.ns_egret::noTopMostIndex;
            }
            else if(_loc3_ >= this._9040 && _loc3_ < this._9042)
            {
               --this.ns_egret::topMostIndex;
            }
            else if(_loc3_ >= this._9042 && _loc3_ < this._9043)
            {
               --this.ns_egret::toolTipIndex;
            }
            else
            {
               --this.ns_egret::cursorIndex;
            }
         }
         if(param2 <= this._9040)
         {
            ++this.ns_egret::noTopMostIndex;
         }
         else if(param2 > this._9040 && param2 <= this._9042)
         {
            ++this.ns_egret::topMostIndex;
         }
         else if(param2 > this._9042 && param2 <= this._9043)
         {
            ++this.ns_egret::toolTipIndex;
         }
         else
         {
            ++this.ns_egret::cursorIndex;
         }
         return super.addElementAt(param1,param2);
      }
      
      override public function removeElement(param1:_1133) : _1133
      {
         return this.removeElementAt(super.getElementIndex(param1));
      }
      
      override public function removeElementAt(param1:int) : _1133
      {
         var _loc2_:_1133 = super.removeElementAt(param1);
         if(param1 < this._9040)
         {
            --this.ns_egret::noTopMostIndex;
         }
         else if(param1 >= this._9040 && param1 < this._9042)
         {
            --this.ns_egret::topMostIndex;
         }
         else if(param1 >= this._9042 && param1 < this._9043)
         {
            --this.ns_egret::toolTipIndex;
         }
         else
         {
            --this.ns_egret::cursorIndex;
         }
         return _loc2_;
      }
      
      override public function _2426() : void
      {
         while(this._9040 > 0)
         {
            super.removeElementAt(0);
            --this.ns_egret::noTopMostIndex;
         }
      }
      
      override public function _8171(param1:_1133) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_1133 = null;
         if(super._8171(param1))
         {
            if(param1.parent == this)
            {
               _loc2_ = super.getElementIndex(param1);
               if(_loc2_ < this._9040)
               {
                  return true;
               }
            }
            else
            {
               _loc3_ = 0;
               while(_loc3_ < this._9040)
               {
                  _loc4_ = super.getElementAt(_loc3_);
                  if(_loc4_ is _1134)
                  {
                     if(_1134(_loc4_)._8171(param1))
                     {
                        return true;
                     }
                  }
                  _loc3_++;
               }
            }
         }
         return false;
      }
      
      override ns_egret function elementRemoved(param1:_1133, param2:int, param3:Boolean = true) : void
      {
         if(param3)
         {
            param1.dispatchEvent(new Event("removeFromSystemManager"));
         }
         super.ns_egret::elementRemoved(param1,param2,param3);
      }
      
      ns_egret function get _9039() : int
      {
         return super._2249;
      }
      
      ns_egret function raw_getElementAt(param1:int) : _1133
      {
         return super.getElementAt(param1);
      }
      
      ns_egret function _9041(param1:_1133) : _1133
      {
         var _loc2_:int = super._2249;
         if(param1.parent == this)
         {
            _loc2_--;
         }
         return this.ns_egret::raw_addElementAt(param1,_loc2_);
      }
      
      ns_egret function raw_addElementAt(param1:_1133, param2:int) : _1133
      {
         var _loc3_:int = 0;
         if(param1.parent == this)
         {
            _loc3_ = getElementIndex(param1);
            if(_loc3_ < this._9040)
            {
               --this.ns_egret::noTopMostIndex;
            }
            else if(_loc3_ >= this._9040 && _loc3_ < this._9042)
            {
               --this.ns_egret::topMostIndex;
            }
            else if(_loc3_ >= this._9042 && _loc3_ < this._9043)
            {
               --this.ns_egret::toolTipIndex;
            }
            else
            {
               --this.ns_egret::cursorIndex;
            }
         }
         return super.addElementAt(param1,param2);
      }
      
      ns_egret function raw_removeElement(param1:_1133) : _1133
      {
         return super.removeElementAt(super.getElementIndex(param1));
      }
      
      ns_egret function raw_removeElementAt(param1:int) : _1133
      {
         return super.removeElementAt(param1);
      }
      
      ns_egret function _9032() : void
      {
         while(super._2249 > 0)
         {
            super.removeElementAt(0);
         }
      }
      
      ns_egret function raw_getElementIndex(param1:_1133) : int
      {
         return super.getElementIndex(param1);
      }
      
      ns_egret function raw_setElementIndex(param1:_1133, param2:int) : void
      {
         super.setElementIndex(param1,param2);
      }
      
      ns_egret function _9036(param1:_1133, param2:_1133) : void
      {
         super.swapElementsAt(super.getElementIndex(param1),super.getElementIndex(param2));
      }
      
      ns_egret function _9034(param1:int, param2:int) : void
      {
         super.swapElementsAt(param1,param2);
      }
      
      ns_egret function _9033(param1:_1133) : Boolean
      {
         return super._8171(param1);
      }
   }
}

