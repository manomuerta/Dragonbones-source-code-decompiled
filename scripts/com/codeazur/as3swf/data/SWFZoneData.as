package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   
   public class SWFZoneData
   {
      public var alignmentCoordinate:Number;
      
      public var range:Number;
      
      public function SWFZoneData(param1:SWFData = null)
      {
         super();
         if(param1 != null)
         {
            this.parse(param1);
         }
      }
      
      public function parse(param1:SWFData) : void
      {
         this.alignmentCoordinate = param1.readFLOAT16();
         this.range = param1.readFLOAT16();
      }
      
      public function publish(param1:SWFData) : void
      {
         param1.writeFLOAT16(this.alignmentCoordinate);
         param1.writeFLOAT16(this.range);
      }
      
      public function toString() : String
      {
         return "(" + this.alignmentCoordinate + "," + this.range + ")";
      }
   }
}

