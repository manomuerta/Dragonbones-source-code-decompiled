package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   
   public class TagFileAttributes implements ITag
   {
      public static const TYPE:uint = 69;
      
      public var useDirectBlit:Boolean = false;
      
      public var useGPU:Boolean = false;
      
      public var hasMetadata:Boolean = false;
      
      public var actionscript3:Boolean = true;
      
      public var useNetwork:Boolean = false;
      
      public function TagFileAttributes()
      {
         super();
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         var _loc5_:uint = param1.readUI8();
         this.useDirectBlit = (_loc5_ & 0x40) != 0;
         this.useGPU = (_loc5_ & 0x20) != 0;
         this.hasMetadata = (_loc5_ & 0x10) != 0;
         this.actionscript3 = (_loc5_ & 8) != 0;
         this.useNetwork = (_loc5_ & 1) != 0;
         param1.skipBytes(3);
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         param1.writeTagHeader(this.type,4);
         var _loc3_:uint = 0;
         if(this.useNetwork)
         {
            _loc3_ |= 1;
         }
         if(this.actionscript3)
         {
            _loc3_ |= 8;
         }
         if(this.hasMetadata)
         {
            _loc3_ |= 16;
         }
         if(this.useGPU)
         {
            _loc3_ |= 32;
         }
         if(this.useDirectBlit)
         {
            _loc3_ |= 64;
         }
         param1.writeUI8(_loc3_);
         param1.writeUI8(0);
         param1.writeUI8(0);
         param1.writeUI8(0);
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "FileAttributes";
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
         return Tag.toStringCommon(this.type,this.name,param1) + "AS3: " + this.actionscript3 + ", " + "HasMetadata: " + this.hasMetadata + ", " + "UseDirectBlit: " + this.useDirectBlit + ", " + "UseGPU: " + this.useGPU + ", " + "UseNetwork: " + this.useNetwork;
      }
   }
}

