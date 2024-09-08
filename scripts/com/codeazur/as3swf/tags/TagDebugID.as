package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.utils.StringUtils;
   import flash.utils.ByteArray;
   
   public class TagDebugID implements ITag
   {
      public static const TYPE:uint = 63;
      
      protected var _uuid:ByteArray;
      
      public function TagDebugID()
      {
         super();
         this._uuid = new ByteArray();
      }
      
      public function get uuid() : ByteArray
      {
         return this._uuid;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         if(param2 > 0)
         {
            param1.readBytes(this._uuid,0,param2);
         }
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         param1.writeTagHeader(this.type,this._uuid.length);
         if(this._uuid.length > 0)
         {
            param1.writeBytes(this._uuid);
         }
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "DebugID";
      }
      
      public function get version() : uint
      {
         return 6;
      }
      
      public function get level() : uint
      {
         return 1;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc3_:* = Tag.toStringCommon(this.type,this.name,param1) + "UUID: ";
         if(this._uuid.length == 16)
         {
            _loc3_ += StringUtils.printf("%02x%02x%02x%02x-",this._uuid[0],this._uuid[1],this._uuid[2],this._uuid[3]);
            _loc3_ += StringUtils.printf("%02x%02x-",this._uuid[4],this._uuid[5]);
            _loc3_ += StringUtils.printf("%02x%02x-",this._uuid[6],this._uuid[7]);
            _loc3_ += StringUtils.printf("%02x%02x-",this._uuid[8],this._uuid[9]);
            _loc3_ += StringUtils.printf("%02x%02x%02x%02x%02x%02x",this._uuid[10],this._uuid[11],this._uuid[12],this._uuid[13],this._uuid[14],this._uuid[15]);
         }
         else
         {
            _loc3_ += "(invalid length: " + this._uuid.length + ")";
         }
         return _loc3_;
      }
   }
}

