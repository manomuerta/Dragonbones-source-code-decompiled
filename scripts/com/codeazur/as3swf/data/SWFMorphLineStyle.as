package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.utils.ColorUtils;
   
   public class SWFMorphLineStyle
   {
      public var startWidth:uint;
      
      public var endWidth:uint;
      
      public var startColor:uint;
      
      public var endColor:uint;
      
      public var startCapsStyle:uint = 0;
      
      public var endCapsStyle:uint = 0;
      
      public var jointStyle:uint = 0;
      
      public var hasFillFlag:Boolean = false;
      
      public var noHScaleFlag:Boolean = false;
      
      public var noVScaleFlag:Boolean = false;
      
      public var pixelHintingFlag:Boolean = false;
      
      public var noClose:Boolean = false;
      
      public var miterLimitFactor:Number = 3;
      
      public var fillType:SWFMorphFillStyle;
      
      public function SWFMorphLineStyle(param1:SWFData = null, param2:uint = 1)
      {
         super();
         if(param1 != null)
         {
            this.parse(param1,param2);
         }
      }
      
      public function parse(param1:SWFData, param2:uint = 1) : void
      {
         this.startWidth = param1.readUI16();
         this.endWidth = param1.readUI16();
         this.startColor = param1.readRGBA();
         this.endColor = param1.readRGBA();
      }
      
      public function publish(param1:SWFData, param2:uint = 1) : void
      {
         param1.writeUI16(this.startWidth);
         param1.writeUI16(this.endWidth);
         param1.writeRGBA(this.startColor);
         param1.writeRGBA(this.endColor);
      }
      
      public function getMorphedLineStyle(param1:Number = 0) : SWFLineStyle
      {
         var _loc2_:SWFLineStyle = new SWFLineStyle();
         if(this.hasFillFlag)
         {
            _loc2_.fillType = this.fillType.getMorphedFillStyle(param1);
         }
         else
         {
            _loc2_.color = ColorUtils.interpolate(this.startColor,this.endColor,param1);
            _loc2_.width = this.startWidth + (this.endWidth - this.startWidth) * param1;
         }
         _loc2_.startCapsStyle = this.startCapsStyle;
         _loc2_.endCapsStyle = this.endCapsStyle;
         _loc2_.jointStyle = this.jointStyle;
         _loc2_.hasFillFlag = this.hasFillFlag;
         _loc2_.noHScaleFlag = this.noHScaleFlag;
         _loc2_.noVScaleFlag = this.noVScaleFlag;
         _loc2_.pixelHintingFlag = this.pixelHintingFlag;
         _loc2_.noClose = this.noClose;
         _loc2_.miterLimitFactor = this.miterLimitFactor;
         return _loc2_;
      }
      
      public function toString() : String
      {
         return "[SWFMorphLineStyle] " + "StartWidth: " + this.startWidth + ", " + "EndWidth: " + this.endWidth + ", " + "StartColor: " + ColorUtils.rgbaToString(this.startColor) + ", " + "EndColor: " + ColorUtils.rgbaToString(this.endColor);
      }
   }
}

