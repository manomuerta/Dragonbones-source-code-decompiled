package com.codeazur.as3swf.data.etc
{
   import _14146._14145;
   import flash.geom.Point;
   
   public class CurvedEdge extends StraightEdge implements IEdge
   {
      protected var _control:Point;
      
      protected var _14993:Point;
      
      public var line2:_14145 = null;
      
      public function CurvedEdge(param1:Point, param2:Point, param3:Point, param4:uint = 0, param5:uint = 0, param6:Point = null, param7:Point = null, param8:Point = null, param9:uint = 0)
      {
         super(param1,param3,param4,param5,param7,param8,param9);
         this._control = param2;
         this._14993 = param6;
      }
      
      public function get _14994() : Point
      {
         return this._14993;
      }
      
      public function get control() : Point
      {
         return this._control;
      }
      
      override public function get _14995() : _14145
      {
         return this.line2;
      }
      
      override public function reverseWithNewFillStyle() : IEdge
      {
         return new CurvedEdge(to,this.control,from,lineStyleIdx,_fillStyleIdx2,null,null,null,_fillStyleIdx);
      }
      
      override public function toString() : String
      {
         return "stroke:" + lineStyleIdx + ", fill:" + fillStyleIdx + ", start:" + from.toString() + ", control:" + this.control.toString() + ", end:" + to.toString();
      }
   }
}

