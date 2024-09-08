package com.codeazur.as3swf.tags
{
   import _14144.Config;
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.SWFShape;
   import com.codeazur.as3swf.exporters.core.IShapeExporter;
   import com.codeazur.utils.StringUtils;
   
   public class TagDefineFont implements IDefinitionTag
   {
      public static const TYPE:uint = 10;
      
      protected var _characterId:uint;
      
      protected var _glyphShapeTable:Vector.<SWFShape>;
      
      public function TagDefineFont()
      {
         super();
         this._glyphShapeTable = new Vector.<SWFShape>();
      }
      
      public function get characterId() : uint
      {
         return this._characterId;
      }
      
      public function set characterId(param1:uint) : void
      {
         this._characterId = param1;
      }
      
      public function get glyphShapeTable() : Vector.<SWFShape>
      {
         return this._glyphShapeTable;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         var _loc5_:uint = param1.position;
         this._characterId = param1.readUI16();
         var _loc6_:uint = uint(param1.readUI16() >> 1);
         if(_loc6_ > Config.MAX_GLYPHS_NUM)
         {
            param1.position = _loc5_ + param2;
            return;
         }
         param1.skipBytes(_loc6_ - 1 << 1);
         var _loc7_:uint = 0;
         while(_loc7_ < _loc6_)
         {
            this._glyphShapeTable.push(param1.readSHAPE(this.unitDivisor));
            _loc7_++;
         }
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc4_:uint = 0;
         var _loc3_:SWFData = new SWFData();
         var _loc5_:uint = 0;
         var _loc6_:uint = this.glyphShapeTable.length;
         var _loc7_:SWFData = new SWFData();
         _loc3_.writeUI16(this.characterId);
         var _loc8_:uint = uint(_loc6_ << 1);
         _loc4_ = 0;
         while(_loc4_ < _loc6_)
         {
            _loc3_.writeUI16(_loc7_.position + _loc8_);
            _loc7_.writeSHAPE(this.glyphShapeTable[_loc4_]);
            _loc4_++;
         }
         _loc3_.writeBytes(_loc7_);
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      public function clone() : IDefinitionTag
      {
         var _loc1_:TagDefineFont = new TagDefineFont();
         throw new Error("Not implemented yet.");
      }
      
      public function export(param1:IShapeExporter, param2:uint) : void
      {
         this.glyphShapeTable[param2].export(param1);
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "DefineFont";
      }
      
      public function get version() : uint
      {
         return 1;
      }
      
      public function get level() : uint
      {
         return 1;
      }
      
      protected function get unitDivisor() : Number
      {
         return 1;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc3_:String = Tag.toStringCommon(this.type,this.name,param1) + "ID: " + this.characterId + ", " + "Glyphs: " + this._glyphShapeTable.length;
         return _loc3_ + this.toStringCommon(param1);
      }
      
      protected function toStringCommon(param1:uint) : String
      {
         var _loc2_:String = "";
         var _loc3_:uint = 0;
         while(_loc3_ < this._glyphShapeTable.length)
         {
            _loc2_ += "\n" + StringUtils.repeat(param1 + 2) + "[" + _loc3_ + "] GlyphShapes:";
            _loc2_ += this._glyphShapeTable[_loc3_].toString(param1 + 4);
            _loc3_++;
         }
         return _loc2_;
      }
   }
}

