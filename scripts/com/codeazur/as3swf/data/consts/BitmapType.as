package com.codeazur.as3swf.data.consts
{
   public class BitmapType
   {
      public static const JPEG:uint = 1;
      
      public static const GIF89A:uint = 2;
      
      public static const PNG:uint = 3;
      
      public function BitmapType()
      {
         super();
      }
      
      public static function toString(param1:uint) : String
      {
         switch(param1)
         {
            case JPEG:
               return "JPEG";
            case GIF89A:
               return "GIF89a";
            case PNG:
               return "PNG";
            default:
               return "unknown";
         }
      }
   }
}

