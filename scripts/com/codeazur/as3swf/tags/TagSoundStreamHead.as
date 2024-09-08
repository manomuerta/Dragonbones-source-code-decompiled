package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.consts.SoundCompression;
   import com.codeazur.as3swf.data.consts.SoundRate;
   import com.codeazur.as3swf.data.consts.SoundSize;
   import com.codeazur.as3swf.data.consts.SoundType;
   
   public class TagSoundStreamHead implements ITag
   {
      public static const TYPE:uint = 18;
      
      public var playbackSoundRate:uint;
      
      public var playbackSoundSize:uint;
      
      public var playbackSoundType:uint;
      
      public var streamSoundCompression:uint;
      
      public var streamSoundRate:uint;
      
      public var streamSoundSize:uint;
      
      public var streamSoundType:uint;
      
      public var streamSoundSampleCount:uint;
      
      public var latencySeek:uint;
      
      public function TagSoundStreamHead()
      {
         super();
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         param1.readUB(4);
         this.playbackSoundRate = param1.readUB(2);
         this.playbackSoundSize = param1.readUB(1);
         this.playbackSoundType = param1.readUB(1);
         this.streamSoundCompression = param1.readUB(4);
         this.streamSoundRate = param1.readUB(2);
         this.streamSoundSize = param1.readUB(1);
         this.streamSoundType = param1.readUB(1);
         this.streamSoundSampleCount = param1.readUI16();
         if(this.streamSoundCompression == SoundCompression.MP3)
         {
            this.latencySeek = param1.readSI16();
         }
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeUB(4,0);
         _loc3_.writeUB(2,this.playbackSoundRate);
         _loc3_.writeUB(1,this.playbackSoundSize);
         _loc3_.writeUB(1,this.playbackSoundType);
         _loc3_.writeUB(4,this.streamSoundCompression);
         _loc3_.writeUB(2,this.streamSoundRate);
         _loc3_.writeUB(1,this.streamSoundSize);
         _loc3_.writeUB(1,this.streamSoundType);
         _loc3_.writeUI16(this.streamSoundSampleCount);
         if(this.streamSoundCompression == SoundCompression.MP3)
         {
            _loc3_.writeSI16(this.latencySeek);
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
         return "SoundStreamHead";
      }
      
      public function get version() : uint
      {
         return 1;
      }
      
      public function get level() : uint
      {
         return 1;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc3_:String = Tag.toStringCommon(this.type,this.name,param1);
         if(this.streamSoundSampleCount > 0)
         {
            _loc3_ += "Format: " + SoundCompression.toString(this.streamSoundCompression) + ", " + "Rate: " + SoundRate.toString(this.streamSoundRate) + ", " + "Size: " + SoundSize.toString(this.streamSoundSize) + ", " + "Type: " + SoundType.toString(this.streamSoundType) + ", ";
         }
         _loc3_ += "Samples: " + this.streamSoundSampleCount + ", ";
         return _loc3_ + ("LatencySeek: " + this.latencySeek);
      }
   }
}

