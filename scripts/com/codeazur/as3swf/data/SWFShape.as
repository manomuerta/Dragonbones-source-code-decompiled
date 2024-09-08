package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.consts.GradientInterpolationMode;
   import com.codeazur.as3swf.data.consts.GradientSpreadMode;
   import com.codeazur.as3swf.data.consts.LineCapsStyle;
   import com.codeazur.as3swf.data.consts.LineJointStyle;
   import com.codeazur.as3swf.data.etc.CurvedEdge;
   import com.codeazur.as3swf.data.etc.IEdge;
   import com.codeazur.as3swf.data.etc.StraightEdge;
   import com.codeazur.as3swf.exporters.core.DefaultShapeExporter;
   import com.codeazur.as3swf.exporters.core.IShapeExporter;
   import com.codeazur.as3swf.utils.ColorUtils;
   import com.codeazur.as3swf.utils.NumberUtils;
   import com.codeazur.utils.StringUtils;
   import flash.display.CapsStyle;
   import flash.display.GradientType;
   import flash.display.LineScaleMode;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class SWFShape
   {
      protected var _records:Vector.<SWFShapeRecord>;
      
      protected var _fillStyles:Vector.<SWFFillStyle>;
      
      protected var _lineStyles:Vector.<SWFLineStyle>;
      
      protected var _referencePoint:Point;
      
      protected var fillEdgeMaps:Vector.<Dictionary>;
      
      protected var lineEdgeMaps:Vector.<Dictionary>;
      
      protected var currentFillEdgeMap:Dictionary;
      
      protected var currentLineEdgeMap:Dictionary;
      
      protected var numGroups:uint;
      
      protected var coordMap:Dictionary;
      
      protected var unitDivisor:Number;
      
      protected var edgeMapsCreated:Boolean = false;
      
      private const MOVE_BOTTOM:Number = 0;
      
      private const MOVE_TOP:Number = 0;
      
      private var _15043:Array;
      
      public function SWFShape(param1:SWFData = null, param2:uint = 1, param3:Number = 20)
      {
         super();
         this._records = new Vector.<SWFShapeRecord>();
         this._fillStyles = new Vector.<SWFFillStyle>();
         this._lineStyles = new Vector.<SWFLineStyle>();
         this._referencePoint = new Point(0,0);
         this.unitDivisor = param3;
         if(param1 != null)
         {
            this.parse(param1,param2);
         }
      }
      
      public function get records() : Vector.<SWFShapeRecord>
      {
         return this._records;
      }
      
      public function get fillStyles() : Vector.<SWFFillStyle>
      {
         return this._fillStyles;
      }
      
      public function get lineStyles() : Vector.<SWFLineStyle>
      {
         return this._lineStyles;
      }
      
      public function get referencePoint() : Point
      {
         return this._referencePoint;
      }
      
      public function getMaxFillStyleIndex() : uint
      {
         var _loc3_:SWFShapeRecord = null;
         var _loc4_:SWFShapeRecordStyleChange = null;
         var _loc1_:uint = 0;
         var _loc2_:uint = 0;
         while(_loc2_ < this.records.length)
         {
            _loc3_ = this.records[_loc2_];
            if(_loc3_.type == SWFShapeRecord.TYPE_STYLECHANGE)
            {
               _loc4_ = _loc3_ as SWFShapeRecordStyleChange;
               if(_loc4_.fillStyle0 > _loc1_)
               {
                  _loc1_ = _loc4_.fillStyle0;
               }
               if(_loc4_.fillStyle1 > _loc1_)
               {
                  _loc1_ = _loc4_.fillStyle1;
               }
               if(_loc4_.stateNewStyles)
               {
                  break;
               }
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function getMaxLineStyleIndex() : uint
      {
         var _loc3_:SWFShapeRecord = null;
         var _loc4_:SWFShapeRecordStyleChange = null;
         var _loc1_:uint = 0;
         var _loc2_:uint = 0;
         while(_loc2_ < this.records.length)
         {
            _loc3_ = this.records[_loc2_];
            if(_loc3_.type == SWFShapeRecord.TYPE_STYLECHANGE)
            {
               _loc4_ = _loc3_ as SWFShapeRecordStyleChange;
               if(_loc4_.lineStyle > _loc1_)
               {
                  _loc1_ = _loc4_.lineStyle;
               }
               if(_loc4_.stateNewStyles)
               {
                  break;
               }
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function parse(param1:SWFData, param2:uint = 1) : void
      {
         param1.resetBitsPending();
         var _loc3_:uint = param1.readUB(4);
         var _loc4_:uint = param1.readUB(4);
         this.readShapeRecords(param1,_loc3_,_loc4_,param2);
         this.determineReferencePoint();
      }
      
      public function publish(param1:SWFData, param2:uint = 1) : void
      {
         var _loc3_:uint = param1.calculateMaxBits(false,[this.getMaxFillStyleIndex()]);
         var _loc4_:uint = param1.calculateMaxBits(false,[this.getMaxLineStyleIndex()]);
         param1.resetBitsPending();
         param1.writeUB(4,_loc3_);
         param1.writeUB(4,_loc4_);
         this.writeShapeRecords(param1,_loc3_,_loc4_,param2);
      }
      
      protected function readShapeRecords(param1:SWFData, param2:uint, param3:uint, param4:uint = 1) : void
      {
         var _loc5_:SWFShapeRecord = null;
         var _loc6_:* = false;
         var _loc7_:* = false;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:SWFShapeRecordStyleChange = null;
         while(!(_loc5_ is SWFShapeRecordEnd))
         {
            _loc6_ = param1.readUB(1) == 1;
            if(_loc6_)
            {
               _loc7_ = param1.readUB(1) == 1;
               _loc8_ = uint(param1.readUB(4) + 2);
               if(_loc7_)
               {
                  _loc5_ = param1.readSTRAIGHTEDGERECORD(_loc8_);
               }
               else
               {
                  _loc5_ = param1.readCURVEDEDGERECORD(_loc8_);
               }
            }
            else
            {
               _loc9_ = param1.readUB(5);
               if(_loc9_ == 0)
               {
                  _loc5_ = new SWFShapeRecordEnd();
               }
               else
               {
                  _loc10_ = param1.readSTYLECHANGERECORD(_loc9_,param2,param3,param4);
                  if(_loc10_.stateNewStyles)
                  {
                     param2 = _loc10_.numFillBits;
                     param3 = _loc10_.numLineBits;
                  }
                  _loc5_ = _loc10_;
               }
            }
            this._records.push(_loc5_);
         }
      }
      
      protected function writeShapeRecords(param1:SWFData, param2:uint, param3:uint, param4:uint = 1) : void
      {
         var _loc6_:SWFShapeRecord = null;
         var _loc7_:uint = 0;
         var _loc8_:SWFShapeRecordStyleChange = null;
         if(this.records.length == 0 || !(this.records[this.records.length - 1] is SWFShapeRecordEnd))
         {
            this.records.push(new SWFShapeRecordEnd());
         }
         var _loc5_:uint = 0;
         while(_loc5_ < this.records.length)
         {
            _loc6_ = this.records[_loc5_];
            if(_loc6_.isEdgeRecord)
            {
               param1.writeUB(1,1);
               if(_loc6_.type == SWFShapeRecord.TYPE_STRAIGHTEDGE)
               {
                  param1.writeUB(1,1);
                  param1.writeSTRAIGHTEDGERECORD(SWFShapeRecordStraightEdge(_loc6_));
               }
               else
               {
                  param1.writeUB(1,0);
                  param1.writeCURVEDEDGERECORD(SWFShapeRecordCurvedEdge(_loc6_));
               }
            }
            else
            {
               param1.writeUB(1,0);
               if(_loc6_.type == SWFShapeRecord.TYPE_END)
               {
                  param1.writeUB(5,0);
               }
               else
               {
                  _loc7_ = 0;
                  _loc8_ = _loc6_ as SWFShapeRecordStyleChange;
                  if(_loc8_.stateNewStyles)
                  {
                     _loc7_ |= 16;
                  }
                  if(_loc8_.stateLineStyle)
                  {
                     _loc7_ |= 8;
                  }
                  if(_loc8_.stateFillStyle1)
                  {
                     _loc7_ |= 4;
                  }
                  if(_loc8_.stateFillStyle0)
                  {
                     _loc7_ |= 2;
                  }
                  if(_loc8_.stateMoveTo)
                  {
                     _loc7_ |= 1;
                  }
                  param1.writeUB(5,_loc7_);
                  param1.writeSTYLECHANGERECORD(_loc8_,param2,param3,param4);
                  if(_loc8_.stateNewStyles)
                  {
                     param2 = _loc8_.numFillBits;
                     param3 = _loc8_.numLineBits;
                  }
               }
            }
            _loc5_++;
         }
      }
      
      protected function determineReferencePoint() : void
      {
         var _loc1_:SWFShapeRecordStyleChange = this._records[0] as SWFShapeRecordStyleChange;
         if(Boolean(_loc1_) && _loc1_.stateMoveTo)
         {
            this.referencePoint.x = NumberUtils.roundPixels400(_loc1_.moveDeltaX / this.unitDivisor);
            this.referencePoint.y = NumberUtils.roundPixels400(_loc1_.moveDeltaY / this.unitDivisor);
         }
      }
      
      public function export(param1:IShapeExporter = null) : void
      {
         this._15043 = [];
         this.edgeMapsCreated = false;
         this.createEdgeMaps();
         if(param1 == null)
         {
            param1 = new DefaultShapeExporter(null);
         }
         param1.beginShape();
         this._15039(param1);
         var _loc2_:int = 0;
         while(_loc2_ < this.numGroups)
         {
            param1._15040(18);
            this.exportFillPath(param1,_loc2_);
            param1._15040(19);
            this.exportLinePath(param1,_loc2_);
            _loc2_++;
         }
         param1.endShape();
      }
      
      protected function createEdgeMaps() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Point = null;
         var _loc4_:Point = null;
         var _loc5_:Point = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:Vector.<IEdge> = null;
         var _loc12_:uint = 0;
         var _loc13_:SWFShapeRecord = null;
         var _loc14_:SWFShapeRecordStyleChange = null;
         var _loc15_:SWFShapeRecordStraightEdge = null;
         var _loc16_:SWFShapeRecordCurvedEdge = null;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         if(!this.edgeMapsCreated)
         {
            _loc1_ = 0;
            _loc2_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            _loc9_ = 0;
            _loc10_ = 0;
            _loc11_ = new Vector.<IEdge>();
            this.numGroups = 0;
            this.fillEdgeMaps = new Vector.<Dictionary>();
            this.lineEdgeMaps = new Vector.<Dictionary>();
            this.currentFillEdgeMap = new Dictionary();
            this.currentLineEdgeMap = new Dictionary();
            _loc12_ = 0;
            while(_loc12_ < this._records.length)
            {
               _loc13_ = this._records[_loc12_];
               switch(_loc13_.type)
               {
                  case SWFShapeRecord.TYPE_STYLECHANGE:
                     _loc14_ = _loc13_ as SWFShapeRecordStyleChange;
                     if(_loc14_.stateLineStyle || _loc14_.stateFillStyle0 || _loc14_.stateFillStyle1)
                     {
                        this.processSubPath(_loc11_,_loc10_,_loc8_,_loc9_);
                        _loc11_ = new Vector.<IEdge>();
                     }
                     if(_loc14_.stateNewStyles)
                     {
                        _loc6_ = int(this._fillStyles.length);
                        _loc7_ = int(this._lineStyles.length);
                        this.appendFillStyles(this._fillStyles,_loc14_.fillStyles);
                        this.appendLineStyles(this._lineStyles,_loc14_.lineStyles);
                     }
                     if(_loc14_.stateLineStyle && _loc14_.lineStyle == 0 && _loc14_.stateFillStyle0 && _loc14_.fillStyle0 == 0 && _loc14_.stateFillStyle1 && _loc14_.fillStyle1 == 0)
                     {
                        this.cleanEdgeMap(this.currentFillEdgeMap);
                        this.cleanEdgeMap(this.currentLineEdgeMap,false);
                        this.fillEdgeMaps.push(this.currentFillEdgeMap);
                        this.lineEdgeMaps.push(this.currentLineEdgeMap);
                        this.currentFillEdgeMap = new Dictionary();
                        this.currentLineEdgeMap = new Dictionary();
                        _loc10_ = 0;
                        _loc8_ = 0;
                        _loc9_ = 0;
                        ++this.numGroups;
                     }
                     else
                     {
                        if(_loc14_.stateLineStyle)
                        {
                           _loc10_ = _loc14_.lineStyle;
                           if(_loc10_ > 0)
                           {
                              _loc10_ += _loc7_;
                           }
                        }
                        if(_loc14_.stateFillStyle0)
                        {
                           _loc8_ = _loc14_.fillStyle0;
                           if(_loc8_ > 0)
                           {
                              _loc8_ += _loc6_;
                           }
                        }
                        if(_loc14_.stateFillStyle1)
                        {
                           _loc9_ = _loc14_.fillStyle1;
                           if(_loc9_ > 0)
                           {
                              _loc9_ += _loc6_;
                           }
                        }
                     }
                     if(_loc14_.stateMoveTo)
                     {
                        _loc1_ = _loc14_.moveDeltaX / this.unitDivisor;
                        _loc2_ = _loc14_.moveDeltaY / this.unitDivisor;
                     }
                     break;
                  case SWFShapeRecord.TYPE_STRAIGHTEDGE:
                     _loc15_ = _loc13_ as SWFShapeRecordStraightEdge;
                     _loc3_ = new Point(NumberUtils.roundPixels400(_loc1_),NumberUtils.roundPixels400(_loc2_));
                     if(_loc15_.generalLineFlag)
                     {
                        _loc1_ += _loc15_.deltaX / this.unitDivisor;
                        _loc2_ += _loc15_.deltaY / this.unitDivisor;
                     }
                     else if(_loc15_.vertLineFlag)
                     {
                        _loc2_ += _loc15_.deltaY / this.unitDivisor;
                     }
                     else
                     {
                        _loc1_ += _loc15_.deltaX / this.unitDivisor;
                     }
                     _loc4_ = new Point(NumberUtils.roundPixels400(_loc1_),NumberUtils.roundPixels400(_loc2_));
                     _loc11_.push(new StraightEdge(_loc3_,_loc4_,_loc10_,_loc9_,null,null,_loc8_));
                     break;
                  case SWFShapeRecord.TYPE_CURVEDEDGE:
                     _loc16_ = _loc13_ as SWFShapeRecordCurvedEdge;
                     _loc3_ = new Point(NumberUtils.roundPixels400(_loc1_),NumberUtils.roundPixels400(_loc2_));
                     _loc17_ = _loc1_ + _loc16_.controlDeltaX / this.unitDivisor;
                     _loc18_ = _loc2_ + _loc16_.controlDeltaY / this.unitDivisor;
                     _loc1_ = _loc17_ + _loc16_.anchorDeltaX / this.unitDivisor;
                     _loc2_ = _loc18_ + _loc16_.anchorDeltaY / this.unitDivisor;
                     _loc5_ = new Point(_loc17_,_loc18_);
                     _loc4_ = new Point(NumberUtils.roundPixels400(_loc1_),NumberUtils.roundPixels400(_loc2_));
                     _loc11_.push(new CurvedEdge(_loc3_,_loc5_,_loc4_,_loc10_,_loc9_,null,null,null,_loc8_));
                     break;
                  case SWFShapeRecord.TYPE_END:
                     this.processSubPath(_loc11_,_loc10_,_loc8_,_loc9_);
                     this.cleanEdgeMap(this.currentFillEdgeMap);
                     this.cleanEdgeMap(this.currentLineEdgeMap,false);
                     this.fillEdgeMaps.push(this.currentFillEdgeMap);
                     this.lineEdgeMaps.push(this.currentLineEdgeMap);
                     ++this.numGroups;
                     break;
               }
               _loc12_++;
            }
            this.edgeMapsCreated = true;
         }
      }
      
      protected function processSubPath(param1:Vector.<IEdge>, param2:uint, param3:uint, param4:uint) : void
      {
         var _loc5_:Vector.<IEdge> = null;
         var _loc6_:int = 0;
         if(param3 != 0)
         {
            _loc5_ = this.currentFillEdgeMap[param3] as Vector.<IEdge>;
            if(_loc5_ == null)
            {
               _loc5_ = this.currentFillEdgeMap[param3] = new Vector.<IEdge>();
            }
            _loc6_ = int(param1.length - 1);
            while(_loc6_ >= 0)
            {
               _loc5_.push(param1[_loc6_].reverseWithNewFillStyle());
               _loc6_--;
            }
         }
         if(param4 != 0)
         {
            _loc5_ = this.currentFillEdgeMap[param4] as Vector.<IEdge>;
            if(_loc5_ == null)
            {
               _loc5_ = this.currentFillEdgeMap[param4] = new Vector.<IEdge>();
            }
            this.appendEdges(_loc5_,param1);
         }
         if(param2 != 0)
         {
            _loc5_ = this.currentLineEdgeMap[param2] as Vector.<IEdge>;
            if(_loc5_ == null)
            {
               _loc5_ = this.currentLineEdgeMap[param2] = new Vector.<IEdge>();
            }
            this.appendEdges(_loc5_,param1);
         }
      }
      
      protected function exportFillPath(param1:IShapeExporter, param2:uint) : void
      {
         var i:uint = 0;
         var e:IEdge = null;
         var matrix:Matrix = null;
         var fillStyle:SWFFillStyle = null;
         var colors:Array = null;
         var alphas:Array = null;
         var ratios:Array = null;
         var gradientRecord:SWFGradientRecord = null;
         var m:SWFMatrix = null;
         var gri:uint = 0;
         var c:CurvedEdge = null;
         var handler:IShapeExporter = param1;
         var groupIndex:uint = param2;
         var path:Vector.<IEdge> = this.createPathFromEdgeMap(this.fillEdgeMaps[groupIndex]);
         var pos:Point = new Point(Number.MAX_VALUE,Number.MAX_VALUE);
         var fillStyleIdx:uint = uint.MAX_VALUE;
         if(path.length > 0)
         {
            handler.beginFills();
            i = 0;
            while(i < path.length)
            {
               e = path[i];
               if(fillStyleIdx != e.fillStyleIdx)
               {
                  if(fillStyleIdx != uint.MAX_VALUE)
                  {
                     handler.endFill();
                  }
                  fillStyleIdx = e.fillStyleIdx;
                  pos = new Point(Number.MAX_VALUE,Number.MAX_VALUE);
                  try
                  {
                     fillStyle = this._fillStyles[fillStyleIdx - 1];
                     switch(fillStyle.type)
                     {
                        case 0:
                           handler.beginFill(ColorUtils.rgb(fillStyle.rgb),ColorUtils.alpha(fillStyle.rgb));
                           break;
                        case 16:
                        case 18:
                        case 19:
                           colors = [];
                           alphas = [];
                           ratios = [];
                           matrix = fillStyle.gradientMatrix.matrix.clone();
                           matrix.tx /= 20;
                           matrix.ty /= 20;
                           gri = 0;
                           while(gri < fillStyle.gradient.records.length)
                           {
                              gradientRecord = fillStyle.gradient.records[gri];
                              colors.push(ColorUtils.rgb(gradientRecord.color));
                              alphas.push(ColorUtils.alpha(gradientRecord.color));
                              ratios.push(gradientRecord.ratio);
                              gri++;
                           }
                           handler.beginGradientFill(fillStyle.type == 16 ? GradientType.LINEAR : GradientType.RADIAL,colors,alphas,ratios,matrix,GradientSpreadMode.toString(fillStyle.gradient.spreadMode),GradientInterpolationMode.toString(fillStyle.gradient.interpolationMode),fillStyle.gradient.focalPoint);
                           break;
                        case 64:
                        case 65:
                        case 66:
                        case 67:
                           m = fillStyle.bitmapMatrix;
                           matrix = new Matrix();
                           matrix.createBox(m.xscale / 20,m.yscale / 20,m.rotation,m.translateX / 20,m.translateY / 20);
                           handler.beginBitmapFill(fillStyle.bitmapId,matrix,fillStyle.type == 64 || fillStyle.type == 66,fillStyle.type == 64 || fillStyle.type == 65);
                     }
                  }
                  catch(e:Error)
                  {
                     handler.beginFill(0);
                  }
               }
               if(!pos.equals(e.from))
               {
                  handler.moveTo(e.from.x,e.from.y);
               }
               if(e is CurvedEdge)
               {
                  c = CurvedEdge(e);
                  handler.curveTo(c.control.x,c.control.y,c.to.x,c.to.y);
               }
               else
               {
                  handler.lineTo(e.to.x,e.to.y);
               }
               pos = e.to;
               i++;
            }
            if(fillStyleIdx != uint.MAX_VALUE)
            {
               handler.endFill();
            }
            handler.endFills();
         }
      }
      
      private function _15039(param1:IShapeExporter) : void
      {
         var edges:Array;
         var i:int;
         var pos:Point;
         var _9636:uint;
         var lineStyle:SWFFillStyle = null;
         var fillStyle:SWFFillStyle = null;
         var fillStyle2:SWFFillStyle = null;
         var e:IEdge = null;
         var color:uint = 0;
         var o:Object = null;
         var c:CurvedEdge = null;
         var handler:IShapeExporter = param1;
         if(this._15043.length == 0)
         {
            return;
         }
         edges = [];
         i = 0;
         for(; i < this._15043.length; i++)
         {
            e = this._15043[i];
            try
            {
               fillStyle = this._fillStyles[e.fillStyleIdx - 1];
               fillStyle2 = this._fillStyles[e.fillStyleIdx2 - 1];
            }
            catch(err:Error)
            {
               continue;
            }
            if(!(fillStyle.type >= 64 && fillStyle2.type >= 64))
            {
               if(fillStyle.type >= 64)
               {
                  lineStyle = fillStyle2;
               }
               else if(fillStyle2.type >= 64)
               {
                  lineStyle = fillStyle;
               }
               else if(fillStyle.type == 0 && fillStyle2.type == 0)
               {
                  if((fillStyle2.rgb >> 24 & 0xFF) > (fillStyle.rgb >> 24 && 255))
                  {
                     lineStyle = fillStyle2;
                  }
                  else
                  {
                     lineStyle = fillStyle;
                  }
               }
               else if(fillStyle2.type == 0)
               {
                  lineStyle = fillStyle2;
               }
               else
               {
                  lineStyle = fillStyle;
               }
               if(lineStyle.type == 0)
               {
                  color = lineStyle.rgb;
               }
               else
               {
                  color = lineStyle.gradient.records[lineStyle.gradient.records.length - 1].color;
               }
               edges.push({
                  "e":e,
                  "color":color,
                  "id":edges.length + 1,
                  "fid":(lineStyle == fillStyle ? e.fillStyleIdx : e.fillStyleIdx2)
               });
            }
         }
         if(edges.length == 0)
         {
            return;
         }
         edges.sortOn(["color","id"],[Array.NUMERIC,Array.NUMERIC]);
         pos = new Point(Number.MAX_VALUE,Number.MAX_VALUE);
         _9636 = 16909060;
         i = 0;
         while(i < edges.length)
         {
            o = edges[i];
            e = o.e;
            color = uint(o.color);
            if(color != _9636)
            {
               _9636 = color;
               pos = new Point(Number.MAX_VALUE,Number.MAX_VALUE);
            }
            if(!e.from.equals(pos))
            {
               if(i)
               {
                  edges[i - 1].e = this._15042(edges[i - 1].e,false);
               }
               o.e = this._15042(o.e,true);
            }
            pos = e.to;
            i++;
         }
         handler.beginLines();
         pos = new Point(Number.MAX_VALUE,Number.MAX_VALUE);
         _9636 = 16909060;
         i = 0;
         while(i < edges.length)
         {
            o = edges[i];
            e = o.e;
            color = uint(o.color);
            if(color != _9636)
            {
               _9636 = color;
               pos = new Point(Number.MAX_VALUE,Number.MAX_VALUE);
               handler.lineStyle(1,ColorUtils.rgb(color),ColorUtils.alpha(color),false,"normal",CapsStyle.NONE);
            }
            if(!e.from.equals(pos))
            {
               handler.moveTo(e.from.x,e.from.y);
            }
            if(e is CurvedEdge)
            {
               c = CurvedEdge(e);
               handler.curveTo(c.control.x,c.control.y,c.to.x,c.to.y);
            }
            else
            {
               handler.lineTo(e.to.x,e.to.y);
            }
            pos = e.to;
            i++;
         }
         handler.endLines(false);
      }
      
      private function _15042(param1:IEdge, param2:Boolean) : IEdge
      {
         var _loc4_:Point = null;
         var _loc5_:CurvedEdge = null;
         var _loc3_:Number = 1;
         if(param1 is CurvedEdge)
         {
            _loc5_ = CurvedEdge(param1);
            if(param2)
            {
               _loc4_ = this._15041(_loc5_.from,_loc5_.control,_loc3_);
               return new CurvedEdge(_loc4_,_loc5_.control,_loc5_.to,_loc5_.lineStyleIdx,_loc5_.fillStyleIdx2,null,null,null,_loc5_.fillStyleIdx);
            }
            _loc4_ = this._15041(_loc5_.to,_loc5_.control,_loc3_);
            return new CurvedEdge(_loc5_.from,_loc5_.control,_loc4_,_loc5_.lineStyleIdx,_loc5_.fillStyleIdx2,null,null,null,_loc5_.fillStyleIdx);
         }
         if(param2)
         {
            _loc4_ = this._15041(param1.from,param1.to,_loc3_);
            return new StraightEdge(_loc4_,param1.to,param1.lineStyleIdx,param1.fillStyleIdx2,null,null,param1.fillStyleIdx);
         }
         _loc4_ = this._15041(param1.to,param1.from,_loc3_);
         return new StraightEdge(param1.from,_loc4_,param1.lineStyleIdx,param1.fillStyleIdx2,null,null,param1.fillStyleIdx);
      }
      
      private function _15041(param1:Point, param2:Point, param3:Number) : Point
      {
         var _loc4_:Number = param2.x - param1.x;
         var _loc5_:Number = param2.y - param1.y;
         var _loc6_:Number = Math.sqrt(_loc4_ * _loc4_ + _loc5_ * _loc5_);
         if(_loc6_ == 0)
         {
            return param1;
         }
         return new Point(param1.x + _loc4_ * param3 / _loc6_,param1.y + _loc5_ * param3 / _loc6_);
      }
      
      protected function exportLinePath(param1:IShapeExporter, param2:uint) : void
      {
         var lineStyle:SWFLineStyle = null;
         var autoClose:Boolean = false;
         var i:uint = 0;
         var e:IEdge = null;
         var scaleMode:String = null;
         var pixelHintingFlag:Boolean = false;
         var startCapStyle:int = 0;
         var endCapStyle:int = 0;
         var joinStyle:int = 0;
         var miterLimitFactor:int = 0;
         var fillStyle:SWFFillStyle = null;
         var colors:Array = null;
         var alphas:Array = null;
         var ratios:Array = null;
         var gradientRecord:SWFGradientRecord = null;
         var matrix:Matrix = null;
         var m:SWFMatrix = null;
         var gri:uint = 0;
         var c:CurvedEdge = null;
         var handler:IShapeExporter = param1;
         var groupIndex:uint = param2;
         var path:Vector.<IEdge> = this.createPathFromEdgeMap(this.lineEdgeMaps[groupIndex]);
         var pos:Point = new Point(Number.MAX_VALUE,Number.MAX_VALUE);
         var lineStyleIdx:uint = uint.MAX_VALUE;
         if(path.length > 0)
         {
            autoClose = true;
            handler.beginLines();
            i = 0;
            while(i < path.length)
            {
               e = path[i];
               if(lineStyleIdx != e.lineStyleIdx)
               {
                  lineStyleIdx = e.lineStyleIdx;
                  pos = new Point(Number.MAX_VALUE,Number.MAX_VALUE);
                  try
                  {
                     lineStyle = this._lineStyles[lineStyleIdx - 1];
                  }
                  catch(e:Error)
                  {
                     lineStyle = null;
                  }
                  if(lineStyle != null)
                  {
                     scaleMode = LineScaleMode.NORMAL;
                     pixelHintingFlag = false;
                     startCapStyle = 0;
                     endCapStyle = 0;
                     joinStyle = 0;
                     miterLimitFactor = 3;
                     autoClose = true;
                     if(lineStyle is SWFLineStyle2)
                     {
                        if(lineStyle.noClose)
                        {
                           autoClose = false;
                        }
                        if(lineStyle.noHScaleFlag && lineStyle.noVScaleFlag)
                        {
                           scaleMode = "NONE";
                        }
                        else if(lineStyle.noHScaleFlag)
                        {
                           scaleMode = "VERTICAL";
                        }
                        else if(lineStyle.noVScaleFlag)
                        {
                           scaleMode = "HORIZONTAL";
                        }
                        pixelHintingFlag = lineStyle.pixelHintingFlag;
                        startCapStyle = int(lineStyle.startCapsStyle);
                        endCapStyle = int(lineStyle.endCapsStyle);
                        joinStyle = int(lineStyle.jointStyle);
                        miterLimitFactor = lineStyle.miterLimitFactor;
                     }
                     handler.lineStyle(lineStyle.width / 20,ColorUtils.rgb(lineStyle.color),ColorUtils.alpha(lineStyle.color),pixelHintingFlag,scaleMode,LineCapsStyle.toString(startCapStyle),LineCapsStyle.toString(endCapStyle),LineJointStyle.toString(lineStyle.jointStyle),miterLimitFactor);
                     if(lineStyle.hasFillFlag)
                     {
                        fillStyle = lineStyle.fillType;
                        switch(fillStyle.type)
                        {
                           case 16:
                           case 18:
                           case 19:
                              colors = [];
                              alphas = [];
                              ratios = [];
                              matrix = fillStyle.gradientMatrix.matrix.clone();
                              matrix.tx /= 20;
                              matrix.ty /= 20;
                              gri = 0;
                              while(gri < fillStyle.gradient.records.length)
                              {
                                 gradientRecord = fillStyle.gradient.records[gri];
                                 colors.push(ColorUtils.rgb(gradientRecord.color));
                                 alphas.push(ColorUtils.alpha(gradientRecord.color));
                                 ratios.push(gradientRecord.ratio);
                                 gri++;
                              }
                              handler.lineGradientStyle(fillStyle.type == 16 ? GradientType.LINEAR : GradientType.RADIAL,colors,alphas,ratios,matrix,GradientSpreadMode.toString(fillStyle.gradient.spreadMode),GradientInterpolationMode.toString(fillStyle.gradient.interpolationMode),fillStyle.gradient.focalPoint);
                              break;
                           case 64:
                           case 65:
                           case 66:
                           case 67:
                              m = fillStyle.bitmapMatrix;
                              matrix = new Matrix();
                              matrix.createBox(m.xscale / 20,m.yscale / 20,m.rotation,m.translateX / 20,m.translateY / 20);
                              handler.lineBitmapStyle(fillStyle.bitmapId,matrix,fillStyle.type == 64 || fillStyle.type == 66,fillStyle.type == 64 || fillStyle.type == 65);
                        }
                     }
                  }
                  else
                  {
                     handler.lineStyle(0);
                  }
               }
               if(!e.from.equals(pos))
               {
                  handler.moveTo(e.from.x,e.from.y);
               }
               if(e is CurvedEdge)
               {
                  c = CurvedEdge(e);
                  handler.curveTo(c.control.x,c.control.y,c.to.x,c.to.y);
               }
               else
               {
                  handler.lineTo(e.to.x,e.to.y);
               }
               pos = e.to;
               i++;
            }
            handler.endLines(autoClose && path[0].from.x == pos.x && path[0].from.y == pos.y);
         }
      }
      
      protected function createPathFromEdgeMap(param1:Dictionary) : Vector.<IEdge>
      {
         var _loc4_:String = null;
         var _loc5_:uint = 0;
         var _loc2_:Vector.<IEdge> = new Vector.<IEdge>();
         var _loc3_:Array = [];
         for(_loc4_ in param1)
         {
            _loc3_.push(parseInt(_loc4_));
         }
         _loc3_.sort(Array.NUMERIC);
         _loc5_ = 0;
         while(_loc5_ < _loc3_.length)
         {
            this.appendEdges(_loc2_,param1[_loc3_[_loc5_]] as Vector.<IEdge>);
            _loc5_++;
         }
         return _loc2_;
      }
      
      protected function cleanEdgeMap(param1:Dictionary, param2:Boolean = true) : void
      {
         var _loc3_:String = null;
         var _loc4_:Vector.<IEdge> = null;
         var _loc5_:uint = 0;
         var _loc6_:IEdge = null;
         var _loc7_:Vector.<IEdge> = null;
         var _loc8_:IEdge = null;
         var _loc9_:int = 0;
         for(_loc3_ in param1)
         {
            _loc4_ = param1[_loc3_] as Vector.<IEdge>;
            if((Boolean(_loc4_)) && _loc4_.length > 0)
            {
               _loc7_ = new Vector.<IEdge>();
               this.createCoordMap(_loc4_);
               while(_loc4_.length > 0)
               {
                  _loc5_ = 0;
                  while(_loc5_ < _loc4_.length)
                  {
                     if(_loc6_ == null || _loc6_.to.equals(_loc4_[_loc5_].from))
                     {
                        _loc8_ = _loc4_.splice(_loc5_,1)[0];
                        if(_loc6_ == null)
                        {
                           _loc8_._14996 = true;
                        }
                        _loc7_.push(_loc8_);
                        this.removeEdgeFromCoordMap(_loc8_);
                        _loc6_ = _loc8_;
                     }
                     else
                     {
                        _loc8_ = this.findNextEdgeInCoordMap(_loc6_);
                        if(_loc8_)
                        {
                           _loc5_ = uint(_loc4_.indexOf(_loc8_));
                        }
                        else
                        {
                           _loc6_._14998 = true;
                           _loc5_ = 0;
                           _loc6_ = null;
                        }
                     }
                  }
               }
               param1[_loc3_] = _loc7_;
               if(param2)
               {
                  _loc9_ = 0;
                  while(_loc9_ < _loc7_.length)
                  {
                     _loc8_ = _loc7_[_loc9_];
                     if(_loc8_.fillStyleIdx < _loc8_.fillStyleIdx2)
                     {
                        this._15043.push(_loc8_);
                     }
                     _loc9_++;
                  }
               }
            }
         }
      }
      
      protected function createCoordMap(param1:Vector.<IEdge>) : void
      {
         var _loc3_:Point = null;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         this.coordMap = new Dictionary();
         var _loc2_:uint = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_].from;
            _loc4_ = _loc3_.x + "_" + _loc3_.y;
            _loc5_ = this.coordMap[_loc4_] as Array;
            if(_loc5_ == null)
            {
               this.coordMap[_loc4_] = [param1[_loc2_]];
            }
            else
            {
               _loc5_.push(param1[_loc2_]);
            }
            _loc2_++;
         }
      }
      
      protected function removeEdgeFromCoordMap(param1:IEdge) : void
      {
         var _loc4_:int = 0;
         var _loc2_:String = param1.from.x + "_" + param1.from.y;
         var _loc3_:Array = this.coordMap[_loc2_] as Array;
         if(_loc3_)
         {
            if(_loc3_.length == 1)
            {
               delete this.coordMap[_loc2_];
            }
            else
            {
               _loc4_ = int(_loc3_.indexOf(param1));
               if(_loc4_ > -1)
               {
                  _loc3_.splice(_loc4_,1);
               }
            }
         }
      }
      
      protected function findNextEdgeInCoordMap(param1:IEdge) : IEdge
      {
         var _loc2_:String = param1.to.x + "_" + param1.to.y;
         var _loc3_:Array = this.coordMap[_loc2_] as Array;
         if(Boolean(_loc3_) && _loc3_.length > 0)
         {
            return _loc3_[0] as IEdge;
         }
         return null;
      }
      
      protected function appendFillStyles(param1:Vector.<SWFFillStyle>, param2:Vector.<SWFFillStyle>) : void
      {
         var _loc3_:uint = 0;
         while(_loc3_ < param2.length)
         {
            param1.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      protected function appendLineStyles(param1:Vector.<SWFLineStyle>, param2:Vector.<SWFLineStyle>) : void
      {
         var _loc3_:uint = 0;
         while(_loc3_ < param2.length)
         {
            param1.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      protected function appendEdges(param1:Vector.<IEdge>, param2:Vector.<IEdge>) : void
      {
         var _loc3_:uint = 0;
         while(_loc3_ < param2.length)
         {
            param1.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function toString(param1:uint = 0) : String
      {
         var _loc2_:* = "\n" + StringUtils.repeat(param1) + "ShapeRecords:";
         var _loc3_:uint = 0;
         while(_loc3_ < this._records.length)
         {
            _loc2_ += "\n" + StringUtils.repeat(param1 + 2) + "[" + _loc3_ + "] " + this._records[_loc3_].toString(param1 + 2);
            _loc3_++;
         }
         return _loc2_;
      }
   }
}

