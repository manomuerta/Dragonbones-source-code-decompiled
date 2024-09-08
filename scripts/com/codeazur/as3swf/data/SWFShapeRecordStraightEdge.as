package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   
   public class SWFShapeRecordStraightEdge extends SWFShapeRecord
   {
      public var generalLineFlag:Boolean;
      
      public var vertLineFlag:Boolean;
      
      public var deltaY:int;
      
      public var deltaX:int;
      
      protected var numBits:uint;
      
      public function SWFShapeRecordStraightEdge(param1:SWFData = null, param2:uint = 0, param3:uint = 1)
      {
         this.numBits = param2;
         super(param1,param3);
      }
      
      override public function parse(param1:SWFData = null, param2:uint = 1) : void
      {
         this.generalLineFlag = param1.readUB(1) == 1;
         this.vertLineFlag = !this.generalLineFlag ? param1.readUB(1) == 1 : false;
         this.deltaX = this.generalLineFlag || !this.vertLineFlag ? param1.readSB(this.numBits) : 0;
         this.deltaY = this.generalLineFlag || this.vertLineFlag ? param1.readSB(this.numBits) : 0;
      }
      
      override public function publish(param1:SWFData = null, param2:uint = 1) : void
      {
         var _loc3_:Array = [];
         if(this.generalLineFlag || !this.vertLineFlag)
         {
            _loc3_.push(this.deltaX);
         }
         if(this.generalLineFlag || this.vertLineFlag)
         {
            _loc3_.push(this.deltaY);
         }
         this.numBits = param1.calculateMaxBits(true,_loc3_);
         if(this.numBits < 2)
         {
            this.numBits = 2;
         }
         param1.writeUB(4,this.numBits - 2);
         param1.writeUB(1,this.generalLineFlag ? 1 : 0);
         if(!this.generalLineFlag)
         {
            param1.writeUB(1,this.vertLineFlag ? 1 : 0);
         }
         var _loc4_:uint = 0;
         while(_loc4_ < _loc3_.length)
         {
            param1.writeSB(this.numBits,int(_loc3_[_loc4_]));
            _loc4_++;
         }
      }
      
      override public function clone() : SWFShapeRecord
      {
         var _loc1_:SWFShapeRecordStraightEdge = new SWFShapeRecordStraightEdge();
         _loc1_.deltaX = this.deltaX;
         _loc1_.deltaY = this.deltaY;
         _loc1_.generalLineFlag = this.generalLineFlag;
         _loc1_.vertLineFlag = this.vertLineFlag;
         _loc1_.numBits = this.numBits;
         return _loc1_;
      }
      
      override public function get type() : uint
      {
         return SWFShapeRecord.TYPE_STRAIGHTEDGE;
      }
      
      override public function toString(param1:uint = 0) : String
      {
         var _loc2_:String = "[SWFShapeRecordStraightEdge] ";
         if(this.generalLineFlag)
         {
            _loc2_ += "General: " + this.deltaX + "," + this.deltaY;
         }
         else if(this.vertLineFlag)
         {
            _loc2_ += "Vertical: " + this.deltaY;
         }
         else
         {
            _loc2_ += "Horizontal: " + this.deltaX;
         }
         return _loc2_;
      }
   }
}

