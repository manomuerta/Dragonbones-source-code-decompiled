package _1374
{
   import _1088._1095;
   import _1404._1405;
   import egret.core._1117;
   import egret.core._1141;
   import egret.managers._1198;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   import flash.ui.MouseCursor;
   
   public class NumberRegulator extends _1095
   {
      public var _9775:TextInput;
      
      public var labelDisplay:_1117;
      
      private var _7441:Boolean;
      
      private var _9776:Number;
      
      private var _9780:Boolean;
      
      private var _9770:Boolean;
      
      private var _9778:Boolean;
      
      private var _1610:Boolean;
      
      private var _9779:Point;
      
      private var _9781:Number;
      
      private var _9772:Boolean;
      
      public function NumberRegulator()
      {
         this._9779 = new Point();
         super();
         this._2576 = false;
      }
      
      override public function set value(param1:Number) : void
      {
         this._9780 = false;
         super.value = param1;
         _2570();
      }
      
      public function get _9777() : Number
      {
         if(isNaN(this._9776))
         {
            return 0;
         }
         return this._9776;
      }
      
      public function set _9777(param1:Number) : void
      {
         this._9776 = param1;
         this._7441 = true;
         _2466();
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this._7441)
         {
            this._7441 = false;
            if(this._6231() == "prompt")
            {
               this._9780 = false;
               this.setValue(_8231(this._9777,_8236));
               this._9780 = true;
            }
         }
      }
      
      public function get _2506() : Boolean
      {
         return this._9780;
      }
      
      public function get _9771() : Boolean
      {
         return this._9770;
      }
      
      public function set _9771(param1:Boolean) : void
      {
         if(this._9770 == param1)
         {
            return;
         }
         this._9770 = param1;
         if(this.labelDisplay)
         {
            if(param1)
            {
               this.addEventListener(MouseEvent.MOUSE_WHEEL,this._9762,true);
            }
            else
            {
               this.removeEventListener(MouseEvent.MOUSE_WHEEL,this._9762,true);
            }
         }
      }
      
      public function _9769(param1:Number = NaN) : void
      {
         if(!isNaN(param1))
         {
            this._9776 = param1;
         }
         this.setValue(_8231(this._9777,_8236));
         this._9780 = true;
         _2570();
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this._9775)
         {
            this._9775.text = String(value);
            this._9775.tabEnabled = true;
            this._9775.addEventListener(MouseEvent.MOUSE_WHEEL,this._9764,true);
            this._9775.addEventListener(KeyboardEvent.KEY_DOWN,this._9767);
         }
         else if(param2 == this.labelDisplay)
         {
            this.labelDisplay.text = String(value);
            if(this._9771)
            {
               this.addEventListener(MouseEvent.MOUSE_WHEEL,this._9762,true);
            }
            this.addEventListener(MouseEvent.ROLL_OVER,this._9766);
            this.addEventListener(MouseEvent.ROLL_OUT,this._9768);
            this.addEventListener(MouseEvent.MOUSE_DOWN,this._9765);
            this.addEventListener(MouseEvent.CLICK,this._9763);
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this._9775)
         {
            this._9775.removeEventListener(MouseEvent.MOUSE_WHEEL,this._9764,true);
            this._9775.removeEventListener(KeyboardEvent.KEY_DOWN,this._9767);
         }
         else if(param2 == this.labelDisplay)
         {
            this.removeEventListener(MouseEvent.MOUSE_WHEEL,this._9762,true);
            this.removeEventListener(MouseEvent.ROLL_OVER,this._9766);
            this.removeEventListener(MouseEvent.ROLL_OUT,this._9768);
            this.removeEventListener(MouseEvent.MOUSE_DOWN,this._9765);
            this.removeEventListener(MouseEvent.CLICK,this._9763);
         }
      }
      
      private function _9762(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         if(this._1610 || this._9778)
         {
            return;
         }
         _1198.setCursor(_1405.DESKTOP_RESIZE_NS);
         var _loc2_:Number = this.value;
         _8042(param1.delta > 0);
         if(value != _loc2_)
         {
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      private function _9768(param1:MouseEvent) : void
      {
         if(!this._1610 && !this._9778)
         {
            _1198.setCursor(MouseCursor.ARROW);
         }
      }
      
      private function _9766(param1:MouseEvent) : void
      {
         if(!this._1610 && !this._9778)
         {
            _1198.setCursor(_1405.DESKTOP_RESIZE_EW);
         }
      }
      
      private function _9764(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         var _loc2_:Number = Number(this._9775.text);
         if(isNaN(_loc2_))
         {
            this._9775.text = String(value);
            return;
         }
         var _loc3_:Number = param1.delta > 0 ? _loc2_ + _8047 : _loc2_ - _8047;
         this._9775.text = String(_8231(_loc3_,_8236));
         this._9775.selectAll();
      }
      
      private function _9763(param1:MouseEvent) : void
      {
         if(!this._9772)
         {
            this._9773();
         }
      }
      
      protected function _9773() : void
      {
         if(this._9778)
         {
            return;
         }
         this._9778 = true;
         _1198.setCursor(MouseCursor.AUTO);
         this._9775.text = String(value);
         this._9775._2581();
         this._9775.selectAll();
         stage.addEventListener(MouseEvent.MOUSE_DOWN,this._8394);
         _2570();
      }
      
      override public function _2581() : void
      {
         super._2581();
         this._9773();
      }
      
      private function _9767(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER)
         {
            this._9774();
         }
         else if(param1.keyCode == Keyboard.ESCAPE)
         {
            this._9774(false);
         }
      }
      
      private function _8394(param1:Event) : void
      {
         if(this.contains(param1.target as DisplayObject))
         {
            return;
         }
         this._9774();
      }
      
      protected function _9774(param1:Boolean = true) : void
      {
         var _loc2_:Number = NaN;
         _1198.setCursor(MouseCursor.AUTO);
         this._9778 = false;
         if(stage)
         {
            stage.removeEventListener(MouseEvent.MOUSE_DOWN,this._8394);
         }
         if(param1)
         {
            if(!this._9775.text)
            {
               this._9769();
               dispatchEvent(new Event(Event.CHANGE));
            }
            else
            {
               _loc2_ = Number(this._9775.text);
               if(!isNaN(_loc2_))
               {
                  _loc2_ = _8231(_loc2_,_8236);
                  if(this._2506 || _loc2_ != value)
                  {
                     this.setValue(_loc2_);
                     dispatchEvent(new Event(Event.CHANGE));
                  }
               }
            }
         }
         _2570();
      }
      
      public function get isDragging() : Boolean
      {
         return this._1610;
      }
      
      protected function _9765(param1:MouseEvent) : void
      {
         if(this._9778)
         {
            return;
         }
         this._9781 = value;
         this._9779.x = param1.stageX;
         this._9779.y = param1.stageY;
         this._1610 = true;
         this._9772 = false;
         _1198.setCursor(_1405.DESKTOP_RESIZE_EW);
         stage.addEventListener(MouseEvent.MOUSE_UP,this._8097);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this._8395);
      }
      
      protected function _8395(param1:MouseEvent) : void
      {
         this._8518();
         if(_1141._8368)
         {
            param1.updateAfterEvent();
         }
      }
      
      private function _8518() : void
      {
         var _loc1_:Number = this.stage.mouseX - this._9779.x + this.stage.mouseY - this._9779.y;
         _loc1_ *= _8047;
         var _loc2_:Number = this.value;
         var _loc3_:Number = _8231(this._9781 + _loc1_,_8236);
         if(_loc2_ != _loc3_)
         {
            this.setValue(_loc3_);
         }
         this._9781 = this.value;
         this._9779.x = this.stage.mouseX;
         this._9779.y = this.stage.mouseY;
         if(value != _loc2_)
         {
            this._9772 = true;
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      protected function _8097(param1:MouseEvent) : void
      {
         this._1610 = false;
         _1198.setCursor(MouseCursor.AUTO);
         if(this.labelDisplay is DisplayObject)
         {
            if(DisplayObject(this.labelDisplay).getBounds(stage).contains(param1.stageX,param1.stageY))
            {
               _1198.setCursor(_1405.DESKTOP_RESIZE_EW);
            }
         }
         stage.removeEventListener(MouseEvent.MOUSE_UP,this._8097);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._8395);
         if(this._9772)
         {
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      override protected function _6231() : String
      {
         if(this._9778 && enabled)
         {
            return "edit";
         }
         if(this._9780)
         {
            return "prompt";
         }
         return super._6231();
      }
      
      override protected function setValue(param1:Number) : void
      {
         super.setValue(param1);
         if(this._9775)
         {
            this._9775.text = String(param1);
         }
         if(this.labelDisplay)
         {
            this.labelDisplay.text = String(param1);
         }
         if(this._9780 && initialized)
         {
            this._9780 = false;
            _2570();
         }
      }
   }
}

