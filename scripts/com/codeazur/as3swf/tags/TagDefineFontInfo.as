package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import flash.utils.ByteArray;
   
   public class TagDefineFontInfo implements ITag
   {
      public static const TYPE:uint = 13;
      
      public var fontId:uint;
      
      public var fontName:String;
      
      public var smallText:Boolean;
      
      public var shiftJIS:Boolean;
      
      public var ansi:Boolean;
      
      public var italic:Boolean;
      
      public var bold:Boolean;
      
      public var wideCodes:Boolean;
      
      public var langCode:uint = 0;
      
      protected var _codeTable:Vector.<uint>;
      
      protected var langCodeLength:uint = 0;
      
      public function TagDefineFontInfo()
      {
         super();
         this._codeTable = new Vector.<uint>();
      }
      
      public function get codeTable() : Vector.<uint>
      {
         return this._codeTable;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         this.fontId = param1.readUI16();
         var _loc5_:uint = param1.readUI8();
         var _loc6_:ByteArray = new ByteArray();
         param1.readBytes(_loc6_,0,_loc5_);
         this.fontName = _loc6_.readUTFBytes(_loc5_);
         var _loc7_:uint = param1.readUI8();
         this.smallText = (_loc7_ & 0x20) != 0;
         this.shiftJIS = (_loc7_ & 0x10) != 0;
         this.ansi = (_loc7_ & 8) != 0;
         this.italic = (_loc7_ & 4) != 0;
         this.bold = (_loc7_ & 2) != 0;
         this.wideCodes = (_loc7_ & 1) != 0;
         this.parseLangCode(param1);
         var _loc8_:uint = uint(param2 - _loc5_ - this.langCodeLength - 4);
         var _loc9_:uint = 0;
         while(_loc9_ < _loc8_)
         {
            this._codeTable.push(this.wideCodes ? param1.readUI16() : param1.readUI8());
            _loc9_++;
         }
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeUI16(this.fontId);
         var _loc4_:ByteArray = new ByteArray();
         _loc4_.writeUTFBytes(this.fontName);
         _loc3_.writeUI8(_loc4_.length);
         _loc3_.writeBytes(_loc4_);
         var _loc5_:uint = 0;
         if(this.smallText)
         {
            _loc5_ |= 32;
         }
         if(this.shiftJIS)
         {
            _loc5_ |= 16;
         }
         if(this.ansi)
         {
            _loc5_ |= 8;
         }
         if(this.italic)
         {
            _loc5_ |= 4;
         }
         if(this.bold)
         {
            _loc5_ |= 2;
         }
         if(this.wideCodes)
         {
            _loc5_ |= 1;
         }
         _loc3_.writeUI8(_loc5_);
         this.publishLangCode(_loc3_);
         var _loc6_:uint = this._codeTable.length;
         var _loc7_:uint = 0;
         while(_loc7_ < _loc6_)
         {
            if(this.wideCodes)
            {
               _loc3_.writeUI16(this._codeTable[_loc7_]);
            }
            else
            {
               _loc3_.writeUI8(this._codeTable[_loc7_]);
            }
            _loc7_++;
         }
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      protected function parseLangCode(param1:SWFData) : void
      {
      }
      
      protected function publishLangCode(param1:SWFData) : void
      {
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "DefineFontInfo";
      }
      
      public function get version() : uint
      {
         return 1;
      }
      
      public function get level() : uint
      {
         return 1;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         return Tag.toStringCommon(this.type,this.name,param1) + "FontID: " + this.fontId + ", " + "FontName: " + this.fontName + ", " + "Italic: " + this.italic + ", " + "Bold: " + this.bold + ", " + "Codes: " + this._codeTable.length;
      }
   }
}

