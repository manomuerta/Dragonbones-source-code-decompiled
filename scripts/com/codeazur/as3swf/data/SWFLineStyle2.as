package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.consts.LineCapsStyle;
   import com.codeazur.as3swf.data.consts.LineJointStyle;
   import com.codeazur.as3swf.utils.ColorUtils;
   
   public class SWFLineStyle2 extends SWFLineStyle
   {
      public function SWFLineStyle2(param1:SWFData = null, param2:uint = 1)
      {
         super(param1,param2);
      }
      
      override public function parse(param1:SWFData, param2:uint = 1) : void
      {
         width = param1.readUI16();
         startCapsStyle = param1.readUB(2);
         jointStyle = param1.readUB(2);
         hasFillFlag = param1.readUB(1) == 1;
         noHScaleFlag = param1.readUB(1) == 1;
         noVScaleFlag = param1.readUB(1) == 1;
         pixelHintingFlag = param1.readUB(1) == 1;
         param1.readUB(5);
         noClose = param1.readUB(1) == 1;
         endCapsStyle = param1.readUB(2);
         if(jointStyle == LineJointStyle.MITER)
         {
            miterLimitFactor = param1.readFIXED8();
         }
         if(hasFillFlag)
         {
            fillType = param1.readFILLSTYLE(param2);
         }
         else
         {
            color = param1.readRGBA();
         }
      }
      
      override public function publish(param1:SWFData, param2:uint = 1) : void
      {
         param1.writeUI16(width);
         param1.writeUB(2,startCapsStyle);
         param1.writeUB(2,jointStyle);
         param1.writeUB(1,hasFillFlag ? 1 : 0);
         param1.writeUB(1,noHScaleFlag ? 1 : 0);
         param1.writeUB(1,noVScaleFlag ? 1 : 0);
         param1.writeUB(1,pixelHintingFlag ? 1 : 0);
         param1.writeUB(5,0);
         param1.writeUB(1,noClose ? 1 : 0);
         param1.writeUB(2,endCapsStyle);
         if(jointStyle == LineJointStyle.MITER)
         {
            param1.writeFIXED8(miterLimitFactor);
         }
         if(hasFillFlag)
         {
            param1.writeFILLSTYLE(fillType,param2);
         }
         else
         {
            param1.writeRGBA(color);
         }
      }
      
      override public function toString() : String
      {
         var _loc1_:* = "[SWFLineStyle2] Width: " + width + ", " + "StartCaps: " + LineCapsStyle.toString(startCapsStyle) + ", " + "EndCaps: " + LineCapsStyle.toString(endCapsStyle) + ", " + "Joint: " + LineJointStyle.toString(jointStyle) + ", ";
         if(noClose)
         {
            _loc1_ += "NoClose, ";
         }
         if(noHScaleFlag)
         {
            _loc1_ += "NoHScale, ";
         }
         if(noVScaleFlag)
         {
            _loc1_ += "NoVScale, ";
         }
         if(pixelHintingFlag)
         {
            _loc1_ += "PixelHinting, ";
         }
         if(hasFillFlag)
         {
            _loc1_ += "Fill: " + fillType.toString();
         }
         else
         {
            _loc1_ += "Color: " + ColorUtils.rgbaToString(color);
         }
         return _loc1_;
      }
   }
}

