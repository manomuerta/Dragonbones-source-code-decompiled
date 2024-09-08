package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.SWFRectangle;
   import com.codeazur.utils.StringUtils;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class TagDefineEditText implements IDefinitionTag
   {
      public static const TYPE:uint = 37;
      
      public static var _15081:TextField = new TextField();
      
      public var bounds:SWFRectangle;
      
      public var variableName:String;
      
      public var hasText:Boolean;
      
      public var wordWrap:Boolean;
      
      public var multiline:Boolean;
      
      public var password:Boolean;
      
      public var readOnly:Boolean;
      
      public var hasTextColor:Boolean;
      
      public var hasMaxLength:Boolean;
      
      public var hasFont:Boolean;
      
      public var hasFontClass:Boolean;
      
      public var autoSize:Boolean;
      
      public var hasLayout:Boolean;
      
      public var noSelect:Boolean;
      
      public var border:Boolean;
      
      public var wasStatic:Boolean;
      
      public var html:Boolean;
      
      public var useOutlines:Boolean;
      
      public var fontId:uint;
      
      public var fontClass:String;
      
      public var fontHeight:uint;
      
      public var textColor:uint;
      
      public var maxLength:uint;
      
      public var align:uint;
      
      public var leftMargin:uint;
      
      public var rightMargin:uint;
      
      public var indent:uint;
      
      public var leading:int;
      
      public var initialText:String = "";
      
      protected var _characterId:uint;
      
      public function TagDefineEditText()
      {
         super();
      }
      
      public function get characterId() : uint
      {
         return this._characterId;
      }
      
      public function set characterId(param1:uint) : void
      {
         this._characterId = param1;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         this._characterId = param1.readUI16();
         this.bounds = param1.readRECT();
         var _loc5_:uint = param1.readUI8();
         this.hasText = (_loc5_ & 0x80) != 0;
         this.wordWrap = (_loc5_ & 0x40) != 0;
         this.multiline = (_loc5_ & 0x20) != 0;
         this.password = (_loc5_ & 0x10) != 0;
         this.readOnly = (_loc5_ & 8) != 0;
         this.hasTextColor = (_loc5_ & 4) != 0;
         this.hasMaxLength = (_loc5_ & 2) != 0;
         this.hasFont = (_loc5_ & 1) != 0;
         var _loc6_:uint = param1.readUI8();
         this.hasFontClass = (_loc6_ & 0x80) != 0;
         this.autoSize = (_loc6_ & 0x40) != 0;
         this.hasLayout = (_loc6_ & 0x20) != 0;
         this.noSelect = (_loc6_ & 0x10) != 0;
         this.border = (_loc6_ & 8) != 0;
         this.wasStatic = (_loc6_ & 4) != 0;
         this.html = (_loc6_ & 2) != 0;
         this.useOutlines = (_loc6_ & 1) != 0;
         if(this.hasFont)
         {
            this.fontId = param1.readUI16();
         }
         if(this.hasFontClass)
         {
            this.fontClass = param1.readString();
         }
         if(this.hasFont)
         {
            this.fontHeight = param1.readUI16();
         }
         if(this.hasTextColor)
         {
            this.textColor = param1.readRGBA();
         }
         if(this.hasMaxLength)
         {
            this.maxLength = param1.readUI16();
         }
         if(this.hasLayout)
         {
            this.align = param1.readUI8();
            this.leftMargin = param1.readUI16();
            this.rightMargin = param1.readUI16();
            this.indent = param1.readUI16();
            this.leading = param1.readSI16();
         }
         this.variableName = param1.readString();
         if(this.hasText)
         {
            this.initialText = param1.readString() || "";
         }
      }
      
      public function _15080() : Object
      {
         var _loc4_:int = 0;
         var _loc6_:TagDefineFont2 = null;
         var _loc1_:String = null;
         var _loc2_:Object = null;
         var _loc3_:TextFormat = null;
         var _loc5_:String = null;
         if(Boolean(_loc6_) && Boolean(_loc6_.fontName))
         {
            _loc1_ = _loc6_.fontName;
            _loc2_ = {};
            _loc2_[this.characterId] = {};
            _loc2_[this.characterId].maxChars = this.maxLength;
            _loc2_[this.characterId].border = this.border;
            _loc2_[this.characterId].defaultTextFormat = {};
            _loc3_ = new TextFormat();
            _loc3_.font = _loc1_.replace(/\s*(Bold|Italic)\s*/g,"");
            _loc3_.leading = this.leading / 20;
            if(this.align == 0)
            {
               _loc3_.align = "left";
            }
            else if(this.align == 1)
            {
               _loc3_.align = "right";
            }
            else if(this.align == 2)
            {
               _loc3_.align = "center";
            }
            if(_loc1_.indexOf("Bold") > -1)
            {
               _loc3_.bold = true;
            }
            if(_loc1_.indexOf("Italic") > -1)
            {
               _loc3_.italic = true;
            }
            _loc3_.size = this.fontHeight / 20;
            _loc3_.color = "0x" + (this.textColor & 0xFFFFFF).toString(16);
            _loc2_[this.characterId].defaultTextFormat = _loc3_;
            _15081.defaultTextFormat = _loc3_;
         }
         this.initialText = StringUtils._15079(this.initialText);
         this.initialText = this.initialText.replace(/\<sbr\x20\/\>/g,"<br/>");
         _15081.width = this.bounds.rect.width;
         _15081.text = this.initialText;
         _15081.multiline = true;
         if(this.initialText.indexOf("<p") == -1)
         {
            this.initialText = "";
            _loc4_ = 0;
            while(_loc4_ < _15081.numLines)
            {
               _loc5_ = _15081.getLineText(_loc4_);
               if(_loc5_.lastIndexOf("\n") == -1)
               {
                  this.initialText += _loc5_ + "\n";
               }
               _loc4_++;
            }
         }
         return {
            "type":this.name,
            "wordWrap":this.wordWrap,
            "textColor":"0x" + (this.textColor & 0xFFFFFF).toString(16),
            "multiline":this.multiline,
            "readOnly":this.readOnly,
            "initialText":this.initialText,
            "align":this.align,
            "width":this.bounds.rect.width,
            "height":this.bounds.rect.height,
            "characterId":this._characterId,
            "fontHeight":this.fontHeight,
            "x":this.bounds.xmin / 20,
            "y":this.bounds.ymin / 20,
            "posX":this.bounds.xmin / 20,
            "posY":this.bounds.ymin / 20
         };
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeUI16(this.characterId);
         _loc3_.writeRECT(this.bounds);
         var _loc4_:uint = 0;
         if(this.hasText)
         {
            _loc4_ |= 128;
         }
         if(this.wordWrap)
         {
            _loc4_ |= 64;
         }
         if(this.multiline)
         {
            _loc4_ |= 32;
         }
         if(this.password)
         {
            _loc4_ |= 16;
         }
         if(this.readOnly)
         {
            _loc4_ |= 8;
         }
         if(this.hasTextColor)
         {
            _loc4_ |= 4;
         }
         if(this.hasMaxLength)
         {
            _loc4_ |= 2;
         }
         if(this.hasFont)
         {
            _loc4_ |= 1;
         }
         _loc3_.writeUI8(_loc4_);
         var _loc5_:uint = 0;
         if(this.hasFontClass)
         {
            _loc5_ |= 128;
         }
         if(this.autoSize)
         {
            _loc5_ |= 64;
         }
         if(this.hasLayout)
         {
            _loc5_ |= 32;
         }
         if(this.noSelect)
         {
            _loc5_ |= 16;
         }
         if(this.border)
         {
            _loc5_ |= 8;
         }
         if(this.wasStatic)
         {
            _loc5_ |= 4;
         }
         if(this.html)
         {
            _loc5_ |= 2;
         }
         if(this.useOutlines)
         {
            _loc5_ |= 1;
         }
         _loc3_.writeUI8(_loc5_);
         if(this.hasFont)
         {
            _loc3_.writeUI16(this.fontId);
         }
         if(this.hasFontClass)
         {
            _loc3_.writeString(this.fontClass);
         }
         if(this.hasFont)
         {
            _loc3_.writeUI16(this.fontHeight);
         }
         if(this.hasTextColor)
         {
            _loc3_.writeRGBA(this.textColor);
         }
         if(this.hasMaxLength)
         {
            _loc3_.writeUI16(this.maxLength);
         }
         if(this.hasLayout)
         {
            _loc3_.writeUI8(this.align);
            _loc3_.writeUI16(this.leftMargin);
            _loc3_.writeUI16(this.rightMargin);
            _loc3_.writeUI16(this.indent);
            _loc3_.writeSI16(this.leading);
         }
         _loc3_.writeString(this.variableName);
         if(this.hasText)
         {
            _loc3_.writeString(this.initialText);
         }
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      public function clone() : IDefinitionTag
      {
         var _loc1_:TagDefineEditText = new TagDefineEditText();
         _loc1_.characterId = this.characterId;
         _loc1_.bounds = this.bounds.clone();
         _loc1_.variableName = this.variableName;
         _loc1_.hasText = this.hasText;
         _loc1_.wordWrap = this.wordWrap;
         _loc1_.multiline = this.multiline;
         _loc1_.password = this.password;
         _loc1_.readOnly = this.readOnly;
         _loc1_.hasTextColor = this.hasTextColor;
         _loc1_.hasMaxLength = this.hasMaxLength;
         _loc1_.hasFont = this.hasFont;
         _loc1_.hasFontClass = this.hasFontClass;
         _loc1_.autoSize = this.autoSize;
         _loc1_.hasLayout = this.hasLayout;
         _loc1_.noSelect = this.noSelect;
         _loc1_.border = this.border;
         _loc1_.wasStatic = this.wasStatic;
         _loc1_.html = this.html;
         _loc1_.useOutlines = this.useOutlines;
         _loc1_.fontId = this.fontId;
         _loc1_.fontClass = this.fontClass;
         _loc1_.fontHeight = this.fontHeight;
         _loc1_.textColor = this.textColor;
         _loc1_.maxLength = this.maxLength;
         _loc1_.align = this.align;
         _loc1_.leftMargin = this.leftMargin;
         _loc1_.rightMargin = this.rightMargin;
         _loc1_.indent = this.indent;
         _loc1_.leading = this.leading;
         _loc1_.initialText = this.initialText;
         return _loc1_;
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "DefineEditText";
      }
      
      public function get version() : uint
      {
         return 4;
      }
      
      public function get level() : uint
      {
         return 1;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         return Tag.toStringCommon(this.type,this.name,param1) + "ID: " + this.characterId + ", " + (this.hasText && this.initialText.length > 0 ? "Text: " + this.initialText + ", " : "") + (this.variableName.length > 0 ? "VariableName: " + this.variableName + ", " : "") + "Bounds: " + this.bounds;
      }
   }
}

