package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.data.consts.GradientInterpolationMode;
   import com.codeazur.as3swf.data.consts.GradientSpreadMode;
   import com.codeazur.as3swf.data.consts.LineCapsStyle;
   import com.codeazur.as3swf.data.consts.LineJointStyle;
   import com.codeazur.as3swf.data.etc.CurvedEdge;
   import com.codeazur.as3swf.data.etc.IEdge;
   import com.codeazur.as3swf.data.etc.StraightEdge;
   import com.codeazur.as3swf.exporters.core._14139;
   import com.codeazur.as3swf.exporters.core._14140;
   import com.codeazur.as3swf.utils.ColorUtils;
   import com.codeazur.as3swf.utils.NumberUtils;
   import com.codeazur.utils.StringUtils;
   import flash.display.GradientType;
   import flash.display.LineScaleMode;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class _14134
   {
      protected var _records:Vector.<SWFShapeRecord>;
      
      protected var _fillStyles:Vector.<SWFFillStyle>;
      
      protected var _lineStyles:Vector.<SWFLineStyle>;
      
      protected var fillEdgeMaps:Vector.<Dictionary>;
      
      protected var lineEdgeMaps:Vector.<Dictionary>;
      
      protected var currentFillEdgeMap:Dictionary;
      
      protected var currentLineEdgeMap:Dictionary;
      
      protected var numGroups:uint;
      
      protected var coordMap:Dictionary;
      
      protected var unitDivisor:Number;
      
      protected var edgeMapsCreated:Boolean = false;
      
      public var _15037:Boolean = false;
      
      private var _15038:Dictionary;
      
      public function _14134(param1:Number = 20)
      {
         super();
         this._records = new Vector.<SWFShapeRecord>();
         this._fillStyles = new Vector.<SWFFillStyle>();
         this._lineStyles = new Vector.<SWFLineStyle>();
         this.unitDivisor = param1;
      }
      
      public function _15036() : Dictionary
      {
         this._15037 = true;
         this.edgeMapsCreated = false;
         this.createEdgeMaps();
         var _loc1_:Dictionary = new Dictionary();
         _loc1_["fillEdgeMaps"] = this.fillEdgeMaps;
         _loc1_["fillStyles"] = this.fillStyles;
         _loc1_["lineEdgeMaps"] = this.lineEdgeMaps;
         _loc1_["lineStyles"] = this.lineStyles;
         return _loc1_;
      }
      
      public function exportData(param1:_14140 = null, param2:Dictionary = null) : void
      {
         if(param2)
         {
            this._15038 = param2;
         }
         this.edgeMapsCreated = false;
         this.createEdgeMaps();
         if(param1 == null)
         {
            param1 = new _14139(null);
         }
         param1.beginShape();
         var _loc3_:int = 0;
         while(_loc3_ < this.numGroups)
         {
            this._15032(param1,_loc3_);
            this._15033(param1,_loc3_);
            _loc3_++;
         }
         param1.endShape();
      }
      
      private function _15035(param1:String, param2:uint, param3:String) : IEdge
      {
         var _loc4_:Vector.<Dictionary> = null;
         var _loc7_:IEdge = null;
         switch(param1)
         {
            case "fill":
               _loc4_ = this._15038["fillEdgeMaps"];
               break;
            case "line":
               _loc4_ = this._15038["lineEdgeMaps"];
         }
         var _loc5_:Vector.<IEdge> = this.createPathFromEdgeMap(_loc4_[param2]);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc7_ = _loc5_[_loc6_] as IEdge;
            if(param3 == _loc7_.flag)
            {
               return _loc7_;
            }
            _loc6_++;
         }
         return null;
      }
      
      private function _15031(param1:String) : *
      {
         switch(param1)
         {
            case "fill":
               return this._15038["fillStyles"];
            case "line":
               return this._15038["lineStyles"];
            default:
               return null;
         }
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
                        this.cleanEdgeMap(this.currentLineEdgeMap);
                        this._15034(this.currentFillEdgeMap);
                        this._15034(this.currentLineEdgeMap);
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
                     this._15034(this.currentFillEdgeMap);
                     this._15034(this.currentLineEdgeMap);
                     if(!this._15037)
                     {
                        this.cleanEdgeMap(this.currentFillEdgeMap);
                        this.cleanEdgeMap(this.currentLineEdgeMap);
                     }
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
      
      private function _15034(param1:Dictionary) : void
      {
         var _loc2_:String = null;
         var _loc3_:Vector.<IEdge> = null;
         var _loc4_:int = 0;
         var _loc5_:IEdge = null;
         for(_loc2_ in param1)
         {
            _loc3_ = param1[_loc2_] as Vector.<IEdge>;
            if(Boolean(_loc3_) && _loc3_.length > 0)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  (_loc5_ = _loc3_[_loc4_]).flag = _loc2_ + "_" + _loc4_;
                  _loc4_++;
               }
            }
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
      
      protected function _15032(param1:_14140, param2:uint) : void
      {
         var _loc14_:uint = 0;
         var _loc15_:IEdge = null;
         var _loc16_:IEdge = null;
         var _loc17_:Matrix = null;
         var _loc18_:SWFFillStyle = null;
         var _loc19_:SWFFillStyle = null;
         var _loc20_:Array = null;
         var _loc21_:Array = null;
         var _loc22_:Array = null;
         var _loc23_:SWFGradientRecord = null;
         var _loc24_:uint = 0;
         var _loc25_:CurvedEdge = null;
         var _loc26_:CurvedEdge = null;
         var _loc3_:Vector.<IEdge> = this.createPathFromEdgeMap(this.fillEdgeMaps[param2]);
         var _loc4_:Point = new Point(Number.MAX_VALUE,Number.MAX_VALUE);
         var _loc5_:uint = uint.MAX_VALUE;
         var _loc6_:uint = uint.MAX_VALUE;
         var _loc7_:Array = [];
         var _loc8_:Array = [];
         var _loc9_:Array = [];
         var _loc10_:Array = [];
         var _loc11_:Array = [];
         var _loc12_:Array = [];
         var _loc13_:Array = [];
         if(_loc3_.length > 0)
         {
            param1.beginFills();
            _loc14_ = 0;
            while(_loc14_ < _loc3_.length)
            {
               _loc15_ = _loc3_[_loc14_];
               _loc16_ = this._15035("fill",param2,_loc15_.flag);
               if(_loc5_ != _loc15_.fillStyleIdx)
               {
                  if(_loc5_ != uint.MAX_VALUE)
                  {
                     param1.endFill();
                  }
                  _loc5_ = _loc15_.fillStyleIdx;
                  _loc6_ = _loc16_.fillStyleIdx;
                  _loc4_ = new Point(Number.MAX_VALUE,Number.MAX_VALUE);
                  _loc18_ = this._fillStyles[_loc5_ - 1];
                  _loc19_ = (this._15031("fill") as Vector.<SWFFillStyle>)[_loc6_ - 1];
                  switch(_loc18_.type)
                  {
                     case 0:
                        _loc7_ = [ColorUtils.rgb(_loc18_.rgb),ColorUtils.rgb(_loc19_.rgb)];
                        _loc8_ = [ColorUtils.alpha(_loc18_.rgb),ColorUtils.alpha(_loc19_.rgb)];
                        param1.beginFill(_loc7_,_loc8_);
                        break;
                     case 16:
                     case 18:
                     case 19:
                        _loc11_ = [_loc18_.type == 16 ? GradientType.LINEAR : GradientType.RADIAL,_loc19_.type == 16 ? GradientType.LINEAR : GradientType.RADIAL];
                        _loc20_ = [];
                        _loc21_ = [];
                        _loc22_ = [];
                        _loc7_ = [];
                        _loc8_ = [];
                        _loc9_ = [];
                        _loc10_ = [];
                        if(!_loc18_.gradientMatrix)
                        {
                           _loc17_ = new Matrix();
                        }
                        else
                        {
                           _loc17_ = _loc18_.gradientMatrix._15028;
                        }
                        _loc24_ = 0;
                        while(_loc24_ < _loc18_.gradient.records.length)
                        {
                           _loc23_ = _loc18_.gradient.records[_loc24_];
                           _loc20_.push(ColorUtils.rgb(_loc23_.color));
                           _loc21_.push(ColorUtils.alpha(_loc23_.color));
                           _loc22_.push(_loc23_.ratio);
                           _loc24_++;
                        }
                        _loc7_.push(_loc20_);
                        _loc8_.push(_loc21_);
                        _loc9_.push(_loc22_);
                        _loc10_.push(_loc17_);
                        _loc20_ = [];
                        _loc21_ = [];
                        _loc22_ = [];
                        _loc17_ = _loc19_.gradientMatrix._15028;
                        _loc24_ = 0;
                        while(_loc24_ < _loc19_.gradient.records.length)
                        {
                           _loc23_ = _loc19_.gradient.records[_loc24_];
                           _loc20_.push(ColorUtils.rgb(_loc23_.color));
                           _loc21_.push(ColorUtils.alpha(_loc23_.color));
                           _loc22_.push(_loc23_.ratio);
                           _loc24_++;
                        }
                        _loc7_.push(_loc20_);
                        _loc8_.push(_loc21_);
                        _loc9_.push(_loc22_);
                        _loc10_.push(_loc17_);
                        param1.beginGradientFill(_loc11_,_loc7_,_loc8_,_loc9_,_loc10_,GradientSpreadMode.toString(_loc18_.gradient.spreadMode),GradientInterpolationMode.toString(_loc18_.gradient.interpolationMode),_loc18_.gradient.focalPoint);
                        break;
                     case 64:
                     case 65:
                     case 66:
                     case 67:
                        _loc13_ = [_loc18_.bitmapId,_loc19_.bitmapId];
                        _loc10_ = [];
                        _loc17_ = _loc18_.bitmapMatrix._15028;
                        _loc10_.push(_loc17_);
                        _loc17_ = _loc19_.bitmapMatrix._15028;
                        _loc10_.push(_loc17_);
                        _loc12_ = [_loc18_.type == 64 || _loc18_.type == 66,_loc19_.type == 64 || _loc19_.type == 66];
                        param1.beginBitmapFill(_loc13_,_loc10_,_loc12_,_loc18_.type == 64 || _loc18_.type == 65);
                  }
               }
               if(!_loc4_.equals(_loc15_.from))
               {
                  param1.moveTo([_loc15_.from.x,_loc16_.from.x],[_loc15_.from.y,_loc16_.from.y]);
               }
               if(_loc15_ is CurvedEdge)
               {
                  _loc25_ = CurvedEdge(_loc15_);
                  _loc26_ = CurvedEdge(_loc16_);
                  param1.curveTo([_loc25_.control.x,_loc26_.control.x],[_loc25_.control.y,_loc26_.control.y],[_loc25_.to.x,_loc26_.to.x],[_loc25_.to.y,_loc26_.to.y]);
               }
               else
               {
                  param1.lineTo([_loc15_.to.x,_loc16_.to.x],[_loc15_.to.y,_loc16_.to.y]);
               }
               _loc4_ = _loc15_.to;
               _loc14_++;
            }
            if(_loc5_ != uint.MAX_VALUE)
            {
               param1.endFill();
            }
            param1.endFills();
         }
      }
      
      protected function _15033(param1:_14140, param2:uint) : void
      {
         var lineStyle:SWFLineStyle = null;
         var lineStyleEnd:SWFLineStyle = null;
         var i:uint = 0;
         var e:IEdge = null;
         var end:IEdge = null;
         var scaleMode:String = null;
         var fillStyle:SWFFillStyle = null;
         var fillStyleEnd:SWFFillStyle = null;
         var colors:Array = null;
         var alphas:Array = null;
         var ratios:Array = null;
         var gradientRecord:SWFGradientRecord = null;
         var matrix:Matrix = null;
         var gri:uint = 0;
         var c:CurvedEdge = null;
         var d:CurvedEdge = null;
         var handler:_14140 = param1;
         var groupIndex:uint = param2;
         var path:Vector.<IEdge> = this.createPathFromEdgeMap(this.lineEdgeMaps[groupIndex]);
         var pos:Point = new Point(Number.MAX_VALUE,Number.MAX_VALUE);
         var lineStyleIdx:uint = uint.MAX_VALUE;
         var lineStyleEndIdx:uint = uint.MAX_VALUE;
         var a_colors:Array = [];
         var a_alhpas:Array = [];
         var a_ratios:Array = [];
         var a_matrix:Array = [];
         var a_style:Array = [];
         var a_repeat:Array = [];
         var a_bilmapId:Array = [];
         var a_thickness:Array = [];
         var a_caps:Array = [];
         var a_joints:Array = [];
         var a_miterLimit:Array = [];
         if(path.length > 0)
         {
            handler.beginLines();
            i = 0;
            while(i < path.length)
            {
               e = path[i];
               end = this._15035("line",groupIndex,e.flag);
               if(lineStyleIdx != e.lineStyleIdx)
               {
                  lineStyleIdx = e.lineStyleIdx;
                  lineStyleEndIdx = end.lineStyleIdx;
                  pos = new Point(Number.MAX_VALUE,Number.MAX_VALUE);
                  try
                  {
                     lineStyle = this._lineStyles[lineStyleIdx - 1];
                     lineStyleEnd = (this._15031("line") as Vector.<SWFLineStyle>)[lineStyleEndIdx - 1];
                  }
                  catch(e:Error)
                  {
                     lineStyle = null;
                     lineStyleEnd = null;
                  }
                  if(lineStyle != null)
                  {
                     scaleMode = LineScaleMode.NORMAL;
                     if(lineStyle.noHScaleFlag && lineStyle.noVScaleFlag)
                     {
                        scaleMode = LineScaleMode.NONE;
                     }
                     else if(lineStyle.noHScaleFlag)
                     {
                        scaleMode = LineScaleMode.HORIZONTAL;
                     }
                     else if(lineStyle.noVScaleFlag)
                     {
                        scaleMode = LineScaleMode.VERTICAL;
                     }
                     a_thickness = [lineStyle.width / 20,lineStyleEnd.width / 20];
                     a_colors = [ColorUtils.rgb(lineStyle.color),ColorUtils.rgb(lineStyleEnd.color)];
                     a_alhpas = [ColorUtils.alpha(lineStyle.color),ColorUtils.alpha(lineStyleEnd.color)];
                     a_caps = [LineCapsStyle.toString(lineStyle.startCapsStyle),LineCapsStyle.toString(lineStyleEnd.startCapsStyle)];
                     a_joints = [LineJointStyle.toString(lineStyle.jointStyle),LineJointStyle.toString(lineStyleEnd.jointStyle)];
                     a_miterLimit = [lineStyle.miterLimitFactor,lineStyleEnd.miterLimitFactor];
                     handler.lineStyle(a_thickness,a_colors,a_alhpas,lineStyle.pixelHintingFlag,scaleMode,a_caps,LineCapsStyle.toString(lineStyle.endCapsStyle),a_joints,a_miterLimit);
                     if(lineStyle.hasFillFlag)
                     {
                        fillStyle = lineStyle.fillType;
                        fillStyleEnd = lineStyleEnd.fillType;
                        switch(fillStyle.type)
                        {
                           case 16:
                           case 18:
                           case 19:
                              a_style = [fillStyle.type == 16 ? GradientType.LINEAR : GradientType.RADIAL,fillStyleEnd.type == 16 ? GradientType.LINEAR : GradientType.RADIAL];
                              colors = [];
                              alphas = [];
                              ratios = [];
                              a_colors = [];
                              a_alhpas = [];
                              a_ratios = [];
                              a_matrix = [];
                              matrix = fillStyle.gradientMatrix._15028;
                              gri = 0;
                              while(gri < fillStyle.gradient.records.length)
                              {
                                 gradientRecord = fillStyle.gradient.records[gri];
                                 colors.push(ColorUtils.rgb(gradientRecord.color));
                                 alphas.push(ColorUtils.alpha(gradientRecord.color));
                                 ratios.push(gradientRecord.ratio);
                                 gri++;
                              }
                              a_colors.push(colors);
                              a_alhpas.push(alphas);
                              a_ratios.push(ratios);
                              a_matrix.push(matrix);
                              colors = [];
                              alphas = [];
                              ratios = [];
                              matrix = fillStyleEnd.gradientMatrix._15028;
                              gri = 0;
                              while(gri < fillStyleEnd.gradient.records.length)
                              {
                                 gradientRecord = fillStyleEnd.gradient.records[gri];
                                 colors.push(ColorUtils.rgb(gradientRecord.color));
                                 alphas.push(ColorUtils.alpha(gradientRecord.color));
                                 ratios.push(gradientRecord.ratio);
                                 gri++;
                              }
                              a_colors.push(colors);
                              a_alhpas.push(alphas);
                              a_ratios.push(ratios);
                              a_matrix.push(matrix);
                              handler.lineGradientStyle(a_style,a_colors,a_alhpas,a_ratios,a_matrix,GradientSpreadMode.toString(fillStyle.gradient.spreadMode),GradientInterpolationMode.toString(fillStyle.gradient.interpolationMode),fillStyle.gradient.focalPoint);
                        }
                     }
                  }
                  else
                  {
                     handler.lineStyle([0,0]);
                  }
               }
               if(!e.from.equals(pos))
               {
                  handler.moveTo([e.from.x,end.from.x],[e.from.y,end.from.y]);
               }
               if(e is CurvedEdge)
               {
                  c = CurvedEdge(e);
                  d = CurvedEdge(end);
                  handler.curveTo([c.control.x,d.control.x],[c.control.y,d.control.y],[c.to.x,d.to.x],[c.to.y,d.to.y]);
               }
               else
               {
                  handler.lineTo([e.to.x,end.to.x],[e.to.y,end.to.y]);
               }
               pos = e.to;
               i++;
            }
            handler.endLines();
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
      
      protected function cleanEdgeMap(param1:Dictionary) : void
      {
         var _loc2_:String = null;
         var _loc3_:Vector.<IEdge> = null;
         var _loc4_:uint = 0;
         var _loc5_:IEdge = null;
         var _loc6_:Vector.<IEdge> = null;
         var _loc7_:IEdge = null;
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
      
      public function get records() : Vector.<SWFShapeRecord>
      {
         return this._records;
      }
      
      public function set records(param1:Vector.<SWFShapeRecord>) : void
      {
         this._records = param1;
      }
      
      public function get fillStyles() : Vector.<SWFFillStyle>
      {
         return this._fillStyles;
      }
      
      public function get lineStyles() : Vector.<SWFLineStyle>
      {
         return this._lineStyles;
      }
      
      public function toString(param1:uint = 0) : String
      {
         var _loc2_:* = "\n" + StringUtils.repeat(param1) + "MorphShapeRecords:";
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

