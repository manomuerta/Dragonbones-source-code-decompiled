package _1045
{
   import _1088._1101;
   import _1185._1196;
   import egret.core._1117;
   import egret.core._1118;
   import egret.core._1131;
   import egret.core._1137;
   import egret.core.ns_egret;
   import flash.events.Event;
   import flash.events.TextEvent;
   import flash.text.TextFieldType;
   
   use namespace ns_egret;
   
   public class _1047 extends _1101 implements _1118, _1117, _1131
   {
      private var _7639:Boolean = false;
      
      private var _7630:Boolean = true;
      
      private var _7637:Boolean = false;
      
      private var _7628:Boolean = true;
      
      private var _7644:Boolean = true;
      
      private var _7570:Boolean = true;
      
      private var editableChanged:Boolean = false;
      
      private var _7445:int = 0;
      
      private var _7435:Boolean = false;
      
      private var _7658:Boolean = true;
      
      private var _7642:Boolean = false;
      
      private var _7444:String = null;
      
      private var _7434:Boolean = false;
      
      private var _7648:Number = NaN;
      
      private var _7636:Boolean = false;
      
      private var _7651:Number = NaN;
      
      private var _7638:Boolean = false;
      
      private var _7654:Number = 0;
      
      private var _7649:Number = 0;
      
      private var _7629:Number = 0;
      
      private var _6805:Number = 0;
      
      private var _7634:Boolean = false;
      
      private var _7650:String = "top";
      
      private var _7652:Number = NaN;
      
      private var _7656:Number = NaN;
      
      private var _7657:Boolean = false;
      
      public function _1047()
      {
         super();
         selectable = true;
      }
      
      public function get displayAsPassword() : Boolean
      {
         return this._7639;
      }
      
      public function set displayAsPassword(param1:Boolean) : void
      {
         if(param1 == this._7639)
         {
            return;
         }
         this._7639 = param1;
         this._7630 = true;
         _2466();
         invalidateSize();
         invalidateDisplayList();
      }
      
      public function get alwaysShowSelection() : Boolean
      {
         return this._7637;
      }
      
      public function set alwaysShowSelection(param1:Boolean) : void
      {
         if(param1 == this._7637)
         {
            return;
         }
         this._7637 = param1;
         this._7628 = true;
         _2466();
      }
      
      public function get editable() : Boolean
      {
         if(enabled)
         {
            return this._7570;
         }
         return this._7644;
      }
      
      public function set editable(param1:Boolean) : void
      {
         if(this._7570 == param1)
         {
            return;
         }
         if(enabled)
         {
            this._7570 = param1;
            this.editableChanged = true;
            _2466();
         }
         else
         {
            this._7644 = param1;
         }
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         if(param1 == super.enabled)
         {
            return;
         }
         super.enabled = param1;
         if(enabled)
         {
            if(this._7570 != this._7644)
            {
               this.editableChanged = true;
            }
            this._7570 = this._7644;
         }
         else
         {
            if(this.editable)
            {
               this.editableChanged = true;
            }
            this._7644 = this._7570;
            this._7570 = false;
         }
         _2466();
      }
      
      public function get maxChars() : int
      {
         return this._7445;
      }
      
      public function set maxChars(param1:int) : void
      {
         if(param1 == this._7445)
         {
            return;
         }
         this._7445 = param1;
         this._7435 = true;
         _2466();
      }
      
      public function get multiline() : Boolean
      {
         return this._7658;
      }
      
      public function set multiline(param1:Boolean) : void
      {
         if(param1 == this.multiline)
         {
            return;
         }
         this._7658 = param1;
         this._7642 = true;
         _2466();
      }
      
      public function get restrict() : String
      {
         return this._7444;
      }
      
      public function set restrict(param1:String) : void
      {
         if(param1 == this._7444)
         {
            return;
         }
         this._7444 = param1;
         this._7434 = true;
         _2466();
      }
      
      override public function _7655(param1:String) : void
      {
         super._7655(param1);
         if(!param1 || param1 == "size")
         {
            this._7636 = true;
            this._7638 = true;
         }
      }
      
      override public function set leading(param1:int) : void
      {
         if(leading == param1)
         {
            return;
         }
         super.leading = param1;
         this._7636 = true;
      }
      
      public function get _6244() : Number
      {
         return this._7648;
      }
      
      public function set _6244(param1:Number) : void
      {
         if(this._7648 == param1)
         {
            return;
         }
         this._7648 = param1;
         this._7636 = true;
         _2466();
      }
      
      public function get _6245() : Number
      {
         return this._7651;
      }
      
      public function set _6245(param1:Number) : void
      {
         if(this._7651 == param1)
         {
            return;
         }
         this._7651 = param1;
         this._7638 = true;
         _2466();
      }
      
      public function get contentWidth() : Number
      {
         return this._7654;
      }
      
      private function _7645(param1:Number) : void
      {
         if(param1 == this._7654)
         {
            return;
         }
         var _loc2_:Number = this._7654;
         this._7654 = param1;
         _7626("contentWidth",_loc2_,param1);
      }
      
      public function get contentHeight() : Number
      {
         return this._7649;
      }
      
      private function _7643(param1:Number) : void
      {
         if(param1 == this._7649)
         {
            return;
         }
         var _loc2_:Number = this._7649;
         this._7649 = param1;
         _7626("contentHeight",_loc2_,param1);
      }
      
      public function get horizontalScrollPosition() : Number
      {
         return this._7629;
      }
      
      public function set horizontalScrollPosition(param1:Number) : void
      {
         if(this._7629 == param1)
         {
            return;
         }
         param1 = Math.round(param1);
         var _loc2_:Number = this._7629;
         this._7629 = param1;
         if(this._7634)
         {
            if(_7027)
            {
               _7027.scrollH = param1;
            }
            _7626("horizontalScrollPosition",_loc2_,param1);
         }
      }
      
      public function get verticalScrollPosition() : Number
      {
         return this._6805;
      }
      
      public function set verticalScrollPosition(param1:Number) : void
      {
         if(this._6805 == param1)
         {
            return;
         }
         param1 = Math.round(param1);
         var _loc2_:Number = this._6805;
         this._6805 = param1;
         if(this._7634)
         {
            if(_7027)
            {
               _7027.scrollV = this._7631(param1);
            }
            _7626("verticalScrollPosition",_loc2_,param1);
         }
      }
      
      private function _7631(param1:Number) : int
      {
         if(_7027.numLines == 0)
         {
            return 1;
         }
         var _loc2_:Number = _7027.getLineMetrics(0).height;
         var _loc3_:Number = (height - 4) % _loc2_;
         if(_7027.textHeight + _loc3_ - height == param1)
         {
            return _7027.maxScrollV;
         }
         return int((param1 - 2) / _loc2_) + 1;
      }
      
      private function _7635(param1:int) : Number
      {
         var _loc3_:Number = NaN;
         if(param1 == 1 || _7027.numLines == 0)
         {
            return 0;
         }
         var _loc2_:Number = _7027.getLineMetrics(0).height;
         if(param1 == _7027.maxScrollV)
         {
            _loc3_ = (height - 4) % _loc2_;
            return _7027.textHeight + _loc3_ - height;
         }
         return _loc2_ * (param1 - 1) + 2;
      }
      
      public function _7624(param1:uint) : Number
      {
         var _loc2_:Number = 0;
         var _loc3_:Number = this._7654 - this._7629 - width;
         var _loc4_:Number = -this._7629;
         switch(param1)
         {
            case _1137.LEFT:
               _loc2_ = this._7629 <= 0 ? 0 : Math.max(_loc4_,-size);
               break;
            case _1137.RIGHT:
               _loc2_ = this._7629 + width >= this.contentWidth ? 0 : Math.min(_loc3_,size);
               break;
            case _1137.PAGE_LEFT:
               _loc2_ = Math.max(_loc4_,-width);
               break;
            case _1137.PAGE_RIGHT:
               _loc2_ = Math.min(_loc3_,width);
               break;
            case _1137.HOME:
               _loc2_ = _loc4_;
               break;
            case _1137.END:
               _loc2_ = _loc3_;
         }
         return _loc2_;
      }
      
      public function _7653(param1:int = 0, param2:int = 2147483647) : void
      {
         if(param2 == int.MAX_VALUE)
         {
            param2 = text.length;
         }
         var _loc3_:int = _7027.getLineIndexOfChar(param1);
         var _loc4_:int = _7027.getLineIndexOfChar(Math.max(param2,0));
         var _loc5_:int = _7027.scrollV;
         var _loc6_:int = _7027.getLineIndexAtPoint(2,_7027.height - 2);
         if(_loc4_ > _loc6_)
         {
            _loc5_ += _loc4_ - _loc6_;
         }
         if(_loc3_ < _loc5_)
         {
            _loc5_ = _loc3_;
         }
         this.verticalScrollPosition = this._7635(_loc5_);
      }
      
      public function _7625(param1:uint) : Number
      {
         var _loc2_:Number = 0;
         var _loc3_:Number = this._7649 - this._6805 - height;
         var _loc4_:Number = -this._6805;
         switch(param1)
         {
            case _1137.UP:
               _loc2_ = this._7647(-1);
               break;
            case _1137.DOWN:
               _loc2_ = this._7647(1);
               break;
            case _1137.PAGE_UP:
               _loc2_ = Math.max(_loc4_,-width);
               break;
            case _1137.PAGE_DOWN:
               _loc2_ = Math.min(_loc3_,width);
               break;
            case _1137.HOME:
               _loc2_ = _loc4_;
               break;
            case _1137.END:
               _loc2_ = _loc3_;
         }
         return _loc2_;
      }
      
      private function _7647(param1:int) : Number
      {
         if(!_7027)
         {
            return 0;
         }
         var _loc2_:int = this._7631(this._6805);
         var _loc3_:int = _loc2_ + param1;
         _loc3_ = Math.max(1,Math.min(_7027.maxScrollV,_loc3_));
         var _loc4_:Number = this._7635(_loc3_);
         return int(_loc4_ - this._6805);
      }
      
      public function get clipAndEnableScrolling() : Boolean
      {
         return this._7634;
      }
      
      public function set clipAndEnableScrolling(param1:Boolean) : void
      {
         if(this._7634 == param1)
         {
            return;
         }
         this._7634 = param1;
         if(_7027)
         {
            if(param1)
            {
               _7027.scrollH = this._7629;
               _7027.scrollV = this._7631(this._6805);
               this._7640();
            }
            else
            {
               _7027.scrollH = 0;
               _7027.scrollV = 1;
            }
         }
      }
      
      override protected function _2476() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         if(!_7027)
         {
            this.editableChanged = true;
            this._7630 = true;
            this._7435 = true;
            this._7642 = true;
            this._7434 = true;
         }
         super._2476();
         if(this.editableChanged)
         {
            _7027.type = this._7570 ? TextFieldType.INPUT : TextFieldType.DYNAMIC;
            this.editableChanged = false;
         }
         if(this._7630)
         {
            _7027.displayAsPassword = this._7639;
            this._7630 = false;
         }
         if(this._7628)
         {
            _7027.alwaysShowSelection = this._7637;
            this._7628 = false;
         }
         if(this._7435)
         {
            _7027.maxChars = this._7445;
            this._7435 = false;
         }
         if(this._7642)
         {
            _7027.multiline = this._7658;
            _7027.wordWrap = this._7658;
            this._7642 = false;
         }
         if(this._7434)
         {
            _7027.restrict = this._7444;
            this._7434 = false;
         }
         if(this._7636)
         {
            this._7636 = false;
            if(isNaN(this._7648))
            {
               this._7652 = NaN;
            }
            else
            {
               _loc1_ = int(this._6244);
               _loc2_ = 22;
               if(_7027.length > 0)
               {
                  _loc2_ = _7027.getLineMetrics(0).height;
               }
               else
               {
                  _7027.ns_egret::_7660 = "M";
                  _loc2_ = _7027.getLineMetrics(0).height;
                  _7027.ns_egret::_7660 = "";
               }
               this._7652 = _loc1_ * _loc2_ + 4;
            }
         }
         if(this._7638)
         {
            this._7638 = false;
            if(isNaN(this._7651))
            {
               this._7656 = NaN;
            }
            else
            {
               _loc3_ = int(this._7651);
               this._7656 = size * _loc3_ + 5;
            }
         }
      }
      
      public function get verticalAlign() : String
      {
         var _loc1_:Object = this._7646;
         if(Boolean(_loc1_) && _loc1_["verticalAlign"] !== undefined)
         {
            return _loc1_["verticalAlign"];
         }
         return this._7650;
      }
      
      public function set verticalAlign(param1:String) : void
      {
         setStyle("verticalAlign",param1);
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         var _loc5_:Number = NaN;
         this._7657 = true;
         var _loc3_:int = _7027.scrollH;
         var _loc4_:int = _7027.scrollV;
         super._5823(param1,param2);
         this._7640();
         _7027.scrollH = _loc3_;
         _7027.scrollV = _loc4_;
         _7027.x = 0;
         _7027.y = 0;
         if(_7027.textHeight < param2)
         {
            _loc5_ = 0;
            if(this.verticalAlign == _1196.MIDDLE)
            {
               _loc5_ = 0.5;
            }
            else if(this.verticalAlign == _1196.BOTTOM)
            {
               _loc5_ = 1;
            }
            _7027.y += Math.floor((param2 - _7027.textHeight) * _loc5_);
         }
         this._7657 = false;
      }
      
      private function _7640() : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(!this.clipAndEnableScrolling)
         {
            return;
         }
         this._7645(_7027.textWidth);
         var _loc1_:Number = 0;
         var _loc2_:int = _7027.numLines;
         if(_loc2_ == 0)
         {
            _loc1_ = 4;
         }
         else
         {
            _loc3_ = _7027.getLineMetrics(0).height;
            _loc4_ = (height - 4) % _loc3_;
            _loc1_ = _7027.textHeight + _loc4_;
         }
         this._7643(_loc1_);
      }
      
      public function get selectionBeginIndex() : int
      {
         _6040();
         if(_7027)
         {
            return _7027.selectionBeginIndex;
         }
         return 0;
      }
      
      public function get selectionEndIndex() : int
      {
         _6040();
         if(_7027)
         {
            return _7027.selectionEndIndex;
         }
         return 0;
      }
      
      public function get caretIndex() : int
      {
         _6040();
         if(_7027)
         {
            return _7027.caretIndex;
         }
         return 0;
      }
      
      public function setSelection(param1:int, param2:int) : void
      {
         _6040();
         if(_7027)
         {
            _7027.setSelection(param1,param2);
         }
      }
      
      public function selectAll() : void
      {
         _6040();
         if(_7027)
         {
            _7027.setSelection(0,_7027.length);
         }
      }
      
      override protected function _7028() : void
      {
         measuredWidth = isNaN(this._7656) ? DEFAULT_MEASURED_WIDTH : this._7656;
         if(this._7445 != 0)
         {
            measuredWidth = Math.min(measuredWidth,_7027.textWidth);
         }
         if(this._7658)
         {
            measuredHeight = isNaN(this._7652) ? DEFAULT_MEASURED_HEIGHT * 2 : this._7652;
         }
         else
         {
            measuredHeight = _7027.textHeight;
         }
      }
      
      override protected function _7022() : void
      {
         super._7022();
         _7027.type = this._7570 ? TextFieldType.INPUT : TextFieldType.DYNAMIC;
         _7027.multiline = this._7658;
         _7027.wordWrap = this._7658;
         _7027.addEventListener(Event.CHANGE,this._7633);
         _7027.addEventListener(Event.SCROLL,this._7632);
         _7027.addEventListener(TextEvent.TEXT_INPUT,this._7627);
         if(this._7634)
         {
            _7027.scrollH = this._7629;
            _7027.scrollV = this._7631(this._6805);
         }
      }
      
      private function _7633(param1:Event) : void
      {
         _7641(false);
         param1.stopImmediatePropagation();
         dispatchEvent(new Event(Event.CHANGE));
         invalidateSize();
         invalidateDisplayList();
         this._7640();
      }
      
      private function _7632(param1:Event) : void
      {
         if(this._7657)
         {
            return;
         }
         this.horizontalScrollPosition = _7027.scrollH;
         this.verticalScrollPosition = this._7635(_7027.scrollV);
      }
      
      private function _7627(param1:TextEvent) : void
      {
         param1.stopImmediatePropagation();
         var _loc2_:TextEvent = new TextEvent(TextEvent.TEXT_INPUT,false,true);
         _loc2_.text = param1.text;
         dispatchEvent(_loc2_);
         if(_loc2_.isDefaultPrevented())
         {
            param1.preventDefault();
         }
      }
   }
}

