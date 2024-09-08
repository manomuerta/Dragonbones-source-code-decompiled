package com.codeazur.as3swf.utils
{
   import com.codeazur.utils.StringUtils;
   
   public class ColorUtils
   {
      public function ColorUtils()
      {
         super();
      }
      
      public static function alpha(param1:uint) : Number
      {
         return Number(param1 >>> 24) / 255;
      }
      
      public static function rgb(param1:uint) : uint
      {
         return param1 & 0xFFFFFF;
      }
      
      public static function r(param1:uint) : Number
      {
         return Number(rgb(param1) >> 16 & 0xFF) / 255;
      }
      
      public static function g(param1:uint) : Number
      {
         return Number(rgb(param1) >> 8 & 0xFF) / 255;
      }
      
      public static function b(param1:uint) : Number
      {
         return Number(rgb(param1) & 0xFF) / 255;
      }
      
      public static function interpolate(param1:uint, param2:uint, param3:Number) : uint
      {
         var _loc4_:Number = r(param1);
         var _loc5_:Number = g(param1);
         var _loc6_:Number = b(param1);
         var _loc7_:Number = alpha(param1);
         var _loc8_:uint = uint((_loc4_ + (r(param2) - _loc4_) * param3) * 255);
         var _loc9_:uint = uint((_loc5_ + (g(param2) - _loc5_) * param3) * 255);
         var _loc10_:uint = uint((_loc6_ + (b(param2) - _loc6_) * param3) * 255);
         var _loc11_:uint = uint((_loc7_ + (alpha(param2) - _loc7_) * param3) * 255);
         return _loc10_ | _loc9_ << 8 | _loc8_ << 16 | _loc11_ << 24;
      }
      
      public static function rgbToString(param1:uint) : String
      {
         return StringUtils.printf("#%06x",param1 & 0xFFFFFF);
      }
      
      public static function rgbaToString(param1:uint) : String
      {
         return StringUtils.printf("#%06x(%02x)",param1 & 0xFFFFFF,param1 >>> 24);
      }
      
      public static function argbToString(param1:uint) : String
      {
         return StringUtils.printf("#(%02x)%06x",param1 >>> 24,param1 & 0xFFFFFF);
      }
   }
}

