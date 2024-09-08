package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   
   public class TagProductInfo implements ITag
   {
      public static const TYPE:uint = 41;
      
      private static const UINT_MAX_CARRY:Number = uint.MAX_VALUE + 1;
      
      public var productId:uint;
      
      public var edition:uint;
      
      public var majorVersion:uint;
      
      public var minorVersion:uint;
      
      public var build:Number;
      
      public var compileDate:Date;
      
      public function TagProductInfo()
      {
         super();
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         this.productId = param1.readUI32();
         this.edition = param1.readUI32();
         this.majorVersion = param1.readUI8();
         this.minorVersion = param1.readUI8();
         this.build = param1.readUI32() + param1.readUI32() * UINT_MAX_CARRY;
         var _loc5_:Number = param1.readUI32() + param1.readUI32() * UINT_MAX_CARRY;
         this.compileDate = new Date(_loc5_);
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeUI32(this.productId);
         _loc3_.writeUI32(this.edition);
         _loc3_.writeUI8(this.majorVersion);
         _loc3_.writeUI8(this.minorVersion);
         _loc3_.writeUI32(this.build);
         _loc3_.writeUI32(this.build / UINT_MAX_CARRY);
         _loc3_.writeUI32(this.compileDate.time);
         _loc3_.writeUI32(this.compileDate.time / UINT_MAX_CARRY);
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "ProductInfo";
      }
      
      public function get version() : uint
      {
         return 3;
      }
      
      public function get level() : uint
      {
         return 1;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         return Tag.toStringCommon(this.type,this.name,param1) + "ProductID: " + this.productId + ", " + "Edition: " + this.edition + ", " + "Version: " + this.majorVersion + "." + this.minorVersion + " r" + this.build + ", " + "CompileDate: " + this.compileDate.toString();
      }
   }
}

