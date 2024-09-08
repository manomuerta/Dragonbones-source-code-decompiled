package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   
   public class SWFKerningRecord
   {
      public var code1:uint;
      
      public var code2:uint;
      
      public var adjustment:int;
      
      public function SWFKerningRecord(param1:SWFData = null, param2:Boolean = false)
      {
         super();
         if(param1 != null)
         {
            this.parse(param1,param2);
         }
      }
      
      public function parse(param1:SWFData, param2:Boolean) : void
      {
         this.code1 = param2 ? param1.readUI16() : param1.readUI8();
         this.code2 = param2 ? param1.readUI16() : param1.readUI8();
         this.adjustment = param1.readSI16();
      }
      
      public function publish(param1:SWFData, param2:Boolean) : void
      {
         if(param2)
         {
            param1.writeUI16(this.code1);
         }
         else
         {
            param1.writeUI8(this.code1);
         }
         if(param2)
         {
            param1.writeUI16(this.code2);
         }
         else
         {
            param1.writeUI8(this.code2);
         }
         param1.writeSI16(this.adjustment);
      }
      
      public function toString(param1:uint = 0) : String
      {
         return "Code1: " + this.code1 + ", " + "Code2: " + this.code2 + ", " + "Adjustment: " + this.adjustment;
      }
   }
}

