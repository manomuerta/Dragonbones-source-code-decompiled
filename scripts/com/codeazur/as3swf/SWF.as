package com.codeazur.as3swf
{
   import com.codeazur.as3swf.data.SWFRectangle;
   import com.codeazur.as3swf.events.SWFProgressEvent;
   import com.codeazur.utils.StringUtils;
   import flash.utils.ByteArray;
   
   public class SWF extends SWFTimelineContainer
   {
      public static const COMPRESSION_METHOD_ZLIB:String = "zlib";
      
      public static const COMPRESSION_METHOD_LZMA:String = "lzma";
      
      public static const TOSTRING_FLAG_TIMELINE_STRUCTURE:uint = 1;
      
      public static const TOSTRING_FLAG_AVM1_BYTECODE:uint = 2;
      
      protected static const FILE_LENGTH_POS:uint = 4;
      
      protected static const COMPRESSION_START_POS:uint = 8;
      
      public var signature:String;
      
      public var version:int;
      
      public var fileLength:uint;
      
      public var fileLengthCompressed:uint;
      
      public var frameSize:SWFRectangle;
      
      public var frameRate:Number;
      
      public var frameCount:uint;
      
      public var compressed:Boolean;
      
      public var compressionMethod:String;
      
      protected var bytes:SWFData;
      
      public function SWF(param1:ByteArray = null)
      {
         super();
         this.bytes = new SWFData();
         if(param1 != null)
         {
            this.loadBytes(param1);
         }
         else
         {
            this.version = 10;
            this.fileLength = 0;
            this.fileLengthCompressed = 0;
            this.frameSize = new SWFRectangle();
            this.frameRate = 50;
            this.frameCount = 1;
            this.compressed = true;
            this.compressionMethod = COMPRESSION_METHOD_ZLIB;
         }
      }
      
      public function loadBytes(param1:ByteArray) : void
      {
         this.bytes.length = 0;
         param1.position = 0;
         param1.readBytes(this.bytes);
         this.parse(this.bytes);
      }
      
      public function loadBytesAsync(param1:ByteArray) : void
      {
         this.bytes.length = 0;
         param1.position = 0;
         param1.readBytes(this.bytes);
         this.parseAsync(this.bytes);
      }
      
      public function parse(param1:SWFData) : void
      {
         this.bytes = param1;
         this.parseHeader();
         parseTags(param1,this.version);
      }
      
      public function parseAsync(param1:SWFData) : void
      {
         this.bytes = param1;
         this.parseHeader();
         parseTagsAsync(param1,this.version);
      }
      
      public function publish(param1:ByteArray) : void
      {
         var _loc2_:SWFData = new SWFData();
         this.publishHeader(_loc2_);
         publishTags(_loc2_,this.version);
         this.publishFinalize(_loc2_);
         param1.writeBytes(_loc2_);
      }
      
      public function publishAsync(param1:ByteArray) : void
      {
         var data:SWFData = null;
         var ba:ByteArray = param1;
         data = new SWFData();
         this.publishHeader(data);
         publishTagsAsync(data,this.version);
         addEventListener(SWFProgressEvent.COMPLETE,function(param1:SWFProgressEvent):void
         {
            removeEventListener(SWFProgressEvent.COMPLETE,arguments.callee);
            publishFinalize(data);
            ba.length = 0;
            ba.writeBytes(data);
         },false,int.MAX_VALUE);
      }
      
      protected function parseHeader() : void
      {
         this.signature = "";
         this.compressed = false;
         this.compressionMethod = COMPRESSION_METHOD_ZLIB;
         this.bytes.position = 0;
         var _loc1_:uint = this.bytes.readUI8();
         if(_loc1_ == 67)
         {
            this.compressed = true;
         }
         else if(_loc1_ == 90)
         {
            this.compressed = true;
            this.compressionMethod = COMPRESSION_METHOD_LZMA;
         }
         else if(_loc1_ != 70)
         {
            throw new Error("Not a SWF. First signature byte is 0x" + _loc1_.toString(16) + " (expected: 0x43 or 0x5A or 0x46)");
         }
         this.signature += String.fromCharCode(_loc1_);
         _loc1_ = this.bytes.readUI8();
         if(_loc1_ != 87)
         {
            throw new Error("Not a SWF. Second signature byte is 0x" + _loc1_.toString(16) + " (expected: 0x57)");
         }
         this.signature += String.fromCharCode(_loc1_);
         _loc1_ = this.bytes.readUI8();
         if(_loc1_ != 83)
         {
            throw new Error("Not a SWF. Third signature byte is 0x" + _loc1_.toString(16) + " (expected: 0x53)");
         }
         this.signature += String.fromCharCode(_loc1_);
         this.version = this.bytes.readUI8();
         this.fileLength = this.bytes.readUI32();
         this.fileLengthCompressed = this.bytes.length;
         if(this.compressed)
         {
            this.bytes.swfUncompress(this.compressionMethod,this.fileLength);
         }
         this.frameSize = this.bytes.readRECT();
         this.frameRate = this.bytes.readFIXED8();
         this.frameCount = this.bytes.readUI16();
      }
      
      protected function publishHeader(param1:SWFData) : void
      {
         var _loc2_:uint = 70;
         if(this.compressed)
         {
            if(this.compressionMethod == COMPRESSION_METHOD_ZLIB)
            {
               _loc2_ = 67;
            }
            else if(this.compressionMethod == COMPRESSION_METHOD_LZMA)
            {
               _loc2_ = 90;
            }
         }
         param1.writeUI8(_loc2_);
         param1.writeUI8(87);
         param1.writeUI8(83);
         param1.writeUI8(this.version);
         param1.writeUI32(0);
         param1.writeRECT(this.frameSize);
         param1.writeFIXED8(this.frameRate);
         param1.writeUI16(this.frameCount);
      }
      
      protected function publishFinalize(param1:SWFData) : void
      {
         this.fileLength = this.fileLengthCompressed = param1.length;
         if(this.compressed)
         {
            this.compressionMethod = SWF.COMPRESSION_METHOD_ZLIB;
            param1.position = COMPRESSION_START_POS;
            param1.swfCompress(this.compressionMethod);
            this.fileLengthCompressed = param1.length;
         }
         var _loc2_:uint = param1.position;
         param1.position = FILE_LENGTH_POS;
         param1.writeUI32(this.fileLength);
         param1.position = 0;
      }
      
      override public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc3_:String = StringUtils.repeat(param1);
         var _loc4_:String = StringUtils.repeat(param1 + 2);
         var _loc5_:String = StringUtils.repeat(param1 + 4);
         var _loc6_:* = _loc3_ + "[SWF]\n" + _loc4_ + "Header:\n" + _loc5_ + "Version: " + this.version + "\n" + _loc5_ + "Compression: ";
         if(this.compressed)
         {
            if(this.compressionMethod == COMPRESSION_METHOD_ZLIB)
            {
               _loc6_ += "ZLIB";
            }
            else if(this.compressionMethod == COMPRESSION_METHOD_LZMA)
            {
               _loc6_ += "LZMA";
            }
            else
            {
               _loc6_ += "Unknown";
            }
         }
         else
         {
            _loc6_ += "None";
         }
         return _loc6_ + "\n" + _loc5_ + "FileLength: " + this.fileLength + "\n" + _loc5_ + "FileLengthCompressed: " + this.fileLengthCompressed + "\n" + _loc5_ + "FrameSize: " + this.frameSize.toStringSize() + "\n" + _loc5_ + "FrameRate: " + this.frameRate + "\n" + _loc5_ + "FrameCount: " + this.frameCount + super.toString(param1);
      }
   }
}

