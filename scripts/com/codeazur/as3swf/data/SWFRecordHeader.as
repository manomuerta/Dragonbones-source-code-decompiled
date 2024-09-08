package com.codeazur.as3swf.data
{
   public class SWFRecordHeader
   {
      public var type:uint;
      
      public var contentLength:uint;
      
      public var headerLength:uint;
      
      public function SWFRecordHeader(param1:uint, param2:uint, param3:uint)
      {
         super();
         this.type = param1;
         this.contentLength = param2;
         this.headerLength = param3;
      }
      
      public function get tagLength() : uint
      {
         return this.headerLength + this.contentLength;
      }
      
      public function toString() : String
      {
         return "[SWFRecordHeader] type: " + this.type + ", headerLength: " + this.headerLength + ", contentlength: " + this.contentLength;
      }
   }
}

