package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.utils.StringUtils;
   
   public class SWFClipActions
   {
      public var eventFlags:SWFClipEventFlags;
      
      protected var _records:Vector.<SWFClipActionRecord>;
      
      public function SWFClipActions(param1:SWFData = null, param2:uint = 0)
      {
         super();
         this._records = new Vector.<SWFClipActionRecord>();
         if(param1 != null)
         {
            this.parse(param1,param2);
         }
      }
      
      public function get records() : Vector.<SWFClipActionRecord>
      {
         return this._records;
      }
      
      public function parse(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFClipActionRecord = null;
         param1.readUI16();
         this.eventFlags = param1.readCLIPEVENTFLAGS(param2);
         while(_loc3_ = param1.readCLIPACTIONRECORD(param2), _loc3_ != null)
         {
            this._records.push(_loc3_);
         }
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         param1.writeUI16(0);
         param1.writeCLIPEVENTFLAGS(this.eventFlags,param2);
         var _loc3_:uint = 0;
         while(_loc3_ < this.records.length)
         {
            param1.writeCLIPACTIONRECORD(this.records[_loc3_],param2);
            _loc3_++;
         }
         if(param2 >= 6)
         {
            param1.writeUI32(0);
         }
         else
         {
            param1.writeUI16(0);
         }
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc3_:* = "ClipActions (" + this.eventFlags.toString() + "):";
         var _loc4_:uint = 0;
         while(_loc4_ < this._records.length)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "[" + _loc4_ + "] " + this._records[_loc4_].toString(param1 + 2,param2);
            _loc4_++;
         }
         return _loc3_;
      }
   }
}

