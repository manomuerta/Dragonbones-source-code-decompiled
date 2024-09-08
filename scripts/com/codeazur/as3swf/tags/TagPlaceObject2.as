package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.utils.StringUtils;
   
   public class TagPlaceObject2 extends TagPlaceObject implements IDisplayListTag
   {
      public static const TYPE:uint = 26;
      
      public function TagPlaceObject2()
      {
         super();
      }
      
      override public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         var _loc5_:uint = param1.readUI8();
         hasClipActions = (_loc5_ & 0x80) != 0;
         hasClipDepth = (_loc5_ & 0x40) != 0;
         hasName = (_loc5_ & 0x20) != 0;
         hasRatio = (_loc5_ & 0x10) != 0;
         hasColorTransform = (_loc5_ & 8) != 0;
         hasMatrix = (_loc5_ & 4) != 0;
         hasCharacter = (_loc5_ & 2) != 0;
         hasMove = (_loc5_ & 1) != 0;
         depth = param1.readUI16();
         if(hasCharacter)
         {
            characterId = param1.readUI16();
         }
         if(hasMatrix)
         {
            matrix = param1.readMATRIX();
         }
         if(hasColorTransform)
         {
            colorTransform = param1.readCXFORMWITHALPHA();
         }
         if(hasRatio)
         {
            ratio = param1.readUI16();
         }
         if(hasName)
         {
            instanceName = param1.readString();
         }
         if(hasClipDepth)
         {
            clipDepth = param1.readUI16();
         }
         if(hasClipActions)
         {
            clipActions = param1.readCLIPACTIONS(param3);
         }
      }
      
      override public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:uint = 0;
         var _loc4_:SWFData = new SWFData();
         if(hasMove)
         {
            _loc3_ |= 1;
         }
         if(hasCharacter)
         {
            _loc3_ |= 2;
         }
         if(hasMatrix)
         {
            _loc3_ |= 4;
         }
         if(hasColorTransform)
         {
            _loc3_ |= 8;
         }
         if(hasRatio)
         {
            _loc3_ |= 16;
         }
         if(hasName)
         {
            _loc3_ |= 32;
         }
         if(hasClipDepth)
         {
            _loc3_ |= 64;
         }
         if(hasClipActions)
         {
            _loc3_ |= 128;
         }
         _loc4_.writeUI8(_loc3_);
         _loc4_.writeUI16(depth);
         if(hasCharacter)
         {
            _loc4_.writeUI16(characterId);
         }
         if(hasMatrix)
         {
            _loc4_.writeMATRIX(matrix);
         }
         if(hasColorTransform)
         {
            _loc4_.writeCXFORM(colorTransform);
         }
         if(hasRatio)
         {
            _loc4_.writeUI16(ratio);
         }
         if(hasName)
         {
            _loc4_.writeString(instanceName);
         }
         if(hasClipDepth)
         {
            _loc4_.writeUI16(clipDepth);
         }
         if(hasClipActions)
         {
            _loc4_.writeCLIPACTIONS(clipActions,param2);
         }
         param1.writeTagHeader(this.type,_loc4_.length);
         param1.writeBytes(_loc4_);
      }
      
      override public function get type() : uint
      {
         return TYPE;
      }
      
      override public function get name() : String
      {
         return "PlaceObject2";
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
         var _loc3_:String = Tag.toStringCommon(this.type,this.name,param1) + "Depth: " + depth;
         if(hasCharacter)
         {
            _loc3_ += ", CharacterID: " + characterId;
         }
         if(hasMatrix)
         {
            _loc3_ += ", Matrix: " + matrix.toString();
         }
         if(hasColorTransform)
         {
            _loc3_ += ", ColorTransform: " + colorTransform;
         }
         if(hasRatio)
         {
            _loc3_ += ", Ratio: " + ratio;
         }
         if(hasName)
         {
            _loc3_ += ", Name: " + instanceName;
         }
         if(hasClipDepth)
         {
            _loc3_ += ", ClipDepth: " + clipDepth;
         }
         if(hasClipActions && clipActions != null)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + clipActions.toString(param1 + 2,param2);
         }
         return _loc3_;
      }
   }
}

