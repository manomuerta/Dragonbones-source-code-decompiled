package com.codeazur.as3swf.tags
{
   import _14144.Config;
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.SWFKerningRecord;
   import com.codeazur.as3swf.data.SWFRectangle;
   import com.codeazur.utils.StringUtils;
   import flash.utils.ByteArray;
   
   public class TagDefineFont2 extends TagDefineFont implements IDefinitionTag
   {
      public static const TYPE:uint = 48;
      
      public var hasLayout:Boolean;
      
      public var shiftJIS:Boolean;
      
      public var smallText:Boolean;
      
      public var ansi:Boolean;
      
      public var wideOffsets:Boolean;
      
      public var wideCodes:Boolean;
      
      public var italic:Boolean;
      
      public var bold:Boolean;
      
      public var languageCode:uint;
      
      public var fontName:String;
      
      public var ascent:uint;
      
      public var descent:uint;
      
      public var leading:int;
      
      protected var _codeTable:Vector.<uint>;
      
      protected var _fontAdvanceTable:Vector.<int>;
      
      protected var _fontBoundsTable:Vector.<SWFRectangle>;
      
      protected var _fontKerningTable:Vector.<SWFKerningRecord>;
      
      public function TagDefineFont2()
      {
         super();
         this._codeTable = new Vector.<uint>();
         this._fontAdvanceTable = new Vector.<int>();
         this._fontBoundsTable = new Vector.<SWFRectangle>();
         this._fontKerningTable = new Vector.<SWFKerningRecord>();
      }
      
      public function get codeTable() : Vector.<uint>
      {
         return this._codeTable;
      }
      
      public function get fontAdvanceTable() : Vector.<int>
      {
         return this._fontAdvanceTable;
      }
      
      public function get fontBoundsTable() : Vector.<SWFRectangle>
      {
         return this._fontBoundsTable;
      }
      
      public function get fontKerningTable() : Vector.<SWFKerningRecord>
      {
         return this._fontKerningTable;
      }
      
      override public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         var _loc9_:uint = 0;
         var _loc11_:uint = 0;
         var _loc12_:uint = 0;
         var _loc5_:uint = param1.position;
         _characterId = param1.readUI16();
         var _loc6_:uint = param1.readUI8();
         this.hasLayout = (_loc6_ & 0x80) != 0;
         this.shiftJIS = (_loc6_ & 0x40) != 0;
         this.smallText = (_loc6_ & 0x20) != 0;
         this.ansi = (_loc6_ & 0x10) != 0;
         this.wideOffsets = (_loc6_ & 8) != 0;
         this.wideCodes = (_loc6_ & 4) != 0;
         this.italic = (_loc6_ & 2) != 0;
         this.bold = (_loc6_ & 1) != 0;
         this.languageCode = param1.readLANGCODE();
         var _loc7_:uint = param1.readUI8();
         var _loc8_:ByteArray = new ByteArray();
         param1.readBytes(_loc8_,0,_loc7_);
         this.fontName = _loc8_.readUTFBytes(_loc7_);
         var _loc10_:uint = param1.readUI16();
         if(_loc10_ > Config.MAX_GLYPHS_NUM)
         {
            param1.position = _loc5_ + param2;
            return;
         }
         if(_loc10_ > 0)
         {
            param1.skipBytes(_loc10_ << (this.wideOffsets ? 2 : 1));
            _loc11_ = this.wideOffsets ? param1.readUI32() : param1.readUI16();
            _loc9_ = 0;
            while(_loc9_ < _loc10_)
            {
               _glyphShapeTable.push(param1.readSHAPE());
               _loc9_++;
            }
            _loc9_ = 0;
            while(_loc9_ < _loc10_)
            {
               this._codeTable.push(this.wideCodes ? param1.readUI16() : param1.readUI8());
               _loc9_++;
            }
         }
         if(this.hasLayout)
         {
            this.ascent = param1.readUI16();
            this.descent = param1.readUI16();
            this.leading = param1.readSI16();
            _loc9_ = 0;
            while(_loc9_ < _loc10_)
            {
               this._fontAdvanceTable.push(param1.readSI16());
               _loc9_++;
            }
            _loc9_ = 0;
            while(_loc9_ < _loc10_)
            {
               this._fontBoundsTable.push(param1.readRECT());
               _loc9_++;
            }
            _loc12_ = param1.readUI16();
            _loc9_ = 0;
            while(_loc9_ < _loc12_)
            {
               this._fontKerningTable.push(param1.readKERNINGRECORD(this.wideCodes));
               _loc9_++;
            }
         }
      }
      
      override public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc5_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         var _loc12_:SWFData = null;
         var _loc13_:uint = 0;
         var _loc3_:SWFData = new SWFData();
         var _loc4_:uint = glyphShapeTable.length;
         _loc3_.writeUI16(characterId);
         var _loc6_:uint = 0;
         if(this.hasLayout)
         {
            _loc6_ |= 128;
         }
         if(this.shiftJIS)
         {
            _loc6_ |= 64;
         }
         if(this.smallText)
         {
            _loc6_ |= 32;
         }
         if(this.ansi)
         {
            _loc6_ |= 16;
         }
         if(this.wideOffsets)
         {
            _loc6_ |= 8;
         }
         if(this.wideCodes)
         {
            _loc6_ |= 4;
         }
         if(this.italic)
         {
            _loc6_ |= 2;
         }
         if(this.bold)
         {
            _loc6_ |= 1;
         }
         _loc3_.writeUI8(_loc6_);
         _loc3_.writeLANGCODE(this.languageCode);
         var _loc7_:ByteArray = new ByteArray();
         _loc7_.writeUTFBytes(this.fontName);
         _loc3_.writeUI8(_loc7_.length);
         _loc3_.writeBytes(_loc7_);
         _loc3_.writeUI16(_loc4_);
         if(_loc4_ > 0)
         {
            _loc8_ = uint(_loc4_ << (this.wideOffsets ? 2 : 1));
            _loc9_ = this.wideOffsets ? 4 : 2;
            _loc10_ = this.wideOffsets ? uint(_loc4_ << 1) : _loc4_;
            _loc11_ = _loc8_ + _loc9_;
            _loc12_ = new SWFData();
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               if(this.wideOffsets)
               {
                  _loc3_.writeUI32(_loc11_ + _loc12_.position);
               }
               else
               {
                  _loc3_.writeUI16(_loc11_ + _loc12_.position);
               }
               _loc12_.writeSHAPE(glyphShapeTable[_loc5_]);
               _loc5_++;
            }
            if(this.wideOffsets)
            {
               _loc3_.writeUI32(_loc11_ + _loc12_.length);
            }
            else
            {
               _loc3_.writeUI16(_loc11_ + _loc12_.length);
            }
            _loc3_.writeBytes(_loc12_);
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               if(this.wideCodes)
               {
                  _loc3_.writeUI16(this.codeTable[_loc5_]);
               }
               else
               {
                  _loc3_.writeUI8(this.codeTable[_loc5_]);
               }
               _loc5_++;
            }
         }
         if(this.hasLayout)
         {
            _loc3_.writeUI16(this.ascent);
            _loc3_.writeUI16(this.descent);
            _loc3_.writeSI16(this.leading);
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc3_.writeSI16(this.fontAdvanceTable[_loc5_]);
               _loc5_++;
            }
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc3_.writeRECT(this.fontBoundsTable[_loc5_]);
               _loc5_++;
            }
            _loc13_ = this.fontKerningTable.length;
            _loc3_.writeUI16(_loc13_);
            _loc5_ = 0;
            while(_loc5_ < _loc13_)
            {
               _loc3_.writeKERNINGRECORD(this.fontKerningTable[_loc5_],this.wideCodes);
               _loc5_++;
            }
         }
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      override public function get type() : uint
      {
         return TYPE;
      }
      
      override public function get name() : String
      {
         return "DefineFont2";
      }
      
      override public function get version() : uint
      {
         return 3;
      }
      
      override public function get level() : uint
      {
         return 2;
      }
      
      override public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc3_:String = Tag.toStringCommon(this.type,this.name,param1) + "ID: " + characterId + ", " + "FontName: " + this.fontName + ", " + "Italic: " + this.italic + ", " + "Bold: " + this.bold + ", " + "Glyphs: " + _glyphShapeTable.length;
         return _loc3_ + this.toStringCommon(param1);
      }
      
      override protected function toStringCommon(param1:uint) : String
      {
         var _loc2_:uint = 0;
         var _loc4_:Boolean = false;
         var _loc5_:SWFRectangle = null;
         var _loc3_:String = super.toStringCommon(param1);
         if(this.hasLayout)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "Ascent: " + this.ascent;
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "Descent: " + this.descent;
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "Leading: " + this.leading;
         }
         if(this._codeTable.length > 0)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "CodeTable:";
            _loc2_ = 0;
            while(_loc2_ < this._codeTable.length)
            {
               if((_loc2_ & 0x0F) == 0)
               {
                  _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + this._codeTable[_loc2_].toString();
               }
               else
               {
                  _loc3_ += ", " + this._codeTable[_loc2_].toString();
               }
               _loc2_++;
            }
         }
         if(this._fontAdvanceTable.length > 0)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "FontAdvanceTable:";
            _loc2_ = 0;
            while(_loc2_ < this._fontAdvanceTable.length)
            {
               if((_loc2_ & 7) == 0)
               {
                  _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + this._fontAdvanceTable[_loc2_].toString();
               }
               else
               {
                  _loc3_ += ", " + this._fontAdvanceTable[_loc2_].toString();
               }
               _loc2_++;
            }
         }
         if(this._fontBoundsTable.length > 0)
         {
            _loc4_ = false;
            _loc2_ = 0;
            while(_loc2_ < this._fontBoundsTable.length)
            {
               _loc5_ = this._fontBoundsTable[_loc2_];
               if(_loc5_.xmin != 0 || _loc5_.xmax != 0 || _loc5_.ymin != 0 || _loc5_.ymax != 0)
               {
                  _loc4_ = true;
                  break;
               }
               _loc2_++;
            }
            if(_loc4_)
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "FontBoundsTable:";
               _loc2_ = 0;
               while(_loc2_ < this._fontBoundsTable.length)
               {
                  _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + "[" + _loc2_ + "] " + this._fontBoundsTable[_loc2_].toString();
                  _loc2_++;
               }
            }
         }
         if(this._fontKerningTable.length > 0)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "KerningTable:";
            _loc2_ = 0;
            while(_loc2_ < this._fontKerningTable.length)
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + "[" + _loc2_ + "] " + this._fontKerningTable[_loc2_].toString();
               _loc2_++;
            }
         }
         return _loc3_;
      }
   }
}

