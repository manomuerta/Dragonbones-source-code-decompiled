package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   
   public class SWFGlyphEntry
   {
      public var index:uint;
      
      public var advance:int;
      
      public function SWFGlyphEntry(param1:SWFData = null, param2:uint = 0, param3:uint = 0)
      {
         super();
         if(param1 != null)
         {
            this.parse(param1,param2,param3);
         }
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint) : void
      {
         this.index = param1.readUB(param2);
         this.advance = param1.readSB(param3);
      }
      
      public function publish(param1:SWFData, param2:uint, param3:uint) : void
      {
         param1.writeUB(param2,this.index);
         param1.writeSB(param3,this.advance);
      }
      
      public function clone() : SWFGlyphEntry
      {
         var _loc1_:SWFGlyphEntry = new SWFGlyphEntry();
         _loc1_.index = this.index;
         _loc1_.advance = this.advance;
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "[SWFGlyphEntry] Index: " + this.index.toString() + ", Advance: " + this.advance.toString();
      }
   }
}

