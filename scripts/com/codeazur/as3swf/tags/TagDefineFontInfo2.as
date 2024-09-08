package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   
   public class TagDefineFontInfo2 extends TagDefineFontInfo implements ITag
   {
      public static const TYPE:uint = 62;
      
      public function TagDefineFontInfo2()
      {
         super();
      }
      
      override protected function parseLangCode(param1:SWFData) : void
      {
         langCode = param1.readUI8();
         langCodeLength = 1;
      }
      
      override protected function publishLangCode(param1:SWFData) : void
      {
         param1.writeUI8(langCode);
      }
      
      override public function get type() : uint
      {
         return TYPE;
      }
      
      override public function get name() : String
      {
         return "DefineFontInfo2";
      }
      
      override public function get version() : uint
      {
         return 6;
      }
      
      override public function get level() : uint
      {
         return 2;
      }
      
      override public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         return Tag.toStringCommon(this.type,this.name,param1) + "FontID: " + fontId + ", " + "FontName: " + fontName + ", " + "Italic: " + italic + ", " + "Bold: " + bold + ", " + "LanguageCode: " + langCode + ", " + "Codes: " + _codeTable.length;
      }
   }
}

