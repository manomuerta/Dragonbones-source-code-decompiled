package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.SWFSoundInfo;
   
   public class TagDefineButtonSound implements IDefinitionTag
   {
      public static const TYPE:uint = 17;
      
      public var buttonSoundChar0:uint;
      
      public var buttonSoundChar1:uint;
      
      public var buttonSoundChar2:uint;
      
      public var buttonSoundChar3:uint;
      
      public var buttonSoundInfo0:SWFSoundInfo;
      
      public var buttonSoundInfo1:SWFSoundInfo;
      
      public var buttonSoundInfo2:SWFSoundInfo;
      
      public var buttonSoundInfo3:SWFSoundInfo;
      
      protected var _characterId:uint;
      
      public function TagDefineButtonSound()
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
         this.buttonSoundChar0 = param1.readUI16();
         if(this.buttonSoundChar0 != 0)
         {
            this.buttonSoundInfo0 = param1.readSOUNDINFO();
         }
         this.buttonSoundChar1 = param1.readUI16();
         if(this.buttonSoundChar1 != 0)
         {
            this.buttonSoundInfo1 = param1.readSOUNDINFO();
         }
         this.buttonSoundChar2 = param1.readUI16();
         if(this.buttonSoundChar2 != 0)
         {
            this.buttonSoundInfo2 = param1.readSOUNDINFO();
         }
         this.buttonSoundChar3 = param1.readUI16();
         if(this.buttonSoundChar3 != 0)
         {
            this.buttonSoundInfo3 = param1.readSOUNDINFO();
         }
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeUI16(this.characterId);
         _loc3_.writeUI16(this.buttonSoundChar0);
         if(this.buttonSoundChar0 != 0)
         {
            _loc3_.writeSOUNDINFO(this.buttonSoundInfo0);
         }
         _loc3_.writeUI16(this.buttonSoundChar1);
         if(this.buttonSoundChar1 != 0)
         {
            _loc3_.writeSOUNDINFO(this.buttonSoundInfo1);
         }
         _loc3_.writeUI16(this.buttonSoundChar2);
         if(this.buttonSoundChar2 != 0)
         {
            _loc3_.writeSOUNDINFO(this.buttonSoundInfo2);
         }
         _loc3_.writeUI16(this.buttonSoundChar3);
         if(this.buttonSoundChar3 != 0)
         {
            _loc3_.writeSOUNDINFO(this.buttonSoundInfo3);
         }
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      public function clone() : IDefinitionTag
      {
         var _loc1_:TagDefineButtonSound = new TagDefineButtonSound();
         _loc1_.characterId = this.characterId;
         _loc1_.buttonSoundChar0 = this.buttonSoundChar0;
         _loc1_.buttonSoundChar1 = this.buttonSoundChar1;
         _loc1_.buttonSoundChar2 = this.buttonSoundChar2;
         _loc1_.buttonSoundChar3 = this.buttonSoundChar3;
         _loc1_.buttonSoundInfo0 = this.buttonSoundInfo0.clone();
         _loc1_.buttonSoundInfo1 = this.buttonSoundInfo1.clone();
         _loc1_.buttonSoundInfo2 = this.buttonSoundInfo2.clone();
         _loc1_.buttonSoundInfo3 = this.buttonSoundInfo3.clone();
         return _loc1_;
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "DefineButtonSound";
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
         return Tag.toStringCommon(this.type,this.name,param1) + "ButtonID: " + this.characterId + ", " + "ButtonSoundChars: " + this.buttonSoundChar0 + "," + this.buttonSoundChar1 + "," + this.buttonSoundChar2 + "," + this.buttonSoundChar3;
      }
   }
}

