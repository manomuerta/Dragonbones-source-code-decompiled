package com.codeazur.as3swf.data.consts
{
   public class SoundType
   {
      public static const MONO:uint = 0;
      
      public static const STEREO:uint = 1;
      
      public function SoundType()
      {
         super();
      }
      
      public static function toString(param1:uint) : String
      {
         switch(param1)
         {
            case MONO:
               return "mono";
            case STEREO:
               return "stereo";
            default:
               return "unknown";
         }
      }
   }
}

