package com.codeazur.as3swf.data.filters
{
   import com.codeazur.as3swf.SWFData;
   import flash.filters.BitmapFilter;
   import flash.filters.BlurFilter;
   
   public class FilterBlur extends Filter implements IFilter
   {
      public var blurX:Number;
      
      public var _15009:int;
      
      public var blurY:Number;
      
      public var _15010:int;
      
      public var passes:uint;
      
      public function FilterBlur(param1:uint)
      {
         super(param1);
      }
      
      override public function get filter() : BitmapFilter
      {
         return new BlurFilter(this.blurX,this.blurY,this.passes);
      }
      
      override public function parse(param1:SWFData) : void
      {
         var _loc2_:Array = param1._15006();
         this._15009 = _loc2_[0];
         this.blurX = _loc2_[1];
         _loc2_ = param1._15006();
         this._15010 = _loc2_[0];
         this.blurY = _loc2_[1];
         this.passes = param1.readUI8() >> 3;
      }
      
      override public function publish(param1:SWFData) : void
      {
         param1.writeFIXED(this.blurX);
         param1.writeFIXED(this.blurY);
         param1.writeUI8(this.passes << 3);
      }
      
      override public function clone() : IFilter
      {
         var _loc1_:FilterBlur = new FilterBlur(id);
         _loc1_.blurX = this.blurX;
         _loc1_.blurY = this.blurY;
         _loc1_.passes = this.passes;
         return _loc1_;
      }
      
      override public function toString(param1:uint = 0) : String
      {
         return "[BlurFilter] " + "BlurX: " + this.blurX + ", " + "BlurY: " + this.blurY + ", " + "Passes: " + this.passes;
      }
   }
}

