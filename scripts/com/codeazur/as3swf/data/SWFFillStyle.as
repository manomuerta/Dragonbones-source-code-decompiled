package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.utils.ColorUtils;
   import com.codeazur.utils.StringUtils;
   
   public class SWFFillStyle
   {
      public var type:uint;
      
      public var rgb:uint;
      
      public var gradient:SWFGradient;
      
      public var gradientMatrix:SWFMatrix;
      
      public var bitmapId:uint;
      
      public var bitmapMatrix:SWFMatrix;
      
      protected var _level:uint;
      
      public function SWFFillStyle(param1:SWFData = null, param2:uint = 1)
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
         this.type = param1.readUI8();
         switch(this.type)
         {
            case 0:
               this.rgb = param2 <= 2 ? param1.readRGB() : param1.readRGBA();
               break;
            case 16:
            case 18:
            case 19:
               this.gradientMatrix = param1.readMATRIX();
               this.gradient = this.type == 19 ? param1.readFOCALGRADIENT(param2) : param1.readGRADIENT(param2);
               break;
            case 64:
            case 65:
            case 66:
            case 67:
               this.bitmapId = param1.readUI16();
               this.bitmapMatrix = param1.readMATRIX();
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
               if(param2 <= 2)
               {
                  param1.writeRGB(this.rgb);
               }
               else
               {
                  param1.writeRGBA(this.rgb);
               }
               break;
            case 16:
            case 18:
               param1.writeMATRIX(this.gradientMatrix);
               param1.writeGRADIENT(this.gradient,param2);
               break;
            case 19:
               param1.writeMATRIX(this.gradientMatrix);
               param1.writeFOCALGRADIENT(SWFFocalGradient(this.gradient),param2);
               break;
            case 64:
            case 65:
            case 66:
            case 67:
               param1.writeUI16(this.bitmapId);
               param1.writeMATRIX(this.bitmapMatrix);
               break;
            default:
               throw new Error("Unknown fill style type: 0x" + this.type.toString(16));
         }
      }
      
      public function clone() : SWFFillStyle
      {
         var _loc1_:SWFFillStyle = new SWFFillStyle();
         _loc1_.type = this.type;
         _loc1_.rgb = this.rgb;
         _loc1_.gradient = this.gradient.clone();
         _loc1_.gradientMatrix = this.gradientMatrix.clone();
         _loc1_.bitmapId = this.bitmapId;
         _loc1_.bitmapMatrix = this.bitmapMatrix.clone();
         return _loc1_;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "[SWFFillStyle] Type: " + StringUtils.printf("%02x",this.type);
         switch(this.type)
         {
            case 0:
               _loc1_ += " (solid), Color: " + (this._level <= 2 ? ColorUtils.rgbToString(this.rgb) : ColorUtils.rgbaToString(this.rgb));
               break;
            case 16:
               _loc1_ += " (linear gradient), Gradient: " + this.gradient + ", Matrix: " + this.gradientMatrix;
               break;
            case 18:
               _loc1_ += " (radial gradient), Gradient: " + this.gradient + ", Matrix: " + this.gradientMatrix;
               break;
            case 19:
               _loc1_ += " (focal radial gradient), Gradient: " + this.gradient + ", Matrix: " + this.gradientMatrix + ", FocalPoint: " + this.gradient.focalPoint;
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

