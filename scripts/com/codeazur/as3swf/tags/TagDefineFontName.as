package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   
   public class TagDefineFontName implements ITag
   {
      public static const TYPE:uint = 88;
      
      public var fontId:uint;
      
      public var fontName:String;
      
      public var fontCopyright:String;
      
      public function TagDefineFontName()
      {
         super();
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         this.fontId = param1.readUI16();
         this.fontName = param1.readString();
         this.fontCopyright = param1.readString();
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeUI16(this.fontId);
         _loc3_.writeString(this.fontName);
         _loc3_.writeString(this.fontCopyright);
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "DefineFontName";
      }
      
      public function get version() : uint
      {
         return 9;
      }
      
      public function get level() : uint
      {
         return 1;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         return Tag.toStringCommon(this.type,this.name,param1) + "FontID: " + this.fontId + ", " + "Name: " + this.fontName + ", " + "Copyright: " + this.fontCopyright;
      }
   }
}

