package com.codeazur.as3swf.tags
{
   public interface IDefinitionTag extends ITag
   {
      function get characterId() : uint;
      
      function set characterId(param1:uint) : void;
      
      function clone() : IDefinitionTag;
   }
}

