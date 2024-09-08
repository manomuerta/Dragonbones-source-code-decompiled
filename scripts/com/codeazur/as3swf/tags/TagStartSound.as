package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.SWFSoundInfo;
   
   public class TagStartSound implements ITag
   {
      public static const TYPE:uint = 15;
      
      public var soundId:uint;
      
      public var soundInfo:SWFSoundInfo;
      
      public function TagStartSound()
      {
         super();
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         this.soundId = param1.readUI16();
         this.soundInfo = param1.readSOUNDINFO();
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeUI16(this.soundId);
         _loc3_.writeSOUNDINFO(this.soundInfo);
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "StartSound";
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
         return Tag.toStringCommon(this.type,this.name,param1) + "SoundID: " + this.soundId + ", " + "SoundInfo: " + this.soundInfo;
      }
   }
}

