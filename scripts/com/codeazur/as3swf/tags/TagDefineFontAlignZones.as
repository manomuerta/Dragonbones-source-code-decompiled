package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.SWFZoneRecord;
   import com.codeazur.as3swf.data.consts.CSMTableHint;
   import com.codeazur.utils.StringUtils;
   
   public class TagDefineFontAlignZones implements ITag
   {
      public static const TYPE:uint = 73;
      
      public var fontId:uint;
      
      public var csmTableHint:uint;
      
      protected var _zoneTable:Vector.<SWFZoneRecord>;
      
      public function TagDefineFontAlignZones()
      {
         super();
         this._zoneTable = new Vector.<SWFZoneRecord>();
      }
      
      public function get zoneTable() : Vector.<SWFZoneRecord>
      {
         return this._zoneTable;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         this.fontId = param1.readUI16();
         this.csmTableHint = param1.readUI8() >> 6;
         var _loc5_:uint = uint(param1.position + param2 - 3);
         while(param1.position < _loc5_)
         {
            this._zoneTable.push(param1.readZONERECORD());
         }
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeUI16(this.fontId);
         _loc3_.writeUI8(this.csmTableHint << 6);
         var _loc4_:uint = 0;
         while(_loc4_ < this._zoneTable.length)
         {
            _loc3_.writeZONERECORD(this._zoneTable[_loc4_]);
            _loc4_++;
         }
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "DefineFontAlignZones";
      }
      
      public function get version() : uint
      {
         return 8;
      }
      
      public function get level() : uint
      {
         return 1;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc3_:String = Tag.toStringCommon(this.type,this.name,param1) + "FontID: " + this.fontId + ", " + "CSMTableHint: " + CSMTableHint.toString(this.csmTableHint) + ", " + "Records: " + this._zoneTable.length;
         var _loc4_:uint = 0;
         while(_loc4_ < this._zoneTable.length)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "[" + _loc4_ + "] " + this._zoneTable[_loc4_].toString(param1 + 2);
            _loc4_++;
         }
         return _loc3_;
      }
   }
}

