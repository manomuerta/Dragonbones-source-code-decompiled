package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.SWFTimelineContainer;
   
   public class TagDefineSprite extends SWFTimelineContainer implements IDefinitionTag
   {
      public static const TYPE:uint = 39;
      
      public var frameCount:uint;
      
      protected var _characterId:uint;
      
      public var _15061:Boolean = false;
      
      public var _15063:Boolean = false;
      
      public function TagDefineSprite()
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
         this.frameCount = param1.readUI16();
         parseTags(param1,param3);
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeUI16(this.characterId);
         _loc3_.writeUI16(this.frameCount);
         publishTags(_loc3_,param2);
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      public function clone() : IDefinitionTag
      {
         var _loc1_:TagDefineSprite = new TagDefineSprite();
         throw new Error("Not implemented yet.");
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "DefineSprite";
      }
      
      public function get version() : uint
      {
         return 3;
      }
      
      public function get level() : uint
      {
         return 1;
      }
      
      override public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         return Tag.toStringCommon(this.type,this.name,param1) + "ID: " + this.characterId + ", " + "FrameCount: " + this.frameCount + super.toString(param1);
      }
   }
}

