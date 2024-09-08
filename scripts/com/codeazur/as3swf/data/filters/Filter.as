package com.codeazur.as3swf.data.filters
{
   import com.codeazur.as3swf.SWFData;
   import flash.filters.BitmapFilter;
   
   public class Filter implements IFilter
   {
      protected var _id:uint;
      
      public function Filter(param1:uint)
      {
         super();
         this._id = param1;
      }
      
      public function get id() : uint
      {
         return this._id;
      }
      
      public function get filter() : BitmapFilter
      {
         throw new Error("Implement in subclasses!");
      }
      
      public function parse(param1:SWFData) : void
      {
         throw new Error("Implement in subclasses!");
      }
      
      public function publish(param1:SWFData) : void
      {
         throw new Error("Implement in subclasses!");
      }
      
      public function clone() : IFilter
      {
         throw new Error("Implement in subclasses!");
      }
      
      public function toString(param1:uint = 0) : String
      {
         return "[Filter]";
      }
   }
}

