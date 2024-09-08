package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.SWFGlyphEntry;
   import com.codeazur.as3swf.data.SWFMatrix;
   import com.codeazur.as3swf.data.SWFRectangle;
   import com.codeazur.as3swf.data.SWFTextRecord;
   import com.codeazur.utils.StringUtils;
   
   public class TagDefineText implements IDefinitionTag
   {
      public static const TYPE:uint = 11;
      
      public var textBounds:SWFRectangle;
      
      public var textMatrix:SWFMatrix;
      
      public var _15087:uint;
      
      public var _15085:uint;
      
      protected var _characterId:uint;
      
      protected var _records:Vector.<SWFTextRecord>;
      
      private var _15088:Vector.<SWFGlyphEntry>;
      
      private var _15086:String = "";
      
      private var codeTable:Vector.<uint>;
      
      private var leading:int = 0;
      
      public function TagDefineText()
      {
         super();
         this._records = new Vector.<SWFTextRecord>();
      }
      
      public function get characterId() : uint
      {
         return this._characterId;
      }
      
      public function set characterId(param1:uint) : void
      {
         this._characterId = param1;
      }
      
      public function get records() : Vector.<SWFTextRecord>
      {
         return this._records;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         var _loc7_:SWFTextRecord = null;
         this._characterId = param1.readUI16();
         this.textBounds = param1.readRECT();
         this.textMatrix = param1.readMATRIX();
         var _loc5_:uint = param1.readUI8();
         var _loc6_:uint = param1.readUI8();
         this._15087 = _loc5_;
         this._15085 = _loc6_;
         while(_loc7_ = param1.readTEXTRECORD(_loc5_,_loc6_,_loc7_,this.level), _loc7_ != null)
         {
            this._records.push(_loc7_);
         }
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:SWFTextRecord = null;
         var _loc12_:uint = 0;
         var _loc13_:SWFGlyphEntry = null;
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeUI16(this.characterId);
         _loc3_.writeRECT(this.textBounds);
         _loc3_.writeMATRIX(this.textMatrix);
         var _loc7_:Array = [];
         var _loc8_:Array = [];
         var _loc9_:uint = this._records.length;
         _loc4_ = 0;
         while(_loc4_ < _loc9_)
         {
            _loc6_ = this._records[_loc4_];
            _loc12_ = _loc6_.glyphEntries.length;
            _loc5_ = 0;
            while(_loc5_ < _loc12_)
            {
               _loc13_ = _loc6_.glyphEntries[_loc5_];
               _loc7_.push(_loc13_.index);
               _loc8_.push(_loc13_.advance);
               _loc5_++;
            }
            _loc4_++;
         }
         var _loc10_:uint = _loc3_.calculateMaxBits(false,_loc7_);
         var _loc11_:uint = _loc3_.calculateMaxBits(true,_loc8_);
         _loc3_.writeUI8(_loc10_);
         _loc3_.writeUI8(_loc11_);
         _loc6_ = null;
         _loc4_ = 0;
         while(_loc4_ < _loc9_)
         {
            _loc3_.writeTEXTRECORD(this._records[_loc4_],_loc10_,_loc11_,_loc6_,this.level);
            _loc6_ = this._records[_loc4_];
            _loc4_++;
         }
         _loc3_.writeUI8(0);
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      public function clone() : IDefinitionTag
      {
         var _loc1_:TagDefineText = new TagDefineText();
         _loc1_.characterId = this.characterId;
         _loc1_.textBounds = this.textBounds.clone();
         _loc1_.textMatrix = this.textMatrix.clone();
         var _loc2_:uint = 0;
         while(_loc2_ < this._records.length)
         {
            _loc1_.records.push(this._records[_loc2_].clone());
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "DefineText";
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
         var _loc4_:uint = 0;
         var _loc3_:String = Tag.toStringCommon(this.type,this.name,param1) + "ID: " + this.characterId + ", " + "Bounds: " + this.textBounds + ", " + "Matrix: " + this.textMatrix;
         if(this._records.length > 0)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "TextRecords:";
            _loc4_ = 0;
            while(_loc4_ < this._records.length)
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + "[" + _loc4_ + "] " + this._records[_loc4_].toString(param1 + 4);
               _loc4_++;
            }
         }
         return _loc3_;
      }
   }
}

