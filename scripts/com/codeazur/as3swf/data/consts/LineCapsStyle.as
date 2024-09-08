package com.codeazur.as3swf.data.consts
{
   import flash.display.CapsStyle;
   
   public class LineCapsStyle
   {
      public static const ROUND:uint = 0;
      
      public static const NO:uint = 1;
      
      public static const SQUARE:uint = 2;
      
      public function LineCapsStyle()
      {
         super();
      }
      
      public static function toString(param1:uint) : String
      {
         switch(param1)
         {
            case ROUND:
               return CapsStyle.ROUND;
            case NO:
               return CapsStyle.NONE;
            case SQUARE:
               return CapsStyle.SQUARE;
            default:
               return "unknown";
         }
      }
   }
}

