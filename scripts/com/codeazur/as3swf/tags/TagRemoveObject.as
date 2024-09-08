package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   
   public class TagRemoveObject implements IDisplayListTag
   {
      public static const TYPE:uint = 5;
      
      public var characterId:uint = 0;
      
      public var depth:uint;
      
      public function TagRemoveObject()
      {
         super();
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         this.characterId = param1.readUI16();
         this.depth = param1.readUI16();
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         param1.writeTagHeader(this.type,4);
         param1.writeUI16(this.characterId);
         param1.writeUI16(this.depth);
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "RemoveObject";
      }
      
      public function get version() : uint
      {
         return 1;
      }
      
      public function get level() : uint
      {
         return 1;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         return Tag.toStringCommon(this.type,this.name,param1) + "CharacterID: " + this.characterId + ", " + "Depth: " + this.depth;
      }
   }
}

