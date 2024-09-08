package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.SWFClipActions;
   import com.codeazur.as3swf.data.SWFColorTransform;
   import com.codeazur.as3swf.data.SWFMatrix;
   import com.codeazur.as3swf.data.filters.IFilter;
   
   public class TagPlaceObject implements IDisplayListTag
   {
      public static const TYPE:uint = 4;
      
      public var hasClipActions:Boolean;
      
      public var hasClipDepth:Boolean;
      
      public var hasName:Boolean;
      
      public var hasRatio:Boolean;
      
      public var hasColorTransform:Boolean;
      
      public var hasMatrix:Boolean;
      
      public var hasCharacter:Boolean;
      
      public var hasMove:Boolean;
      
      public var _15089:Boolean;
      
      public var _15090:Boolean;
      
      public var hasImage:Boolean;
      
      public var hasClassName:Boolean;
      
      public var hasCacheAsBitmap:Boolean;
      
      public var hasBlendMode:Boolean;
      
      public var hasFilterList:Boolean;
      
      public var characterId:uint;
      
      public var depth:uint;
      
      public var matrix:SWFMatrix;
      
      public var colorTransform:SWFColorTransform;
      
      public var ratio:uint;
      
      public var instanceName:String;
      
      public var clipDepth:uint;
      
      public var clipActions:SWFClipActions;
      
      public var className:String;
      
      public var blendMode:uint;
      
      public var bitmapCache:uint;
      
      public var bitmapBackgroundColor:uint;
      
      public var visible:uint;
      
      public var metaData:Object;
      
      protected var _surfaceFilterList:Vector.<IFilter>;
      
      public function TagPlaceObject()
      {
         super();
         this._surfaceFilterList = new Vector.<IFilter>();
      }
      
      public function get surfaceFilterList() : Vector.<IFilter>
      {
         return this._surfaceFilterList;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         var _loc5_:uint = param1.position;
         this.characterId = param1.readUI16();
         this.depth = param1.readUI16();
         this.matrix = param1.readMATRIX();
         this.hasCharacter = true;
         this.hasMatrix = true;
         if(param1.position - _loc5_ < param2)
         {
            this.colorTransform = param1.readCXFORM();
            this.hasColorTransform = true;
         }
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeUI16(this.characterId);
         _loc3_.writeUI16(this.depth);
         _loc3_.writeMATRIX(this.matrix);
         if(this.hasColorTransform)
         {
            _loc3_.writeCXFORM(this.colorTransform);
         }
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "PlaceObject";
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
         var _loc3_:String = Tag.toStringCommon(this.type,this.name,param1) + "Depth: " + this.depth;
         if(this.hasCharacter)
         {
            _loc3_ += ", CharacterID: " + this.characterId;
         }
         if(this.hasMatrix)
         {
            _loc3_ += ", Matrix: " + this.matrix;
         }
         if(this.hasColorTransform)
         {
            _loc3_ += ", ColorTransform: " + this.colorTransform;
         }
         if(this.instanceName)
         {
            _loc3_ += ", instanceName: " + this.instanceName;
         }
         return _loc3_;
      }
   }
}

