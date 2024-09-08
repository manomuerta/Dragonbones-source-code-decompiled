package com.codeazur.as3swf.data.consts
{
   public class SoundRate
   {
      public static const KHZ_5:uint = 0;
      
      public static const KHZ_11:uint = 1;
      
      public static const KHZ_22:uint = 2;
      
      public static const KHZ_44:uint = 3;
      
      public function SoundRate()
      {
         super();
      }
      
      public static function toString(param1:uint) : String
      {
         switch(param1)
         {
            case KHZ_5:
               return "5.5kHz";
            case KHZ_11:
               return "11kHz";
            case KHZ_22:
               return "22kHz";
            case KHZ_44:
               return "44kHz";
            default:
               return "unknown";
         }
      }
      
      public static function _14992(param1:uint) : Number
      {
         switch(param1)
         {
            case KHZ_5:
               return 5.5;
            case KHZ_11:
               return 11;
            case KHZ_22:
               return 22;
            case KHZ_44:
               return 44;
            default:
               return -1;
         }
      }
   }
}

