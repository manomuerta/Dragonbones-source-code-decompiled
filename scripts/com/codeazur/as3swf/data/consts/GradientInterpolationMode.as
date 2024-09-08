package com.codeazur.as3swf.data.consts
{
   import flash.display.InterpolationMethod;
   
   public class GradientInterpolationMode
   {
      public static const NORMAL:uint = 0;
      
      public static const LINEAR:uint = 1;
      
      public function GradientInterpolationMode()
      {
         super();
      }
      
      public static function toString(param1:uint) : String
      {
         switch(param1)
         {
            case NORMAL:
               return InterpolationMethod.RGB;
            case LINEAR:
               return InterpolationMethod.LINEAR_RGB;
            default:
               return InterpolationMethod.RGB;
         }
      }
   }
}

