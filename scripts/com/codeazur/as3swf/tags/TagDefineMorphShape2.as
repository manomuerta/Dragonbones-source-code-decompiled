package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.SWFMorphLineStyle2;
   import com.codeazur.as3swf.data.SWFRectangle;
   import com.codeazur.utils.StringUtils;
   
   public class TagDefineMorphShape2 extends TagDefineMorphShape implements ITag
   {
      public static const TYPE:uint = 84;
      
      public var startEdgeBounds:SWFRectangle;
      
      public var endEdgeBounds:SWFRectangle;
      
      public var usesNonScalingStrokes:Boolean;
      
      public var usesScalingStrokes:Boolean;
      
      public function TagDefineMorphShape2()
      {
         super();
      }
      
      override public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         var _loc7_:uint = 0;
         _characterId = param1.readUI16();
         if(characterId == 33)
         {
         }
         startBounds = param1.readRECT();
         endBounds = param1.readRECT();
         this.startEdgeBounds = param1.readRECT();
         this.endEdgeBounds = param1.readRECT();
         var _loc5_:uint = param1.readUI8();
         this.usesNonScalingStrokes = (_loc5_ & 2) != 0;
         this.usesScalingStrokes = (_loc5_ & 1) != 0;
         var _loc6_:uint = param1.readUI32();
         var _loc8_:uint = param1.readUI8();
         if(_loc8_ == 255)
         {
            _loc8_ = param1.readUI16();
         }
         _loc7_ = 0;
         while(_loc7_ < _loc8_)
         {
            _morphFillStyles.push(param1.readMORPHFILLSTYLE());
            _loc7_++;
         }
         var _loc9_:uint = param1.readUI8();
         if(_loc9_ == 255)
         {
            _loc9_ = param1.readUI16();
         }
         _loc7_ = 0;
         while(_loc7_ < _loc9_)
         {
            _morphLineStyles.push(param1.readMORPHLINESTYLE2());
            _loc7_++;
         }
         startEdges = param1.readSHAPE();
         endEdges = param1.readSHAPE();
      }
      
      override public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeUI16(characterId);
         _loc3_.writeRECT(startBounds);
         _loc3_.writeRECT(endBounds);
         _loc3_.writeRECT(this.startEdgeBounds);
         _loc3_.writeRECT(this.endEdgeBounds);
         var _loc4_:uint = 0;
         if(this.usesNonScalingStrokes)
         {
            _loc4_ |= 2;
         }
         if(this.usesScalingStrokes)
         {
            _loc4_ |= 1;
         }
         _loc3_.writeUI8(_loc4_);
         var _loc5_:SWFData = new SWFData();
         var _loc7_:uint = _morphFillStyles.length;
         if(_loc7_ > 254)
         {
            _loc5_.writeUI8(255);
            _loc5_.writeUI16(_loc7_);
         }
         else
         {
            _loc5_.writeUI8(_loc7_);
         }
         _loc6_ = 0;
         while(_loc6_ < _loc7_)
         {
            _loc5_.writeMORPHFILLSTYLE(_morphFillStyles[_loc6_]);
            _loc6_++;
         }
         var _loc8_:uint = _morphLineStyles.length;
         if(_loc8_ > 254)
         {
            _loc5_.writeUI8(255);
            _loc5_.writeUI16(_loc8_);
         }
         else
         {
            _loc5_.writeUI8(_loc8_);
         }
         _loc6_ = 0;
         while(_loc6_ < _loc8_)
         {
            _loc5_.writeMORPHLINESTYLE2(SWFMorphLineStyle2(_morphLineStyles[_loc6_]));
            _loc6_++;
         }
         _loc5_.writeSHAPE(startEdges);
         _loc3_.writeUI32(_loc5_.length);
         _loc3_.writeBytes(_loc5_);
         _loc3_.writeSHAPE(endEdges);
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      override public function get type() : uint
      {
         return TYPE;
      }
      
      override public function get name() : String
      {
         return "DefineMorphShape2";
      }
      
      override public function get version() : uint
      {
         return 8;
      }
      
      override public function get level() : uint
      {
         return 2;
      }
      
      override public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc3_:uint = 0;
         var _loc4_:String = StringUtils.repeat(param1 + 2);
         var _loc5_:String = StringUtils.repeat(param1 + 4);
         var _loc6_:String = Tag.toStringCommon(this.type,this.name,param1) + "ID: " + characterId;
         _loc6_ = (_loc6_ = (_loc6_ = (_loc6_ = (_loc6_ = _loc6_ + ("\n" + _loc4_ + "Bounds:")) + ("\n" + _loc5_ + "StartBounds: " + startBounds.toString())) + ("\n" + _loc5_ + "EndBounds: " + endBounds.toString())) + ("\n" + _loc5_ + "StartEdgeBounds: " + this.startEdgeBounds.toString())) + ("\n" + _loc5_ + "EndEdgeBounds: " + this.endEdgeBounds.toString());
         if(_morphFillStyles.length > 0)
         {
            _loc6_ += "\n" + _loc4_ + "FillStyles:";
            _loc3_ = 0;
            while(_loc3_ < _morphFillStyles.length)
            {
               _loc6_ += "\n" + _loc5_ + "[" + (_loc3_ + 1) + "] " + _morphFillStyles[_loc3_].toString();
               _loc3_++;
            }
         }
         if(_morphLineStyles.length > 0)
         {
            _loc6_ += "\n" + _loc4_ + "LineStyles:";
            _loc3_ = 0;
            while(_loc3_ < _morphLineStyles.length)
            {
               _loc6_ += "\n" + _loc5_ + "[" + (_loc3_ + 1) + "] " + _morphLineStyles[_loc3_].toString();
               _loc3_++;
            }
         }
         _loc6_ += startEdges.toString(param1 + 2);
         return _loc6_ += startEdges.toString(param1 + 2) + endEdges.toString(param1 + 2);
      }
   }
}

