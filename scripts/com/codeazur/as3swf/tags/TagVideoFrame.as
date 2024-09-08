package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import flash.utils.ByteArray;
   
   public class TagVideoFrame implements ITag
   {
      public static const TYPE:uint = 61;
      
      public var streamId:uint;
      
      public var frameNum:uint;
      
      protected var _videoData:ByteArray;
      
      public function TagVideoFrame()
      {
         super();
         this._videoData = new ByteArray();
      }
      
      public function get videoData() : ByteArray
      {
         return this._videoData;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         this.streamId = param1.readUI16();
         this.frameNum = param1.readUI16();
         param1.readBytes(this._videoData,0,param2 - 4);
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         param1.writeTagHeader(this.type,this._videoData.length + 4);
         param1.writeUI16(this.streamId);
         param1.writeUI16(this.frameNum);
         if(this._videoData.length > 0)
         {
            param1.writeBytes(this._videoData);
         }
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "VideoFrame";
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
         return Tag.toStringCommon(this.type,this.name,param1) + "StreamID: " + this.streamId + ", " + "Frame: " + this.frameNum;
      }
   }
}

