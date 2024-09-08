package _1374
{
   import _1088._1101;
   import _1185._1196;
   import _1404._1420;
   import egret.core._1112;
   import egret.core._1117;
   import egret.core._1118;
   import egret.core._1131;
   import egret.core._1137;
   import egret.core._1140;
   import egret.core.ns_egret;
   import flash.display.NativeMenu;
   import flash.events.Event;
   import flash.events.TextEvent;
   
   use namespace ns_egret;
   
   public class _1387 extends _1140 implements _1118, _1117, _1131
   {
      public static const DEFAULT_MEASURED_WIDTH:Number = 160;
      
      public static const DEFAULT_MEASURED_HEIGHT:Number = 22;
      
      protected var _7027:_1420;
      
      ns_egret var _8055:Boolean = true;
      
      private var _8534:String;
      
      private var _size:uint;
      
      private var _8541:Boolean = false;
      
      private var _8540:Boolean = false;
      
      private var _8536:String = "left";
      
      private var _8539:int = 2;
      
      private var _8537:uint;
      
      private var _8531:Number = NaN;
      
      private var _8528:Boolean = false;
      
      private var _8533:Boolean = false;
      
      private var _8527:Boolean;
      
      ns_egret var _text:String = "";
      
      ns_egret var textChanged:Boolean = false;
      
      ns_egret var _8082:Number;
      
      ns_egret var _8083:Number;
      
      private var _9740:NativeMenu;
      
      private var _7639:Boolean = false;
      
      private var _7630:Boolean = true;
      
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
      
      public function _1387()
      {
         this._8534 = _1112.fontFamily;
         this._size = _1112.size;
         this._8537 = _1112.textColor;
         super();
         this.ns_egret::_8529 = true;
         this.selectable = true;
      }
      
      override public function _7655(param1:String) : void
      {
         super._7655(param1);
         if(this.ns_egret::_8055)
         {
            return;
         }
         this.ns_egret::_8055 = true;
         this._2466();
         this.invalidateSize();
         this.invalidateDisplayList();
         if(!param1 || param1 == "size")
         {
            this._7636 = true;
            this._7638 = true;
         }
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         if(super.enabled == param1)
         {
            return;
         }
         super.enabled = param1;
         if(enabled)
         {
            if(this._8533 != this._8528)
            {
               this._8527 = true;
            }
            this._8533 = this._8528;
            if(this._7570 != this._7644)
            {
               this.editableChanged = true;
            }
            this._7570 = this._7644;
         }
         else
         {
            if(this._8533)
            {
               this._8527 = true;
            }
            this._8528 = this._8533;
            this._8533 = false;
            if(this.editable)
            {
               this.editableChanged = true;
            }
            this._7644 = this._7570;
            this._7570 = false;
         }
         _2466();
      }
      
      public function get fontFamily() : String
      {
         var _loc1_:Object = this._7646;
         if(Boolean(_loc1_) && _loc1_["fontFamily"] !== undefined)
         {
            return _loc1_["fontFamily"];
         }
         return this._8534;
      }
      
      public function set fontFamily(param1:String) : void
      {
         setStyle("fontFamily",param1);
      }
      
      public function get size() : uint
      {
         var _loc1_:Object = this._7646;
         if(Boolean(_loc1_) && _loc1_["size"] !== undefined)
         {
            return _loc1_["size"];
         }
         return this._size;
      }
      
      public function set size(param1:uint) : void
      {
         setStyle("size",param1);
      }
      
      public function get bold() : Boolean
      {
         var _loc1_:Object = this._7646;
         if(Boolean(_loc1_) && _loc1_["bold"] !== undefined)
         {
            return _loc1_["bold"];
         }
         return this._8541;
      }
      
      public function set bold(param1:Boolean) : void
      {
         setStyle("bold",param1);
      }
      
      public function get italic() : Boolean
      {
         var _loc1_:Object = this._7646;
         if(Boolean(_loc1_) && _loc1_["italic"] !== undefined)
         {
            return _loc1_["italic"];
         }
         return this._8540;
      }
      
      public function set italic(param1:Boolean) : void
      {
         setStyle("italic",param1);
      }
      
      public function get textAlign() : String
      {
         var _loc1_:Object = this._7646;
         if(Boolean(_loc1_) && _loc1_["textAlign"] !== undefined)
         {
            return _loc1_["textAlign"];
         }
         return this._8536;
      }
      
      public function set textAlign(param1:String) : void
      {
         setStyle("textAlign",param1);
      }
      
      public function get leading() : int
      {
         return this._8539;
      }
      
      public function set leading(param1:int) : void
      {
         if(this._8539 == param1)
         {
            return;
         }
         this._8539 = param1;
         if(this._7027)
         {
            this._7027.leading = this.ns_egret::_8081;
         }
         this.ns_egret::_8055 = true;
         _2466();
         invalidateSize();
         invalidateDisplayList();
         this._7636 = true;
      }
      
      ns_egret function get _8081() : int
      {
         return this._8539;
      }
      
      public function get textColor() : uint
      {
         var _loc1_:Object = this._7646;
         if(Boolean(_loc1_) && _loc1_["textColor"] !== undefined)
         {
            return _loc1_["textColor"];
         }
         return this._8537;
      }
      
      public function set textColor(param1:uint) : void
      {
         setStyle("textColor",param1);
      }
      
      public function get letterSpacing() : Number
      {
         return this._8531;
      }
      
      public function set letterSpacing(param1:Number) : void
      {
         if(this._8531 == param1)
         {
            return;
         }
         this._8531 = param1;
         this.ns_egret::_8055 = true;
         _2466();
         invalidateSize();
         invalidateDisplayList();
      }
      
      public function _8052(param1:_1101) : void
      {
         this.fontFamily = param1.fontFamily;
         this.size = param1.size;
         this.textColor = param1.textColor;
         this.bold = param1.bold;
         this.italic = param1.italic;
         this.textAlign = param1.textAlign;
         this.leading = param1.leading;
         this.letterSpacing = param1.letterSpacing;
      }
      
      public function get selectable() : Boolean
      {
         if(enabled)
         {
            return this._8533;
         }
         return this._8528;
      }
      
      public function set selectable(param1:Boolean) : void
      {
         if(param1 == this.selectable)
         {
            return;
         }
         if(enabled)
         {
            this._8533 = param1;
            this._8527 = true;
            _2466();
         }
         else
         {
            this._8528 = param1;
         }
      }
      
      public function get text() : String
      {
         return this.ns_egret::_text;
      }
      
      public function set text(param1:String) : void
      {
         if(param1 == null)
         {
            param1 = "";
         }
         this.ns_egret::_text = param1;
         if(this._7027)
         {
            this._7027.text = this.ns_egret::_text;
         }
         this.ns_egret::textChanged = true;
         _2466();
         invalidateSize();
         invalidateDisplayList();
      }
      
      public function get textHeight() : Number
      {
         this._8526();
         return this.ns_egret::_8082;
      }
      
      public function get textWidth() : Number
      {
         this._8526();
         return this.ns_egret::_8083;
      }
      
      private function _8526() : void
      {
         if(Boolean(ns_egret::_7680) || Boolean(ns_egret::_7701) || Boolean(ns_egret::_7674))
         {
            _2449();
         }
      }
      
      override protected function _2438() : void
      {
         super._2438();
         if(!this._7027)
         {
            this._8530();
         }
      }
      
      override protected function _2476() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         if(!this._7027)
         {
            this.editableChanged = true;
            this._7630 = true;
            this._7435 = true;
            this._7642 = true;
            this._7434 = true;
         }
         super._2476();
         if(!this._7027)
         {
            this._8530();
         }
         if(this._8527)
         {
            this._7027.selectable = this._8533;
            this._8527 = false;
         }
         if(this.ns_egret::_8055)
         {
            this._7027.fontFamily = this.fontFamily;
            this._7027.fontSize = this.size;
            this._7027.bold = this.bold;
            this._7027.italic = this.italic;
            this._7027.align = this.textAlign;
            this._7027.leading = this.leading;
            this._7027.letterSpacing = this.letterSpacing;
            this._7027._9741 = this.textColor;
            this._7027._9739 = this.textColor;
         }
         if(this.ns_egret::textChanged)
         {
            this._7641(true);
            this.ns_egret::textChanged = false;
         }
         if(this.editableChanged)
         {
            this._7027.editable = this._7570;
            this.editableChanged = false;
         }
         if(this._7630)
         {
            this._7027.displayAsPassword = this._7639;
            this._7630 = false;
         }
         if(this._7435)
         {
            this._7027.maxChars = this._7445;
            this._7435 = false;
         }
         if(this._7642)
         {
            this._7027.multiline = this._7658;
            this._7027.wordWrap = this._7658;
            this._7642 = false;
         }
         if(this._7434)
         {
            this._7027.restrict = this._7444;
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
               if(this._7027.length > 0)
               {
                  _loc2_ = this._7027._9737;
               }
               else
               {
                  _loc2_ = this._7027._9737;
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
               this._7656 = this.size * _loc3_ + 5;
            }
         }
      }
      
      override public function _2581() : void
      {
         if(Boolean(this._7027) && Boolean(stage))
         {
            stage.focus = this._7027;
         }
      }
      
      private function _8530() : void
      {
         if(!this._7027)
         {
            this._7022();
            this._7027.text = this.ns_egret::_text;
            this._7027.leading = this.ns_egret::_8081;
            this._8527 = true;
            this.ns_egret::textChanged = true;
            this.ns_egret::_8055 = true;
            _2466();
         }
      }
      
      protected function _7022() : void
      {
         this._7027 = new _1420();
         if(this._9740)
         {
            this._7027.contextMenu = this._9740;
         }
         this._7027.selectable = this.selectable;
         this._7027._9738 = 1;
         this._7027.addEventListener("textChanged",this.ns_egret::_8051);
         this._7027.addEventListener("widthChanged",this._8523);
         this._7027.addEventListener("heightChanged",this._8523);
         ns_egret::_1607(this._7027);
         this._7027.editable = this._7570;
         this._7027.multiline = this._7658;
         this._7027.wordWrap = this._7658;
         this._7027.addEventListener(Event.CHANGE,this._7633);
         this._7027.addEventListener(Event.SCROLL,this._7632);
         this._7027.addEventListener(TextEvent.TEXT_INPUT,this._7627);
         if(this._7634)
         {
            this._7027.scrollH = this._7629;
            this._7027.scrollV = this._7631(this._6805);
         }
      }
      
      override public function set contextMenu(param1:NativeMenu) : void
      {
         if(this._7027)
         {
            this._7027.contextMenu = param1;
         }
         else
         {
            this._9740 = param1;
         }
      }
      
      override public function get contextMenu() : NativeMenu
      {
         if(this._7027)
         {
            return this._7027.contextMenu;
         }
         return this._9740;
      }
      
      override protected function _7028() : void
      {
         measuredWidth = isNaN(this._7656) ? DEFAULT_MEASURED_WIDTH : this._7656;
         if(this._7445 != 0)
         {
            measuredWidth = Math.min(measuredWidth,this._7027.textWidth);
         }
         if(this._7658)
         {
            measuredHeight = isNaN(this._7652) ? DEFAULT_MEASURED_HEIGHT * 2 : this._7652;
         }
         else
         {
            measuredHeight = this._7027.textHeight;
         }
      }
      
      final ns_egret function _8058(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         var _loc5_:Number = NaN;
         this._7657 = true;
         var _loc3_:int = this._7027.scrollH;
         var _loc4_:int = this._7027.scrollV;
         super._5823(param1,param2);
         this._7027.x = 0;
         this._7027.y = 0;
         this._7027.width = param1;
         this._7027.height = param2;
         this.ns_egret::_8083 = this._7027.textWidth;
         this.ns_egret::_8082 = this._7027.textHeight;
         this._7640();
         this._7027.scrollH = _loc3_;
         this._7027.scrollV = _loc4_;
         this._7027.x = 0;
         this._7027.y = 0;
         if(this._7027.textHeight < param2)
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
            this._7027.y += Math.floor((param2 - this._7027.textHeight) * _loc5_);
         }
         this._7657 = false;
      }
      
      protected function _7641(param1:Boolean) : void
      {
         if(!param1)
         {
            this.ns_egret::_text = this._7027.text;
         }
         this.ns_egret::_8083 = this._7027.textWidth;
         this.ns_egret::_8082 = this._7027.textHeight;
      }
      
      ns_egret function _8051(param1:Event) : void
      {
         this._7641(false);
         invalidateSize();
         invalidateDisplayList();
      }
      
      private function _8523(param1:Event) : void
      {
         this._7641(true);
         invalidateSize();
         invalidateDisplayList();
      }
      
      private function _8524(param1:Event) : void
      {
         this._7641(true);
         invalidateSize();
         invalidateDisplayList();
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
            if(this._7027)
            {
               this._7027.scrollH = param1;
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
            if(this._7027)
            {
               this._7027.scrollV = this._7631(param1);
            }
            _7626("verticalScrollPosition",_loc2_,param1);
         }
      }
      
      private function _7631(param1:Number) : int
      {
         if(this._7027.numLines == 0)
         {
            return 0;
         }
         var _loc2_:Number = this._7027._9737 + this._7027.leading;
         if(this._7027.textHeight - height == param1)
         {
            return this._7027.maxScrollV;
         }
         return int((param1 + this._7027.leading) / _loc2_);
      }
      
      private function _7635(param1:int) : Number
      {
         if(param1 == 0 || this._7027.numLines == 0)
         {
            return 0;
         }
         var _loc2_:Number = this._7027._9737 + this._8539;
         if(param1 == this._7027.maxScrollV)
         {
            return this._7027.textHeight - height;
         }
         return _loc2_ * param1 - this._7027.leading;
      }
      
      public function _7624(param1:uint) : Number
      {
         var _loc2_:Number = 0;
         var _loc3_:Number = this._7654 - this._7629 - width;
         var _loc4_:Number = -this._7629;
         switch(param1)
         {
            case _1137.LEFT:
               _loc2_ = this._7629 <= 0 ? 0 : Math.max(_loc4_,-this.size);
               break;
            case _1137.RIGHT:
               _loc2_ = this._7629 + width >= this.contentWidth ? 0 : Math.min(_loc3_,this.size);
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
            param2 = this.text.length;
         }
         var _loc3_:int = this._7027.getLineIndexOfChar(param1);
         var _loc4_:int = this._7027.getLineIndexOfChar(Math.max(param2,0));
         var _loc5_:int = this._7027.scrollV;
         var _loc6_:int = this._7027.getLineIndexAtPoint(2,this._7027.height - 2);
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
         if(!this._7027)
         {
            return 0;
         }
         var _loc2_:int = this._7631(this._6805);
         var _loc3_:int = _loc2_ + param1;
         _loc3_ = Math.max(0,Math.min(this._7027.maxScrollV,_loc3_));
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
         if(this._7027)
         {
            if(param1)
            {
               this._7027.scrollH = this._7629;
               this._7027.scrollV = this._7631(this._6805);
               this._7640();
            }
            else
            {
               this._7027.scrollH = 0;
               this._7027.scrollV = 0;
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
      
      private function _7640() : void
      {
         if(!this.clipAndEnableScrolling)
         {
            return;
         }
         this._7645(this._7027.textWidth);
         var _loc1_:Number = 0;
         var _loc2_:int = this._7027.numLines;
         if(_loc2_ == 0)
         {
            _loc1_ = this._7027._9737;
         }
         else
         {
            _loc1_ = this._7027.textHeight;
         }
         this._7643(_loc1_);
      }
      
      public function get selectionBeginIndex() : int
      {
         _6040();
         if(this._7027)
         {
            return this._7027.selectionBeginIndex;
         }
         return 0;
      }
      
      public function get selectionEndIndex() : int
      {
         _6040();
         if(this._7027)
         {
            return this._7027.selectionEndIndex;
         }
         return 0;
      }
      
      public function get caretIndex() : int
      {
         _6040();
         if(this._7027)
         {
            return this._7027.caretIndex;
         }
         return 0;
      }
      
      public function setSelection(param1:int, param2:int) : void
      {
         _6040();
         if(this._7027)
         {
            this._7027.setSelection(param1,param2);
         }
      }
      
      public function selectAll() : void
      {
         _6040();
         if(this._7027)
         {
            this._7027.setSelection(0,this._7027.length);
         }
      }
      
      private function _7633(param1:Event) : void
      {
         this._7641(false);
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
         this.horizontalScrollPosition = this._7027.scrollH;
         this.verticalScrollPosition = this._7635(this._7027.scrollV);
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

