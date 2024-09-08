package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   
   public class SWFShapeRecord
   {
      public static const TYPE_UNKNOWN:uint = 0;
      
      public static const TYPE_END:uint = 1;
      
      public static const TYPE_STYLECHANGE:uint = 2;
      
      public static const TYPE_STRAIGHTEDGE:uint = 3;
      
      public static const TYPE_CURVEDEDGE:uint = 4;
      
      public function SWFShapeRecord(param1:SWFData = null, param2:uint = 1)
      {
         super();
         if(param1 != null)
         {
            this.parse(param1,param2);
         }
      }
      
      public function get type() : uint
      {
         return TYPE_UNKNOWN;
      }
      
      public function get isEdgeRecord() : Boolean
      {
         return this.type == TYPE_STRAIGHTEDGE || this.type == TYPE_CURVEDEDGE;
      }
      
      public function parse(param1:SWFData = null, param2:uint = 1) : void
      {
      }
      
      public function publish(param1:SWFData = null, param2:uint = 1) : void
      {
      }
      
      public function clone() : SWFShapeRecord
      {
         return null;
      }
      
      public function toString(param1:uint = 0) : String
      {
         return "[SWFShapeRecord]";
      }
   }
}

