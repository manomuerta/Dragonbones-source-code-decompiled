package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.SWFMorphFillStyle;
   import com.codeazur.as3swf.data.SWFMorphLineStyle;
   import com.codeazur.as3swf.data.SWFRectangle;
   import com.codeazur.as3swf.data.SWFShape;
   import com.codeazur.as3swf.data.SWFShapeRecord;
   import com.codeazur.as3swf.data.SWFShapeRecordCurvedEdge;
   import com.codeazur.as3swf.data.SWFShapeRecordEnd;
   import com.codeazur.as3swf.data.SWFShapeRecordStraightEdge;
   import com.codeazur.as3swf.data.SWFShapeRecordStyleChange;
   import com.codeazur.as3swf.data._14134;
   import com.codeazur.as3swf.exporters.core._14140;
   import com.codeazur.utils.StringUtils;
   import flash.utils.Dictionary;
   
   public class TagDefineMorphShape implements IDefinitionTag
   {
      public static const TYPE:uint = 46;
      
      public var startBounds:SWFRectangle;
      
      public var endBounds:SWFRectangle;
      
      public var startEdges:SWFShape;
      
      public var endEdges:SWFShape;
      
      protected var _characterId:uint;
      
      protected var _morphFillStyles:Vector.<SWFMorphFillStyle>;
      
      protected var _morphLineStyles:Vector.<SWFMorphLineStyle>;
      
      private var _15083:Dictionary;
      
      public function TagDefineMorphShape()
      {
         super();
         this._morphFillStyles = new Vector.<SWFMorphFillStyle>();
         this._morphLineStyles = new Vector.<SWFMorphLineStyle>();
      }
      
      public function get characterId() : uint
      {
         return this._characterId;
      }
      
      public function set characterId(param1:uint) : void
      {
         this._characterId = param1;
      }
      
      public function get morphFillStyles() : Vector.<SWFMorphFillStyle>
      {
         return this._morphFillStyles;
      }
      
      public function get morphLineStyles() : Vector.<SWFMorphLineStyle>
      {
         return this._morphLineStyles;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         var _loc6_:uint = 0;
         this._characterId = param1.readUI16();
         this.startBounds = param1.readRECT();
         this.endBounds = param1.readRECT();
         var _loc5_:uint = param1.readUI32();
         var _loc7_:uint = param1.readUI8();
         if(_loc7_ == 255)
         {
            _loc7_ = param1.readUI16();
         }
         _loc6_ = 0;
         while(_loc6_ < _loc7_)
         {
            this._morphFillStyles.push(param1.readMORPHFILLSTYLE());
            _loc6_++;
         }
         var _loc8_:uint = param1.readUI8();
         if(_loc8_ == 255)
         {
            _loc8_ = param1.readUI16();
         }
         _loc6_ = 0;
         while(_loc6_ < _loc8_)
         {
            this._morphLineStyles.push(param1.readMORPHLINESTYLE());
            _loc6_++;
         }
         this.startEdges = param1.readSHAPE();
         this.endEdges = param1.readSHAPE();
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc5_:uint = 0;
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeUI16(this.characterId);
         _loc3_.writeRECT(this.startBounds);
         _loc3_.writeRECT(this.endBounds);
         var _loc4_:SWFData = new SWFData();
         var _loc6_:uint = this._morphFillStyles.length;
         if(_loc6_ > 254)
         {
            _loc4_.writeUI8(255);
            _loc4_.writeUI16(_loc6_);
         }
         else
         {
            _loc4_.writeUI8(_loc6_);
         }
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            _loc4_.writeMORPHFILLSTYLE(this._morphFillStyles[_loc5_]);
            _loc5_++;
         }
         var _loc7_:uint = this._morphLineStyles.length;
         if(_loc7_ > 254)
         {
            _loc4_.writeUI8(255);
            _loc4_.writeUI16(_loc7_);
         }
         else
         {
            _loc4_.writeUI8(_loc7_);
         }
         _loc5_ = 0;
         while(_loc5_ < _loc7_)
         {
            _loc4_.writeMORPHLINESTYLE(this._morphLineStyles[_loc5_]);
            _loc5_++;
         }
         _loc4_.writeSHAPE(this.startEdges);
         _loc3_.writeUI32(_loc4_.length);
         _loc3_.writeBytes(_loc4_);
         _loc3_.writeSHAPE(this.endEdges);
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      public function clone() : IDefinitionTag
      {
         var _loc1_:TagDefineMorphShape = new TagDefineMorphShape();
         throw new Error("Not implemented yet.");
      }
      
      public function _15082(param1:_14140 = null) : void
      {
         this.export(param1,1);
         this.export(param1,0);
      }
      
      public function export(param1:_14140 = null, param2:Number = 0, param3:Dictionary = null) : void
      {
         var _loc15_:SWFShapeRecord = null;
         var _loc16_:SWFShapeRecord = null;
         var _loc17_:SWFShapeRecordStyleChange = null;
         var _loc18_:SWFShapeRecordStyleChange = null;
         var _loc19_:SWFShapeRecordStyleChange = null;
         var _loc20_:SWFShapeRecordCurvedEdge = null;
         var _loc21_:SWFShapeRecordCurvedEdge = null;
         var _loc22_:SWFShapeRecordCurvedEdge = null;
         var _loc23_:SWFShapeRecordStraightEdge = null;
         var _loc24_:SWFShapeRecordStraightEdge = null;
         var _loc25_:SWFShapeRecordStraightEdge = null;
         var _loc4_:Vector.<SWFShapeRecord> = new Vector.<SWFShapeRecord>();
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         while(_loc11_ < this.startEdges.records.length && _loc12_ < this.endEdges.records.length)
         {
            _loc15_ = this.startEdges.records[_loc11_];
            _loc16_ = this.endEdges.records[_loc12_];
            if(_loc15_ is SWFShapeRecordStyleChange || _loc16_ is SWFShapeRecordStyleChange)
            {
               if(_loc15_ is SWFShapeRecordStyleChange)
               {
                  _loc17_ = _loc15_ as SWFShapeRecordStyleChange;
                  if(_loc17_.stateMoveTo)
                  {
                     _loc5_ = _loc17_.moveDeltaX;
                     _loc6_ = _loc17_.moveDeltaY;
                  }
               }
               else
               {
                  _loc17_ = new SWFShapeRecordStyleChange();
                  _loc11_--;
               }
               if(_loc16_ is SWFShapeRecordStyleChange)
               {
                  _loc18_ = _loc16_ as SWFShapeRecordStyleChange;
                  if(_loc18_.stateMoveTo)
                  {
                     _loc7_ = _loc18_.moveDeltaX;
                     _loc8_ = _loc18_.moveDeltaY;
                  }
               }
               else
               {
                  _loc18_ = new SWFShapeRecordStyleChange();
                  _loc12_--;
               }
               _loc19_ = _loc17_.clone() as SWFShapeRecordStyleChange;
               if(_loc17_.stateMoveTo || _loc18_.stateMoveTo)
               {
                  _loc19_.moveDeltaX = _loc5_ + (_loc7_ - _loc5_) * param2;
                  _loc19_.moveDeltaY = _loc6_ + (_loc8_ - _loc6_) * param2;
                  _loc19_.stateMoveTo = _loc19_.moveDeltaX != _loc9_ || _loc19_.moveDeltaY != _loc10_;
               }
               _loc4_.push(_loc19_);
            }
            else
            {
               if(_loc15_ is SWFShapeRecordEnd)
               {
                  _loc4_.push(_loc15_);
                  break;
               }
               if(_loc16_ is SWFShapeRecordEnd)
               {
                  _loc4_.push(_loc16_);
                  break;
               }
               if(_loc15_ is SWFShapeRecordCurvedEdge || _loc16_ is SWFShapeRecordCurvedEdge)
               {
                  _loc20_ = null;
                  if(_loc15_ is SWFShapeRecordCurvedEdge)
                  {
                     _loc20_ = _loc15_ as SWFShapeRecordCurvedEdge;
                  }
                  else if(_loc15_ is SWFShapeRecordStraightEdge)
                  {
                     _loc20_ = this.convertToCurvedEdge(_loc15_ as SWFShapeRecordStraightEdge);
                  }
                  _loc21_ = null;
                  if(_loc16_ is SWFShapeRecordCurvedEdge)
                  {
                     _loc21_ = _loc16_ as SWFShapeRecordCurvedEdge;
                  }
                  else if(_loc16_ is SWFShapeRecordStraightEdge)
                  {
                     _loc21_ = this.convertToCurvedEdge(_loc16_ as SWFShapeRecordStraightEdge);
                  }
                  if(!(_loc21_ == null || _loc20_ == null))
                  {
                     (_loc22_ = new SWFShapeRecordCurvedEdge()).controlDeltaX = _loc20_.controlDeltaX + (_loc21_.controlDeltaX - _loc20_.controlDeltaX) * param2;
                     _loc22_.controlDeltaY = _loc20_.controlDeltaY + (_loc21_.controlDeltaY - _loc20_.controlDeltaY) * param2;
                     _loc22_.anchorDeltaX = _loc20_.anchorDeltaX + (_loc21_.anchorDeltaX - _loc20_.anchorDeltaX) * param2;
                     _loc22_.anchorDeltaY = _loc20_.anchorDeltaY + (_loc21_.anchorDeltaY - _loc20_.anchorDeltaY) * param2;
                     _loc5_ += _loc20_.controlDeltaX + _loc20_.anchorDeltaX;
                     _loc6_ += _loc20_.controlDeltaY + _loc20_.anchorDeltaY;
                     _loc7_ += _loc21_.controlDeltaX + _loc21_.anchorDeltaX;
                     _loc8_ += _loc21_.controlDeltaY + _loc21_.anchorDeltaY;
                     _loc9_ += _loc22_.controlDeltaX + _loc22_.anchorDeltaX;
                     _loc10_ += _loc22_.controlDeltaY + _loc22_.anchorDeltaY;
                     _loc4_.push(_loc22_);
                  }
               }
               else
               {
                  _loc23_ = null;
                  if(_loc15_ is SWFShapeRecordStraightEdge)
                  {
                     _loc23_ = _loc15_ as SWFShapeRecordStraightEdge;
                  }
                  _loc24_ = null;
                  if(_loc16_ is SWFShapeRecordStraightEdge)
                  {
                     _loc24_ = _loc16_ as SWFShapeRecordStraightEdge;
                  }
                  if(!(_loc24_ == null || _loc23_ == null))
                  {
                     (_loc25_ = new SWFShapeRecordStraightEdge()).generalLineFlag = true;
                     _loc25_.vertLineFlag = false;
                     _loc25_.deltaX = _loc23_.deltaX + (_loc24_.deltaX - _loc23_.deltaX) * param2;
                     _loc25_.deltaY = _loc23_.deltaY + (_loc24_.deltaY - _loc23_.deltaY) * param2;
                     if(_loc23_.deltaX != 0 && _loc24_.deltaY != 0)
                     {
                        _loc25_.generalLineFlag = true;
                        _loc25_.vertLineFlag = false;
                     }
                     else
                     {
                        _loc25_.generalLineFlag = false;
                        _loc25_.vertLineFlag = _loc23_.deltaX == 0;
                     }
                     _loc5_ += _loc23_.deltaX;
                     _loc6_ += _loc23_.deltaY;
                     _loc7_ += _loc24_.deltaX;
                     _loc8_ += _loc24_.deltaY;
                     _loc9_ += _loc25_.deltaX;
                     _loc10_ += _loc25_.deltaX;
                     _loc4_.push(_loc25_);
                  }
               }
            }
            _loc11_++;
            _loc12_++;
         }
         var _loc13_:_14134 = new _14134();
         var _loc14_:int = 0;
         while(_loc14_ < this.morphFillStyles.length)
         {
            _loc13_.fillStyles.push(this.morphFillStyles[_loc14_].getMorphedFillStyle(param2));
            _loc14_++;
         }
         _loc14_ = 0;
         while(_loc14_ < this.morphLineStyles.length)
         {
            _loc13_.lineStyles.push(this.morphLineStyles[_loc14_].getMorphedLineStyle(param2));
            _loc14_++;
         }
         _loc13_.records = _loc4_;
         if(param2 == 1)
         {
            this._15083 = _loc13_._15036();
         }
         else
         {
            _loc13_.exportData(param1,this._15083);
         }
      }
      
      protected function convertToCurvedEdge(param1:SWFShapeRecordStraightEdge) : SWFShapeRecordCurvedEdge
      {
         var _loc2_:SWFShapeRecordCurvedEdge = new SWFShapeRecordCurvedEdge();
         _loc2_.controlDeltaX = param1.deltaX / 2;
         _loc2_.controlDeltaY = param1.deltaY / 2;
         _loc2_.anchorDeltaX = param1.deltaX - _loc2_.controlDeltaX;
         _loc2_.anchorDeltaY = param1.deltaY - _loc2_.controlDeltaY;
         return _loc2_;
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "DefineMorphShape";
      }
      
      public function get version() : uint
      {
         return 3;
      }
      
      public function get level() : uint
      {
         return 1;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc3_:uint = 0;
         var _loc4_:String = StringUtils.repeat(param1 + 2);
         var _loc5_:String = StringUtils.repeat(param1 + 4);
         var _loc6_:String = Tag.toStringCommon(this.type,this.name,param1) + "ID: " + this.characterId;
         _loc6_ = (_loc6_ = (_loc6_ = _loc6_ + ("\n" + _loc4_ + "Bounds:")) + ("\n" + _loc5_ + "StartBounds: " + this.startBounds.toString())) + ("\n" + _loc5_ + "EndBounds: " + this.endBounds.toString());
         if(this._morphFillStyles.length > 0)
         {
            _loc6_ += "\n" + _loc4_ + "FillStyles:";
            _loc3_ = 0;
            while(_loc3_ < this._morphFillStyles.length)
            {
               _loc6_ += "\n" + _loc5_ + "[" + (_loc3_ + 1) + "] " + this._morphFillStyles[_loc3_].toString();
               _loc3_++;
            }
         }
         if(this._morphLineStyles.length > 0)
         {
            _loc6_ += "\n" + _loc4_ + "LineStyles:";
            _loc3_ = 0;
            while(_loc3_ < this._morphLineStyles.length)
            {
               _loc6_ += "\n" + _loc5_ + "[" + (_loc3_ + 1) + "] " + this._morphLineStyles[_loc3_].toString();
               _loc3_++;
            }
         }
         _loc6_ += this.startEdges.toString(param1 + 2);
         return _loc6_ += this.startEdges.toString(param1 + 2) + this.endEdges.toString(param1 + 2);
      }
   }
}

