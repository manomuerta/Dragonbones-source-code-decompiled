package com.codeazur.as3swf.data.consts
{
   import flash.display.JointStyle;
   
   public class LineJointStyle
   {
      public static const ROUND:uint = 0;
      
      public static const BEVEL:uint = 1;
      
      public static const MITER:uint = 2;
      
      public function LineJointStyle()
      {
         super();
      }
      
      public static function toString(param1:uint) : String
      {
         switch(param1)
         {
            case ROUND:
               return JointStyle.ROUND;
            case BEVEL:
               return JointStyle.BEVEL;
            case MITER:
               return JointStyle.MITER;
            default:
               return "null";
         }
      }
   }
}

