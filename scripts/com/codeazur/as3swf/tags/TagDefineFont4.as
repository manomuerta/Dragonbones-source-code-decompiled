package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import flash.utils.ByteArray;
   
   public class TagDefineFont4 implements IDefinitionTag
   {
      public static const TYPE:uint = 91;
      
      public var hasFontData:Boolean;
      
      public var italic:Boolean;
      
      public var bold:Boolean;
      
      public var fontName:String;
      
      protected var _characterId:uint;
      
      protected var _fontData:ByteArray;
      
      public function TagDefineFont4()
      {
         super();
         this._fontData = new ByteArray();
      }
      
      public function get characterId() : uint
      {
         return this._characterId;
      }
      
      public function set characterId(param1:uint) : void
      {
         this._characterId = param1;
      }
      
      public function get fontData() : ByteArray
      {
         return this._fontData;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         var _loc5_:uint = param1.position;
         this._characterId = param1.readUI16();
         var _loc6_:uint = param1.readUI8();
         this.hasFontData = (_loc6_ & 4) != 0;
         this.italic = (_loc6_ & 2) != 0;
         this.bold = (_loc6_ & 1) != 0;
         this.fontName = param1.readString();
         if(this.hasFontData && param2 > param1.position - _loc5_)
         {
            param1.readBytes(this._fontData,0,param2 - (param1.position - _loc5_));
         }
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeUI16(this.characterId);
         var _loc4_:uint = 0;
         if(this.hasFontData)
         {
            _loc4_ |= 4;
         }
         if(this.italic)
         {
            _loc4_ |= 2;
         }
         if(this.bold)
         {
            _loc4_ |= 1;
         }
         _loc3_.writeUI8(_loc4_);
         _loc3_.writeString(this.fontName);
         if(this.hasFontData && this._fontData.length > 0)
         {
            _loc3_.writeBytes(this._fontData);
         }
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      public function clone() : IDefinitionTag
      {
         var _loc1_:TagDefineFont4 = new TagDefineFont4();
         _loc1_.characterId = this.characterId;
         _loc1_.hasFontData = this.hasFontData;
         _loc1_.italic = this.italic;
         _loc1_.bold = this.bold;
         _loc1_.fontName = this.fontName;
         if(this._fontData.length > 0)
         {
            _loc1_.fontData.writeBytes(this._fontData);
         }
         return _loc1_;
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "DefineFont4";
      }
      
      public function get version() : uint
      {
         return 10;
      }
      
      public function get level() : uint
      {
         return 1;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         return Tag.toStringCommon(this.type,this.name,param1) + "ID: " + this.characterId + ", " + "FontName: " + this.fontName + ", " + "HasFontData: " + this.hasFontData + ", " + "Italic: " + this.italic + ", " + "Bold: " + this.bold;
      }
   }
}

