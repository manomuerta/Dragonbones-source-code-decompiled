package com.codeazur.as3swf.tags
{
   import _724._14088;
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.consts.BlendMode;
   import com.codeazur.as3swf.utils.ColorUtils;
   import com.codeazur.utils.StringUtils;
   
   public class TagPlaceObject3 extends TagPlaceObject2 implements IDisplayListTag
   {
      public static const TYPE:uint = 70;
      
      public function TagPlaceObject3()
      {
         super();
      }
      
      override public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc5_:uint = param1.readUI8();
         hasClipActions = (_loc5_ & 0x80) != 0;
         hasClipDepth = (_loc5_ & 0x40) != 0;
         hasName = (_loc5_ & 0x20) != 0;
         hasRatio = (_loc5_ & 0x10) != 0;
         hasColorTransform = (_loc5_ & 8) != 0;
         hasMatrix = (_loc5_ & 4) != 0;
         hasCharacter = (_loc5_ & 2) != 0;
         hasMove = (_loc5_ & 1) != 0;
         var _loc6_:uint = param1.readUI8();
         _15089 = (_loc6_ & 0x40) != 0;
         _15090 = (_loc6_ & 0x20) != 0;
         hasImage = (_loc6_ & 0x10) != 0;
         hasClassName = (_loc6_ & 8) != 0;
         hasCacheAsBitmap = (_loc6_ & 4) != 0;
         hasBlendMode = (_loc6_ & 2) != 0;
         hasFilterList = (_loc6_ & 1) != 0;
         depth = param1.readUI16();
         if(hasClassName)
         {
            className = param1.readString();
         }
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
         if(hasFilterList)
         {
            _14088._14734 = true;
            _loc7_ = param1.readUI8();
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               _surfaceFilterList.push(param1.readFILTER());
               _loc8_++;
            }
         }
         if(hasBlendMode)
         {
            blendMode = param1.readUI8();
         }
         if(hasCacheAsBitmap)
         {
            bitmapCache = param1.readUI8();
         }
         if(_15090)
         {
            visible = param1.readUI8();
         }
         if(_15089)
         {
            bitmapBackgroundColor = param1.readRGBA();
         }
         if(hasClipActions)
         {
            clipActions = param1.readCLIPACTIONS(param3);
         }
      }
      
      protected function _15091() : SWFData
      {
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc1_:SWFData = new SWFData();
         var _loc2_:uint = 0;
         if(hasClipActions)
         {
            _loc2_ |= 128;
         }
         if(hasClipDepth)
         {
            _loc2_ |= 64;
         }
         if(hasName)
         {
            _loc2_ |= 32;
         }
         if(hasRatio)
         {
            _loc2_ |= 16;
         }
         if(hasColorTransform)
         {
            _loc2_ |= 8;
         }
         if(hasMatrix)
         {
            _loc2_ |= 4;
         }
         if(hasCharacter)
         {
            _loc2_ |= 2;
         }
         if(hasMove)
         {
            _loc2_ |= 1;
         }
         _loc1_.writeUI8(_loc2_);
         var _loc3_:uint = 0;
         if(_15089)
         {
            _loc3_ |= 64;
         }
         if(_15090)
         {
            _loc3_ |= 32;
         }
         if(hasImage)
         {
            _loc3_ |= 16;
         }
         if(hasClassName)
         {
            _loc3_ |= 8;
         }
         if(hasCacheAsBitmap)
         {
            _loc3_ |= 4;
         }
         if(hasBlendMode)
         {
            _loc3_ |= 2;
         }
         if(hasFilterList)
         {
            _loc3_ |= 1;
         }
         _loc1_.writeUI8(_loc3_);
         _loc1_.writeUI16(depth);
         if(hasClassName)
         {
            _loc1_.writeString(className);
         }
         if(hasCharacter)
         {
            _loc1_.writeUI16(characterId);
         }
         if(hasMatrix)
         {
            _loc1_.writeMATRIX(matrix);
         }
         if(hasColorTransform)
         {
            _loc1_.writeCXFORM(colorTransform);
         }
         if(hasRatio)
         {
            _loc1_.writeUI16(ratio);
         }
         if(hasName)
         {
            _loc1_.writeString(instanceName);
         }
         if(hasClipDepth)
         {
            _loc1_.writeUI16(clipDepth);
         }
         if(hasFilterList)
         {
            _loc4_ = _surfaceFilterList.length;
            _loc1_.writeUI8(_loc4_);
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc1_.writeFILTER(_surfaceFilterList[_loc5_]);
               _loc5_++;
            }
         }
         if(hasBlendMode)
         {
            _loc1_.writeUI8(blendMode);
         }
         if(hasCacheAsBitmap)
         {
            _loc1_.writeUI8(bitmapCache);
         }
         if(_15090)
         {
            _loc1_.writeUI8(visible);
         }
         if(_15089)
         {
            _loc1_.writeRGBA(bitmapBackgroundColor);
         }
         if(hasClipActions)
         {
            _loc1_.writeCLIPACTIONS(clipActions,this.version);
         }
         return _loc1_;
      }
      
      override public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = this._15091();
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      override public function get type() : uint
      {
         return TYPE;
      }
      
      override public function get name() : String
      {
         return "PlaceObject3";
      }
      
      override public function get version() : uint
      {
         return 8;
      }
      
      override public function get level() : uint
      {
         return 3;
      }
      
      override public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc4_:uint = 0;
         var _loc3_:String = Tag.toStringCommon(this.type,this.name,param1) + "Depth: " + depth;
         if(hasClassName)
         {
            _loc3_ += ", ClassName: " + className;
         }
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
         if(hasBlendMode)
         {
            _loc3_ += ", BlendMode: " + BlendMode.toString(blendMode);
         }
         if(hasCacheAsBitmap)
         {
            _loc3_ += ", CacheAsBitmap: " + bitmapCache;
         }
         if(_15090)
         {
            _loc3_ += ", Visible: " + visible;
         }
         if(_15089)
         {
            _loc3_ += ", BackgroundColor: " + ColorUtils.rgbaToString(bitmapBackgroundColor);
         }
         if(hasFilterList)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "Filters:";
            _loc4_ = 0;
            while(_loc4_ < surfaceFilterList.length)
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + "[" + _loc4_ + "] " + surfaceFilterList[_loc4_].toString(param1 + 4);
               _loc4_++;
            }
         }
         if(hasClipActions)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + clipActions.toString(param1 + 2);
         }
         return _loc3_;
      }
   }
}

