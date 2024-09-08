package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.utils.NumberUtils;
   import flash.geom.Rectangle;
   
   public class SWFRectangle
   {
      public var xmin:int = 0;
      
      public var xmax:int = 11000;
      
      public var ymin:int = 0;
      
      public var ymax:int = 8000;
      
      protected var _rectangle:Rectangle;
      
      public function SWFRectangle(param1:SWFData = null)
      {
         super();
         this._rectangle = new Rectangle();
         if(param1 != null)
         {
            this.parse(param1);
         }
      }
      
      public function parse(param1:SWFData) : void
      {
         param1.resetBitsPending();
         var _loc2_:uint = param1.readUB(5);
         this.xmin = param1.readSB(_loc2_);
         this.xmax = param1.readSB(_loc2_);
         this.ymin = param1.readSB(_loc2_);
         this.ymax = param1.readSB(_loc2_);
      }
      
      public function publish(param1:SWFData) : void
      {
         var _loc2_:uint = param1.calculateMaxBits(true,[this.xmin,this.xmax,this.ymin,this.ymax]);
         param1.resetBitsPending();
         param1.writeUB(5,_loc2_);
         param1.writeSB(_loc2_,this.xmin);
         param1.writeSB(_loc2_,this.xmax);
         param1.writeSB(_loc2_,this.ymin);
         param1.writeSB(_loc2_,this.ymax);
      }
      
      public function clone() : SWFRectangle
      {
         var _loc1_:SWFRectangle = new SWFRectangle();
         _loc1_.xmin = this.xmin;
         _loc1_.xmax = this.xmax;
         _loc1_.ymin = this.ymin;
         _loc1_.ymax = this.ymax;
         return _loc1_;
      }
      
      public function get rect() : Rectangle
      {
         this._rectangle.left = NumberUtils.roundPixels20(this.xmin / 20);
         this._rectangle.right = NumberUtils.roundPixels20(this.xmax / 20);
         this._rectangle.top = NumberUtils.roundPixels20(this.ymin / 20);
         this._rectangle.bottom = NumberUtils.roundPixels20(this.ymax / 20);
         return this._rectangle;
      }
      
      public function toString() : String
      {
         return "(" + this.xmin + "," + this.xmax + "," + this.ymin + "," + this.ymax + ")";
      }
      
      public function toStringSize() : String
      {
         return "(" + (Number(this.xmax) / 20 - Number(this.xmin) / 20) + "," + (Number(this.ymax) / 20 - Number(this.ymin) / 20) + ")";
      }
   }
}

