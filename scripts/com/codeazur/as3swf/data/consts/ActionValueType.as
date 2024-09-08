package com.codeazur.as3swf.data.consts
{
   public class ActionValueType
   {
      public static const STRING:uint = 0;
      
      public static const FLOAT:uint = 1;
      
      public static const NULL:uint = 2;
      
      public static const UNDEFINED:uint = 3;
      
      public static const REGISTER:uint = 4;
      
      public static const BOOLEAN:uint = 5;
      
      public static const DOUBLE:uint = 6;
      
      public static const INTEGER:uint = 7;
      
      public static const CONSTANT_8:uint = 8;
      
      public static const CONSTANT_16:uint = 9;
      
      public function ActionValueType()
      {
         super();
      }
      
      public static function toString(param1:uint) : String
      {
         switch(param1)
         {
            case STRING:
               return "string";
            case FLOAT:
               return "float";
            case NULL:
               return "null";
            case UNDEFINED:
               return "undefined";
            case REGISTER:
               return "register";
            case BOOLEAN:
               return "boolean";
            case DOUBLE:
               return "double";
            case INTEGER:
               return "integer";
            case CONSTANT_8:
               return "constant8";
            case CONSTANT_16:
               return "constant16";
            default:
               return "unknown";
         }
      }
   }
}

