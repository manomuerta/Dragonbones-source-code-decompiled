package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.utils.ColorUtils;
   
   public class SWFMorphGradientRecord
   {
      public var startRatio:uint;
      
      public var startColor:uint;
      
      public var endRatio:uint;
      
      public var endColor:uint;
      
      public function SWFMorphGradientRecord(param1:SWFData = null)
      {
         super();
         if(param1 != null)
         {
            this.parse(param1);
         }
      }
      
      public function parse(param1:SWFData) : void
      {
         this.startRatio = param1.readUI8();
         this.startColor = param1.readRGBA();
         this.endRatio = param1.readUI8();
         this.endColor = param1.readRGBA();
      }
      
      public function publish(param1:SWFData) : void
      {
         param1.writeUI8(this.startRatio);
         param1.writeRGBA(this.startColor);
         param1.writeUI8(this.endRatio);
         param1.writeRGBA(this.endColor);
      }
      
      public function getMorphedGradientRecord(param1:Number = 0) : SWFGradientRecord
      {
         var _loc2_:SWFGradientRecord = new SWFGradientRecord();
         _loc2_.color = ColorUtils.interpolate(this.startColor,this.endColor,param1);
         _loc2_.ratio = this.startRatio + (this.endRatio - this.startRatio) * param1;
         return _loc2_;
      }
      
      public function toString() : String
      {
         return "[" + this.startRatio + "," + ColorUtils.rgbaToString(this.startColor) + "," + this.endRatio + "," + ColorUtils.rgbaToString(this.endColor) + "]";
      }
   }
}

