package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   
   public class TagUnknown implements ITag
   {
      protected var _type:uint;
      
      public function TagUnknown(param1:uint = 0)
      {
         super();
         this._type = param1;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         param1.skipBytes(param2);
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         throw new Error("No raw tag data available.");
      }
      
      public function get type() : uint
      {
         return this._type;
      }
      
      public function get name() : String
      {
         return "????";
      }
      
      public function get version() : uint
      {
         return 0;
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

