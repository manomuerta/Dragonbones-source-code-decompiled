package com.codeazur.as3swf.data.filters
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.utils.ColorUtils;
   import flash.filters.BitmapFilter;
   import flash.filters.DropShadowFilter;
   
   public class FilterDropShadow extends Filter implements IFilter
   {
      public var dropShadowColor:uint;
      
      public var blurX:Number;
      
      public var _15009:int;
      
      public var blurY:Number;
      
      public var _15010:int;
      
      public var angle:Number;
      
      public var _15011:int;
      
      public var distance:Number;
      
      public var _15008:int;
      
      public var strength:Number;
      
      public var _15007:int;
      
      public var innerShadow:Boolean;
      
      public var knockout:Boolean;
      
      public var compositeSource:Boolean;
      
      public var passes:uint;
      
      public function FilterDropShadow(param1:uint)
      {
         super(param1);
      }
      
      override public function get filter() : BitmapFilter
      {
         return new DropShadowFilter(this.distance,this.angle * 180 / Math.PI,ColorUtils.rgb(this.dropShadowColor),ColorUtils.alpha(this.dropShadowColor),this.blurX,this.blurY,this.strength,this.passes,this.innerShadow,this.knockout);
      }
      
      override public function parse(param1:SWFData) : void
      {
         this.dropShadowColor = param1.readRGBA();
         var _loc2_:Array = param1._15006();
         this._15009 = _loc2_[0];
         this.blurX = _loc2_[1];
         _loc2_ = param1._15006();
         this._15010 = _loc2_[0];
         this.blurY = _loc2_[1];
         _loc2_ = param1._15006();
         this._15011 = _loc2_[0];
         this.angle = _loc2_[1];
         _loc2_ = param1._15006();
         this._15008 = _loc2_[0];
         this.distance = _loc2_[1];
         _loc2_ = param1._15005();
         this._15007 = _loc2_[0];
         this.strength = _loc2_[1];
         var _loc3_:uint = param1.readUI8();
         this.innerShadow = (_loc3_ & 0x80) != 0;
         this.knockout = (_loc3_ & 0x40) != 0;
         this.compositeSource = (_loc3_ & 0x20) != 0;
         this.passes = _loc3_ & 0x1F;
      }
      
      override public function publish(param1:SWFData) : void
      {
         param1.writeRGBA(this.dropShadowColor);
         param1.writeFIXED(this.blurX);
         param1.writeFIXED(this.blurY);
         param1.writeFIXED(this.angle);
         param1.writeFIXED(this.distance);
         param1.writeFIXED8(this.strength);
         var _loc2_:uint = uint(this.passes & 0x1F);
         if(this.innerShadow)
         {
            _loc2_ |= 128;
         }
         if(this.knockout)
         {
            _loc2_ |= 64;
         }
         if(this.compositeSource)
         {
            _loc2_ |= 32;
         }
         param1.writeUI8(_loc2_);
      }
      
      override public function clone() : IFilter
      {
         var _loc1_:FilterDropShadow = new FilterDropShadow(id);
         _loc1_.dropShadowColor = this.dropShadowColor;
         _loc1_.blurX = this.blurX;
         _loc1_.blurY = this.blurY;
         _loc1_.angle = this.angle;
         _loc1_.distance = this.distance;
         _loc1_.strength = this.strength;
         _loc1_.passes = this.passes;
         _loc1_.innerShadow = this.innerShadow;
         _loc1_.knockout = this.knockout;
         _loc1_.compositeSource = this.compositeSource;
         return _loc1_;
      }
      
      override public function toString(param1:uint = 0) : String
      {
         var _loc2_:String = "[DropShadowFilter] " + "DropShadowColor: " + ColorUtils.rgbToString(this.dropShadowColor) + ", " + "BlurX: " + this.blurX + ", " + "BlurY: " + this.blurY + ", " + "Angle: " + this.angle + ", " + "Distance: " + this.distance + ", " + "Strength: " + this.strength + ", " + "Passes: " + this.passes;
         var _loc3_:Array = [];
         if(this.innerShadow)
         {
            _loc3_.push("InnerShadow");
         }
         if(this.knockout)
         {
            _loc3_.push("Knockout");
         }
         if(this.compositeSource)
         {
            _loc3_.push("CompositeSource");
         }
         if(_loc3_.length > 0)
         {
            _loc2_ += ", Flags: " + _loc3_.join(", ");
         }
         return _loc2_;
      }
   }
}

