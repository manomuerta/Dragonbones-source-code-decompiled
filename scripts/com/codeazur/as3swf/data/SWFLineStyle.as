package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.utils.ColorUtils;
   
   public class SWFLineStyle
   {
      public var width:uint;
      
      public var color:uint;
      
      public var _level:uint;
      
      public var startCapsStyle:uint = 0;
      
      public var endCapsStyle:uint = 0;
      
      public var jointStyle:uint = 0;
      
      public var hasFillFlag:Boolean = false;
      
      public var noHScaleFlag:Boolean = false;
      
      public var noVScaleFlag:Boolean = false;
      
      public var pixelHintingFlag:Boolean = false;
      
      public var noClose:Boolean = false;
      
      public var miterLimitFactor:Number = 3;
      
      public var fillType:SWFFillStyle;
      
      public function SWFLineStyle(param1:SWFData = null, param2:uint = 1)
      {
         super();
         if(param1 != null)
         {
            this.parse(param1,param2);
         }
      }
      
      public function parse(param1:SWFData, param2:uint = 1) : void
      {
         this._level = param2;
         this.width = param1.readUI16();
         this.color = param2 <= 2 ? param1.readRGB() : param1.readRGBA();
      }
      
      public function publish(param1:SWFData, param2:uint = 1) : void
      {
         param1.writeUI16(this.width);
         if(param2 <= 2)
         {
            param1.writeRGB(this.color);
         }
         else
         {
            param1.writeRGBA(this.color);
         }
      }
      
      public function clone() : SWFLineStyle
      {
         var _loc1_:SWFLineStyle = new SWFLineStyle();
         _loc1_.width = this.width;
         _loc1_.color = this.color;
         _loc1_.startCapsStyle = this.startCapsStyle;
         _loc1_.endCapsStyle = this.endCapsStyle;
         _loc1_.jointStyle = this.jointStyle;
         _loc1_.hasFillFlag = this.hasFillFlag;
         _loc1_.noHScaleFlag = this.noHScaleFlag;
         _loc1_.noVScaleFlag = this.noVScaleFlag;
         _loc1_.pixelHintingFlag = this.pixelHintingFlag;
         _loc1_.noClose = this.noClose;
         _loc1_.miterLimitFactor = this.miterLimitFactor;
         _loc1_.fillType = this.fillType.clone();
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "[SWFLineStyle] Width: " + this.width + " Color: " + (this._level <= 2 ? ColorUtils.rgbToString(this.color) : ColorUtils.rgbaToString(this.color));
      }
   }
}

