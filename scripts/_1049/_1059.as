package _1049
{
   import _1038._1039;
   import _1045.DataGrid;
   import _1045.Grid;
   import _1177.CollectionEvent;
   import _1177._1178;
   import _1193._1192;
   import egret.core._1121;
   import egret.core._1133;
   import egret.core._1134;
   import egret.core._1141;
   import egret.core.ns_egret;
   import egret.managers._1205;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   use namespace ns_egret;
   
   public class _1059 extends _1192
   {
      private static var _7937:Boolean = false;
      
      private static var _7920:Boolean = false;
      
      private static var _7982:Number = 8192;
      
      private static var _7986:Number = 512;
      
      public var _7733:_1055;
      
      private var _7702:Vector.<int>;
      
      private var _7693:Vector.<int>;
      
      private var _7965:Vector.<int>;
      
      private var _7952:Vector.<int>;
      
      private var _7956:Vector.<_1133>;
      
      private var _7963:Vector.<_1133>;
      
      private var _7951:Vector.<_1133>;
      
      private var _7962:Vector.<_1066>;
      
      private var hoverIndicator:_1133 = null;
      
      private var caretIndicator:_1133 = null;
      
      private var editorIndicator:_1133 = null;
      
      private var _7941:Rectangle;
      
      private var _7975:Rectangle;
      
      private var _7853:Dictionary;
      
      private var _7842:Dictionary;
      
      private var _7945:Number = 0;
      
      private var _7938:Number = 0;
      
      private var _7995:Boolean = false;
      
      private var _7927:Dictionary;
      
      private var _7944:Vector.<_1133>;
      
      private var _7940:Vector.<int>;
      
      private var _7929:Vector.<int>;
      
      private var _7993:Number = 0;
      
      private var _7992:Number = 0;
      
      private var _7969:Boolean = false;
      
      private var _7955:Object = null;
      
      private var _7930:Boolean = false;
      
      public function _1059()
      {
         this._7702 = new Vector.<int>(0);
         this._7693 = new Vector.<int>(0);
         this._7965 = new Vector.<int>(0);
         this._7952 = new Vector.<int>(0);
         this._7956 = new Vector.<_1133>(0);
         this._7963 = new Vector.<_1133>(0);
         this._7951 = new Vector.<_1133>(0);
         this._7962 = new Vector.<_1066>(0);
         this._7941 = new Rectangle();
         this._7975 = new Rectangle();
         this._7853 = new Dictionary();
         this._7842 = new Dictionary();
         this._7927 = new Dictionary(true);
         this._7944 = new Vector.<_1133>(0);
         this._7940 = new Vector.<int>(0);
         this._7929 = new Vector.<int>(0);
         super();
         this._7733 = new _1055();
      }
      
      private static function _7987(param1:Number, param2:_1053) : Number
      {
         var _loc3_:Number = param2.minWidth;
         var _loc4_:Number = param2.maxWidth;
         if(!isNaN(_loc3_))
         {
            param1 = Math.max(param1,_loc3_);
         }
         if(!isNaN(_loc4_))
         {
            param1 = Math.min(param1,_loc4_);
         }
         return param1;
      }
      
      override public function get _6056() : Boolean
      {
         return true;
      }
      
      override public function set _6056(param1:Boolean) : void
      {
      }
      
      public function get _7572() : Boolean
      {
         return this._7995;
      }
      
      public function set _7572(param1:Boolean) : void
      {
         if(this.caretIndicator)
         {
            this.caretIndicator.visible = param1;
         }
         this._7995 = param1;
      }
      
      override public function _7479() : void
      {
         this._7981(this._7956);
         this._7981(this._7963);
         this._7702.length = 0;
         this._7981(this._7951);
         this._7693.length = 0;
         this._7976(this._7962);
         this._7949();
         this._7989(this.hoverIndicator);
         this.hoverIndicator = null;
         this._7989(this.caretIndicator);
         this.caretIndicator = null;
         this._7989(this.editorIndicator);
         this.editorIndicator = null;
         this._7941.setEmpty();
         this._7975.setEmpty();
      }
      
      override public function _7988(param1:int) : Rectangle
      {
         var _loc2_:_1039 = !!this.grid ? this.grid.columns : null;
         if(!_loc2_)
         {
            return null;
         }
         var _loc3_:uint = uint(_loc2_.length);
         var _loc4_:int = param1 / _loc3_;
         var _loc5_:int = param1 - _loc4_ * _loc3_;
         return this._7733._7738(_loc4_,_loc5_);
      }
      
      override protected function _7926(param1:Rectangle) : Rectangle
      {
         var _loc2_:int = Math.max(0,param1.top - 1);
         var _loc3_:int = this._7733._7737(param1.x,_loc2_);
         return this._7733._7558(_loc3_);
      }
      
      override protected function _7925(param1:Rectangle) : Rectangle
      {
         var _loc2_:int = Math.max(0,this._7733._7717() - 1);
         var _loc3_:int = Math.min(_loc2_,param1.bottom + 1);
         var _loc4_:int = this._7733._7737(param1.x,_loc3_);
         return this._7733._7558(_loc4_);
      }
      
      override protected function _7923(param1:Rectangle) : Rectangle
      {
         var _loc2_:int = Math.max(0,param1.left - 1);
         var _loc3_:int = this._7733._7719(_loc2_,param1.y);
         return this._7733._7720(_loc3_);
      }
      
      override protected function _7922(param1:Rectangle) : Rectangle
      {
         var _loc2_:int = Math.max(0,this._7733._7872() - 1);
         var _loc3_:int = Math.min(_loc2_,param1.right + 1);
         var _loc4_:int = this._7733._7719(_loc3_,param1.y);
         return this._7733._7720(_loc4_);
      }
      
      override protected function _7839() : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:String = null;
         if(!this.grid)
         {
            return;
         }
         this.grid._7547 = -1;
         this.grid._7512 = -1;
         super._7839();
         var _loc1_:* = this._7938 != horizontalScrollPosition;
         var _loc2_:* = this._7945 != verticalScrollPosition;
         this._7938 = horizontalScrollPosition;
         this._7945 = verticalScrollPosition;
         if(this._7702.length == 0 || this._7693.length == 0)
         {
            _loc3_ = true;
         }
         if(!_loc3_ && _loc2_)
         {
            _loc4_ = this._7702[0];
            _loc5_ = this._7702[this._7702.length - 1];
            _loc6_ = this._7733._7737(horizontalScrollPosition,verticalScrollPosition);
            _loc7_ = this._7733._7737(horizontalScrollPosition,verticalScrollPosition + target.height);
            if(_loc4_ != _loc6_ || _loc5_ != _loc7_)
            {
               _loc3_ = true;
            }
         }
         if(!_loc3_ && _loc1_)
         {
            _loc8_ = this._7693[0];
            _loc9_ = this._7693[this._7693.length - 1];
            _loc10_ = this._7733._7719(horizontalScrollPosition,verticalScrollPosition);
            _loc11_ = this._7733._7719(horizontalScrollPosition + target.width,verticalScrollPosition);
            if(_loc8_ != _loc10_ || _loc9_ != _loc11_)
            {
               _loc3_ = true;
            }
         }
         if(_loc3_)
         {
            _loc12_ = "none";
            if(_loc2_ && _loc1_)
            {
               _loc12_ = "bothScrollPositions";
            }
            else if(_loc2_)
            {
               _loc12_ = "verticalScrollPosition";
            }
            else if(_loc1_)
            {
               _loc12_ = "horizontalScrollPosition";
            }
            this.grid.ns_egret::_7475(_loc12_);
         }
      }
      
      override public function _7028() : void
      {
         var _loc1_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         if(!this.grid)
         {
            return;
         }
         if(this._7936)
         {
            _loc1_ = getTimer();
         }
         this._7954();
         var _loc2_:int = this.grid.requestedRowCount;
         if(_loc2_ == -1)
         {
            _loc7_ = this._7733._7573;
            if(this.grid.requestedMaxRowCount != -1)
            {
               _loc2_ = Math.min(this.grid.requestedMaxRowCount,_loc7_);
            }
            if(this.grid.requestedMinRowCount != -1)
            {
               _loc2_ = Math.max(this.grid.requestedMinRowCount,_loc2_);
            }
         }
         var _loc3_:Number = this._7733._7858(this.grid.requestedColumnCount);
         var _loc4_:Number = this._7733._7856(_loc2_);
         var _loc5_:Number = this._7733._7858(this.grid.requestedMinColumnCount);
         var _loc6_:Number = this._7733._7856(this.grid.requestedMinRowCount);
         this.grid.measuredWidth = Math.ceil(_loc3_);
         this.grid.measuredHeight = Math.ceil(_loc4_);
         if(this._7936)
         {
            _loc8_ = getTimer() - _loc1_;
            this._7959.measureTimes.push(_loc8_);
         }
      }
      
      override public function _5823(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:int = 0;
         if(!this.grid)
         {
            return;
         }
         if(this._7936)
         {
            _loc3_ = getTimer();
            if(this._7959.updateDisplayListStartTime === undefined)
            {
               this._7959.updateDisplayListStartTime = _loc3_;
            }
         }
         var _loc4_:_1039 = this.grid.columns;
         var _loc5_:int = !!_loc4_ ? this.grid.ns_egret::_7456(this.grid.columns.length) : -1;
         if(!_loc4_ || _loc5_ < 0)
         {
            return;
         }
         var _loc6_:_1058 = this._7996("backgroundLayer");
         var _loc7_:_1058 = this._7996("selectionLayer");
         var _loc8_:_1058 = this._7996("editorIndicatorLayer");
         var _loc9_:_1058 = this._7996("rendererLayer");
         var _loc10_:_1058 = this._7996("overlayLayer");
         var _loc11_:Boolean = this.grid.ns_egret::_7455("verticalScrollPosition") || this.grid.ns_egret::_7455("horizontalScrollPosition");
         if(_loc11_)
         {
            this._7965 = this._7702;
            this._7952 = this._7693;
            _loc12_ = Math.max(0,horizontalScrollPosition);
            _loc13_ = Math.max(0,verticalScrollPosition);
            this._7975.x = _loc12_;
            this._7975.y = _loc13_;
            this._7975.width = param1;
            this._7975.height = param2;
            this._7991(_loc12_,_loc13_,param1);
            this._7967(_loc9_,_loc12_,_loc13_,param1,param2);
            _loc14_ = Math.ceil(this._7733._7872());
            _loc15_ = Math.ceil(this._7733._7717());
            this.grid._7729(_loc14_,_loc15_);
            _loc16_ = this._7733._7573;
            if(_loc13_ == 0 && _loc15_ < param2)
            {
               _loc19_ = param2 - this._7733._7717();
               _loc16_ += Math.ceil(_loc19_ / this._7733._7718);
            }
            _loc17_ = this._7733._7573;
            while(_loc17_ < _loc16_)
            {
               this._7702.push(_loc17_);
               _loc17_++;
            }
            this._7956 = this._7964(this.grid._7542,_loc6_,this._7956,this._7965,this._7702,this._7968);
            _loc18_ = _loc16_ - 1;
            this._7963 = this._7964(this.grid._7554,_loc10_,this._7963,this._7965,this._7702,this._7970,_loc18_);
            this._7951 = this._7964(this.grid._7279,_loc10_,this._7951,this._7952,this._7693,this._7957,_loc5_);
            this._7965.length = 0;
            this._7952.length = 0;
         }
         if(_loc11_ || this.grid.ns_egret::_7455("hoverIndicator"))
         {
            this._7961(_loc6_);
         }
         if(_loc11_ || this.grid.ns_egret::_7455("selectionIndicator"))
         {
            this._7947(_loc7_);
         }
         if(_loc11_ || this.grid.ns_egret::_7455("caretIndicator"))
         {
            this._7960(_loc10_);
         }
         if(_loc11_ || this.grid.ns_egret::_7455("editorIndicator"))
         {
            this._7958(_loc8_);
         }
         if(!_loc11_)
         {
            this._7943();
         }
         this.grid._2449();
         if(this._7936)
         {
            _loc20_ = getTimer();
            _loc21_ = int(this._7702.length * this._7693.length);
            this._7959.updateDisplayListEndTime = _loc20_;
            this._7959.updateDisplayListTimes.push(_loc20_ - _loc3_);
            this._7959.updateDisplayListRectangles.push(this._7975.clone());
            this._7959.updateDisplayListCellCounts.push(_loc21_);
         }
      }
      
      private function _7943() : void
      {
         var _loc4_:_1066 = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc1_:Grid = this.grid;
         var _loc2_:Boolean = this._7504();
         var _loc3_:Boolean = this._7496();
         if(!_loc2_ && !_loc3_)
         {
            return;
         }
         for each(_loc4_ in this._7962)
         {
            _loc5_ = int(_loc4_._6589);
            _loc6_ = _loc4_.columnIndex;
            _loc7_ = _loc4_.selected;
            _loc8_ = _loc4_._7915;
            _loc9_ = _loc4_._7854;
            if(_loc2_)
            {
               _loc4_.selected = _loc1_._7481(_loc5_);
               _loc4_._7915 = _loc1_._7548 == _loc5_;
               _loc4_._7854 = _loc1_._7547 == _loc5_;
            }
            else if(_loc3_)
            {
               _loc4_.selected = _loc1_._7487(_loc5_,_loc6_);
               _loc4_._7915 = _loc1_._7548 == _loc5_ && _loc1_._7514 == _loc6_;
               _loc4_._7854 = _loc1_._7547 == _loc5_ && _loc1_._7512 == _loc6_;
            }
            if(_loc7_ != _loc4_.selected || _loc8_ != _loc4_._7915 || _loc9_ != _loc4_._7854)
            {
               _loc4_.prepare(true);
            }
         }
      }
      
      private function get grid() : Grid
      {
         return target as Grid;
      }
      
      private function _7996(param1:String) : _1058
      {
         var _loc2_:Grid = this.grid;
         if(!_loc2_)
         {
            return null;
         }
         return _loc2_.getChildByName(param1) as _1058;
      }
      
      private function _7741(param1:int) : _1053
      {
         var _loc2_:_1039 = this.grid.columns;
         if(_loc2_ == null || param1 >= _loc2_.length || param1 < 0)
         {
            return null;
         }
         return _loc2_.getItemAt(param1) as _1053;
      }
      
      private function _7694(param1:int) : Object
      {
         var _loc2_:_1039 = this.grid.dataProvider;
         if(_loc2_ == null || param1 >= _loc2_.length || param1 < 0)
         {
            return null;
         }
         return _loc2_.getItemAt(param1);
      }
      
      private function _7946(param1:int) : _1066
      {
         var _loc2_:_1058 = this._7996("rendererLayer");
         if(!_loc2_)
         {
            return null;
         }
         var _loc3_:Object = this.grid.typicalItem;
         if(_loc3_ == null)
         {
            _loc3_ = this._7694(0);
         }
         var _loc4_:_1053 = this._7741(param1);
         var _loc5_:Class = this._7819(_loc4_,_loc3_);
         var _loc6_:_1066 = this._7845(_loc5_) as _1066;
         _loc2_.addElement(_loc6_);
         this._7836(_loc6_,0,param1,this.grid.typicalItem,false);
         var _loc7_:Number = _loc4_.width;
         if(isNaN(_loc7_))
         {
            if("explicitWidth" in _loc6_)
            {
               _loc7_ = Number(Object(_loc6_).explicitWidth);
            }
         }
         if(isNaN(_loc7_))
         {
            _loc7_ = 4096;
         }
         this._7974(_loc6_,0,0,_loc7_,NaN);
         return _loc6_;
      }
      
      private function _7928(param1:Number, param2:Number, param3:int) : void
      {
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:_1053 = null;
         var _loc13_:_1066 = null;
         var _loc4_:_1058 = this._7996("rendererLayer");
         if(!_loc4_)
         {
            return;
         }
         var _loc5_:_1055 = this._7733;
         var _loc6_:int = _loc5_._7560;
         var _loc7_:Number = _loc5_._7756(0,param3);
         var _loc8_:int = _loc5_._7901;
         var _loc9_:int = param3;
         while(param1 > 0 && _loc9_ >= 0 && _loc9_ < _loc6_)
         {
            _loc10_ = _loc5_._7861(_loc9_);
            _loc11_ = _loc5_._7864(_loc9_);
            _loc12_ = this._7741(_loc9_);
            if(!isNaN(_loc12_.width))
            {
               _loc11_ = _loc12_.width;
               _loc5_._7863(_loc9_,_loc11_);
            }
            if(isNaN(_loc11_) || isNaN(_loc10_))
            {
               _loc13_ = this._7946(_loc9_);
               if(isNaN(_loc11_))
               {
                  _loc11_ = _7987(_loc13_.preferredWidth,_loc12_);
                  _loc5_._7863(_loc9_,_loc11_);
               }
               if(isNaN(_loc10_))
               {
                  _loc10_ = Number(_loc13_.preferredHeight);
                  _loc5_._7862(_loc9_,_loc10_);
               }
               _loc4_.removeElement(_loc13_);
               this._7989(_loc13_);
            }
            if(_loc9_ == param3)
            {
               param1 -= _loc7_ + _loc11_ - param2;
            }
            else
            {
               param1 -= _loc11_ + _loc8_;
            }
            _loc9_ = this.grid.ns_egret::_7471(_loc9_);
         }
      }
      
      private function _7954() : void
      {
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:_1053 = null;
         var _loc11_:Boolean = false;
         var _loc12_:_1066 = null;
         var _loc1_:_1058 = this._7996("rendererLayer");
         if(!_loc1_)
         {
            return;
         }
         var _loc2_:_1055 = this._7733;
         var _loc3_:int = _loc2_._7560;
         var _loc4_:int = _loc2_._7901;
         var _loc5_:int = this.grid.requestedColumnCount;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         while(_loc7_ < _loc3_)
         {
            _loc8_ = _loc2_._7861(_loc7_);
            _loc9_ = _loc2_._7864(_loc7_);
            _loc10_ = this._7741(_loc7_);
            if(!_loc10_.visible)
            {
               _loc2_._7863(_loc7_,0);
               _loc2_._7862(_loc7_,0);
            }
            else
            {
               if(!isNaN(_loc10_.width))
               {
                  _loc9_ = _loc10_.width;
                  _loc2_._7863(_loc7_,_loc9_);
               }
               _loc11_ = _loc5_ == -1 || _loc6_ < _loc5_;
               if((_loc11_) && (isNaN(_loc9_) || isNaN(_loc8_)))
               {
                  _loc12_ = this._7946(_loc7_);
                  if(isNaN(_loc9_))
                  {
                     _loc9_ = _7987(_loc12_.preferredWidth,_loc10_);
                     _loc2_._7863(_loc7_,_loc9_);
                  }
                  if(isNaN(_loc8_))
                  {
                     _loc8_ = Number(_loc12_.preferredHeight);
                     _loc2_._7862(_loc7_,_loc8_);
                  }
                  _loc1_.removeElement(_loc12_);
                  this._7989(_loc12_);
               }
               _loc6_++;
            }
            _loc7_++;
         }
      }
      
      private function _7991(param1:Number, param2:Number, param3:Number) : void
      {
         var _loc13_:Number = NaN;
         var _loc14_:_1053 = null;
         var _loc15_:Number = NaN;
         var _loc4_:_1055 = this._7733;
         var _loc5_:int;
         if((_loc5_ = _loc4_._7560) <= 0)
         {
            return;
         }
         var _loc6_:int = _loc4_._7719(param1,param2);
         this._7928(param3,param1,_loc6_);
         var _loc7_:int = _loc4_._7901;
         var _loc8_:Number = _loc4_._7756(0,_loc6_);
         var _loc9_:Number = param3;
         var _loc10_:uint = 0;
         var _loc11_:int = _loc6_;
         while(_loc9_ > 0 && _loc11_ >= 0 && _loc11_ < _loc5_)
         {
            _loc13_ = _loc4_._7864(_loc11_);
            _loc14_ = this._7741(_loc11_);
            if(isNaN(_loc14_.width))
            {
               _loc10_ += 1;
               _loc13_ = _7987(_loc13_,_loc14_);
            }
            else
            {
               _loc13_ = _loc14_.width;
            }
            _loc4_._7875(_loc11_,_loc13_);
            if(_loc11_ == _loc6_)
            {
               _loc9_ -= _loc8_ + _loc13_ - param1;
            }
            else
            {
               _loc9_ -= _loc13_ + _loc7_;
            }
            _loc11_ = this.grid.ns_egret::_7471(_loc11_);
         }
         if(param1 != 0 || _loc9_ < 1 || _loc10_ == 0)
         {
            return;
         }
         var _loc12_:Number = Math.ceil(_loc9_ / _loc10_);
         _loc11_ = _loc6_;
         while(_loc11_ >= 0 && _loc11_ < _loc5_ && _loc9_ >= 1)
         {
            _loc14_ = this._7741(_loc11_);
            if(isNaN(_loc14_.width))
            {
               _loc15_ = _loc4_._7539(_loc11_);
               _loc13_ = _loc15_ + Math.min(_loc9_,_loc12_);
               _loc13_ = _7987(_loc13_,_loc14_);
               _loc4_._7875(_loc11_,_loc13_);
               _loc9_ -= _loc13_ - _loc15_;
            }
            _loc11_ = this.grid.ns_egret::_7471(_loc11_);
         }
      }
      
      private function _7819(param1:_1053, param2:Object) : Class
      {
         return param1._7819(param2);
      }
      
      private function _7967(param1:_1058, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc19_:_1053 = null;
         var _loc25_:_1066 = null;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:_1066 = null;
         var _loc30_:Number = NaN;
         var _loc31_:Number = NaN;
         var _loc32_:Object = null;
         var _loc33_:Class = null;
         var _loc34_:int = 0;
         var _loc35_:int = 0;
         var _loc36_:int = 0;
         var _loc37_:int = 0;
         var _loc38_:Number = NaN;
         var _loc39_:Number = NaN;
         var _loc40_:Number = NaN;
         var _loc41_:int = 0;
         var _loc42_:int = 0;
         var _loc43_:Rectangle = null;
         if(!param1)
         {
            return;
         }
         var _loc8_:_1055 = this._7733;
         var _loc9_:int = _loc8_._7573;
         var _loc10_:int = _loc8_._7560;
         var _loc11_:int = _loc8_._7907;
         var _loc12_:int = _loc8_._7901;
         var _loc13_:int = _loc8_._7719(param2,param3);
         var _loc14_:int = _loc8_._7737(param2,param3);
         var _loc15_:Number = _loc8_._7756(_loc14_,_loc13_);
         var _loc16_:Number = _loc8_._7757(_loc14_,_loc13_);
         var _loc17_:Vector.<int> = new Vector.<int>();
         var _loc18_:Number = param4;
         _loc7_ = _loc13_;
         while(_loc18_ > 0 && _loc7_ >= 0 && _loc7_ < _loc10_)
         {
            _loc17_.push(_loc7_);
            _loc26_ = _loc8_._7539(_loc7_);
            if(_loc7_ == _loc13_)
            {
               _loc18_ -= _loc15_ + _loc26_ - param2;
            }
            else
            {
               _loc18_ -= _loc26_ + _loc12_;
            }
            _loc7_ = this.grid.ns_egret::_7471(_loc7_);
         }
         var _loc20_:Vector.<int> = new Vector.<int>();
         var _loc21_:Vector.<_1066> = new Vector.<_1066>();
         var _loc22_:Number = _loc15_;
         var _loc23_:Number = _loc16_;
         var _loc24_:Number = param5;
         _loc6_ = _loc14_;
         while(_loc24_ > 0 && _loc6_ >= 0 && _loc6_ < _loc9_)
         {
            _loc20_.push(_loc6_);
            _loc27_ = _loc8_._7746(_loc6_);
            for each(_loc7_ in _loc17_)
            {
               _loc29_ = this._7953(_loc6_,_loc7_);
               if(!_loc29_)
               {
                  _loc32_ = this._7694(_loc6_);
                  _loc19_ = this._7741(_loc7_);
                  _loc33_ = this._7819(_loc19_,_loc32_);
                  _loc29_ = this._7845(_loc33_) as _1066;
               }
               if(_loc29_.parent != param1)
               {
                  param1.addElement(_loc29_);
               }
               _loc21_.push(_loc29_);
               this._7836(_loc29_,_loc6_,_loc7_);
               _loc30_ = _loc8_._7539(_loc7_);
               this._7974(_loc29_,_loc22_,_loc23_,_loc30_,_loc27_);
               _loc31_ = Number(_loc29_.preferredHeight);
               _loc8_._7879(_loc6_,_loc7_,_loc31_);
               _loc22_ += _loc30_ + _loc12_;
            }
            _loc28_ = _loc8_._7746(_loc6_);
            if(_loc27_ != _loc28_)
            {
               _loc34_ = int(_loc17_.length);
               _loc27_ = _loc28_;
               for each(_loc7_ in _loc17_)
               {
                  _loc35_ = int(_loc20_.indexOf(_loc6_));
                  _loc36_ = int(_loc17_.indexOf(_loc7_));
                  _loc37_ = _loc35_ * _loc34_ + _loc36_;
                  _loc29_ = _loc21_[_loc37_];
                  _loc38_ = Number(_loc29_.layoutBoundsX);
                  _loc39_ = Number(_loc29_.layoutBoundsY);
                  _loc40_ = Number(_loc29_.layoutBoundsWidth);
                  this._7974(_loc29_,_loc38_,_loc39_,_loc40_,_loc27_);
                  _loc8_._7879(_loc6_,_loc7_,_loc29_.preferredHeight);
               }
            }
            _loc22_ = _loc15_;
            _loc23_ += _loc27_ + _loc11_;
            if(_loc6_ == _loc14_)
            {
               _loc24_ -= _loc16_ + _loc27_ - param3;
            }
            else
            {
               _loc24_ -= _loc27_ + _loc11_;
            }
            _loc6_++;
         }
         for each(_loc25_ in this._7962)
         {
            this._7984(_loc25_);
            if(_loc25_)
            {
               _loc25_.discard(true);
            }
         }
         if(_loc20_.length > 0 && _loc17_.length > 0)
         {
            _loc41_ = _loc20_[_loc20_.length - 1];
            _loc42_ = _loc17_[_loc17_.length - 1];
            _loc43_ = _loc8_._7738(_loc41_,_loc42_);
            this._7941.x = _loc15_;
            this._7941.y = _loc16_;
            this._7941.width = _loc43_.x + _loc43_.width - _loc15_;
            this._7941.height = _loc43_.y + _loc43_.height - _loc16_;
         }
         else
         {
            this._7941.setEmpty();
         }
         this._7962 = _loc21_;
         this._7702 = _loc20_;
         this._7693 = _loc17_;
      }
      
      public function _7534(param1:int, param2:int) : void
      {
         var _loc3_:_1066 = this._7684(param1,param2);
         if(!_loc3_)
         {
            return;
         }
         if(this._7924(_loc3_))
         {
            _loc3_.grid.invalidateDisplayList();
            return;
         }
         this._7836(_loc3_,param1,param2);
         var _loc4_:Number = Number(_loc3_.layoutBoundsX);
         var _loc5_:Number = Number(_loc3_.layoutBoundsY);
         var _loc6_:Number = Number(_loc3_.layoutBoundsWidth);
         var _loc7_:Number = Number(_loc3_.layoutBoundsHeight);
         this._7974(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_);
         var _loc8_:Number = Number(_loc3_.preferredHeight);
         if(this._7733.variableRowHeight && _loc7_ != _loc8_)
         {
            this.grid.invalidateDisplayList();
         }
      }
      
      private function _7924(param1:_1066) : Boolean
      {
         var _loc2_:_1053 = param1.column;
         if(!_loc2_ || _loc2_._6053 === null)
         {
            return false;
         }
         var _loc3_:Class = this._7819(_loc2_,param1.data);
         return _loc3_ !== this._7842[param1];
      }
      
      private function _7934(param1:int, param2:int) : int
      {
         if(this._7702 == null || this._7693 == null)
         {
            return -1;
         }
         var _loc3_:int = int(this._7702.indexOf(param1));
         var _loc4_:int = int(this._7693.indexOf(param2));
         if(_loc3_ == -1 || _loc4_ == -1)
         {
            return -1;
         }
         return int(_loc3_ * this._7693.length + _loc4_);
      }
      
      public function _7684(param1:int, param2:int) : _1066
      {
         var _loc3_:int = this._7934(param1,param2);
         if(_loc3_ == -1 || _loc3_ >= this._7962.length)
         {
            return null;
         }
         return this._7962[_loc3_];
      }
      
      private function _7953(param1:int, param2:int) : _1066
      {
         var _loc3_:int = this._7934(param1,param2);
         if(_loc3_ == -1 || _loc3_ >= this._7962.length)
         {
            return null;
         }
         var _loc4_:_1066 = this._7962[_loc3_];
         this._7962[_loc3_] = null;
         if(Boolean(_loc4_) && this._7924(_loc4_))
         {
            this._7984(_loc4_);
            return null;
         }
         return _loc4_;
      }
      
      private function _7836(param1:_1066, param2:int, param3:int, param4:Object = null, param5:Boolean = true) : void
      {
         param1.visible = param5;
         var _loc6_:_1053 = this._7741(param3);
         if(_loc6_)
         {
            param1._6589 = param2;
            param1.column = _loc6_;
            if(param4 == null)
            {
               param4 = this._7694(param2);
            }
            param1.label = _loc6_._7442(param4);
            if(this._7504())
            {
               param1.selected = this.grid._7481(param2);
               param1._7915 = this.grid._7548 == param2;
               param1._7854 = this.grid._7547 == param2;
            }
            else if(this._7496())
            {
               param1.selected = this.grid._7487(param2,param3);
               param1._7915 = this.grid._7548 == param2 && this.grid._7514 == param3;
               param1._7854 = this.grid._7547 == param2 && this.grid._7512 == param3;
            }
            param1.data = param4;
            if(this.grid._5598)
            {
               param1._6967(this.grid._5598);
            }
            param1.prepare(!this._7969);
         }
      }
      
      private function _7984(param1:_1066) : void
      {
         if(!param1)
         {
            return;
         }
         this._7989(param1);
      }
      
      private function _7976(param1:Vector.<_1066>) : void
      {
         var _loc2_:_1066 = null;
         for each(_loc2_ in param1)
         {
            this._7984(_loc2_);
         }
         param1.length = 0;
      }
      
      private function _7964(param1:Class, param2:_1058, param3:Vector.<_1133>, param4:Vector.<int>, param5:Vector.<int>, param6:Function, param7:int = -1) : Vector.<_1133>
      {
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:_1133 = null;
         if(!param2)
         {
            return new Vector.<_1133>(0);
         }
         this._7921(param1,param2,param3);
         if(param1 == null)
         {
            return new Vector.<_1133>(0);
         }
         this._7971(param3,param4,param5,param7);
         var _loc8_:uint = param5.length;
         var _loc9_:Vector.<_1133> = new Vector.<_1133>(_loc8_);
         var _loc10_:int = 0;
         while(_loc10_ < _loc8_)
         {
            _loc11_ = param5[_loc10_];
            if(_loc11_ == param7)
            {
               _loc9_.length = _loc10_;
               break;
            }
            _loc12_ = int(param4.indexOf(_loc11_));
            if((_loc13_ = _loc12_ != -1 && _loc12_ < param3.length ? param3[_loc12_] : null) == null)
            {
               _loc13_ = this._7845(param1);
            }
            _loc9_[_loc10_] = _loc13_;
            param2.addElement(_loc13_);
            _loc13_.visible = true;
            param6(_loc13_,_loc11_);
            _loc10_++;
         }
         return _loc9_;
      }
      
      private function _7972(param1:Class, param2:_1058, param3:Vector.<_1133>, param4:Vector.<int>, param5:Vector.<int>, param6:Vector.<int>, param7:Vector.<int>, param8:Function) : Vector.<_1133>
      {
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:_1133 = null;
         if(!param2)
         {
            return new Vector.<_1133>(0);
         }
         if(this._7921(param1,param2,param3))
         {
            param4.length = 0;
            param5.length = 0;
         }
         if(param1 == null)
         {
            return new Vector.<_1133>(0);
         }
         var _loc9_:uint = param6.length;
         var _loc10_:Vector.<_1133> = new Vector.<_1133>(_loc9_);
         this._7985(param3,_loc10_,param4,param6,param5,param7);
         var _loc11_:int = 0;
         while(_loc11_ < _loc9_)
         {
            _loc12_ = param6[_loc11_];
            _loc13_ = param7[_loc11_];
            _loc14_ = _loc10_[_loc11_];
            if(_loc14_ === null)
            {
               _loc14_ = this._7845(param1);
               _loc10_[_loc11_] = _loc14_;
            }
            param2.addElement(_loc14_);
            _loc14_.visible = true;
            param8(_loc14_,_loc12_,_loc13_);
            _loc11_++;
         }
         return _loc10_;
      }
      
      private function _7921(param1:Class, param2:_1058, param3:Vector.<_1133>) : Boolean
      {
         var _loc4_:_1133 = null;
         if(param3.length > 0 && param1 != this._7842[param3[0]])
         {
            for each(_loc4_ in param3)
            {
               param2.removeElement(_loc4_);
               this._7989(_loc4_);
            }
            param3.length = 0;
            return true;
         }
         return false;
      }
      
      private function _7971(param1:Vector.<_1133>, param2:Vector.<int>, param3:Vector.<int>, param4:int) : void
      {
         var _loc6_:int = 0;
         var _loc7_:_1133 = null;
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            _loc6_ = int(param3.indexOf(param2[_loc5_]));
            if(param2[_loc5_] == param4 || _loc6_ == -1)
            {
               _loc7_ = param1[_loc5_];
               if(_loc7_)
               {
                  this._7989(_loc7_);
                  param1[_loc5_] = null;
               }
            }
            _loc5_++;
         }
      }
      
      private function _7985(param1:Vector.<_1133>, param2:Vector.<_1133>, param3:Vector.<int>, param4:Vector.<int>, param5:Vector.<int>, param6:Vector.<int>) : void
      {
         var _loc11_:_1133 = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc7_:Boolean = true;
         var _loc8_:int = int(param4.length);
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         while(_loc10_ < param1.length)
         {
            _loc11_ = param1[_loc10_];
            if(_loc11_ != null)
            {
               _loc12_ = param3[_loc10_];
               _loc13_ = param5[_loc10_];
               while(_loc9_ < _loc8_)
               {
                  _loc14_ = param4[_loc9_];
                  _loc15_ = param6[_loc9_];
                  if(_loc14_ == _loc12_)
                  {
                     if(_loc15_ == _loc13_)
                     {
                        param2[_loc9_] = _loc11_;
                        _loc7_ = false;
                        break;
                     }
                     if(_loc15_ > _loc13_)
                     {
                        break;
                     }
                  }
                  else if(_loc14_ > _loc12_)
                  {
                     break;
                  }
                  _loc9_++;
               }
               if(_loc7_)
               {
                  this._7989(_loc11_);
               }
               _loc7_ = true;
            }
            _loc10_++;
         }
         param1.length = 0;
      }
      
      private function _7968(param1:_1133, param2:int) : void
      {
         var _loc3_:int = this._7733._7573;
         var _loc4_:Rectangle = param2 < _loc3_ ? this._7733._7558(param2) : this._7733._7873(param2);
         if(!_loc4_)
         {
            return;
         }
         if(param2 < _loc3_ && _loc4_.width == 0)
         {
            _loc4_.width = this._7975.width;
         }
         this._7942(param1,param2);
         this._7973(param1,_loc4_);
      }
      
      private function _7970(param1:_1133, param2:int) : void
      {
         this._7942(param1,param2);
         var _loc3_:Number = Number(param1.preferredHeight);
         var _loc4_:int = this._7733._7573;
         var _loc5_:Rectangle = param2 < _loc4_ ? this._7733._7558(param2) : this._7733._7873(param2);
         if(!_loc5_)
         {
            return;
         }
         var _loc6_:Number = _loc5_.x;
         var _loc7_:Number = Math.max(_loc5_.width,this._7975.right);
         var _loc8_:Number = _loc5_.bottom;
         this._7979(param1,_loc6_,_loc8_,_loc7_,_loc3_);
      }
      
      private function _7957(param1:_1133, param2:int) : void
      {
         this._7942(param1,-1,param2);
         var _loc3_:Rectangle = this._7941;
         var _loc4_:Number = Number(param1.preferredWidth);
         var _loc5_:Number = Math.max(_loc3_.height,this._7975.height);
         var _loc6_:Number = this._7733._7756(0,param2) + this._7733._7539(param2);
         var _loc7_:Number = _loc3_.y;
         this._7979(param1,_loc6_,_loc7_,_loc4_,_loc5_);
      }
      
      private function _7504() : Boolean
      {
         var _loc1_:String = this.grid._6609;
         return _loc1_ == _1063._7565 || _loc1_ == _1063._6608;
      }
      
      private function _7496() : Boolean
      {
         var _loc1_:String = this.grid._6609;
         return _loc1_ == _1063._7562 || _loc1_ == _1063._7538;
      }
      
      private function _7947(param1:_1058) : void
      {
         var _loc3_:Vector.<int> = null;
         var _loc4_:int = 0;
         var _loc5_:Vector.<int> = null;
         var _loc6_:int = 0;
         var _loc2_:Class = this.grid.selectionIndicator;
         if(this._7504())
         {
            if(this._7929.length > 0)
            {
               this._7949();
            }
            _loc3_ = this._7940;
            this._7940 = new Vector.<int>();
            for each(_loc4_ in this._7702)
            {
               if(this.grid._7481(_loc4_))
               {
                  this._7940.push(_loc4_);
               }
            }
            this._7944 = this._7964(_loc2_,param1,this._7944,_loc3_,this._7940,this._7939);
            return;
         }
         if(this._7940.length > 0 && this._7929.length == 0)
         {
            this._7949();
         }
         if(this._7496())
         {
            _loc3_ = this._7940;
            _loc5_ = this._7929;
            this._7940 = new Vector.<int>();
            this._7929 = new Vector.<int>();
            for each(_loc4_ in this._7702)
            {
               for each(_loc6_ in this._7693)
               {
                  if(this.grid._7487(_loc4_,_loc6_))
                  {
                     this._7940.push(_loc4_);
                     this._7929.push(_loc6_);
                  }
               }
            }
            this._7944 = this._7972(_loc2_,param1,this._7944,_loc3_,_loc5_,this._7940,this._7929,this._7931);
            return;
         }
         if(this._7929.length > 0)
         {
            this._7949();
         }
      }
      
      private function _7939(param1:_1133, param2:int) : void
      {
         this._7942(param1,param2);
         this._7973(param1,this._7733._7558(param2));
      }
      
      private function _7931(param1:_1133, param2:int, param3:int) : void
      {
         this._7942(param1,param2,param3);
         this._7973(param1,this._7733._7738(param2,param3));
      }
      
      private function _7949() : void
      {
         this._7981(this._7944);
         this._7940.length = 0;
         this._7929.length = 0;
      }
      
      private function _7990(param1:_1058, param2:Class, param3:_1133, param4:int, param5:int) : _1133
      {
         var _loc6_:Rectangle = null;
         if(!param1)
         {
            return null;
         }
         if(Boolean(param3) && param2 != this._7842[param3])
         {
            this._7978(param3);
            param3 = null;
            if(param2 == null)
            {
               return null;
            }
         }
         if(param4 == -1 || this.grid._6609 == _1063.NONE || this._7496() && this.grid.ns_egret::_7471(param5 - 1) != param5)
         {
            if(param3)
            {
               param3.visible = false;
            }
            return param3;
         }
         if(!param3 && Boolean(param2))
         {
            param3 = this._7977(param2);
         }
         if(param3)
         {
            _loc6_ = this._7504() ? this._7733._7558(param4) : this._7733._7738(param4,param5);
            this._7942(param3,param4,param5);
            if(param2 == this.grid.caretIndicator && Boolean(_loc6_))
            {
               if(this._7496() && param5 < this.grid.columns.length - 1)
               {
                  _loc6_.width += 1;
               }
               if(param4 < this.grid.dataProvider.length - 1 || this._7702.length > this.grid.dataProvider.length)
               {
                  _loc6_.height += 1;
               }
            }
            this._7973(param3,_loc6_);
            param1.addElement(param3);
            param3.visible = true;
         }
         return param3;
      }
      
      private function _7961(param1:_1058) : void
      {
         var _loc2_:int = this.grid._7547;
         var _loc3_:int = this.grid._7512;
         var _loc4_:Class = this.grid.hoverIndicator;
         this.hoverIndicator = this._7990(param1,_loc4_,this.hoverIndicator,_loc2_,_loc3_);
      }
      
      private function _7960(param1:_1058) : void
      {
         var _loc2_:int = this.grid._7548;
         var _loc3_:int = this.grid._7514;
         var _loc4_:Class = this.grid.caretIndicator;
         this.caretIndicator = this._7990(param1,_loc4_,this.caretIndicator,_loc2_,_loc3_);
         if(Boolean(this.caretIndicator) && !this._7995)
         {
            this.caretIndicator.visible = this._7995;
         }
      }
      
      private function _7958(param1:_1058) : void
      {
         var _loc6_:Rectangle = null;
         var _loc2_:DataGrid = this.grid._5598;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:int = _loc2_._7533;
         var _loc4_:int = _loc2_._7509;
         var _loc5_:Class = _loc2_.editorIndicator;
         if(Boolean(this.editorIndicator) && _loc5_ != this._7842[this.editorIndicator])
         {
            this._7978(this.editorIndicator);
            this.editorIndicator = null;
            if(_loc5_ == null)
            {
               return;
            }
         }
         if(_loc3_ == -1 || _loc4_ == -1)
         {
            if(this.editorIndicator)
            {
               this.editorIndicator.visible = false;
            }
            return;
         }
         if(!this.editorIndicator && Boolean(_loc5_))
         {
            this.editorIndicator = this._7977(_loc5_);
         }
         if(this.editorIndicator)
         {
            _loc6_ = this._7733._7738(_loc3_,_loc4_);
            this._7942(this.editorIndicator,_loc3_,_loc4_);
            this._7973(this.editorIndicator,_loc6_);
            param1.addElement(this.editorIndicator);
            this.editorIndicator.visible = true;
         }
      }
      
      public function _7670(param1:CollectionEvent) : void
      {
         switch(param1.kind)
         {
            case _1178.ADD:
               this._7948(param1);
               break;
            case _1178.REMOVE:
               this._7932(param1);
               break;
            case _1178.MOVE:
               break;
            case _1178.REFRESH:
            case _1178.RESET:
               this._7935(param1);
               break;
            case _1178.UPDATE:
               this._7933(param1);
               break;
            case _1178.REPLACE:
         }
      }
      
      private function _7948(param1:CollectionEvent) : void
      {
         var _loc2_:int = param1.location;
         var _loc3_:int = int(param1.items.length);
         this._7966(this._7702,_loc2_,_loc3_);
         this._7966(this._7940,_loc2_,_loc3_);
      }
      
      private function _7932(param1:CollectionEvent) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc2_:uint = param1.items.length;
         var _loc3_:int = param1.location;
         var _loc4_:int = param1.location + param1.items.length - 1;
         var _loc5_:int = -1;
         var _loc6_:int = -1;
         var _loc7_:int = 0;
         while(_loc7_ < this._7702.length)
         {
            _loc8_ = this._7702[_loc7_];
            if(_loc8_ >= _loc3_ && _loc8_ <= _loc4_)
            {
               if(_loc5_ == -1)
               {
                  _loc5_ = _loc6_ = _loc7_;
               }
               else
               {
                  _loc6_ = _loc7_;
               }
            }
            else if(_loc8_ > _loc4_)
            {
               this._7702[_loc7_] = _loc8_ - _loc2_;
            }
            _loc7_++;
         }
         if(_loc5_ != -1 && _loc6_ != -1)
         {
            _loc9_ = _loc6_ - _loc5_ + 1;
            this._7702.splice(_loc5_,_loc9_);
            if(_loc6_ < this._7956.length)
            {
               this._7981(this._7956.splice(_loc5_,_loc9_));
            }
            if(_loc6_ < this._7963.length)
            {
               this._7981(this._7963.splice(_loc5_,_loc9_));
            }
            _loc10_ = int(this._7693.length);
            _loc11_ = _loc5_ * _loc10_;
            this._7976(this._7962.splice(_loc11_,_loc9_ * _loc10_));
         }
      }
      
      private function _7966(param1:Vector.<int>, param2:int, param3:int) : void
      {
         var _loc6_:int = 0;
         var _loc4_:int = int(param1.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = param1[_loc5_];
            if(_loc6_ >= param2)
            {
               param1[_loc5_] = _loc6_ + param3;
            }
            _loc5_++;
         }
      }
      
      private function _7935(param1:CollectionEvent) : void
      {
         this._7479();
      }
      
      private function _7933(param1:CollectionEvent) : void
      {
         var _loc2_:Object = null;
         var _loc6_:int = 0;
         var _loc7_:_1066 = null;
         var _loc3_:int = int(param1.items.length);
         var _loc4_:int = int(this._7962.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc2_ = param1.items[_loc5_];
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               _loc7_ = this._7962[_loc6_] as _1066;
               if((Boolean(_loc7_)) && _loc7_.data == _loc2_)
               {
                  this._7984(_loc7_);
                  this._7962[_loc6_] = null;
               }
               _loc6_++;
            }
            _loc5_++;
         }
      }
      
      public function _7677(param1:CollectionEvent) : void
      {
         switch(param1.kind)
         {
            case _1178.UPDATE:
               this._7479();
               break;
            default:
               this._7479();
               if(this.grid)
               {
                  this.grid._7729(0,0);
               }
         }
      }
      
      private function _7977(param1:Class) : _1133
      {
         this._7969 = true;
         var _loc2_:_1133 = new param1() as _1133;
         this._7842[_loc2_] = param1;
         return _loc2_;
      }
      
      private function _7845(param1:Class) : _1133
      {
         var _loc3_:_1133 = null;
         this._7969 = false;
         var _loc2_:Vector.<_1133> = this._7853[param1] as Vector.<_1133>;
         if(_loc2_)
         {
            _loc3_ = _loc2_.pop();
            if(_loc2_.length == 0)
            {
               delete this._7853[param1];
            }
            if(_loc3_)
            {
               return _loc3_;
            }
         }
         return this._7977(param1);
      }
      
      private function _7989(param1:_1133) : Boolean
      {
         if(!param1)
         {
            return false;
         }
         param1.visible = false;
         var _loc2_:Class = this._7842[param1];
         if(!_loc2_)
         {
            return false;
         }
         var _loc3_:Vector.<_1133> = this._7853[_loc2_];
         if(!_loc3_)
         {
            _loc3_ = new Vector.<_1133>();
            this._7853[_loc2_] = _loc3_;
         }
         _loc3_.push(param1);
         return true;
      }
      
      private function _7981(param1:Vector.<_1133>) : void
      {
         var _loc2_:_1133 = null;
         for each(_loc2_ in param1)
         {
            this._7989(_loc2_);
         }
         param1.length = 0;
      }
      
      private function _7978(param1:_1133) : void
      {
         var _loc5_:int = 0;
         var _loc2_:Class = this._7842[param1];
         var _loc3_:Vector.<_1133> = !!_loc2_ ? this._7853[_loc2_] : null;
         if(_loc3_)
         {
            _loc5_ = int(_loc3_.indexOf(param1));
            if(_loc5_ != -1)
            {
               _loc3_.splice(_loc5_,1);
            }
            if(_loc3_.length == 0)
            {
               delete this._7853[_loc2_];
            }
         }
         delete this._7842[param1];
         param1.visible = false;
         var _loc4_:_1134 = param1.parent as _1134;
         if(_loc4_)
         {
            _loc4_.removeElement(param1);
         }
      }
      
      private function _7974(param1:_1066, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:_1205 = null;
         var _loc8_:_1121 = null;
         var _loc9_:Number = NaN;
         if(this._7936)
         {
            _loc6_ = getTimer();
         }
         if(!isNaN(param4) || !isNaN(param5))
         {
            if(param1 is _1205)
            {
               _loc7_ = param1 as _1205;
               _1141.ns_egret::_1609._1608(_loc7_,true);
            }
            param1._7599(param4,param5);
         }
         if(param1 is _1121)
         {
            _loc8_ = param1 as _1121;
            _loc8_._2449();
         }
         param1._7777(param2,param3);
         if(this._7936)
         {
            _loc9_ = getTimer() - _loc6_;
            this._7959.layoutGridElementTimes.push(_loc9_);
         }
      }
      
      private function _7973(param1:_1133, param2:Rectangle) : void
      {
         if(param2)
         {
            this._7979(param1,param2.x,param2.y,param2.width,param2.height);
         }
      }
      
      private function _7979(param1:_1133, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         if(param4 > _7982)
         {
            _loc6_ = Math.max(0,horizontalScrollPosition);
            _loc7_ = this.grid.layoutBoundsWidth;
            _loc8_ = Math.max(param2,_loc6_ - _7986);
            _loc9_ = Math.min(param2 + param4,_loc6_ + _loc7_ + _7986);
            param2 = _loc8_;
            param4 = _loc9_ - _loc8_;
         }
         if(param5 > _7982)
         {
            _loc10_ = Math.max(0,verticalScrollPosition);
            _loc11_ = this.grid.layoutBoundsHeight;
            _loc12_ = Math.max(param3,_loc10_ - _7986);
            _loc13_ = Math.min(param3 + param5,_loc10_ + _loc11_ + _7986);
            param3 = _loc12_;
            param5 = _loc13_ - _loc12_;
         }
         param1._7599(param4,param5);
         param1._7777(param2,param3);
      }
      
      private function _7942(param1:_1133, param2:int = -1, param3:int = -1) : void
      {
         var _loc4_:_1067 = param1 as _1067;
         if(_loc4_)
         {
            _loc4_._7950(this.grid,param2,param3);
         }
      }
      
      public function _7491() : Vector.<int>
      {
         return this._7702.concat();
      }
      
      public function _7683() : Vector.<int>
      {
         return this._7693.concat();
      }
      
      public function _7738(param1:int, param2:int) : Rectangle
      {
         return this._7733._7738(param1,param2);
      }
      
      public function _7558(param1:int) : Rectangle
      {
         return this._7733._7558(param1);
      }
      
      public function _7720(param1:int) : Rectangle
      {
         return this._7733._7720(param1);
      }
      
      public function _7737(param1:Number, param2:Number) : int
      {
         return this._7733._7737(param1,param2);
      }
      
      public function _7719(param1:Number, param2:Number) : int
      {
         return this._7733._7719(param1,param2);
      }
      
      public function _7755(param1:Number, param2:Number) : _1048
      {
         var _loc3_:int = this._7733._7737(param1,param2);
         var _loc4_:int = this._7733._7719(param1,param2);
         if(_loc3_ == -1 || _loc4_ == -1)
         {
            return null;
         }
         return new _1048(_loc3_,_loc4_);
      }
      
      public function _7751(param1:Number, param2:Number, param3:Number, param4:Number) : Vector.<_1048>
      {
         var _loc9_:int = 0;
         var _loc5_:Vector.<_1048> = new Vector.<_1048>();
         if(param3 <= 0 || param4 <= 0)
         {
            return _loc5_;
         }
         var _loc6_:_1048 = this._7755(param1,param2);
         var _loc7_:_1048 = this._7755(param1 + param3,param2 + param4);
         if(!_loc6_ || !_loc7_)
         {
            return _loc5_;
         }
         var _loc8_:int = _loc6_._6589;
         while(_loc8_ <= _loc7_._6589)
         {
            _loc9_ = _loc6_.columnIndex;
            while(_loc9_ <= _loc7_.columnIndex)
            {
               _loc5_.push(new _1048(_loc8_,_loc9_));
               _loc9_++;
            }
            _loc8_++;
         }
         return _loc5_;
      }
      
      public function _7711(param1:int, param2:int) : _1066
      {
         var _loc3_:_1066 = this._7684(param1,param2);
         if(_loc3_)
         {
            return _loc3_;
         }
         var _loc4_:_1058 = this._7996("rendererLayer");
         if(!_loc4_)
         {
            return null;
         }
         var _loc5_:Object = this._7694(param1);
         var _loc6_:_1053 = this._7741(param2);
         if(_loc5_ == null || _loc6_ == null)
         {
            return null;
         }
         if(!_loc6_.visible)
         {
            return null;
         }
         var _loc7_:Class = this._7819(_loc6_,_loc5_);
         var _loc8_:_1066 = new _loc7_() as _1066;
         this._7969 = true;
         _loc4_.addElement(_loc8_);
         this._7836(_loc8_,param1,param2,_loc5_,false);
         var _loc9_:Rectangle = this._7733._7738(param1,param2);
         if(_loc9_ == null)
         {
            return null;
         }
         this._7974(_loc8_,_loc9_.x,_loc9_.y,_loc9_.width,_loc9_.height);
         _loc4_.removeElement(_loc8_);
         _loc8_.visible = false;
         return _loc8_;
      }
      
      public function _7736(param1:int, param2:int) : Boolean
      {
         if(param1 == -1 && param2 == -1)
         {
            return false;
         }
         return (param1 == -1 || this._7702.indexOf(param1) != -1) && (param2 == -1 || this._7693.indexOf(param2) != -1);
      }
      
      public function get _7959() : Object
      {
         return this._7955;
      }
      
      public function get _7936() : Boolean
      {
         return this._7930;
      }
      
      public function set _7936(param1:Boolean) : void
      {
         if(param1 == this._7930)
         {
            return;
         }
         if(param1)
         {
            this._7955 = {
               "updateDisplayListTimes":new Vector.<Number>(),
               "updateDisplayListRectangles":new Vector.<Rectangle>(),
               "updateDisplayListCellCounts":new Vector.<int>(),
               "measureTimes":new Vector.<Number>(),
               "layoutGridElementTimes":new Vector.<Number>()
            };
         }
         this._7930 = param1;
      }
   }
}

