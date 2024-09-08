package com.codeazur.as3swf.data.filters
{
   import com.codeazur.as3swf.utils.ColorUtils;
   import flash.filters.BitmapFilter;
   import flash.filters.BitmapFilterType;
   import flash.filters.GradientBevelFilter;
   
   public class FilterGradientBevel extends FilterGradientGlow implements IFilter
   {
      public function FilterGradientBevel(param1:uint)
      {
         super(param1);
      }
      
      override public function get filter() : BitmapFilter
      {
         var _loc5_:String = null;
         var _loc1_:Array = [];
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < numColors)
         {
            _loc1_.push(ColorUtils.rgb(gradientColors[_loc4_]));
            _loc2_.push(ColorUtils.alpha(gradientColors[_loc4_]));
            _loc3_.push(gradientRatios[_loc4_]);
            _loc4_++;
         }
         if(onTop)
         {
            _loc5_ = BitmapFilterType.FULL;
         }
         else
         {
            _loc5_ = innerShadow ? BitmapFilterType.INNER : BitmapFilterType.OUTER;
         }
         return new GradientBevelFilter(distance,angle,_loc1_,_loc2_,_loc3_,blurX,blurY,strength,passes,_loc5_,knockout);
      }
      
      override public function clone() : IFilter
      {
         var _loc2_:uint = 0;
         var _loc1_:FilterGradientBevel = new FilterGradientBevel(id);
         _loc1_.numColors = numColors;
         _loc2_ = 0;
         while(_loc2_ < numColors)
         {
            _loc1_.gradientColors.push(gradientColors[_loc2_]);
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < numColors)
         {
            _loc1_.gradientRatios.push(gradientRatios[_loc2_]);
            _loc2_++;
         }
         _loc1_.blurX = blurX;
         _loc1_.blurY = blurY;
         _loc1_.angle = angle;
         _loc1_.distance = distance;
         _loc1_.strength = strength;
         _loc1_.passes = passes;
         _loc1_.innerShadow = innerShadow;
         _loc1_.knockout = knockout;
         _loc1_.compositeSource = compositeSource;
         _loc1_.onTop = onTop;
         return _loc1_;
      }
      
      override protected function get filterName() : String
      {
         return "GradientBevelFilter";
      }
   }
}

