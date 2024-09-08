package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.SWFColorTransform;
   
   public class TagDefineButtonCxform implements IDefinitionTag
   {
      public static const TYPE:uint = 23;
      
      public var buttonColorTransform:SWFColorTransform;
      
      protected var _characterId:uint;
      
      public function TagDefineButtonCxform()
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
         this.buttonColorTransform = param1.readCXFORM();
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeUI16(this.characterId);
         _loc3_.writeCXFORM(this.buttonColorTransform);
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      public function clone() : IDefinitionTag
      {
         var _loc1_:TagDefineButtonCxform = new TagDefineButtonCxform();
         _loc1_.characterId = this.characterId;
         _loc1_.buttonColorTransform = this.buttonColorTransform.clone();
         return _loc1_;
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "DefineButtonCxform";
      }
      
      public function get version() : uint
      {
         return 2;
      }
      
      public function get level() : uint
      {
         return 1;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         return Tag.toStringCommon(this.type,this.name,param1) + "ID: " + this.characterId + ", " + "ColorTransform: " + this.buttonColorTransform;
      }
   }
}

