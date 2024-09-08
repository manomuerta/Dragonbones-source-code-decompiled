package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   
   public class TagEnd implements ITag
   {
      public static const TYPE:uint = 0;
      
      public function TagEnd()
      {
         super();
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         param1.writeTagHeader(this.type,0);
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "End";
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
         return Tag.toStringCommon(this.type,this.name,param1);
      }
   }
}

