package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   
   public class SWFMorphFocalGradient extends SWFMorphGradient
   {
      public function SWFMorphFocalGradient(param1:SWFData = null, param2:uint = 1)
      {
         super(param1,param2);
      }
      
      override public function parse(param1:SWFData, param2:uint) : void
      {
         super.parse(param1,param2);
         startFocalPoint = param1.readFIXED8();
         endFocalPoint = param1.readFIXED8();
      }
      
      override public function publish(param1:SWFData, param2:uint) : void
      {
         super.publish(param1,param2);
         param1.writeFIXED8(startFocalPoint);
         param1.writeFIXED8(endFocalPoint);
      }
      
      override public function getMorphedGradient(param1:Number = 0) : SWFGradient
      {
         var _loc2_:SWFGradient = new SWFGradient();
         var _loc3_:uint = 0;
         while(_loc3_ < records.length)
         {
            _loc2_.records.push(records[_loc3_].getMorphedGradientRecord(param1));
            _loc3_++;
         }
         return _loc2_;
      }
      
      override public function toString() : String
      {
         return "FocalPoint: " + startFocalPoint + "," + endFocalPoint + " (" + _records.join(",") + ")";
      }
   }
}

