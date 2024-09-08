package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import flash.utils.ByteArray;
   
   public class TagSoundStreamBlock implements ITag
   {
      public static const TYPE:uint = 19;
      
      protected var _soundData:ByteArray;
      
      public function TagSoundStreamBlock()
      {
         super();
         this._soundData = new ByteArray();
      }
      
      public function get soundData() : ByteArray
      {
         return this._soundData;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         param1.readBytes(this._soundData,0,param2);
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         param1.writeTagHeader(this.type,this._soundData.length,true);
         if(this._soundData.length > 0)
         {
            param1.writeBytes(this._soundData);
         }
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "SoundStreamBlock";
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
         return Tag.toStringCommon(this.type,this.name,param1) + "Length: " + this._soundData.length;
      }
   }
}

