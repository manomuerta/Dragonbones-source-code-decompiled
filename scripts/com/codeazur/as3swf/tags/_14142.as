package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import flash.utils.ByteArray;
   
   public class _14142 implements ITag
   {
      public static const TYPE:uint = 40;
      
      protected var _characterId:uint;
      
      protected var _binaryData:ByteArray;
      
      public function _14142()
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
         if(param2 > 2)
         {
            param1.readBytes(this._binaryData,0,param2 - 2);
         }
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeUI16(this._characterId);
         if(this._binaryData.length > 0)
         {
            _loc3_.writeBytes(this._binaryData);
         }
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      public function clone() : ITag
      {
         var _loc1_:_14142 = new _14142();
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
         return "NameCharacter";
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
         var _loc3_:String = Tag.toStringCommon(this.type,this.name,param1) + "ID: " + this.characterId;
         if(this.binaryData.length > 0)
         {
            this.binaryData.position = 0;
            _loc3_ += ", Name: " + this.binaryData.readUTFBytes(this.binaryData.length - 1);
            this.binaryData.position = 0;
         }
         return _loc3_;
      }
   }
}

