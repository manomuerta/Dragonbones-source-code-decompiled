package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   
   public class SWFMorphGradient
   {
      public var spreadMode:uint;
      
      public var interpolationMode:uint;
      
      public var startFocalPoint:Number = 0;
      
      public var endFocalPoint:Number = 0;
      
      protected var _records:Vector.<SWFMorphGradientRecord>;
      
      public function SWFMorphGradient(param1:SWFData = null, param2:uint = 1)
      {
         super();
         this._records = new Vector.<SWFMorphGradientRecord>();
         if(param1 != null)
         {
            this.parse(param1,param2);
         }
      }
      
      public function get records() : Vector.<SWFMorphGradientRecord>
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
            this._records.push(param1.readMORPHGRADIENTRECORD());
            _loc4_++;
         }
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:uint = this.records.length;
         param1.resetBitsPending();
         param1.writeUB(2,this.spreadMode);
         param1.writeUB(2,this.interpolationMode);
         param1.writeUB(4,_loc3_);
         var _loc4_:uint = 0;
         while(_loc4_ < _loc3_)
         {
            param1.writeMORPHGRADIENTRECORD(this._records[_loc4_]);
            _loc4_++;
         }
      }
      
      public function getMorphedGradient(param1:Number = 0) : SWFGradient
      {
         var _loc2_:SWFGradient = new SWFGradient();
         var _loc3_:uint = 0;
         while(_loc3_ < this.records.length)
         {
            _loc2_.records.push(this.records[_loc3_].getMorphedGradientRecord(param1));
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function toString() : String
      {
         return "(" + this._records.join(",") + "), spread:" + this.spreadMode + ", interpolation:" + this.interpolationMode;
      }
   }
}

