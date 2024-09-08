package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   
   public class SWFZoneRecord
   {
      public var maskX:Boolean;
      
      public var maskY:Boolean;
      
      protected var _zoneData:Vector.<SWFZoneData>;
      
      public function SWFZoneRecord(param1:SWFData = null)
      {
         super();
         this._zoneData = new Vector.<SWFZoneData>();
         if(param1 != null)
         {
            this.parse(param1);
         }
      }
      
      public function get zoneData() : Vector.<SWFZoneData>
      {
         return this._zoneData;
      }
      
      public function parse(param1:SWFData) : void
      {
         var _loc2_:uint = param1.readUI8();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            this._zoneData.push(param1.readZONEDATA());
            _loc3_++;
         }
         var _loc4_:uint = param1.readUI8();
         this.maskX = (_loc4_ & 1) != 0;
         this.maskY = (_loc4_ & 2) != 0;
      }
      
      public function publish(param1:SWFData) : void
      {
         var _loc2_:uint = this._zoneData.length;
         param1.writeUI8(_loc2_);
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            param1.writeZONEDATA(this._zoneData[_loc3_]);
            _loc3_++;
         }
         var _loc4_:uint = 0;
         if(this.maskX)
         {
            _loc4_ |= 1;
         }
         if(this.maskY)
         {
            _loc4_ |= 2;
         }
         param1.writeUI8(_loc4_);
      }
      
      public function toString(param1:uint = 0) : String
      {
         var _loc2_:String = "MaskY: " + this.maskY + ", MaskX: " + this.maskX;
         var _loc3_:uint = 0;
         while(_loc3_ < this._zoneData.length)
         {
            _loc2_ += ", " + _loc3_ + ": " + this._zoneData[_loc3_].toString();
            _loc3_++;
         }
         return _loc2_;
      }
   }
}

