package _872
{
   import _1045.Group;
   import _1045._1082;
   import egret.core._1112;
   import egret.core._1142;
   import egret.core.ns_egret;
   import flash.text.TextFormat;
   
   use namespace ns_egret;
   
   public class _1005 extends Group
   {
      public static var maxSize:Number = 300;
      
      private var _7027:_1142;
      
      private var rect:_1082;
      
      private var defaultTextFormat:TextFormat;
      
      private var _7025:TextFormat;
      
      private var _backgroundColor:uint = 0;
      
      private var _7026:String;
      
      private var _color:uint = 16777215;
      
      private var _7021:Number = 1;
      
      private var _7024:Number = 1;
      
      private var _7020:Boolean;
      
      private var _7019:Boolean;
      
      private var _7018:Boolean;
      
      private var _2028:Boolean;
      
      private var textChanged:Boolean;
      
      private var textFormatChanged:Boolean;
      
      public function _1005()
      {
         this._7027 = new _1142();
         this.rect = new _1082();
         this.defaultTextFormat = new TextFormat(_1112.fontFamily,14,16777215);
         super();
         mouseEnabled = false;
         mouseChildren = true;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.drawRect();
         addElement(this.rect);
         this._7022();
         ns_egret::_1607(this._7027);
      }
      
      override protected function _7028() : void
      {
         var _loc2_:Number = NaN;
         super._7028();
         var _loc1_:Number = 10;
         _loc2_ = 10;
         this._7027.wordWrap = false;
         if(this._7027.textWidth + _loc1_ > this._7027.width)
         {
            this._7027.width = this._7027.textWidth + _loc1_ * 2;
         }
         if(this._7027.textHeight + _loc2_ > this._7027.height)
         {
            this._7027.height = this._7027.textHeight + _loc2_;
         }
         if(this._7027.textWidth + _loc1_ > maxSize)
         {
            this._7027.width = maxSize - _loc1_;
            this._7027.wordWrap = true;
         }
         measuredWidth = this._7027.textWidth + _loc1_;
         measuredHeight = this._7027.textHeight + _loc2_;
      }
      
      private function _7023() : void
      {
         var _loc3_:int = 0;
         var _loc1_:Number = this._7027.textWidth + 10;
         var _loc2_:Number = this._7027.textHeight + 10;
         if(_loc1_ > maxSize)
         {
            _loc3_ = Math.ceil(_loc1_ / maxSize);
            _loc1_ = maxSize - 10;
            _loc2_ = this._7027.textHeight * _loc3_ + 10;
            this._7027.wordWrap = true;
         }
         this.width = _loc1_;
         this.height = _loc2_;
         this._7027.width = this.width - 10;
         this._7027.height = this.height - 10;
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         this._7022();
         this._7023();
         this.drawRect();
      }
      
      private function _7022() : void
      {
         this._7027.text = this.showText;
         this.defaultTextFormat.color = this.color;
         if(this.textFormat)
         {
            if(this.textFormat.align)
            {
               this.defaultTextFormat.align = this.textFormat.align;
            }
            if(this.textFormat.blockIndent)
            {
               this.defaultTextFormat.blockIndent = this.textFormat.blockIndent;
            }
            if(this.textFormat.bold)
            {
               this.defaultTextFormat.bold = this.textFormat.bold;
            }
            if(this.textFormat.bullet)
            {
               this.defaultTextFormat.bullet = this.textFormat.bullet;
            }
            if(this.textFormat.color)
            {
               this.defaultTextFormat.color = this.textFormat.color;
            }
            if(this.textFormat.display)
            {
               this.defaultTextFormat.display = this.textFormat.display;
            }
            if(this.textFormat.font)
            {
               this.defaultTextFormat.font = this.textFormat.font;
            }
            if(this.textFormat.indent)
            {
               this.defaultTextFormat.indent = this.textFormat.indent;
            }
            if(this.textFormat.italic)
            {
               this.defaultTextFormat.italic = this.textFormat.italic;
            }
            if(this.textFormat.kerning)
            {
               this.defaultTextFormat.kerning = this.textFormat.kerning;
            }
            if(this.textFormat.leading)
            {
               this.defaultTextFormat.leading = this.textFormat.leading;
            }
            if(this.textFormat.leftMargin)
            {
               this.defaultTextFormat.leftMargin = this.textFormat.leftMargin;
            }
            if(this.textFormat.letterSpacing)
            {
               this.defaultTextFormat.letterSpacing = this.textFormat.letterSpacing;
            }
            if(this.textFormat.rightMargin)
            {
               this.defaultTextFormat.rightMargin = this.textFormat.rightMargin;
            }
            if(this.textFormat.size)
            {
               this.defaultTextFormat.size = this.textFormat.size;
            }
            if(this.textFormat.tabStops)
            {
               this.defaultTextFormat.tabStops = this.textFormat.tabStops;
            }
            if(this.textFormat.target)
            {
               this.defaultTextFormat.target = this.textFormat.target;
            }
            if(this.textFormat.underline)
            {
               this.defaultTextFormat.underline = this.textFormat.underline;
            }
            if(this.textFormat.url)
            {
               this.defaultTextFormat.url = this.textFormat.url;
            }
         }
         this._7027.defaultTextFormat = this.defaultTextFormat;
         this._7027.mouseEnabled = true;
         this._7027.alpha = this._5477;
         this._7027.multiline = true;
         this._7027.selectable = false;
         this._7027.wordWrap = false;
         this._7027.x = 5;
         this._7027.y = 5;
      }
      
      private function drawRect() : void
      {
         this.rect.fillColor = 0;
         this.rect.alpha = this._5468;
         this.rect.width = this.width;
         this.rect.height = this.height;
         this.rect.x = 0;
         this.rect.y = 0;
         this.rect.radius = 5;
      }
      
      public function get textFormat() : TextFormat
      {
         return this._7025;
      }
      
      public function set textFormat(param1:TextFormat) : void
      {
         if(this.textFormat != param1)
         {
            this.textFormatChanged = true;
         }
         this._7025 = param1;
         _2466();
      }
      
      public function get backgroundColor() : uint
      {
         return this._backgroundColor;
      }
      
      public function set backgroundColor(param1:uint) : void
      {
         if(this.backgroundColor != param1)
         {
            this._7018 = true;
         }
         this._backgroundColor = param1;
         _2466();
      }
      
      public function get showText() : String
      {
         return this._7026;
      }
      
      public function set showText(param1:String) : void
      {
         if(this.showText != param1)
         {
            this.textChanged = true;
         }
         this._7026 = param1;
         _2466();
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function set color(param1:uint) : void
      {
         if(param1 != this.color)
         {
            this._2028 = true;
         }
         this._color = param1;
         _2466();
      }
      
      public function get _5468() : Number
      {
         return this._7021;
      }
      
      public function set _5468(param1:Number) : void
      {
         if(param1 != this._5468)
         {
            this._7019 = true;
         }
         this._7021 = param1;
         _2466();
      }
      
      public function get _5477() : Number
      {
         return this._7024;
      }
      
      public function set _5477(param1:Number) : void
      {
         if(param1 != this._5477)
         {
            this._7020 = true;
         }
         this._7024 = param1;
         _2466();
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this._2028)
         {
            invalidateDisplayList();
            this._2028 = false;
         }
         if(this.textChanged)
         {
            invalidateSize();
            invalidateDisplayList();
            this.textChanged = false;
         }
         if(this.textFormatChanged)
         {
            invalidateSize();
            invalidateDisplayList();
            this.textFormatChanged = false;
         }
         if(this._7018)
         {
            invalidateDisplayList();
            this._7018 = false;
         }
         if(this._7019)
         {
            invalidateDisplayList();
            this._7019 = false;
         }
         if(this._7020)
         {
            invalidateDisplayList();
            this._7020 = false;
         }
      }
   }
}

