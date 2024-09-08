package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   
   public class SWFGradient
   {
      public var spreadMode:uint;
      
      public var interpolationMode:uint;
      
      public var focalPoint:Number = 0;
      
      protected var _records:Vector.<SWFGradientRecord>;
      
      public function SWFGradient(param1:SWFData = null, param2:uint = 1)
      {
         super();
         this._records = new Vector.<SWFGradientRecord>();
         if(param1 != null)
         {
            this.parse(param1,param2);
         }
      }
      
      public function get records() : Vector.<SWFGradientRecord>
      {
         return this._records;
      }
      
      public function parse(param1:SWFData, param2:uint) : void
      {
         param1.resetBitsPending();
         this.spreadMode = param1.readUB(2);
         this.interpolationMode = param1.readUB(2);
         var _loc3_:uint = param1.readUB(4);
         var _loc4_:uint = 0;
         while(_loc4_ < _loc3_)
         {
            this._records.push(param1.readGRADIENTRECORD(param2));
            _loc4_++;
         }
      }
      
      public function publish(param1:SWFData, param2:uint = 1) : void
      {
         var _loc3_:uint = this.records.length;
         param1.resetBitsPending();
         param1.writeUB(2,this.spreadMode);
         param1.writeUB(2,this.interpolationMode);
         param1.writeUB(4,_loc3_);
         var _loc4_:uint = 0;
         while(_loc4_ < _loc3_)
         {
            param1.writeGRADIENTRECORD(this.records[_loc4_],param2);
            _loc4_++;
         }
      }
      
      public function clone() : SWFGradient
      {
         var _loc1_:SWFGradient = new SWFGradient();
         _loc1_.spreadMode = this.spreadMode;
         _loc1_.interpolationMode = this.interpolationMode;
         _loc1_.focalPoint = this.focalPoint;
         var _loc2_:uint = 0;
         while(_loc2_ < this.records.length)
         {
            _loc1_.records.push(this.records[_loc2_].clone());
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "(" + this._records.join(",") + "), SpreadMode: " + this.spreadMode + ", InterpolationMode: " + this.interpolationMode;
      }
   }
}

