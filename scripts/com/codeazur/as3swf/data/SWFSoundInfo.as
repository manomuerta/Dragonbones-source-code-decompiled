package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   
   public class SWFSoundInfo
   {
      public var syncStop:Boolean;
      
      public var syncNoMultiple:Boolean;
      
      public var hasEnvelope:Boolean;
      
      public var hasLoops:Boolean;
      
      public var hasOutPoint:Boolean;
      
      public var hasInPoint:Boolean;
      
      public var outPoint:uint;
      
      public var inPoint:uint;
      
      public var loopCount:uint;
      
      protected var _envelopeRecords:Vector.<SWFSoundEnvelope>;
      
      public function SWFSoundInfo(param1:SWFData = null)
      {
         super();
         this._envelopeRecords = new Vector.<SWFSoundEnvelope>();
         if(param1 != null)
         {
            this.parse(param1);
         }
      }
      
      public function get envelopeRecords() : Vector.<SWFSoundEnvelope>
      {
         return this._envelopeRecords;
      }
      
      public function parse(param1:SWFData) : void
      {
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc2_:uint = param1.readUI8();
         this.syncStop = (_loc2_ & 0x20) != 0;
         this.syncNoMultiple = (_loc2_ & 0x10) != 0;
         this.hasEnvelope = (_loc2_ & 8) != 0;
         this.hasLoops = (_loc2_ & 4) != 0;
         this.hasOutPoint = (_loc2_ & 2) != 0;
         this.hasInPoint = (_loc2_ & 1) != 0;
         if(this.hasInPoint)
         {
            this.inPoint = param1.readUI32();
         }
         if(this.hasOutPoint)
         {
            this.outPoint = param1.readUI32();
         }
         if(this.hasLoops)
         {
            this.loopCount = param1.readUI16();
         }
         if(this.hasEnvelope)
         {
            _loc3_ = param1.readUI8();
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               this._envelopeRecords.push(param1.readSOUNDENVELOPE());
               _loc4_++;
            }
         }
      }
      
      public function publish(param1:SWFData) : void
      {
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc2_:uint = 0;
         if(this.syncStop)
         {
            _loc2_ |= 32;
         }
         if(this.syncNoMultiple)
         {
            _loc2_ |= 16;
         }
         if(this.hasEnvelope)
         {
            _loc2_ |= 8;
         }
         if(this.hasLoops)
         {
            _loc2_ |= 4;
         }
         if(this.hasOutPoint)
         {
            _loc2_ |= 2;
         }
         if(this.hasInPoint)
         {
            _loc2_ |= 1;
         }
         param1.writeUI8(_loc2_);
         if(this.hasInPoint)
         {
            param1.writeUI32(this.inPoint);
         }
         if(this.hasOutPoint)
         {
            param1.writeUI32(this.outPoint);
         }
         if(this.hasLoops)
         {
            param1.writeUI16(this.loopCount);
         }
         if(this.hasEnvelope)
         {
            _loc3_ = this._envelopeRecords.length;
            param1.writeUI8(_loc3_);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               param1.writeSOUNDENVELOPE(this._envelopeRecords[_loc4_]);
               _loc4_++;
            }
         }
      }
      
      public function clone() : SWFSoundInfo
      {
         var _loc1_:SWFSoundInfo = new SWFSoundInfo();
         _loc1_.syncStop = this.syncStop;
         _loc1_.syncNoMultiple = this.syncNoMultiple;
         _loc1_.hasEnvelope = this.hasEnvelope;
         _loc1_.hasLoops = this.hasLoops;
         _loc1_.hasOutPoint = this.hasOutPoint;
         _loc1_.hasInPoint = this.hasInPoint;
         _loc1_.outPoint = this.outPoint;
         _loc1_.inPoint = this.inPoint;
         _loc1_.loopCount = this.loopCount;
         var _loc2_:uint = 0;
         while(_loc2_ < this._envelopeRecords.length)
         {
            _loc1_.envelopeRecords.push(this._envelopeRecords[_loc2_].clone());
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function toString() : String
      {
         var _loc1_:* = "syncStop:" + this.syncStop + "," + "syncNoMultiple:" + this.syncNoMultiple + "," + "hasEnvelope:" + this.hasEnvelope + "," + "hasLoops:" + this.hasLoops + "," + "inPoint:" + this.inPoint + "," + "outPoint:" + this.outPoint + ",";
         return "[SWFSoundInfo]" + _loc1_;
      }
   }
}

