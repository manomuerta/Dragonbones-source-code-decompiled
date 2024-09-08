package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   
   public class TagMetadata implements ITag
   {
      public static const TYPE:uint = 77;
      
      public var xmlString:String;
      
      public function TagMetadata()
      {
         super();
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         this.xmlString = param1.readString();
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeString(this.xmlString);
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "Metadata";
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
         var str:String = null;
         var xml:XML = null;
         var indent:uint = param1;
         var flags:uint = param2;
         str = Tag.toStringCommon(this.type,this.name,indent);
         try
         {
            xml = new XML(this.xmlString);
            str += " " + xml.toXMLString();
         }
         catch(error:Error)
         {
            str += " " + xmlString;
         }
         return str;
      }
   }
}

