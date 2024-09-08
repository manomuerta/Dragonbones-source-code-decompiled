package _1088
{
   import egret.core._1112;
   import egret.core._1117;
   import egret.core._1140;
   import egret.core._1142;
   import egret.core.ns_egret;
   import flash.events.Event;
   import flash.text.AntiAliasType;
   import flash.text.TextFormat;
   import flash.text.TextLineMetrics;
   
   use namespace ns_egret;
   
   public class _1101 extends _1140 implements _1117
   {
      public static const DEFAULT_MEASURED_WIDTH:Number = 160;
      
      public static const DEFAULT_MEASURED_HEIGHT:Number = 22;
      
      protected var _7027:_1142;
      
      private var _8532:Boolean = false;
      
      private var condenseWhiteChanged:Boolean = false;
      
      ns_egret var _8055:Boolean = true;
      
      ns_egret var embedFonts:Boolean = false;
      
      private var _8534:String;
      
      private var _size:uint;
      
      private var _8541:Boolean = false;
      
      private var _8540:Boolean = false;
      
      private var _8535:Boolean = false;
      
      private var _8536:String = "left";
      
      private var _8539:int = 2;
      
      private var _8537:uint;
      
      private var _8531:Number = NaN;
      
      ns_egret var _7025:TextFormat;
      
      private var _8538:String = "";
      
      ns_egret var _8069:Boolean = false;
      
      ns_egret var _8065:String = null;
      
      private var _8528:Boolean = false;
      
      private var _8533:Boolean = false;
      
      private var _8527:Boolean;
      
      ns_egret var _text:String = "";
      
      ns_egret var textChanged:Boolean = false;
      
      ns_egret var _8082:Number;
      
      ns_egret var _8083:Number;
      
      public function _1101()
      {
         this._8534 = _1112.fontFamily;
         this._size = _1112.size;
         this._8537 = _1112.textColor;
         super();
         this.ns_egret::_8529 = true;
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
      }
      
      public function get condenseWhite() : Boolean
      {
         return this._8532;
      }
      
      public function set condenseWhite(param1:Boolean) : void
      {
         if(param1 == this._8532)
         {
            return;
         }
         this._8532 = param1;
         this.condenseWhiteChanged = true;
         if(this.ns_egret::_8088)
         {
            this.ns_egret::_8069 = true;
         }
         _2466();
         invalidateSize();
         invalidateDisplayList();
         dispatchEvent(new Event("condenseWhiteChanged"));
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
         }
         else
         {
            if(this._8533)
            {
               this._8527 = true;
            }
            this._8528 = this._8533;
            this._8533 = false;
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
      
      public function get underline() : Boolean
      {
         return this._8535;
      }
      
      public function set underline(param1:Boolean) : void
      {
         if(this._8535 == param1)
         {
            return;
         }
         this._8535 = param1;
         this.ns_egret::_8055 = true;
         _2466();
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
            this._7027.ns_egret::leading = this.ns_egret::_8081;
         }
         this.ns_egret::_8055 = true;
         _2466();
         invalidateSize();
         invalidateDisplayList();
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
      
      protected function get defaultTextFormat() : TextFormat
      {
         if(this.ns_egret::_8055)
         {
            this.ns_egret::_7025 = this._8054();
            this.ns_egret::_8055 = false;
         }
         return this.ns_egret::_7025;
      }
      
      ns_egret function _8525() : void
      {
         if(this.ns_egret::_8055)
         {
            this._7027.ns_egret::_8073(this.defaultTextFormat);
            this._7027.defaultTextFormat = this.defaultTextFormat;
         }
      }
      
      public function _8052(param1:_1101) : void
      {
         this.fontFamily = param1.fontFamily;
         this.size = param1.size;
         this.textColor = param1.textColor;
         this.bold = param1.bold;
         this.italic = param1.italic;
         this.underline = param1.underline;
         this.textAlign = param1.textAlign;
         this.leading = param1.leading;
         this.letterSpacing = param1.letterSpacing;
      }
      
      public function _8054() : TextFormat
      {
         var _loc1_:TextFormat = new TextFormat(this.fontFamily,this.size,this.textColor,this.bold,this.italic,this._8535,"","",this.textAlign,0,0,0,this._8539);
         if(!isNaN(this.letterSpacing))
         {
            _loc1_.kerning = true;
            _loc1_.letterSpacing = this.letterSpacing;
         }
         else
         {
            _loc1_.kerning = false;
            _loc1_.letterSpacing = null;
         }
         return _loc1_;
      }
      
      public function get htmlText() : String
      {
         return this._8538;
      }
      
      public function set htmlText(param1:String) : void
      {
         if(!param1)
         {
            param1 = "";
         }
         if(this.ns_egret::_8088 && param1 == this.ns_egret::_8065)
         {
            return;
         }
         this._8538 = param1;
         if(this._7027)
         {
            this._7027.ns_egret::_8085 = this._8538;
         }
         this.ns_egret::_8069 = true;
         this.ns_egret::_text = null;
         this.ns_egret::_8065 = param1;
         _2466();
         invalidateSize();
         invalidateDisplayList();
      }
      
      ns_egret function get _8088() : Boolean
      {
         return Boolean(this.ns_egret::_8065);
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
         if(!this.ns_egret::_8088 && param1 == this.ns_egret::_text)
         {
            return;
         }
         this.ns_egret::_text = param1;
         if(this._7027)
         {
            this._7027.ns_egret::_7660 = this.ns_egret::_text;
         }
         this.ns_egret::textChanged = true;
         this._8538 = null;
         this.ns_egret::_8065 = null;
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
         super._2476();
         if(!this._7027)
         {
            this._8530();
         }
         if(this.condenseWhiteChanged)
         {
            this._7027.condenseWhite = this._8532;
            this.condenseWhiteChanged = false;
         }
         if(this._8527)
         {
            this._7027.selectable = this._8533;
            this._8527 = false;
         }
         if(this.ns_egret::_8055)
         {
            this._7027.ns_egret::_8073(this.defaultTextFormat);
            this._7027.defaultTextFormat = this.defaultTextFormat;
            this._7027.embedFonts = this.ns_egret::embedFonts;
            if(this.ns_egret::_8088)
            {
               this._7027.ns_egret::_8085 = this.ns_egret::_8065;
            }
         }
         if(this.ns_egret::textChanged || this.ns_egret::_8069)
         {
            this._7641(true);
            this.ns_egret::textChanged = false;
            this.ns_egret::_8069 = false;
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
            if(this.ns_egret::_8088)
            {
               this._7027.ns_egret::_8085 = this.ns_egret::_8065;
            }
            else
            {
               this._7027.ns_egret::_7660 = this.ns_egret::_text;
            }
            this._7027.ns_egret::leading = this.ns_egret::_8081;
            this.condenseWhiteChanged = true;
            this._8527 = true;
            this.ns_egret::textChanged = true;
            this.ns_egret::_8055 = true;
            _2466();
         }
      }
      
      protected function _7022() : void
      {
         this._7027 = new _1142();
         this._7027.selectable = this.selectable;
         this._7027.mouseWheelEnabled = false;
         this._7027.antiAliasType = AntiAliasType.ADVANCED;
         this._7027.addEventListener("textChanged",this.ns_egret::_8051);
         this._7027.addEventListener("widthChanged",this._8523);
         this._7027.addEventListener("heightChanged",this._8523);
         this._7027.addEventListener("textFormatChanged",this._8524);
         ns_egret::_1607(this._7027);
      }
      
      override protected function _7028() : void
      {
         super._7028();
         measuredWidth = DEFAULT_MEASURED_WIDTH;
         measuredHeight = DEFAULT_MEASURED_HEIGHT;
      }
      
      final ns_egret function _8058(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         this._7027.x = 0;
         this._7027.y = 0;
         this._7027.ns_egret::_8087 = param1;
         this._7027.ns_egret::_8086 = param2;
         this.ns_egret::_8083 = this._7027.textWidth;
         this.ns_egret::_8082 = this._7027.textHeight;
      }
      
      public function getLineMetrics(param1:int) : TextLineMetrics
      {
         this._8526();
         return !!this._7027 ? this._7027.getLineMetrics(param1) : null;
      }
      
      protected function _7641(param1:Boolean) : void
      {
         if(!param1)
         {
            this.ns_egret::_text = this._7027.text;
         }
         this._8538 = this._7027.htmlText;
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
   }
}

