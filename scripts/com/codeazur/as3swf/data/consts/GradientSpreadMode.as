package com.codeazur.as3swf.data.consts
{
   import flash.display.SpreadMethod;
   
   public class GradientSpreadMode
   {
      public static const PAD:uint = 0;
      
      public static const REFLECT:uint = 1;
      
      public static const REPEAT:uint = 2;
      
      public function GradientSpreadMode()
      {
         super();
      }
      
      public static function toString(param1:uint) : String
      {
         switch(param1)
         {
            case PAD:
               return SpreadMethod.PAD;
            case REFLECT:
               return SpreadMethod.REFLECT;
            case REPEAT:
               return SpreadMethod.REPEAT;
            default:
               return SpreadMethod.PAD;
         }
      }
   }
}

