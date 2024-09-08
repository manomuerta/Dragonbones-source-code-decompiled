package com.codeazur.as3swf.data.actions
{
   import com.codeazur.as3swf.SWFData;
   
   public interface IAction
   {
      function get code() : uint;
      
      function get length() : uint;
      
      function get _14974() : uint;
      
      function get pos() : uint;
      
      function get _14982() : String;
      
      function set _14982(param1:String) : void;
      
      function parse(param1:SWFData) : void;
      
      function publish(param1:SWFData) : void;
      
      function clone() : IAction;
      
      function toString(param1:uint = 0) : String;
      
      function _14979(param1:uint, param2:_14132) : String;
   }
}

