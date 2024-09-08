package com.codeazur.as3swf.data.consts
{
   public class CSMTableHint
   {
      public static const THIN:uint = 0;
      
      public static const MEDIUM:uint = 1;
      
      public static const THICK:uint = 2;
      
      public function CSMTableHint()
      {
         super();
      }
      
      public static function toString(param1:uint) : String
      {
         switch(param1)
         {
            case THIN:
               return "thin";
            case MEDIUM:
               return "medium";
            case THICK:
               return "thick";
            default:
               return "unknown";
         }
      }
   }
}

