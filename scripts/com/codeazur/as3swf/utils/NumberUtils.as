package com.codeazur.as3swf.utils
{
   public class NumberUtils
   {
      public function NumberUtils()
      {
         super();
      }
      
      public static function roundPixels20(param1:Number) : Number
      {
         return Math.round(param1 * 100) / 100;
      }
      
      public static function roundPixels400(param1:Number) : Number
      {
         return Math.round(param1 * 10000) / 10000;
      }
   }
}

