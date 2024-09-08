package com.codeazur.as3swf.data.filters
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.utils.StringUtils;
   import flash.filters.BitmapFilter;
   import flash.filters.ColorMatrixFilter;
   
   public class FilterColorMatrix extends Filter implements IFilter
   {
      protected var _colorMatrix:Vector.<Number>;
      
      public function FilterColorMatrix(param1:uint)
      {
         super(param1);
         this._colorMatrix = new Vector.<Number>();
      }
      
      public function get colorMatrix() : Vector.<Number>
      {
         return this._colorMatrix;
      }
      
      override public function get filter() : BitmapFilter
      {
         return new ColorMatrixFilter([this.colorMatrix[0],this.colorMatrix[1],this.colorMatrix[2],this.colorMatrix[3],this.colorMatrix[4],this.colorMatrix[5],this.colorMatrix[6],this.colorMatrix[7],this.colorMatrix[8],this.colorMatrix[9],this.colorMatrix[10],this.colorMatrix[11],this.colorMatrix[12],this.colorMatrix[13],this.colorMatrix[14],this.colorMatrix[15],this.colorMatrix[16],this.colorMatrix[17],this.colorMatrix[18],this.colorMatrix[19]]);
      }
      
      override public function parse(param1:SWFData) : void
      {
         var _loc2_:uint = 0;
         while(_loc2_ < 20)
         {
            this.colorMatrix.push(param1.readFLOAT());
            _loc2_++;
         }
      }
      
      override public function publish(param1:SWFData) : void
      {
         var _loc2_:uint = 0;
         while(_loc2_ < 20)
         {
            param1.writeFLOAT(this.colorMatrix[_loc2_]);
            _loc2_++;
         }
      }
      
      override public function clone() : IFilter
      {
         var _loc1_:FilterColorMatrix = new FilterColorMatrix(id);
         var _loc2_:uint = 0;
         while(_loc2_ < 20)
         {
            _loc1_.colorMatrix.push(this.colorMatrix[_loc2_]);
            _loc2_++;
         }
         return _loc1_;
      }
      
      override public function toString(param1:uint = 0) : String
      {
         var _loc2_:String = StringUtils.repeat(param1 + 2);
         return "[ColorMatrixFilter]" + "\n" + _loc2_ + "[R] " + this.colorMatrix[0] + ", " + this.colorMatrix[1] + ", " + this.colorMatrix[2] + ", " + this.colorMatrix[3] + ", " + this.colorMatrix[4] + "\n" + _loc2_ + "[G] " + this.colorMatrix[5] + ", " + this.colorMatrix[6] + ", " + this.colorMatrix[7] + ", " + this.colorMatrix[8] + ", " + this.colorMatrix[9] + "\n" + _loc2_ + "[B] " + this.colorMatrix[10] + ", " + this.colorMatrix[11] + ", " + this.colorMatrix[12] + ", " + this.colorMatrix[13] + ", " + this.colorMatrix[14] + "\n" + _loc2_ + "[A] " + this.colorMatrix[15] + ", " + this.colorMatrix[16] + ", " + this.colorMatrix[17] + ", " + this.colorMatrix[18] + ", " + this.colorMatrix[19];
      }
   }
}

