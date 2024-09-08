package _1088
{
   import _1045._1047;
   import _1045._1085;
   import egret.core._1117;
   import egret.core._1118;
   import egret.core._1127;
   import egret.core.ns_egret;
   import flash.display.InteractiveObject;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.TextEvent;
   
   use namespace ns_egret;
   
   public class _1099 extends _1085
   {
      public var _2577:_1118;
      
      private var _8510:Object;
      
      public var _6672:_1117;
      
      private var _7447:String;
      
      public function _1099()
      {
         this._8510 = {};
         super();
         _2576 = true;
         addEventListener(FocusEvent.FOCUS_IN,this._2574);
         addEventListener(FocusEvent.FOCUS_OUT,this.focusOutHandler);
      }
      
      private function _2574(param1:FocusEvent) : void
      {
         if(param1.target == this)
         {
            this._2581();
            return;
         }
         _2570();
      }
      
      private function focusOutHandler(param1:FocusEvent) : void
      {
         if(param1.target == this)
         {
            return;
         }
         _2570();
      }
      
      public function get prompt() : String
      {
         return this._7447;
      }
      
      public function set prompt(param1:String) : void
      {
         if(this._7447 == param1)
         {
            return;
         }
         this._7447 = param1;
         if(this._6672)
         {
            this._6672.text = param1;
         }
         _2466();
         _2570();
      }
      
      override public function get maxWidth() : Number
      {
         if(this._2577)
         {
            return this._2577.maxWidth;
         }
         var _loc1_:* = this._8510.maxWidth;
         return _loc1_ === undefined ? super.maxWidth : _loc1_;
      }
      
      override public function set maxWidth(param1:Number) : void
      {
         if(this._2577)
         {
            this._2577.maxWidth = param1;
            this._8510.maxWidth = true;
         }
         else
         {
            this._8510.maxWidth = param1;
         }
         _2466();
      }
      
      public function get textColor() : uint
      {
         if(this._2577)
         {
            return this._2577.textColor;
         }
         var _loc1_:* = this._8510.textColor;
         return _loc1_ === undefined ? 0 : _loc1_;
      }
      
      public function set textColor(param1:uint) : void
      {
         if(this._2577)
         {
            this._2577.textColor = param1;
            this._8510.textColor = true;
         }
         else
         {
            this._8510.textColor = param1;
         }
         _2466();
      }
      
      public function get displayAsPassword() : Boolean
      {
         if(this._2577)
         {
            return this._2577.displayAsPassword;
         }
         var _loc1_:* = this._8510.displayAsPassword;
         return _loc1_ === undefined ? false : _loc1_;
      }
      
      public function set displayAsPassword(param1:Boolean) : void
      {
         if(this._2577)
         {
            this._2577.displayAsPassword = param1;
            this._8510.displayAsPassword = true;
         }
         else
         {
            this._8510.displayAsPassword = param1;
         }
         _2466();
      }
      
      public function get editable() : Boolean
      {
         if(this._2577)
         {
            return this._2577.editable;
         }
         var _loc1_:* = this._8510.editable;
         return _loc1_ === undefined ? true : _loc1_;
      }
      
      public function set editable(param1:Boolean) : void
      {
         if(this._2577)
         {
            this._2577.editable = param1;
            this._8510.editable = true;
         }
         else
         {
            this._8510.editable = param1;
         }
         _2466();
      }
      
      public function get maxChars() : int
      {
         if(this._2577)
         {
            return this._2577.maxChars;
         }
         var _loc1_:* = this._8510.maxChars;
         return _loc1_ === undefined ? 0 : _loc1_;
      }
      
      public function set maxChars(param1:int) : void
      {
         if(this._2577)
         {
            this._2577.maxChars = param1;
            this._8510.maxChars = true;
         }
         else
         {
            this._8510.maxChars = param1;
         }
         _2466();
      }
      
      public function get restrict() : String
      {
         if(this._2577)
         {
            return this._2577.restrict;
         }
         var _loc1_:* = this._8510.restrict;
         return _loc1_ === undefined ? null : _loc1_;
      }
      
      public function set restrict(param1:String) : void
      {
         if(this._2577)
         {
            this._2577.restrict = param1;
            this._8510.restrict = true;
         }
         else
         {
            this._8510.restrict = param1;
         }
         _2466();
      }
      
      public function get selectable() : Boolean
      {
         if(this._2577)
         {
            return this._2577.selectable;
         }
         var _loc1_:* = this._8510.selectable;
         return _loc1_ === undefined ? true : _loc1_;
      }
      
      public function set selectable(param1:Boolean) : void
      {
         if(this._2577)
         {
            this._2577.selectable = param1;
            this._8510.selectable = true;
         }
         else
         {
            this._8510.selectable = param1;
         }
         _2466();
      }
      
      public function get selectionBeginIndex() : int
      {
         if(this._2577)
         {
            return this._2577.selectionBeginIndex;
         }
         if(this._8510.selectionBeginIndex === undefined)
         {
            return -1;
         }
         return this._8510.selectionBeginIndex;
      }
      
      public function get selectionEndIndex() : int
      {
         if(this._2577)
         {
            return this._2577.selectionEndIndex;
         }
         if(this._8510.selectionEndIndex === undefined)
         {
            return -1;
         }
         return this._8510.selectionEndIndex;
      }
      
      public function get caretIndex() : int
      {
         return !!this._2577 ? this._2577.caretIndex : 0;
      }
      
      public function setSelection(param1:int, param2:int) : void
      {
         if(this._2577)
         {
            this._2577.setSelection(param1,param2);
         }
         else
         {
            this._8510.selectionBeginIndex = param1;
            this._8510.selectionEndIndex = param2;
         }
      }
      
      public function selectAll() : void
      {
         if(this._2577)
         {
            this._2577.selectAll();
         }
         else if(this._8510.text !== undefined)
         {
            this.setSelection(0,this._8510.text.length - 1);
         }
      }
      
      public function get text() : String
      {
         if(this._2577)
         {
            return this._2577.text;
         }
         var _loc1_:* = this._8510.text;
         return _loc1_ === undefined ? "" : _loc1_;
      }
      
      public function set text(param1:String) : void
      {
         if(this._2577)
         {
            this._2577.text = param1;
            this._8510.text = true;
         }
         else
         {
            this._8510.text = param1;
            this._8510.selectionBeginIndex = 0;
            this._8510.selectionEndIndex = 0;
         }
         _2466();
         _2570();
      }
      
      ns_egret function _8515() : Number
      {
         var _loc1_:_1047 = this._2577 as _1047;
         if(_loc1_)
         {
            return _loc1_._6245;
         }
         var _loc2_:* = !!this._2577 ? undefined : this._8510._6245;
         return _loc2_ === undefined ? NaN : _loc2_;
      }
      
      ns_egret function _8516(param1:Number) : void
      {
         var _loc2_:_1047 = null;
         if(this._2577)
         {
            _loc2_ = this._2577 as _1047;
            if(_loc2_)
            {
               _loc2_._6245 = param1;
            }
            this._8510._6245 = true;
         }
         else
         {
            this._8510._6245 = param1;
         }
         _2466();
      }
      
      ns_egret function _8513() : Number
      {
         var _loc1_:_1047 = this._2577 as _1047;
         if(_loc1_)
         {
            return _loc1_._6244;
         }
         var _loc2_:* = !!this._2577 ? undefined : this._8510._6244;
         return _loc2_ === undefined ? NaN : _loc2_;
      }
      
      ns_egret function _8514(param1:Number) : void
      {
         var _loc2_:_1047 = null;
         if(this._2577)
         {
            _loc2_ = this._2577 as _1047;
            if(_loc2_)
            {
               _loc2_._6244 = param1;
            }
            this._8510._6244 = true;
         }
         else
         {
            this._8510._6244 = param1;
         }
         _2466();
      }
      
      override protected function _6231() : String
      {
         var _loc1_:InteractiveObject = !!stage ? stage.focus : null;
         var _loc2_:Object = ns_egret::_2737;
         if(this._7447 && _loc2_ is _1127 && (!_loc1_ || !contains(_loc1_)) && this.text == "")
         {
            if(enabled && _1127(_loc2_)._8334("normalWithPrompt"))
            {
               return "normalWithPrompt";
            }
            if(!enabled && _1127(_loc2_)._8334("disabledWithPrompt"))
            {
               return "disabledWithPrompt";
            }
         }
         return super._6231();
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this._2577)
         {
            this._8512();
            this._2577.addEventListener(TextEvent.TEXT_INPUT,this._8508);
            this._2577.addEventListener(Event.CHANGE,this._8509);
         }
         else if(param2 == this._6672)
         {
            this._6672.text = this._7447;
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this._2577)
         {
            this._8511();
            this._2577.removeEventListener(TextEvent.TEXT_INPUT,this._8508);
            this._2577.removeEventListener(Event.CHANGE,this._8509);
         }
      }
      
      override public function _2581() : void
      {
         if(this._2577)
         {
            this._2577._2581();
         }
         else
         {
            super._2581();
         }
      }
      
      private function _8512() : void
      {
         var _loc1_:Object = {};
         var _loc2_:_1047 = this._2577 as _1047;
         if(this._8510.displayAsPassword !== undefined)
         {
            this._2577.displayAsPassword = this._8510.displayAsPassword;
            _loc1_.displayAsPassword = true;
         }
         if(this._8510.textColor !== undefined)
         {
            this._2577.textColor = this._8510.textColor;
            _loc1_.textColor = true;
         }
         if(this._8510.editable !== undefined)
         {
            this._2577.editable = this._8510.editable;
            _loc1_.editable = true;
         }
         if(this._8510.maxChars !== undefined)
         {
            this._2577.maxChars = this._8510.maxChars;
            _loc1_.maxChars = true;
         }
         if(this._8510.maxHeight !== undefined)
         {
            this._2577.maxHeight = this._8510.maxHeight;
            _loc1_.maxHeight = true;
         }
         if(this._8510.maxWidth !== undefined)
         {
            this._2577.maxWidth = this._8510.maxWidth;
            _loc1_.maxWidth = true;
         }
         if(this._8510.restrict !== undefined)
         {
            this._2577.restrict = this._8510.restrict;
            _loc1_.restrict = true;
         }
         if(this._8510.selectable !== undefined)
         {
            this._2577.selectable = this._8510.selectable;
            _loc1_.selectable = true;
         }
         if(this._8510.text !== undefined)
         {
            this._2577.text = this._8510.text;
            _loc1_.text = true;
         }
         if(this._8510.selectionBeginIndex !== undefined)
         {
            this._2577.setSelection(this._8510.selectionBeginIndex,this._8510.selectionEndIndex);
         }
         if(this._8510._6245 !== undefined && Boolean(_loc2_))
         {
            _loc2_._6245 = this._8510._6245;
            _loc1_._6245 = true;
         }
         if(this._8510._6244 !== undefined && Boolean(_loc2_))
         {
            _loc2_._6244 = this._8510._6244;
            _loc1_._6244 = true;
         }
         this._8510 = _loc1_;
      }
      
      private function _8511() : void
      {
         var _loc1_:Object = {};
         var _loc2_:_1047 = this._2577 as _1047;
         if(this._8510.displayAsPassword)
         {
            _loc1_.displayAsPassword = this._2577.displayAsPassword;
         }
         if(this._8510.textColor)
         {
            _loc1_.textColor = this._2577.textColor;
         }
         if(this._8510.editable)
         {
            _loc1_.editable = this._2577.editable;
         }
         if(this._8510.maxChars)
         {
            _loc1_.maxChars = this._2577.maxChars;
         }
         if(this._8510.maxHeight)
         {
            _loc1_.maxHeight = this._2577.maxHeight;
         }
         if(this._8510.maxWidth)
         {
            _loc1_.maxWidth = this._2577.maxWidth;
         }
         if(this._8510.restrict)
         {
            _loc1_.restrict = this._2577.restrict;
         }
         if(this._8510.selectable)
         {
            _loc1_.selectable = this._2577.selectable;
         }
         if(this._8510.text)
         {
            _loc1_.text = this._2577.text;
         }
         if(Boolean(this._8510._6244) && Boolean(_loc2_))
         {
            _loc1_._6244 = _loc2_._6244;
         }
         if(Boolean(this._8510._6245) && Boolean(_loc2_))
         {
            _loc1_._6245 = _loc2_._6245;
         }
         this._8510 = _loc1_;
      }
      
      private function _8509(param1:Event) : void
      {
         invalidateDisplayList();
         dispatchEvent(param1);
      }
      
      private function _8508(param1:TextEvent) : void
      {
         var _loc2_:Event = param1.clone();
         dispatchEvent(_loc2_);
         if(_loc2_.isDefaultPrevented())
         {
            param1.preventDefault();
         }
      }
   }
}

