package com.codeazur.as3swf.tags.etc
{
   import com.codeazur.as3swf.tags.ITag;
   import com.codeazur.as3swf.tags.TagUnknown;
   
   public class TagSWFEncryptActions extends TagUnknown implements ITag
   {
      public static const TYPE:uint = 253;
      
      public function TagSWFEncryptActions(param1:uint = 0)
      {
         super();
      }
      
      override public function get type() : uint
      {
         return TYPE;
      }
      
      override public function get name() : String
      {
         return "SWFEncryptActions";
      }
   }
}

