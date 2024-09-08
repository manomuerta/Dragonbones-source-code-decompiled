package com.codeazur.as3swf.data
{
   public class SWFShapeRecordEnd extends SWFShapeRecord
   {
      public function SWFShapeRecordEnd()
      {
         super();
      }
      
      override public function clone() : SWFShapeRecord
      {
         return new SWFShapeRecordEnd();
      }
      
      override public function get type() : uint
      {
         return SWFShapeRecord.TYPE_END;
      }
      
      override public function toString(param1:uint = 0) : String
      {
         return "[SWFShapeRecordEnd]";
      }
   }
}

