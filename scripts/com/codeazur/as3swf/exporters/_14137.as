package com.codeazur.as3swf.exporters
{
   import com.codeazur.as3swf.SWF;
   import com.codeazur.as3swf.data.SWFRectangle;
   import com.codeazur.as3swf.exporters.core.DefaultShapeExporter;
   import com.codeazur.as3swf.tags.TagDefineShape;
   import flash.geom.Matrix;
   
   public class _14137 extends DefaultShapeExporter
   {
      public var cmd:Array;
      
      public var _14721:Function;
      
      private var tag:TagDefineShape;
      
      public function _14137(param1:TagDefineShape, param2:SWF, param3:SWFRectangle = null)
      {
         this.tag = param1;
         super(param2);
      }
      
      override public function beginShape() : void
      {
         this.cmd = [];
      }
      
      override public function beginFill(param1:uint, param2:Number = 1) : void
      {
         this.cmd.push(["beginFill",[param1,param2]]);
      }
      
      override public function beginGradientFill(param1:String, param2:Array, param3:Array, param4:Array, param5:Matrix = null, param6:String = "pad", param7:String = "rgb", param8:Number = 0) : void
      {
         this.cmd.push(["beginGradientFill",[param1,param2,param3,param4,param5,param6,param7,param8]]);
      }
      
      override public function endFill() : void
      {
         this.cmd.push(["endFill",null]);
      }
      
      override public function lineStyle(param1:Number = NaN, param2:uint = 0, param3:Number = 1, param4:Boolean = false, param5:String = "normal", param6:String = "round", param7:String = "round", param8:String = "round", param9:Number = 3) : void
      {
         this.cmd.push(["lineStyle",[param1,param2,param3,param4,param5,param6,param8,param9]]);
      }
      
      override public function moveTo(param1:Number, param2:Number) : void
      {
         this.cmd.push(["moveTo",[param1,param2]]);
      }
      
      override public function lineTo(param1:Number, param2:Number) : void
      {
         this.cmd.push(["lineTo",[param1,param2]]);
      }
      
      override public function curveTo(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         this.cmd.push(["curveTo",[param1,param2,param3,param4]]);
      }
      
      override public function endLines(param1:Boolean) : void
      {
         this.cmd.push(["lineStyle",[0,0,0]]);
      }
      
      override public function beginBitmapFill(param1:uint, param2:Matrix = null, param3:Boolean = true, param4:Boolean = false) : void
      {
         this.cmd.push(["beginBitmapFill",[param1,param2,param3,param4]]);
      }
      
      override public function lineBitmapStyle(param1:uint, param2:Matrix = null, param3:Boolean = true, param4:Boolean = false) : void
      {
         this.cmd.push(["lineBitmapStyle",[param1,param2,param3,param4]]);
      }
      
      override public function lineGradientStyle(param1:String, param2:Array, param3:Array, param4:Array, param5:Matrix = null, param6:String = "pad", param7:String = "rgb", param8:Number = 0) : void
      {
         this.cmd.push(["lineGradientStyle",[param1,param2,param3,param4,param5,param6,param7,param8]]);
      }
      
      override public function endShape() : void
      {
         this.cmd.push(["endShape",null]);
         this._14721.call(null,this.tag.characterId,this.cmd);
      }
   }
}

