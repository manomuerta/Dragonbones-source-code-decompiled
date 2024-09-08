package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   
   public interface ITag
   {
      function get type() : uint;
      
      function get name() : String;
      
      function get version() : uint;
      
      function get level() : uint;
      
      function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void;
      
      function publish(param1:SWFData, param2:uint) : void;
      
      function toString(param1:uint = 0, param2:uint = 0) : String;
   }
}

