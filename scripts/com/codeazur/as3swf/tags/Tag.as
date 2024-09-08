package com.codeazur.as3swf.tags
{
   import com.codeazur.utils.StringUtils;
   
   public class Tag
   {
      public function Tag()
      {
         super();
      }
      
      public static function toStringCommon(param1:uint, param2:String, param3:uint = 0) : String
      {
         return StringUtils.repeat(param3) + "[" + StringUtils.printf("%02d",param1) + ":" + param2 + "] ";
      }
   }
}

