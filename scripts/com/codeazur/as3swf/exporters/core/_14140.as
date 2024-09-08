package com.codeazur.as3swf.exporters.core
{
   public interface _14140
   {
      function beginShape() : void;
      
      function endShape() : void;
      
      function beginFills() : void;
      
      function endFills() : void;
      
      function beginLines() : void;
      
      function endLines() : void;
      
      function beginFill(param1:Array, param2:Array = null) : void;
      
      function beginGradientFill(param1:Array, param2:Array, param3:Array, param4:Array, param5:Array = null, param6:String = "pad", param7:String = "rgb", param8:Number = 0) : void;
      
      function beginBitmapFill(param1:Array, param2:Array = null, param3:Array = null, param4:Boolean = false) : void;
      
      function lineBitmapStyle(param1:Array, param2:Array = null, param3:Array = null, param4:Boolean = false) : void;
      
      function endFill() : void;
      
      function lineStyle(param1:Array = null, param2:Array = null, param3:Array = null, param4:Boolean = false, param5:String = "normal", param6:Array = null, param7:String = null, param8:Array = null, param9:Array = null) : void;
      
      function lineGradientStyle(param1:Array, param2:Array, param3:Array, param4:Array, param5:Array = null, param6:String = "pad", param7:String = "rgb", param8:Number = 0) : void;
      
      function moveTo(param1:Array, param2:Array) : void;
      
      function lineTo(param1:Array, param2:Array) : void;
      
      function curveTo(param1:Array, param2:Array, param3:Array, param4:Array) : void;
   }
}

