package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.consts.LineCapsStyle;
   import com.codeazur.as3swf.data.consts.LineJointStyle;
   import com.codeazur.as3swf.utils.ColorUtils;
   
   public class SWFMorphLineStyle2 extends SWFMorphLineStyle
   {
      public function SWFMorphLineStyle2(param1:SWFData = null, param2:uint = 1)
      {
         super(param1,param2);
      }
      
      override public function parse(param1:SWFData, param2:uint = 1) : void
      {
         startWidth = param1.readUI16();
         endWidth = param1.readUI16();
         startCapsStyle = param1.readUB(2);
         jointStyle = param1.readUB(2);
         hasFillFlag = param1.readUB(1) == 1;
         noHScaleFlag = param1.readUB(1) == 1;
         noVScaleFlag = param1.readUB(1) == 1;
         pixelHintingFlag = param1.readUB(1) == 1;
         var _loc3_:uint = param1.readUB(5);
         noClose = param1.readUB(1) == 1;
         endCapsStyle = param1.readUB(2);
         if(jointStyle == LineJointStyle.MITER)
         {
            miterLimitFactor = param1.readFIXED8();
         }
         if(hasFillFlag)
         {
            fillType = param1.readMORPHFILLSTYLE(param2);
         }
         else
         {
            startColor = param1.readRGBA();
            endColor = param1.readRGBA();
         }
      }
      
      override public function publish(param1:SWFData, param2:uint = 1) : void
      {
         param1.writeUI16(startWidth);
         param1.writeUI16(endWidth);
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
            param1.writeMORPHFILLSTYLE(fillType,param2);
         }
         else
         {
            param1.writeRGBA(startColor);
            param1.writeRGBA(endColor);
         }
      }
      
      override public function toString() : String
      {
         var _loc1_:String = "[SWFMorphLineStyle2] " + "StartWidth: " + startWidth + ", " + "EndWidth: " + endWidth + ", " + "StartCaps: " + LineCapsStyle.toString(startCapsStyle) + ", " + "EndCaps: " + LineCapsStyle.toString(endCapsStyle) + ", " + "Joint: " + LineJointStyle.toString(jointStyle);
         if(hasFillFlag)
         {
            _loc1_ += ", Fill: " + fillType.toString();
         }
         else
         {
            _loc1_ += ", StartColor: " + ColorUtils.rgbaToString(startColor);
            _loc1_ += ", EndColor: " + ColorUtils.rgbaToString(endColor);
         }
         return _loc1_;
      }
   }
}

