package _1045
{
   import _1088._1101;
   import _1177.UIEvent;
   import _1185._1196;
   import egret.core._1112;
   import egret.core.ns_egret;
   import flash.events.Event;
   import flash.system.Capabilities;
   import flash.text.Font;
   import flash.text.TextFormat;
   import flash.text.TextLineMetrics;
   import flash.utils.Dictionary;
   
   use namespace ns_egret;
   
   public class Label extends _1101
   {
      public static var _8059:Boolean = false;
      
      private var _8077:Number = 2;
      
      private var _8084:Boolean = false;
      
      private var _7650:String = "top";
      
      private var _8057:int = 0;
      
      private var _8062:Number = NaN;
      
      private var _padding:Number = 0;
      
      private var _8023:Number = NaN;
      
      private var _8022:Number = NaN;
      
      private var _8024:Number = NaN;
      
      private var _8021:Number = NaN;
      
      private var _8074:Dictionary;
      
      private var _8060:Boolean = false;
      
      private var _8078:Boolean = false;
      
      private var _8075:Boolean = true;
      
      public function Label()
      {
         super();
         addEventListener(UIEvent.UPDATE_COMPLETE,this._8053);
         if(_1112._8071)
         {
            this.fontFamily = _1112._8071;
         }
         cacheAsBitmap = true;
         if(Capabilities.manufacturer == "Adobe Macintosh")
         {
            this.addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
            this.addEventListener(Event.REMOVED_FROM_STAGE,this._8064);
         }
      }
      
      private static function _8068(param1:TextFormat) : TextFormat
      {
         return new TextFormat(param1.font,param1.size,param1.color,param1.bold,param1.italic,param1.underline,param1.url,param1.target,param1.align,param1.leftMargin,param1.rightMargin,param1.indent,param1.leading);
      }
      
      private function _8064(param1:Event) : void
      {
         stage.removeEventListener(UIEvent.SCREEN_DPI_CHANGED,this._8056);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         stage.addEventListener(UIEvent.SCREEN_DPI_CHANGED,this._8056);
         this._8056();
      }
      
      private function _8056(param1:Event = null) : void
      {
         if(this._8077 == stage.contentsScaleFactor)
         {
            return;
         }
         this._8077 = stage.contentsScaleFactor;
         if(this._8077 == 1)
         {
            cacheAsBitmap = false;
         }
         else
         {
            cacheAsBitmap = true;
         }
      }
      
      override public function set fontFamily(param1:String) : void
      {
         var _loc3_:Font = null;
         if(fontFamily == param1)
         {
            return;
         }
         var _loc2_:Array = Font.enumerateFonts(false);
         ns_egret::embedFonts = false;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.fontName == param1)
            {
               ns_egret::embedFonts = true;
               break;
            }
         }
         if(!ns_egret::embedFonts && _8059)
         {
            return;
         }
         super.fontFamily = param1;
      }
      
      override public function set toolTip(param1:Object) : void
      {
         super.toolTip = param1;
         this._8084 = param1 != null;
      }
      
      private function _8053(param1:UIEvent) : void
      {
         this._8062 = NaN;
      }
      
      override public function _7655(param1:String) : void
      {
         super._7655(param1);
         if(!param1 || param1 == "verticalAlign")
         {
            if(_7027)
            {
               _7027.ns_egret::leading = this.ns_egret::_8081;
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
      
      override ns_egret function get _8081() : int
      {
         return this.verticalAlign == _1196.JUSTIFY ? 0 : leading;
      }
      
      override protected function get defaultTextFormat() : TextFormat
      {
         if(ns_egret::_8055)
         {
            ns_egret::_7025 = _8054();
            if(this.verticalAlign == _1196.JUSTIFY)
            {
               ns_egret::_7025.leading = 0;
            }
            ns_egret::_8055 = false;
         }
         return ns_egret::_7025;
      }
      
      override public function _8052(param1:_1101) : void
      {
         super._8052(param1);
         if(param1 is Label)
         {
            this.verticalAlign = (param1 as Label).verticalAlign;
         }
      }
      
      public function get _6080() : int
      {
         return this._8057;
      }
      
      public function set _6080(param1:int) : void
      {
         if(this._8057 == param1)
         {
            return;
         }
         this._8057 = param1;
         invalidateSize();
         invalidateDisplayList();
      }
      
      override public function set text(param1:String) : void
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(!ns_egret::_8088 && param1 == ns_egret::_text)
         {
            return;
         }
         super.text = param1;
         this._8074 = null;
      }
      
      override public function set htmlText(param1:String) : void
      {
         if(!param1)
         {
            param1 = "";
         }
         if(Boolean(ns_egret::_8088) && param1 == ns_egret::_8065)
         {
            return;
         }
         super.htmlText = param1;
         this._8074 = null;
      }
      
      public function get padding() : Number
      {
         return this._padding;
      }
      
      public function set padding(param1:Number) : void
      {
         if(this._padding == param1)
         {
            return;
         }
         this._padding = param1;
         invalidateSize();
         invalidateDisplayList();
      }
      
      public function get _2419() : Number
      {
         return this._8023;
      }
      
      public function set _2419(param1:Number) : void
      {
         if(this._8023 == param1)
         {
            return;
         }
         this._8023 = param1;
         invalidateSize();
         invalidateDisplayList();
      }
      
      public function get _2416() : Number
      {
         return this._8022;
      }
      
      public function set _2416(param1:Number) : void
      {
         if(this._8022 == param1)
         {
            return;
         }
         this._8022 = param1;
         invalidateSize();
         invalidateDisplayList();
      }
      
      public function get _2420() : Number
      {
         return this._8024;
      }
      
      public function set _2420(param1:Number) : void
      {
         if(this._8024 == param1)
         {
            return;
         }
         this._8024 = param1;
         invalidateSize();
         invalidateDisplayList();
      }
      
      public function get _2410() : Number
      {
         return this._8021;
      }
      
      public function set _2410(param1:Number) : void
      {
         if(this._8021 == param1)
         {
            return;
         }
         this._8021 = param1;
         invalidateSize();
         invalidateDisplayList();
      }
      
      override protected function _2476() : void
      {
         var _loc1_:Boolean = Boolean(ns_egret::_8055) || Boolean(ns_egret::textChanged) || Boolean(ns_egret::_8069);
         this._8060 = _loc1_ || this._8060;
         super._2476();
         if(this._8060)
         {
            if(!_loc1_)
            {
               _7027.ns_egret::_8073(this.defaultTextFormat);
            }
            this._8066();
            this._8060 = false;
         }
      }
      
      override protected function _7028() : void
      {
         var _loc1_:Number = NaN;
         if(ns_egret::_7680)
         {
            _6040();
         }
         if(this._8076())
         {
            if(!isNaN(this._8062))
            {
               this._8063(this._8062);
               return;
            }
            ns_egret::_8072 = NaN;
            ns_egret::_8070 = NaN;
         }
         if(!isNaN(explicitWidth))
         {
            _loc1_ = explicitWidth;
         }
         else if(maxWidth != 10000)
         {
            _loc1_ = maxWidth;
         }
         this._8063(_loc1_);
      }
      
      private function _8076() : Boolean
      {
         return this._8057 != 1 && (!isNaN(percentWidth) || !isNaN(left) && !isNaN(right)) && isNaN(explicitHeight) && isNaN(percentHeight);
      }
      
      private function _8063(param1:Number) : void
      {
         var _loc8_:Boolean = false;
         var _loc9_:TextLineMetrics = null;
         var _loc2_:String = _7027.text;
         if(this._8078 || Boolean(ns_egret::textChanged) || Boolean(ns_egret::_8069))
         {
            if(ns_egret::_8088)
            {
               _7027.ns_egret::_8085 = ns_egret::_8065;
            }
            else
            {
               _7027.ns_egret::_7660 = ns_egret::_text;
            }
            this._8066();
         }
         var _loc3_:Number = isNaN(this._padding) ? 0 : this._padding;
         var _loc4_:Number = isNaN(this._8023) ? _loc3_ : this._8023;
         var _loc5_:Number = isNaN(this._8022) ? _loc3_ : this._8022;
         var _loc6_:Number = isNaN(this._8024) ? _loc3_ : this._8024;
         var _loc7_:Number = isNaN(this._8021) ? _loc3_ : this._8021;
         _7027.autoSize = "left";
         _7027.wordWrap = this._8057 != 1;
         if(!isNaN(param1))
         {
            _7027.ns_egret::_8087 = param1 - _loc4_ - _loc5_;
            measuredWidth = Math.ceil(_7027.textWidth);
            measuredHeight = Math.ceil(_7027.textHeight);
         }
         else
         {
            _loc8_ = _7027.wordWrap;
            _7027.wordWrap = false;
            measuredWidth = Math.ceil(_7027.textWidth);
            measuredHeight = Math.ceil(_7027.textHeight);
            _7027.wordWrap = _loc8_;
         }
         _7027.autoSize = "none";
         if(this._8057 > 0 && _7027.numLines > this._8057)
         {
            _loc9_ = _7027.getLineMetrics(0);
            measuredHeight = _loc9_.height * this._8057 - _loc9_.leading + 4;
         }
         measuredWidth += _loc4_ + _loc5_;
         measuredHeight += _loc6_ + _loc7_;
         if(this._8078)
         {
            _7027.ns_egret::_7660 = _loc2_;
            this._8066();
         }
      }
      
      public function _8067(param1:TextFormat, param2:int = -1, param3:int = -1) : void
      {
         if(!this._8074)
         {
            this._8074 = new Dictionary();
         }
         if(!this._8074[param2])
         {
            this._8074[param2] = new Dictionary();
         }
         this._8074[param2][param3] = _8068(param1);
         this._8060 = true;
         _2466();
         invalidateSize();
         invalidateDisplayList();
      }
      
      private function _8066(param1:Object = null) : void
      {
         var _loc3_:* = undefined;
         var _loc4_:Dictionary = null;
         var _loc5_:* = undefined;
         var _loc6_:Object = null;
         var _loc7_:int = 0;
         this._8060 = false;
         if(!this._8074 || !_7027 || !ns_egret::_text)
         {
            return;
         }
         var _loc2_:Boolean = Boolean(param1 != null);
         for(_loc3_ in this._8074)
         {
            _loc4_ = this._8074[_loc3_] as Dictionary;
            if(_loc4_)
            {
               for(_loc5_ in _loc4_)
               {
                  if(_loc4_[_loc5_])
                  {
                     if(_loc2_)
                     {
                        _loc6_ = (_loc4_[_loc5_] as TextFormat).leading;
                        (_loc4_[_loc5_] as TextFormat).leading = param1;
                     }
                     _loc7_ = _loc5_;
                     if(_loc7_ > _7027.text.length)
                     {
                        _loc7_ = _7027.text.length;
                     }
                     try
                     {
                        _7027.ns_egret::_8073(_loc4_[_loc5_],_loc3_,_loc7_);
                     }
                     catch(e:Error)
                     {
                     }
                     if(_loc2_)
                     {
                        (_loc4_[_loc5_] as TextFormat).leading = _loc6_;
                     }
                  }
               }
            }
         }
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         var _loc9_:Boolean = false;
         var _loc10_:TextLineMetrics = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         ns_egret::_8058(param1,param2);
         var _loc3_:Number = isNaN(this._padding) ? 0 : this._padding;
         var _loc4_:Number = isNaN(this._8023) ? _loc3_ : this._8023;
         var _loc5_:Number = isNaN(this._8022) ? _loc3_ : this._8022;
         var _loc6_:Number = isNaN(this._8024) ? _loc3_ : this._8024;
         var _loc7_:Number = isNaN(this._8021) ? _loc3_ : this._8021;
         _7027.x = _loc4_;
         _7027.y = _loc6_;
         if(this._8076())
         {
            _loc9_ = isNaN(this._8062) || this._8062 != param1;
            this._8062 = param1;
            if(_loc9_)
            {
               ns_egret::_8072 = NaN;
               ns_egret::_8070 = NaN;
               invalidateSize();
               return;
            }
         }
         if(ns_egret::_7701)
         {
            _8079();
         }
         if(!_7027.visible)
         {
            _7027.visible = true;
         }
         if(this._8078)
         {
            _7027.ns_egret::_7660 = ns_egret::_text;
            this._8066();
         }
         _7027.scrollH = 0;
         _7027.scrollV = 1;
         _7027.ns_egret::_8087 = param1 - _loc4_ - _loc5_;
         var _loc8_:Number = param2 - _loc6_ - _loc7_;
         _7027.ns_egret::_8086 = _loc8_;
         if(this._8057 == 1)
         {
            _7027.wordWrap = false;
         }
         else if(Math.floor(width) < Math.floor(measuredWidth))
         {
            _7027.wordWrap = true;
         }
         ns_egret::_8083 = _7027.textWidth;
         ns_egret::_8082 = _7027.textHeight;
         if(this._8057 > 0 && _7027.numLines > this._8057)
         {
            _loc10_ = _7027.getLineMetrics(0);
            _loc11_ = _loc10_.height * this._8057 - _loc10_.leading + 4;
            _7027.ns_egret::_8086 = Math.min(_loc8_,_loc11_);
         }
         if(this.verticalAlign == _1196.JUSTIFY)
         {
            _7027.ns_egret::_8073(this.defaultTextFormat);
            this._8066(0);
         }
         if(this._8075)
         {
            this._8078 = this._8061();
            if(!this._8084)
            {
               super.toolTip = this._8078 ? ns_egret::_text : null;
            }
         }
         if(_7027.textHeight >= _loc8_)
         {
            return;
         }
         if(this.verticalAlign == _1196.JUSTIFY)
         {
            if(_7027.numLines > 1)
            {
               _7027.ns_egret::_8086 = _loc8_;
               _loc12_ = Math.max(0,_loc8_ - 4 - _7027.textHeight);
               this.defaultTextFormat.leading = Math.floor(_loc12_ / (_7027.numLines - 1));
               _7027.ns_egret::_8073(this.defaultTextFormat);
               this._8066(this.defaultTextFormat.leading);
               this.defaultTextFormat.leading = 0;
            }
         }
         else
         {
            _loc13_ = 0;
            if(this.verticalAlign == _1196.MIDDLE)
            {
               _loc13_ = 0.5;
            }
            else if(this.verticalAlign == _1196.BOTTOM)
            {
               _loc13_ = 1;
            }
            _7027.y += Math.floor((_loc8_ - _7027.textHeight) * _loc13_);
            _7027.ns_egret::_8086 = _loc8_ - _7027.y;
         }
      }
      
      public function get _8080() : Boolean
      {
         return this._8078;
      }
      
      public function get _6541() : Boolean
      {
         return this._8075;
      }
      
      public function set _6541(param1:Boolean) : void
      {
         if(this._8075 == param1)
         {
            return;
         }
         this._8075 = param1;
         invalidateDisplayList();
      }
      
      private function _8061() : Boolean
      {
         var truncationIndicator:String;
         var originalText:String;
         var expLeading:Object;
         var lineM:TextLineMetrics = null;
         var realTextHeight:Number = NaN;
         var lastLineIndex:int = 0;
         var offset:int = 0;
         if(ns_egret::_8088)
         {
            return false;
         }
         truncationIndicator = "...";
         originalText = text;
         expLeading = this.verticalAlign == _1196.JUSTIFY ? 0 : null;
         try
         {
            lineM = _7027.getLineMetrics(0);
            realTextHeight = _7027.height - 4 + _7027.ns_egret::leading;
            lastLineIndex = int(realTextHeight / lineM.height);
         }
         catch(e:Error)
         {
            lastLineIndex = 1;
         }
         if(lastLineIndex < 1)
         {
            lastLineIndex = 1;
         }
         if(_7027.numLines > lastLineIndex && _7027.textHeight > _7027.height)
         {
            offset = _7027.getLineOffset(lastLineIndex);
            originalText = originalText.substr(0,offset);
            _7027.ns_egret::_7660 = originalText + truncationIndicator;
            this._8066(expLeading);
            while(originalText.length > 1 && _7027.numLines > lastLineIndex)
            {
               originalText = originalText.slice(0,-1);
               _7027.ns_egret::_7660 = originalText + truncationIndicator;
               this._8066(expLeading);
            }
            return true;
         }
         return false;
      }
      
      override protected function _7022() : void
      {
         super._7022();
         _7027.wordWrap = true;
         _7027.multiline = true;
         _7027.visible = false;
         _7027.mouseWheelEnabled = false;
      }
      
      override ns_egret function _8051(param1:Event) : void
      {
         super.ns_egret::_8051(param1);
         this._8074 = null;
      }
   }
}

