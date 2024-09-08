package com.codeazur.as3swf.tags
{
   public class TagDefineShape3 extends TagDefineShape2 implements IDefinitionTag
   {
      public static const TYPE:uint = 32;
      
      public function TagDefineShape3()
      {
         super();
      }
      
      override public function get type() : uint
      {
         return TYPE;
      }
      
      override public function get name() : String
      {
         return "DefineShape3";
      }
      
      override public function get version() : uint
      {
         return 3;
      }
      
      override public function get level() : uint
      {
         return 3;
      }
      
      override public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc3_:String = Tag.toStringCommon(this.type,this.name,param1) + "ID: " + characterId + ", " + "Bounds: " + shapeBounds;
         return _loc3_ + shapes.toString(param1 + 2);
      }
   }
}

