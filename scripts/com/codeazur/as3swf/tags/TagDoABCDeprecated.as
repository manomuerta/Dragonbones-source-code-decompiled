package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import flash.utils.ByteArray;
   
   public class TagDoABCDeprecated implements ITag
   {
      public static const TYPE:uint = 72;
      
      protected var _bytes:ByteArray;
      
      public function TagDoABCDeprecated()
      {
         super();
         this._bytes = new ByteArray();
      }
      
      public static function create(param1:ByteArray = null) : TagDoABCDeprecated
      {
         var _loc2_:TagDoABCDeprecated = new TagDoABCDeprecated();
         if(param1 != null && param1.length > 0)
         {
            _loc2_.bytes.writeBytes(param1);
         }
         return _loc2_;
      }
      
      public function get bytes() : ByteArray
      {
         return this._bytes;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         var _loc5_:uint = param1.position;
         param1.readBytes(this.bytes,0,param2 - (param1.position - _loc5_));
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = new SWFData();
         if(this._bytes.length > 0)
         {
            _loc3_.writeBytes(this._bytes);
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
         return "DoABCDeprecated";
      }
      
      public function get version() : uint
      {
         return 9;
      }
      
      public function get level() : uint
      {
         return 1;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         return Tag.toStringCommon(this.type,this.name,param1) + "Length: " + this._bytes.length;
      }
   }
}

