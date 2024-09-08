package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import flash.utils.ByteArray;
   
   public class TagDoABC implements ITag
   {
      public static const TYPE:uint = 82;
      
      public var lazyInitializeFlag:Boolean;
      
      public var abcName:String = "";
      
      protected var _bytes:ByteArray;
      
      public function TagDoABC()
      {
         super();
         this._bytes = new ByteArray();
      }
      
      public static function create(param1:ByteArray = null, param2:String = "", param3:Boolean = true) : TagDoABC
      {
         var _loc4_:TagDoABC = new TagDoABC();
         if(param1 != null && param1.length > 0)
         {
            _loc4_.bytes.writeBytes(param1);
         }
         _loc4_.abcName = param2;
         _loc4_.lazyInitializeFlag = param3;
         return _loc4_;
      }
      
      public function get bytes() : ByteArray
      {
         return this._bytes;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         var _loc5_:uint = param1.position;
         var _loc6_:uint = param1.readUI32();
         this.lazyInitializeFlag = (_loc6_ & 1) != 0;
         this.abcName = param1.readString();
         param1.readBytes(this.bytes,0,param2 - (param1.position - _loc5_));
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeUI32(this.lazyInitializeFlag ? 1 : 0);
         _loc3_.writeString(this.abcName);
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
         return "DoABC";
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
         return Tag.toStringCommon(this.type,this.name,param1) + "Lazy: " + this.lazyInitializeFlag + ", " + (this.abcName.length > 0 ? "Name: " + this.abcName + ", " : "") + "Length: " + this._bytes.length;
      }
   }
}

