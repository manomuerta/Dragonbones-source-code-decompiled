package com.codeazur.as3swf.data.consts
{
   public class SoundSize
   {
      public static const BIT_8:uint = 0;
      
      public static const BIT_16:uint = 1;
      
      public function SoundSize()
      {
         super();
      }
      
      public static function toString(param1:uint) : String
      {
         switch(param1)
         {
            case BIT_8:
               return "8bit";
            case BIT_16:
               return "16bit";
            default:
               return "unknown";
         }
      }
   }
}

