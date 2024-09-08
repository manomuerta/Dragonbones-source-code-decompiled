package com.codeazur.as3swf.data.filters
{
   import com.codeazur.as3swf.SWFData;
   import flash.filters.BitmapFilter;
   
   public interface IFilter
   {
      function get id() : uint;
      
      function get filter() : BitmapFilter;
      
      function parse(param1:SWFData) : void;
      
      function publish(param1:SWFData) : void;
      
      function clone() : IFilter;
      
      function toString(param1:uint = 0) : String;
   }
}

