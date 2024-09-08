package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.utils.ColorUtils;
   
   public class SWFGradientRecord
   {
      public var ratio:uint;
      
      public var color:uint;
      
      protected var _level:uint;
      
      public function SWFGradientRecord(param1:SWFData = null, param2:uint = 1)
      {
         super();
         if(param1 != null)
         {
            this.parse(param1,param2);
         }
      }
      
      public function parse(param1:SWFData, param2:uint) : void
      {
         this._level = param2;
         this.ratio = param1.readUI8();
         this.color = param2 <= 2 ? param1.readRGB() : param1.readRGBA();
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         param1.writeUI8(this.ratio);
         if(param2 <= 2)
         {
            param1.writeRGB(this.color);
         }
         else
         {
            param1.writeRGBA(this.color);
         }
      }
      
      public function clone() : SWFGradientRecord
      {
         var _loc1_:SWFGradientRecord = new SWFGradientRecord();
         _loc1_.ratio = this.ratio;
         _loc1_.color = this.color;
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "[" + this.ratio + "," + (this._level <= 2 ? ColorUtils.rgbToString(this.color) : ColorUtils.rgbaToString(this.color)) + "]";
      }
   }
}

