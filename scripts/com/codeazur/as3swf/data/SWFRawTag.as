package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   
   public class SWFRawTag
   {
      public var header:SWFRecordHeader;
      
      public var bytes:SWFData;
      
      public function SWFRawTag(param1:SWFData = null)
      {
         super();
         if(param1 != null)
         {
            this.parse(param1);
         }
      }
      
      public function parse(param1:SWFData) : void
      {
         var _loc2_:uint = param1.position;
         this.header = param1.readTagHeader();
         this.bytes = new SWFData();
         var _loc3_:uint = param1.position;
         param1.position = _loc2_;
         param1.readBytes(this.bytes,0,this.header.tagLength);
         param1.position = _loc3_;
      }
      
      public function publish(param1:SWFData) : void
      {
         param1.writeBytes(this.bytes);
      }
   }
}

