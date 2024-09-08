package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.SWFRectangle;
   
   public class TagDefineShape4 extends TagDefineShape3 implements IDefinitionTag
   {
      public static const TYPE:uint = 83;
      
      public var edgeBounds:SWFRectangle;
      
      public var usesFillWindingRule:Boolean;
      
      public var usesNonScalingStrokes:Boolean;
      
      public var usesScalingStrokes:Boolean;
      
      public function TagDefineShape4()
      {
         super();
      }
      
      override public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         _characterId = param1.readUI16();
         shapeBounds = param1.readRECT();
         this.edgeBounds = param1.readRECT();
         var _loc5_:uint = param1.readUI8();
         this.usesFillWindingRule = (_loc5_ & 4) != 0;
         this.usesNonScalingStrokes = (_loc5_ & 2) != 0;
         this.usesScalingStrokes = (_loc5_ & 1) != 0;
         shapes = param1.readSHAPEWITHSTYLE(this.level);
      }
      
      override public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeUI16(characterId);
         _loc3_.writeRECT(shapeBounds);
         _loc3_.writeRECT(this.edgeBounds);
         var _loc4_:uint = 0;
         if(this.usesFillWindingRule)
         {
            _loc4_ |= 4;
         }
         if(this.usesNonScalingStrokes)
         {
            _loc4_ |= 2;
         }
         if(this.usesScalingStrokes)
         {
            _loc4_ |= 1;
         }
         _loc3_.writeUI8(_loc4_);
         _loc3_.writeSHAPEWITHSTYLE(shapes,this.level);
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      override public function get type() : uint
      {
         return TYPE;
      }
      
      override public function get name() : String
      {
         return "DefineShape4";
      }
      
      override public function get version() : uint
      {
         return 8;
      }
      
      override public function get level() : uint
      {
         return 4;
      }
      
      override public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc3_:* = Tag.toStringCommon(this.type,this.name,param1) + "ID: " + characterId + ", ";
         if(this.usesFillWindingRule)
         {
            _loc3_ += "UsesFillWindingRule, ";
         }
         if(this.usesNonScalingStrokes)
         {
            _loc3_ += "UsesNonScalingStrokes, ";
         }
         if(this.usesScalingStrokes)
         {
            _loc3_ += "UsesScalingStrokes, ";
         }
         _loc3_ += "ShapeBounds: " + shapeBounds + ", EdgeBounds: " + this.edgeBounds;
         return _loc3_ + shapes.toString(param1 + 2);
      }
   }
}

