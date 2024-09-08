package com.codeazur.as3swf.tags
{
   public class TagDefineShape2 extends TagDefineShape implements IDefinitionTag
   {
      public static const TYPE:uint = 22;
      
      public function TagDefineShape2()
      {
         super();
      }
      
      override public function get type() : uint
      {
         return TYPE;
      }
      
      override public function get name() : String
      {
         return "DefineShape2";
      }
      
      override public function get version() : uint
      {
         return 2;
      }
      
      override public function get level() : uint
      {
         return 2;
      }
      
      override public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc3_:String = Tag.toStringCommon(this.type,this.name,param1) + "ID: " + characterId + ", " + "Bounds: " + shapeBounds;
         return _loc3_ + shapes.toString(param1 + 2);
      }
   }
}

