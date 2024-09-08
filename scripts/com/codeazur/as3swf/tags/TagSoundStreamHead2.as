package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.data.consts.SoundCompression;
   import com.codeazur.as3swf.data.consts.SoundRate;
   import com.codeazur.as3swf.data.consts.SoundSize;
   import com.codeazur.as3swf.data.consts.SoundType;
   
   public class TagSoundStreamHead2 extends TagSoundStreamHead implements ITag
   {
      public static const TYPE:uint = 45;
      
      public function TagSoundStreamHead2()
      {
         super();
      }
      
      override public function get type() : uint
      {
         return TYPE;
      }
      
      override public function get name() : String
      {
         return "SoundStreamHead2";
      }
      
      override public function get version() : uint
      {
         return 3;
      }
      
      override public function get level() : uint
      {
         return 2;
      }
      
      override public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc3_:String = Tag.toStringCommon(this.type,this.name,param1);
         if(streamSoundSampleCount > 0)
         {
            _loc3_ += "Format: " + SoundCompression.toString(streamSoundCompression) + ", " + "Rate: " + SoundRate.toString(streamSoundRate) + ", " + "Size: " + SoundSize.toString(streamSoundSize) + ", " + "Type: " + SoundType.toString(streamSoundType) + ", ";
         }
         return _loc3_ + ("Samples: " + streamSoundSampleCount);
      }
   }
}

