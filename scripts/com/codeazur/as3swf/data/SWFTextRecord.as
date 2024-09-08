package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.utils.ColorUtils;
   import com.codeazur.utils.StringUtils;
   
   public class SWFTextRecord
   {
      public var type:uint;
      
      public var hasFont:Boolean;
      
      public var hasColor:Boolean;
      
      public var hasXOffset:Boolean;
      
      public var hasYOffset:Boolean;
      
      public var fontId:uint;
      
      public var textColor:uint;
      
      public var textHeight:uint;
      
      public var xOffset:int;
      
      public var yOffset:int;
      
      protected var _glyphEntries:Vector.<SWFGlyphEntry>;
      
      protected var _level:uint;
      
      public var text:String = "";
      
      public function SWFTextRecord(param1:SWFData = null, param2:uint = 0, param3:uint = 0, param4:SWFTextRecord = null, param5:uint = 1)
      {
         super();
         this._glyphEntries = new Vector.<SWFGlyphEntry>();
         if(param1 != null)
         {
            this.parse(param1,param2,param3,param4,param5);
         }
      }
      
      public function get glyphEntries() : Vector.<SWFGlyphEntry>
      {
         return this._glyphEntries;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:SWFTextRecord = null, param5:uint = 1) : void
      {
         this._level = param5;
         var _loc6_:uint = param1.readUI8();
         this.type = _loc6_ >> 7;
         this.hasFont = (_loc6_ & 8) != 0;
         this.hasColor = (_loc6_ & 4) != 0;
         this.hasYOffset = (_loc6_ & 2) != 0;
         this.hasXOffset = (_loc6_ & 1) != 0;
         if(this.hasFont)
         {
            this.fontId = param1.readUI16();
         }
         else if(param4 != null)
         {
            this.fontId = param4.fontId;
         }
         if(this.hasColor)
         {
            this.textColor = param5 < 2 ? param1.readRGB() : param1.readRGBA();
         }
         else if(param4 != null)
         {
            this.textColor = param4.textColor;
         }
         if(this.hasXOffset)
         {
            this.xOffset = param1.readSI16();
         }
         else if(param4 != null)
         {
            this.xOffset = param4.xOffset;
         }
         if(this.hasYOffset)
         {
            this.yOffset = param1.readSI16();
         }
         else if(param4 != null)
         {
            this.yOffset = param4.yOffset;
         }
         if(this.hasFont)
         {
            this.textHeight = param1.readUI16();
         }
         else if(param4 != null)
         {
            this.textHeight = param4.textHeight;
         }
         var _loc7_:uint = param1.readUI8();
         var _loc8_:uint = 0;
         while(_loc8_ < _loc7_)
         {
            this._glyphEntries.push(param1.readGLYPHENTRY(param2,param3));
            _loc8_++;
         }
      }
      
      public function publish(param1:SWFData, param2:uint, param3:uint, param4:SWFTextRecord = null, param5:uint = 1) : void
      {
         var _loc6_:uint = uint(this.type << 7);
         this.hasFont = param4 == null || param4.fontId != this.fontId || param4.textHeight != this.textHeight;
         this.hasColor = param4 == null || param4.textColor != this.textColor;
         this.hasXOffset = param4 == null || param4.xOffset != this.xOffset;
         this.hasYOffset = param4 == null || param4.yOffset != this.yOffset;
         if(this.hasFont)
         {
            _loc6_ |= 8;
         }
         if(this.hasColor)
         {
            _loc6_ |= 4;
         }
         if(this.hasYOffset)
         {
            _loc6_ |= 2;
         }
         if(this.hasXOffset)
         {
            _loc6_ |= 1;
         }
         param1.writeUI8(_loc6_);
         if(this.hasFont)
         {
            param1.writeUI16(this.fontId);
         }
         if(this.hasColor)
         {
            if(param5 >= 2)
            {
               param1.writeRGBA(this.textColor);
            }
            else
            {
               param1.writeRGB(this.textColor);
            }
         }
         if(this.hasXOffset)
         {
            param1.writeSI16(this.xOffset);
         }
         if(this.hasYOffset)
         {
            param1.writeSI16(this.yOffset);
         }
         if(this.hasFont)
         {
            param1.writeUI16(this.textHeight);
         }
         var _loc7_:uint = this._glyphEntries.length;
         param1.writeUI8(_loc7_);
         var _loc8_:uint = 0;
         while(_loc8_ < _loc7_)
         {
            param1.writeGLYPHENTRY(this._glyphEntries[_loc8_],param2,param3);
            _loc8_++;
         }
      }
      
      public function clone() : SWFTextRecord
      {
         var _loc1_:SWFTextRecord = new SWFTextRecord();
         _loc1_.type = this.type;
         _loc1_.hasFont = this.hasFont;
         _loc1_.hasColor = this.hasColor;
         _loc1_.hasXOffset = this.hasXOffset;
         _loc1_.hasYOffset = this.hasYOffset;
         _loc1_.fontId = this.fontId;
         _loc1_.textColor = this.textColor;
         _loc1_.textHeight = this.textHeight;
         _loc1_.xOffset = this.xOffset;
         _loc1_.yOffset = this.yOffset;
         var _loc2_:uint = 0;
         while(_loc2_ < this._glyphEntries.length)
         {
            _loc1_.glyphEntries.push(this._glyphEntries[_loc2_].clone());
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function toString(param1:uint = 0) : String
      {
         var _loc2_:Array = ["Glyphs: " + this._glyphEntries.length.toString()];
         if(this.hasFont)
         {
            _loc2_.push("FontID: " + this.fontId);
            _loc2_.push("Height: " + this.textHeight);
         }
         if(this.hasColor)
         {
            _loc2_.push("Color: " + (this._level <= 2 ? ColorUtils.rgbToString(this.textColor) : ColorUtils.rgbaToString(this.textColor)));
         }
         if(this.hasXOffset)
         {
            _loc2_.push("XOffset: " + this.xOffset);
         }
         if(this.hasYOffset)
         {
            _loc2_.push("YOffset: " + this.yOffset);
         }
         var _loc3_:String = _loc2_.join(", ");
         var _loc4_:uint = 0;
         while(_loc4_ < this._glyphEntries.length)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "[" + _loc4_ + "] " + this._glyphEntries[_loc4_].toString();
            _loc4_++;
         }
         return _loc3_;
      }
   }
}

