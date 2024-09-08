package com.codeazur.as3swf.data.filters
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.utils.ColorUtils;
   import com.codeazur.utils.StringUtils;
   import flash.filters.BitmapFilter;
   import flash.filters.BitmapFilterType;
   import flash.filters.GradientGlowFilter;
   
   public class FilterGradientGlow extends Filter implements IFilter
   {
      public var numColors:uint;
      
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
      
      public var onTop:Boolean;
      
      public var passes:uint;
      
      protected var _gradientColors:Vector.<uint>;
      
      protected var _gradientRatios:Vector.<uint>;
      
      public function FilterGradientGlow(param1:uint)
      {
         super(param1);
         this._gradientColors = new Vector.<uint>();
         this._gradientRatios = new Vector.<uint>();
      }
      
      public function get gradientColors() : Vector.<uint>
      {
         return this._gradientColors;
      }
      
      public function get gradientRatios() : Vector.<uint>
      {
         return this._gradientRatios;
      }
      
      override public function get filter() : BitmapFilter
      {
         var _loc5_:String = null;
         var _loc1_:Array = [];
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < this.numColors)
         {
            _loc1_.push(ColorUtils.rgb(this.gradientColors[_loc4_]));
            _loc2_.push(ColorUtils.alpha(this.gradientColors[_loc4_]));
            _loc3_.push(this.gradientRatios[_loc4_]);
            _loc4_++;
         }
         if(this.onTop)
         {
            _loc5_ = BitmapFilterType.FULL;
         }
         else
         {
            _loc5_ = this.innerShadow ? BitmapFilterType.INNER : BitmapFilterType.OUTER;
         }
         return new GradientGlowFilter(this.distance,this.angle * 180 / Math.PI,_loc1_,_loc2_,_loc3_,this.blurX,this.blurY,this.strength,this.passes,_loc5_,this.knockout);
      }
      
      override public function parse(param1:SWFData) : void
      {
         var _loc2_:uint = 0;
         this.numColors = param1.readUI8();
         _loc2_ = 0;
         while(_loc2_ < this.numColors)
         {
            this._gradientColors.push(param1.readRGBA());
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.numColors)
         {
            this._gradientRatios.push(param1.readUI8());
            _loc2_++;
         }
         var _loc3_:Array = param1._15006();
         this._15009 = _loc3_[0];
         this.blurX = _loc3_[1];
         _loc3_ = param1._15006();
         this._15010 = _loc3_[0];
         this.blurY = _loc3_[1];
         _loc3_ = param1._15006();
         this._15011 = _loc3_[0];
         this.angle = _loc3_[1];
         _loc3_ = param1._15006();
         this._15008 = _loc3_[0];
         this.distance = _loc3_[1];
         _loc3_ = param1._15005();
         this._15007 = _loc3_[0];
         this.strength = _loc3_[1];
         var _loc4_:uint = param1.readUI8();
         this.innerShadow = (_loc4_ & 0x80) != 0;
         this.knockout = (_loc4_ & 0x40) != 0;
         this.compositeSource = (_loc4_ & 0x20) != 0;
         this.onTop = (_loc4_ & 0x10) != 0;
         this.passes = _loc4_ & 0x0F;
      }
      
      override public function publish(param1:SWFData) : void
      {
         var _loc2_:uint = 0;
         param1.writeUI8(this.numColors);
         _loc2_ = 0;
         while(_loc2_ < this.numColors)
         {
            param1.writeRGBA(this.gradientColors[_loc2_]);
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.numColors)
         {
            param1.writeUI8(this.gradientRatios[_loc2_]);
            _loc2_++;
         }
         param1.writeFIXED(this.blurX);
         param1.writeFIXED(this.blurY);
         param1.writeFIXED(this.angle);
         param1.writeFIXED(this.distance);
         param1.writeFIXED8(this.strength);
         var _loc3_:uint = uint(this.passes & 0x0F);
         if(this.innerShadow)
         {
            _loc3_ |= 128;
         }
         if(this.knockout)
         {
            _loc3_ |= 64;
         }
         if(this.compositeSource)
         {
            _loc3_ |= 32;
         }
         if(this.onTop)
         {
            _loc3_ |= 16;
         }
         param1.writeUI8(_loc3_);
      }
      
      override public function clone() : IFilter
      {
         var _loc2_:uint = 0;
         var _loc1_:FilterGradientGlow = new FilterGradientGlow(id);
         _loc1_.numColors = this.numColors;
         _loc2_ = 0;
         while(_loc2_ < this.numColors)
         {
            _loc1_.gradientColors.push(this.gradientColors[_loc2_]);
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.numColors)
         {
            _loc1_.gradientRatios.push(this.gradientRatios[_loc2_]);
            _loc2_++;
         }
         _loc1_.blurX = this.blurX;
         _loc1_.blurY = this.blurY;
         _loc1_.angle = this.angle;
         _loc1_.distance = this.distance;
         _loc1_.strength = this.strength;
         _loc1_.passes = this.passes;
         _loc1_.innerShadow = this.innerShadow;
         _loc1_.knockout = this.knockout;
         _loc1_.compositeSource = this.compositeSource;
         _loc1_.onTop = this.onTop;
         return _loc1_;
      }
      
      override public function toString(param1:uint = 0) : String
      {
         var _loc2_:uint = 0;
         var _loc3_:String = "[" + this.filterName + "] " + "BlurX: " + this.blurX + ", " + "BlurY: " + this.blurY + ", " + "Angle: " + this.angle + ", " + "Distance: " + this.distance + ", " + "Strength: " + this.strength + ", " + "Passes: " + this.passes;
         var _loc4_:Array = [];
         if(this.innerShadow)
         {
            _loc4_.push("InnerShadow");
         }
         if(this.knockout)
         {
            _loc4_.push("Knockout");
         }
         if(this.compositeSource)
         {
            _loc4_.push("CompositeSource");
         }
         if(this.onTop)
         {
            _loc4_.push("OnTop");
         }
         if(_loc4_.length > 0)
         {
            _loc3_ += ", Flags: " + _loc4_.join(", ");
         }
         if(this.gradientColors.length > 0)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "GradientColors:";
            _loc2_ = 0;
            while(_loc2_ < this.gradientColors.length)
            {
               _loc3_ += (_loc2_ > 0 ? ", " : " ") + ColorUtils.rgbToString(this.gradientColors[_loc2_]);
               _loc2_++;
            }
         }
         if(this.gradientRatios.length > 0)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "GradientRatios:";
            _loc2_ = 0;
            while(_loc2_ < this.gradientRatios.length)
            {
               _loc3_ += (_loc2_ > 0 ? ", " : " ") + this.gradientRatios[_loc2_];
               _loc2_++;
            }
         }
         return _loc3_;
      }
      
      protected function get filterName() : String
      {
         return "GradientGlowFilter";
      }
   }
}

