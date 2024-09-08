package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import flash.utils.ByteArray;
   
   public class TagDefineBinaryData implements IDefinitionTag
   {
      public static const TYPE:uint = 87;
      
      protected var _characterId:uint;
      
      protected var _binaryData:ByteArray;
      
      public function TagDefineBinaryData()
      {
         super();
         this._binaryData = new ByteArray();
      }
      
      public function get characterId() : uint
      {
         return this._characterId;
      }
      
      public function set characterId(param1:uint) : void
      {
         this._characterId = param1;
      }
      
      public function get binaryData() : ByteArray
      {
         return this._binaryData;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         this._characterId = param1.readUI16();
         param1.readUI32();
         if(param2 > 6)
         {
            param1.readBytes(this._binaryData,0,param2 - 6);
         }
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeUI16(this._characterId);
         _loc3_.writeUI32(0);
         if(this._binaryData.length > 0)
         {
            _loc3_.writeBytes(this._binaryData);
         }
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      public function clone() : IDefinitionTag
      {
         var _loc1_:TagDefineBinaryData = new TagDefineBinaryData();
         _loc1_.characterId = this.characterId;
         if(this._binaryData.length > 0)
         {
            _loc1_.binaryData.writeBytes(this._binaryData);
         }
         return _loc1_;
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "DefineBinaryData";
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
         return Tag.toStringCommon(this.type,this.name,param1) + "ID: " + this.characterId + ", " + "Length: " + this._binaryData.length;
      }
   }
}

