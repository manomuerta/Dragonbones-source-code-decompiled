package com.codeazur.as3swf.data.etc
{
   import _14146._14145;
   import flash.geom.Point;
   
   public interface IEdge
   {
      function get from() : Point;
      
      function get to() : Point;
      
      function get lineStyleIdx() : uint;
      
      function get fillStyleIdx() : uint;
      
      function set flag(param1:String) : void;
      
      function get flag() : String;
      
      function get _14999() : Point;
      
      function get _15000() : Point;
      
      function get fillStyleIdx2() : uint;
      
      function get _14997() : _14145;
      
      function get _14995() : _14145;
      
      function get _14996() : Boolean;
      
      function set _14996(param1:Boolean) : void;
      
      function get _14998() : Boolean;
      
      function set _14998(param1:Boolean) : void;
      
      function reverseWithNewFillStyle() : IEdge;
   }
}

