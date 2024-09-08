package com.codeazur.as3swf.data.etc
{
   import _14146._14145;
   import flash.geom.Point;
   
   public class StraightEdge implements IEdge
   {
      protected var _from:Point;
      
      protected var _to:Point;
      
      protected var _lineStyleIdx:uint = 0;
      
      protected var _fillStyleIdx:uint = 0;
      
      protected var _7386:String;
      
      protected var _15003:Point;
      
      protected var _15004:Point;
      
      protected var _fillStyleIdx2:uint = 0;
      
      public var line:_14145 = null;
      
      public var _15001:Boolean = false;
      
      public var _15002:Boolean = false;
      
      public function StraightEdge(param1:Point, param2:Point, param3:uint = 0, param4:uint = 0, param5:Point = null, param6:Point = null, param7:uint = 0)
      {
         super();
         this._from = param1;
         this._to = param2;
         this._15003 = param5;
         this._15004 = param6;
         this._lineStyleIdx = param3;
         this._fillStyleIdx = param4;
         this._fillStyleIdx2 = param7;
      }
      
      public function get from() : Point
      {
         return this._from;
      }
      
      public function get to() : Point
      {
         return this._to;
      }
      
      public function get _14999() : Point
      {
         return this._15003;
      }
      
      public function get _15000() : Point
      {
         return this._15004;
      }
      
      public function get lineStyleIdx() : uint
      {
         return this._lineStyleIdx;
      }
      
      public function get fillStyleIdx() : uint
      {
         return this._fillStyleIdx;
      }
      
      public function set flag(param1:String) : void
      {
         this._7386 = param1;
      }
      
      public function get flag() : String
      {
         return this._7386;
      }
      
      public function get fillStyleIdx2() : uint
      {
         return this._fillStyleIdx2;
      }
      
      public function get _14997() : _14145
      {
         return this.line;
      }
      
      public function get _14995() : _14145
      {
         return this.line;
      }
      
      public function get _14996() : Boolean
      {
         return this._15001;
      }
      
      public function set _14996(param1:Boolean) : void
      {
         this._15001 = param1;
      }
      
      public function get _14998() : Boolean
      {
         return this._15002;
      }
      
      public function set _14998(param1:Boolean) : void
      {
         this._15002 = param1;
      }
      
      public function reverseWithNewFillStyle() : IEdge
      {
         return new StraightEdge(this.to,this.from,this.lineStyleIdx,this._fillStyleIdx2,null,null,this._fillStyleIdx);
      }
      
      public function toString() : String
      {
         return "stroke:" + this.lineStyleIdx + ", fill:" + this.fillStyleIdx + ", start:" + this.from.toString() + ", end:" + this.to.toString();
      }
   }
}

