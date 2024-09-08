package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import flash.utils.ByteArray;
   
   public class TagJPEGTables implements ITag
   {
      public static const TYPE:uint = 8;
      
      protected var _jpegTables:ByteArray;
      
      public function TagJPEGTables()
      {
         super();
         this._jpegTables = new ByteArray();
      }
      
      public function get jpegTables() : ByteArray
      {
         return this._jpegTables;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         if(param2 > 0)
         {
            param1.readBytes(this._jpegTables,0,param2);
         }
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         param1.writeTagHeader(this.type,this._jpegTables.length);
         if(this.jpegTables.length > 0)
         {
            param1.writeBytes(this.jpegTables);
         }
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "JPEGTables";
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
         return Tag.toStringCommon(this.type,this.name,param1) + "Length: " + this._jpegTables.length;
      }
   }
}

