package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   
   public class TagRemoveObject2 extends TagRemoveObject implements IDisplayListTag
   {
      public static const TYPE:uint = 28;
      
      public function TagRemoveObject2()
      {
         super();
      }
      
      override public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         depth = param1.readUI16();
      }
      
      override public function publish(param1:SWFData, param2:uint) : void
      {
         param1.writeTagHeader(this.type,2);
         param1.writeUI16(depth);
      }
      
      override public function get type() : uint
      {
         return TYPE;
      }
      
      override public function get name() : String
      {
         return "RemoveObject2";
      }
      
      override public function get version() : uint
      {
         return 3;
      }
      
      override public function get level() : uint
      {
         return 2;
      }
      
      override public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         return Tag.toStringCommon(this.type,this.name,param1) + "Depth: " + depth;
      }
   }
}

