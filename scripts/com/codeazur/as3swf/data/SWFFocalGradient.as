package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   
   public class SWFFocalGradient extends SWFGradient
   {
      public function SWFFocalGradient(param1:SWFData = null, param2:uint = 1)
      {
         super(param1,param2);
      }
      
      override public function parse(param1:SWFData, param2:uint) : void
      {
         super.parse(param1,param2);
         focalPoint = param1.readFIXED8();
      }
      
      override public function publish(param1:SWFData, param2:uint = 1) : void
      {
         super.publish(param1,param2);
         param1.writeFIXED8(focalPoint);
      }
      
      override public function toString() : String
      {
         return "(" + _records.join(",") + ")";
      }
   }
}

