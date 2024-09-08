package com.codeazur.as3swf.factories
{
   import com.codeazur.as3swf.data.filters.FilterBevel;
   import com.codeazur.as3swf.data.filters.FilterBlur;
   import com.codeazur.as3swf.data.filters.FilterColorMatrix;
   import com.codeazur.as3swf.data.filters.FilterConvolution;
   import com.codeazur.as3swf.data.filters.FilterDropShadow;
   import com.codeazur.as3swf.data.filters.FilterGlow;
   import com.codeazur.as3swf.data.filters.FilterGradientBevel;
   import com.codeazur.as3swf.data.filters.FilterGradientGlow;
   import com.codeazur.as3swf.data.filters.IFilter;
   
   public class SWFFilterFactory
   {
      public function SWFFilterFactory()
      {
         super();
      }
      
      public static function create(param1:uint) : IFilter
      {
         switch(param1)
         {
            case 0:
               return new FilterDropShadow(param1);
            case 1:
               return new FilterBlur(param1);
            case 2:
               return new FilterGlow(param1);
            case 3:
               return new FilterBevel(param1);
            case 4:
               return new FilterGradientGlow(param1);
            case 5:
               return new FilterConvolution(param1);
            case 6:
               return new FilterColorMatrix(param1);
            case 7:
               return new FilterGradientBevel(param1);
            default:
               throw new Error("Unknown filter ID: " + param1);
         }
      }
   }
}

