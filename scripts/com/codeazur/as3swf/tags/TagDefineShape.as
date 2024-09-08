package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.SWFRectangle;
   import com.codeazur.as3swf.data.SWFShapeWithStyle;
   import com.codeazur.as3swf.exporters.core.IShapeExporter;
   
   public class TagDefineShape implements IDefinitionTag
   {
      public static const TYPE:uint = 2;
      
      public var shapeBounds:SWFRectangle;
      
      public var shapes:SWFShapeWithStyle;
      
      protected var _characterId:uint;
      
      public var _15071:Boolean = true;
      
      public var _15072:Boolean = false;
      
      public function TagDefineShape()
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
         this.shapeBounds = param1.readRECT();
         this.shapes = param1.readSHAPEWITHSTYLE(this.level);
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeUI16(this.characterId);
         _loc3_.writeRECT(this.shapeBounds);
         _loc3_.writeSHAPEWITHSTYLE(this.shapes,this.level);
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      public function clone() : IDefinitionTag
      {
         var _loc1_:TagDefineShape = new TagDefineShape();
         throw new Error("Not implemented yet.");
      }
      
      public function export(param1:IShapeExporter = null) : void
      {
         this.shapes.export(param1);
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "DefineShape";
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
         var _loc3_:String = Tag.toStringCommon(this.type,this.name,param1) + "ID: " + this.characterId + ", " + "Bounds: " + this.shapeBounds;
         return _loc3_ + this.shapes.toString(param1 + 2);
      }
   }
}

