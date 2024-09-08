package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.utils.ColorUtils;
   import com.codeazur.as3swf.utils.MatrixUtils;
   
   public class SWFMorphFillStyle
   {
      public var type:uint;
      
      public var startColor:uint;
      
      public var endColor:uint;
      
      public var startGradientMatrix:SWFMatrix;
      
      public var endGradientMatrix:SWFMatrix;
      
      public var gradient:SWFMorphGradient;
      
      public var bitmapId:uint;
      
      public var startBitmapMatrix:SWFMatrix;
      
      public var endBitmapMatrix:SWFMatrix;
      
      public function SWFMorphFillStyle(param1:SWFData = null, param2:uint = 1)
      {
         super();
         if(param1 != null)
         {
            this.parse(param1,param2);
         }
      }
      
      public function parse(param1:SWFData, param2:uint = 1) : void
      {
         this.type = param1.readUI8();
         switch(this.type)
         {
            case 0:
               this.startColor = param1.readRGBA();
               this.endColor = param1.readRGBA();
               break;
            case 16:
            case 18:
            case 19:
               this.startGradientMatrix = param1.readMATRIX();
               this.endGradientMatrix = param1.readMATRIX();
               this.gradient = this.type == 19 ? param1.readMORPHFOCALGRADIENT(param2) : param1.readMORPHGRADIENT(param2);
               break;
            case 64:
            case 65:
            case 66:
            case 67:
               this.bitmapId = param1.readUI16();
               this.startBitmapMatrix = param1.readMATRIX();
               this.endBitmapMatrix = param1.readMATRIX();
               break;
            default:
               throw new Error("Unknown fill style type: 0x" + this.type.toString(16));
         }
      }
      
      public function publish(param1:SWFData, param2:uint = 1) : void
      {
         param1.writeUI8(this.type);
         switch(this.type)
         {
            case 0:
               param1.writeRGBA(this.startColor);
               param1.writeRGBA(this.endColor);
               break;
            case 16:
            case 18:
            case 19:
               param1.writeMATRIX(this.startGradientMatrix);
               param1.writeMATRIX(this.endGradientMatrix);
               if(this.type == 19)
               {
                  param1.writeMORPHFOCALGRADIENT(SWFMorphFocalGradient(this.gradient),param2);
               }
               else
               {
                  param1.writeMORPHGRADIENT(this.gradient,param2);
               }
               break;
            case 64:
            case 65:
            case 66:
            case 67:
               param1.writeUI16(this.bitmapId);
               param1.writeMATRIX(this.startBitmapMatrix);
               param1.writeMATRIX(this.endBitmapMatrix);
               break;
            default:
               throw new Error("Unknown fill style type: 0x" + this.type.toString(16));
         }
      }
      
      public function getMorphedFillStyle(param1:Number = 0) : SWFFillStyle
      {
         var _loc2_:SWFFillStyle = new SWFFillStyle();
         _loc2_.type = this.type;
         switch(this.type)
         {
            case 0:
               _loc2_.rgb = ColorUtils.interpolate(this.startColor,this.endColor,param1);
               break;
            case 16:
            case 18:
               _loc2_.gradientMatrix = MatrixUtils.interpolate(this.startGradientMatrix,this.endGradientMatrix,param1);
               _loc2_.gradient = this.gradient.getMorphedGradient(param1);
               break;
            case 64:
            case 65:
            case 66:
            case 67:
               _loc2_.bitmapId = this.bitmapId;
               _loc2_.bitmapMatrix = MatrixUtils.interpolate(this.startBitmapMatrix,this.endBitmapMatrix,param1);
         }
         return _loc2_;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "[SWFMorphFillStyle] Type: " + this.type.toString(16);
         switch(this.type)
         {
            case 0:
               _loc1_ += " (solid), StartColor: " + ColorUtils.rgbaToString(this.startColor) + ", EndColor: " + ColorUtils.rgbaToString(this.endColor);
               break;
            case 16:
               _loc1_ += " (linear gradient), Gradient: " + this.gradient;
               break;
            case 18:
               _loc1_ += " (radial gradient), Gradient: " + this.gradient;
               break;
            case 19:
               _loc1_ += " (focal radial gradient), Gradient: " + this.gradient;
               break;
            case 64:
               _loc1_ += " (repeating bitmap), BitmapID: " + this.bitmapId;
               break;
            case 65:
               _loc1_ += " (clipped bitmap), BitmapID: " + this.bitmapId;
               break;
            case 66:
               _loc1_ += " (non-smoothed repeating bitmap), BitmapID: " + this.bitmapId;
               break;
            case 67:
               _loc1_ += " (non-smoothed clipped bitmap), BitmapID: " + this.bitmapId;
         }
         return _loc1_;
      }
   }
}

