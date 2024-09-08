package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   
   public class SWFShapeRecordCurvedEdge extends SWFShapeRecord
   {
      public var controlDeltaX:int;
      
      public var controlDeltaY:int;
      
      public var anchorDeltaX:int;
      
      public var anchorDeltaY:int;
      
      protected var numBits:uint;
      
      public function SWFShapeRecordCurvedEdge(param1:SWFData = null, param2:uint = 0, param3:uint = 1)
      {
         this.numBits = param2;
         super(param1,param3);
      }
      
      override public function parse(param1:SWFData = null, param2:uint = 1) : void
      {
         this.controlDeltaX = param1.readSB(this.numBits);
         this.controlDeltaY = param1.readSB(this.numBits);
         this.anchorDeltaX = param1.readSB(this.numBits);
         this.anchorDeltaY = param1.readSB(this.numBits);
      }
      
      override public function publish(param1:SWFData = null, param2:uint = 1) : void
      {
         this.numBits = param1.calculateMaxBits(true,[this.controlDeltaX,this.controlDeltaY,this.anchorDeltaX,this.anchorDeltaY]);
         if(this.numBits < 2)
         {
            this.numBits = 2;
         }
         param1.writeUB(4,this.numBits - 2);
         param1.writeSB(this.numBits,this.controlDeltaX);
         param1.writeSB(this.numBits,this.controlDeltaY);
         param1.writeSB(this.numBits,this.anchorDeltaX);
         param1.writeSB(this.numBits,this.anchorDeltaY);
      }
      
      override public function clone() : SWFShapeRecord
      {
         var _loc1_:SWFShapeRecordCurvedEdge = new SWFShapeRecordCurvedEdge();
         _loc1_.anchorDeltaX = this.anchorDeltaX;
         _loc1_.anchorDeltaY = this.anchorDeltaY;
         _loc1_.controlDeltaX = this.controlDeltaX;
         _loc1_.controlDeltaY = this.controlDeltaY;
         _loc1_.numBits = this.numBits;
         return _loc1_;
      }
      
      override public function get type() : uint
      {
         return SWFShapeRecord.TYPE_CURVEDEDGE;
      }
      
      override public function toString(param1:uint = 0) : String
      {
         return "[SWFShapeRecordCurvedEdge] " + "ControlDelta: " + this.controlDeltaX + "," + this.controlDeltaY + ", " + "AnchorDelta: " + this.anchorDeltaX + "," + this.anchorDeltaY;
      }
   }
}

