package com.codeazur.as3swf.exporters.core
{
   import com.codeazur.as3swf.SWF;
   import flash.geom.Matrix;
   
   public class DefaultShapeExporter implements IShapeExporter
   {
      protected var swf:SWF;
      
      public function DefaultShapeExporter(param1:SWF)
      {
         super();
         this.swf = param1;
      }
      
      public function beginShape() : void
      {
      }
      
      public function endShape() : void
      {
      }
      
      public function beginFills() : void
      {
      }
      
      public function endFills() : void
      {
      }
      
      public function beginLines() : void
      {
      }
      
      public function endLines(param1:Boolean) : void
      {
      }
      
      public function beginFill(param1:uint, param2:Number = 1) : void
      {
      }
      
      public function beginGradientFill(param1:String, param2:Array, param3:Array, param4:Array, param5:Matrix = null, param6:String = "pad", param7:String = "rgb", param8:Number = 0) : void
      {
      }
      
      public function beginBitmapFill(param1:uint, param2:Matrix = null, param3:Boolean = true, param4:Boolean = false) : void
      {
      }
      
      public function endFill() : void
      {
      }
      
      public function lineBitmapStyle(param1:uint, param2:Matrix = null, param3:Boolean = true, param4:Boolean = false) : void
      {
      }
      
      public function lineStyle(param1:Number = NaN, param2:uint = 0, param3:Number = 1, param4:Boolean = false, param5:String = "normal", param6:String = null, param7:String = null, param8:String = null, param9:Number = 3) : void
      {
      }
      
      public function lineGradientStyle(param1:String, param2:Array, param3:Array, param4:Array, param5:Matrix = null, param6:String = "pad", param7:String = "rgb", param8:Number = 0) : void
      {
      }
      
      public function moveTo(param1:Number, param2:Number) : void
      {
      }
      
      public function lineTo(param1:Number, param2:Number) : void
      {
      }
      
      public function curveTo(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
      }
      
      public function _15040(param1:int) : void
      {
      }
   }
}

