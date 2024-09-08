package com.codeazur.as3swf.exporters.core
{
   import flash.geom.Matrix;
   
   public interface IShapeExporter
   {
      function beginShape() : void;
      
      function endShape() : void;
      
      function beginFills() : void;
      
      function endFills() : void;
      
      function beginLines() : void;
      
      function endLines(param1:Boolean) : void;
      
      function beginFill(param1:uint, param2:Number = 1) : void;
      
      function beginGradientFill(param1:String, param2:Array, param3:Array, param4:Array, param5:Matrix = null, param6:String = "pad", param7:String = "rgb", param8:Number = 0) : void;
      
      function beginBitmapFill(param1:uint, param2:Matrix = null, param3:Boolean = true, param4:Boolean = false) : void;
      
      function endFill() : void;
      
      function lineStyle(param1:Number = NaN, param2:uint = 0, param3:Number = 1, param4:Boolean = false, param5:String = "normal", param6:String = null, param7:String = null, param8:String = null, param9:Number = 3) : void;
      
      function lineGradientStyle(param1:String, param2:Array, param3:Array, param4:Array, param5:Matrix = null, param6:String = "pad", param7:String = "rgb", param8:Number = 0) : void;
      
      function lineBitmapStyle(param1:uint, param2:Matrix = null, param3:Boolean = true, param4:Boolean = false) : void;
      
      function moveTo(param1:Number, param2:Number) : void;
      
      function lineTo(param1:Number, param2:Number) : void;
      
      function curveTo(param1:Number, param2:Number, param3:Number, param4:Number) : void;
      
      function _15040(param1:int) : void;
   }
}

