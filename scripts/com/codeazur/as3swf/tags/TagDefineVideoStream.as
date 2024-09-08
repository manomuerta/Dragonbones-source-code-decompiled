package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.consts.VideoCodecID;
   import com.codeazur.as3swf.data.consts.VideoDeblockingType;
   
   public class TagDefineVideoStream implements IDefinitionTag
   {
      public static const TYPE:uint = 60;
      
      public var numFrames:uint;
      
      public var width:uint;
      
      public var height:uint;
      
      public var deblocking:uint;
      
      public var smoothing:Boolean;
      
      public var codecId:uint;
      
      protected var _characterId:uint;
      
      public function TagDefineVideoStream()
      {
         super();
      }
      
      public function get characterId() : uint
      {
         return this._characterId;
      }
      
      public function set characterId(param1:uint) : void
      {
         this._characterId = param1;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         this._characterId = param1.readUI16();
         this.numFrames = param1.readUI16();
         this.width = param1.readUI16();
         this.height = param1.readUI16();
         param1.readUB(4);
         this.deblocking = param1.readUB(3);
         this.smoothing = param1.readUB(1) == 1;
         this.codecId = param1.readUI8();
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         param1.writeTagHeader(this.type,10);
         param1.writeUI16(this.characterId);
         param1.writeUI16(this.numFrames);
         param1.writeUI16(this.width);
         param1.writeUI16(this.height);
         param1.writeUB(4,0);
         param1.writeUB(3,this.deblocking);
         param1.writeUB(1,this.smoothing ? 1 : 0);
         param1.writeUI8(this.codecId);
      }
      
      public function clone() : IDefinitionTag
      {
         var _loc1_:TagDefineVideoStream = new TagDefineVideoStream();
         _loc1_.characterId = this.characterId;
         _loc1_.numFrames = this.numFrames;
         _loc1_.width = this.width;
         _loc1_.height = this.height;
         _loc1_.deblocking = this.deblocking;
         _loc1_.smoothing = this.smoothing;
         _loc1_.codecId = this.codecId;
         return _loc1_;
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "DefineVideoStream";
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
         return Tag.toStringCommon(this.type,this.name,param1) + "ID: " + this.characterId + ", " + "Frames: " + this.numFrames + ", " + "Width: " + this.width + ", " + "Height: " + this.height + ", " + "Deblocking: " + VideoDeblockingType.toString(this.deblocking) + ", " + "Smoothing: " + this.smoothing + ", " + "Codec: " + VideoCodecID.toString(this.codecId);
      }
   }
}

