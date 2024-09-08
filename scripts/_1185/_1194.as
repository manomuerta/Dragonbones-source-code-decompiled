package _1185
{
   import _1088._1093;
   import _1193._1192;
   import egret.core._1122;
   import egret.core._1137;
   import egret.core._1141;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class _1194 extends _1192
   {
      private var _8937:Number = NaN;
      
      private var _8945:Number = 6;
      
      private var _8940:Number = NaN;
      
      private var _8947:Number = 6;
      
      private var _7761:int = -1;
      
      private var _7687:int = 0;
      
      private var _7762:int = -1;
      
      private var _7698:int = 0;
      
      private var _8941:Number = NaN;
      
      private var _8949:Number = NaN;
      
      private var _8942:Number = NaN;
      
      private var _7752:Number = NaN;
      
      private var _padding:Number = 0;
      
      private var _8023:Number = NaN;
      
      private var _8022:Number = NaN;
      
      private var _8024:Number = NaN;
      
      private var _8021:Number = NaN;
      
      private var _8919:String = "justify";
      
      private var _7650:String = "justify";
      
      private var _8948:String = "left";
      
      private var _8953:String = "top";
      
      private var _orientation:String = "rows";
      
      private var _8944:Number = 0;
      
      private var _8921:Number = 0;
      
      private var startIndex:int = -1;
      
      private var endIndex:int = -1;
      
      private var _8916:Boolean = false;
      
      public function _1194()
      {
         super();
      }
      
      public function get _8946() : Number
      {
         return this._8945;
      }
      
      public function set _8946(param1:Number) : void
      {
         if(param1 == this._8945)
         {
            return;
         }
         this._8937 = param1;
         this._8945 = param1;
         this._8912();
         if(hasEventListener("gapChanged"))
         {
            dispatchEvent(new Event("gapChanged"));
         }
      }
      
      public function get _8950() : Number
      {
         return this._8947;
      }
      
      public function set _8950(param1:Number) : void
      {
         if(param1 == this._8947)
         {
            return;
         }
         this._8940 = param1;
         this._8947 = param1;
         this._8912();
         if(hasEventListener("gapChanged"))
         {
            dispatchEvent(new Event("gapChanged"));
         }
      }
      
      public function get _7560() : int
      {
         return this._7761;
      }
      
      public function get requestedColumnCount() : int
      {
         return this._7687;
      }
      
      public function set requestedColumnCount(param1:int) : void
      {
         if(this._7687 == param1)
         {
            return;
         }
         this._7687 = param1;
         this._7761 = param1;
         this._8912();
      }
      
      public function get _7573() : int
      {
         return this._7762;
      }
      
      public function get requestedRowCount() : int
      {
         return this._7698;
      }
      
      public function set requestedRowCount(param1:int) : void
      {
         if(this._7698 == param1)
         {
            return;
         }
         this._7698 = param1;
         this._7762 = param1;
         this._8912();
      }
      
      public function get _7994() : Number
      {
         return this._8949;
      }
      
      public function set _7994(param1:Number) : void
      {
         if(param1 == this._8949)
         {
            return;
         }
         this._8941 = param1;
         this._8949 = param1;
         this._8912();
      }
      
      public function get rowHeight() : Number
      {
         return this._7752;
      }
      
      public function set rowHeight(param1:Number) : void
      {
         if(param1 == this._7752)
         {
            return;
         }
         this._8942 = param1;
         this._7752 = param1;
         this._8912();
      }
      
      public function get padding() : Number
      {
         return this._padding;
      }
      
      public function set padding(param1:Number) : void
      {
         if(this._padding == param1)
         {
            return;
         }
         this._padding = param1;
         this._8912();
      }
      
      public function get _2419() : Number
      {
         return this._8023;
      }
      
      public function set _2419(param1:Number) : void
      {
         if(this._8023 == param1)
         {
            return;
         }
         this._8023 = param1;
         this._8912();
      }
      
      public function get _2416() : Number
      {
         return this._8022;
      }
      
      public function set _2416(param1:Number) : void
      {
         if(this._8022 == param1)
         {
            return;
         }
         this._8022 = param1;
         this._8912();
      }
      
      public function get _2420() : Number
      {
         return this._8024;
      }
      
      public function set _2420(param1:Number) : void
      {
         if(this._8024 == param1)
         {
            return;
         }
         this._8024 = param1;
         this._8912();
      }
      
      public function get _2410() : Number
      {
         return this._8021;
      }
      
      public function set _2410(param1:Number) : void
      {
         if(this._8021 == param1)
         {
            return;
         }
         this._8021 = param1;
         this._8912();
      }
      
      public function get _2401() : String
      {
         return this._8919;
      }
      
      public function set _2401(param1:String) : void
      {
         if(this._8919 == param1)
         {
            return;
         }
         this._8919 = param1;
         this._8912();
      }
      
      public function get verticalAlign() : String
      {
         return this._7650;
      }
      
      public function set verticalAlign(param1:String) : void
      {
         if(this._7650 == param1)
         {
            return;
         }
         this._7650 = param1;
         this._8912();
      }
      
      public function get _8911() : String
      {
         return this._8948;
      }
      
      public function set _8911(param1:String) : void
      {
         if(this._8948 == param1)
         {
            return;
         }
         this._8948 = param1;
         this._8912();
      }
      
      public function get _8932() : String
      {
         return this._8953;
      }
      
      public function set _8932(param1:String) : void
      {
         if(this._8953 == param1)
         {
            return;
         }
         this._8953 = param1;
         this._8912();
      }
      
      public function get orientation() : String
      {
         return this._orientation;
      }
      
      public function set orientation(param1:String) : void
      {
         if(this._orientation == param1)
         {
            return;
         }
         this._orientation = param1;
         this._8912();
         if(hasEventListener("orientationChanged"))
         {
            dispatchEvent(new Event("orientationChanged"));
         }
      }
      
      private function _8912() : void
      {
         if(target)
         {
            target.invalidateSize();
            target.invalidateDisplayList();
         }
      }
      
      override public function _7028() : void
      {
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         if(!target)
         {
            return;
         }
         var _loc1_:int = this._7761;
         var _loc2_:int = this._7762;
         var _loc3_:int = this._8949;
         var _loc4_:int = this._7752;
         var _loc5_:int = this._8945;
         var _loc6_:int = this._8947;
         var _loc7_:Number = 0;
         if(!_1141._8325(this))
         {
            _loc20_ = 0;
         }
         var _loc8_:Number = 0;
         if(!_1141._8325(this))
         {
            _loc21_ = 0;
         }
         this._8938(target.explicitWidth,target.explicitHeight);
         var _loc9_:int = this._7687 > 0 ? this._7687 : this._7761;
         var _loc10_:int = this._7698 > 0 ? this._7698 : this._7762;
         var _loc11_:Number = isNaN(this._8945) ? 0 : this._8945;
         var _loc12_:Number = isNaN(this._8947) ? 0 : this._8947;
         if(_loc9_ > 0)
         {
            _loc7_ = _loc9_ * (this._8949 + _loc11_) - _loc11_;
            if(!_1141._8325(this))
            {
               _loc20_ = this._7761 * (this._8949 + this._8945) - this._8945;
            }
         }
         if(_loc10_ > 0)
         {
            _loc8_ = _loc10_ * (this._7752 + _loc12_) - _loc12_;
            if(!_1141._8325(this))
            {
               _loc21_ = this._7762 * (this._7752 + this._8947) - this._8947;
            }
         }
         var _loc13_:Number = isNaN(this._padding) ? 0 : this._padding;
         var _loc14_:Number = isNaN(this._8023) ? _loc13_ : this._8023;
         var _loc15_:Number = isNaN(this._8022) ? _loc13_ : this._8022;
         var _loc16_:Number = isNaN(this._8024) ? _loc13_ : this._8024;
         var _loc17_:Number = isNaN(this._8021) ? _loc13_ : this._8021;
         var _loc18_:Number = _loc14_ + _loc15_;
         _loc19_ = _loc16_ + _loc17_;
         target.measuredWidth = Math.ceil(_loc7_ + _loc18_);
         target.measuredHeight = Math.ceil(_loc8_ + _loc19_);
         this._7761 = _loc1_;
         this._7762 = _loc2_;
         this._8945 = _loc5_;
         this._8947 = _loc6_;
         this._8949 = _loc3_;
         this._7752 = _loc4_;
      }
      
      override public function _8090(param1:int, param2:uint) : int
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc9_:Rectangle = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         if(!target || target._2249 < 1)
         {
            return -1;
         }
         var _loc3_:int = target._2249 - 1;
         if(param1 == -1)
         {
            if(param2 == _1137.UP || param2 == _1137.LEFT)
            {
               return -1;
            }
            if(param2 == _1137.DOWN || param2 == _1137.RIGHT)
            {
               return 0;
            }
         }
         var _loc4_:* = this.orientation == _1195.ROWS;
         param1 = Math.max(0,Math.min(_loc3_,param1));
         if(_loc4_)
         {
            if(this._7560 == 0 || this.rowHeight + this._8950 == 0)
            {
               return param1;
            }
            _loc5_ = param1 / this._7560;
            _loc6_ = param1 - _loc5_ * this._7560;
         }
         else
         {
            if(this._7573 == 0 || this._7994 + this._8946 == 0)
            {
               return param1;
            }
            _loc6_ = param1 / this._7573;
            _loc5_ = param1 - _loc6_ * this._7573;
         }
         var _loc7_:int = _loc5_;
         var _loc8_:int = _loc6_;
         switch(param2)
         {
            case _1137.LEFT:
               if(_loc8_ == 0 && _loc4_ && _loc7_ > 0)
               {
                  _loc7_--;
                  _loc8_ = this._7560 - 1;
               }
               else
               {
                  _loc8_--;
               }
               break;
            case _1137.RIGHT:
               if(_loc8_ == this._7560 - 1 && _loc4_ && _loc7_ < this._7573 - 1)
               {
                  _loc8_ = 0;
                  _loc7_++;
               }
               else
               {
                  _loc8_++;
               }
               break;
            case _1137.UP:
               if(_loc7_ == 0 && !_loc4_ && _loc8_ > 0)
               {
                  _loc8_--;
                  _loc7_ = this._7573 - 1;
               }
               else
               {
                  _loc7_--;
               }
               break;
            case _1137.DOWN:
               if(_loc7_ == this._7573 - 1 && !_loc4_ && _loc8_ < this._7560 - 1)
               {
                  _loc8_++;
                  _loc7_ = 0;
               }
               else
               {
                  _loc7_++;
               }
               break;
            case _1137.PAGE_UP:
            case _1137.PAGE_DOWN:
               _loc9_ = _8929();
               if(!_loc9_)
               {
                  _loc9_ = new Rectangle(0,0,target.contentWidth,target.contentHeight);
               }
               if(_loc4_)
               {
                  _loc10_ = Math.ceil(_loc9_.top / (this.rowHeight + this._8950));
                  _loc11_ = Math.floor(_loc9_.bottom / (this.rowHeight + this._8950));
                  if(param2 == _1137.PAGE_UP)
                  {
                     if(_loc10_ < _loc5_ && _loc5_ <= _loc11_)
                     {
                        _loc7_ = _loc10_;
                     }
                     else
                     {
                        _loc7_ = 2 * _loc10_ - _loc11_;
                     }
                  }
                  else if(_loc10_ <= _loc5_ && _loc5_ < _loc11_)
                  {
                     _loc7_ = _loc11_;
                  }
                  else
                  {
                     _loc7_ = 2 * _loc11_ - _loc10_;
                  }
               }
               else
               {
                  _loc12_ = Math.ceil(_loc9_.left / (this._7994 + this._8946));
                  _loc13_ = Math.floor(_loc9_.right / (this._7994 + this._8946));
                  if(param2 == _1137.PAGE_UP)
                  {
                     if(_loc12_ < _loc6_ && _loc6_ <= _loc13_)
                     {
                        _loc8_ = _loc12_;
                     }
                     else
                     {
                        _loc8_ = 2 * _loc12_ - _loc13_;
                     }
                  }
                  else if(_loc12_ <= _loc6_ && _loc6_ < _loc13_)
                  {
                     _loc8_ = _loc13_;
                  }
                  else
                  {
                     _loc8_ = 2 * _loc13_ - _loc12_;
                  }
               }
               break;
            default:
               return super._8090(param1,param2);
         }
         _loc7_ = Math.max(0,Math.min(this._7573 - 1,_loc7_));
         _loc8_ = Math.max(0,Math.min(this._7560 - 1,_loc8_));
         if(_loc4_)
         {
            if(_loc7_ == this._7573 - 1)
            {
               if(param1 == _loc3_ && _loc8_ > _loc6_)
               {
                  _loc8_ = _loc6_;
               }
               if(_loc8_ > _loc3_ - this._7560 * (this._7573 - 1))
               {
                  _loc7_--;
               }
            }
            return _loc7_ * this._7560 + _loc8_;
         }
         if(_loc8_ == this._7560 - 1)
         {
            if(param1 == _loc3_ && _loc7_ > _loc5_)
            {
               _loc7_ = _loc5_;
            }
            if(_loc7_ > _loc3_ - this._7573 * (this._7560 - 1))
            {
               _loc8_--;
            }
         }
         return _loc8_ * this._7573 + _loc7_;
      }
      
      private function _8938(param1:Number, param2:Number) : void
      {
         var _loc18_:_1122 = null;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc3_:Number = isNaN(this._8945) ? 0 : this._8945;
         var _loc4_:Number = isNaN(this._8947) ? 0 : this._8947;
         this._7762 = this._7761 = -1;
         var _loc5_:int;
         var _loc6_:int = _loc5_ = target._2249;
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc18_ = target.getElementAt(_loc7_) as _1122;
            if((Boolean(_loc18_)) && !_loc18_.includeInLayout)
            {
               _loc5_--;
            }
            _loc7_++;
         }
         if(_loc5_ == 0)
         {
            this._7762 = this._7761 = 0;
            return;
         }
         if(isNaN(this._8941) || isNaN(this._8942))
         {
            this._8939();
         }
         if(isNaN(this._8941))
         {
            this._8949 = this._8944;
         }
         else
         {
            this._8949 = this._8941;
         }
         if(isNaN(this._8942))
         {
            this._7752 = this._8921;
         }
         else
         {
            this._7752 = this._8942;
         }
         var _loc8_:Number = this._8949 + _loc3_;
         if(_loc8_ <= 0)
         {
            _loc8_ = 1;
         }
         var _loc9_:Number = this._7752 + _loc4_;
         if(_loc9_ <= 0)
         {
            _loc9_ = 1;
         }
         var _loc10_:* = this.orientation == _1195.COLUMNS;
         var _loc11_:* = !isNaN(param1);
         var _loc12_:* = !isNaN(param2);
         var _loc13_:Number = isNaN(this._padding) ? 0 : this._padding;
         var _loc14_:Number = isNaN(this._8023) ? _loc13_ : this._8023;
         var _loc15_:Number = isNaN(this._8022) ? _loc13_ : this._8022;
         var _loc16_:Number = isNaN(this._8024) ? _loc13_ : this._8024;
         var _loc17_:Number = isNaN(this._8021) ? _loc13_ : this._8021;
         if(this._7687 > 0 || this._7698 > 0)
         {
            if(this._7698 > 0)
            {
               this._7762 = Math.min(this._7698,_loc5_);
            }
            if(this._7687 > 0)
            {
               this._7761 = Math.min(this._7687,_loc5_);
            }
         }
         else if(!_loc11_ && !_loc12_)
         {
            _loc19_ = Math.sqrt(_loc5_ * _loc8_ * _loc9_);
            if(_loc10_)
            {
               this._7762 = Math.max(1,Math.round(_loc19_ / _loc9_));
            }
            else
            {
               this._7761 = Math.max(1,Math.round(_loc19_ / _loc8_));
            }
         }
         else if(_loc11_ && (!_loc12_ || !_loc10_))
         {
            _loc20_ = Math.max(0,param1 - _loc14_ - _loc15_);
            this._7761 = Math.floor((_loc20_ + _loc3_) / _loc8_);
            this._7761 = Math.max(1,Math.min(this._7761,_loc5_));
         }
         else
         {
            _loc21_ = Math.max(0,param2 - _loc16_ - _loc17_);
            this._7762 = Math.floor((_loc21_ + _loc4_) / _loc9_);
            this._7762 = Math.max(1,Math.min(this._7762,_loc5_));
         }
         if(this._7762 == -1)
         {
            this._7762 = Math.max(1,Math.ceil(_loc5_ / this._7761));
         }
         if(this._7761 == -1)
         {
            this._7761 = Math.max(1,Math.ceil(_loc5_ / this._7762));
         }
         if(this._7687 > 0 && this._7698 > 0)
         {
            if(this.orientation == _1195.ROWS)
            {
               this._7762 = Math.max(1,Math.ceil(_loc5_ / this._7687));
            }
            else
            {
               this._7761 = Math.max(1,Math.ceil(_loc5_ / this._7698));
            }
         }
      }
      
      private function _8939() : void
      {
         if(!target)
         {
            return;
         }
         if(_6056)
         {
            this._8934();
         }
         else
         {
            this._8935();
         }
      }
      
      private function _8934() : void
      {
         var _loc3_:int = 0;
         var _loc4_:_1122 = null;
         var _loc1_:Number = !!_7607 ? _7607.height : 22;
         var _loc2_:Number = !!_7607 ? _7607.width : 22;
         this._8944 = Math.max(this._8944,_loc2_);
         this._8921 = Math.max(this._8921,_loc1_);
         if(this.startIndex != -1 && this.endIndex != -1)
         {
            _loc3_ = this.startIndex;
            while(_loc3_ <= this.endIndex)
            {
               _loc4_ = target._7596(_loc3_) as _1122;
               if(!(!_loc4_ || !_loc4_.includeInLayout))
               {
                  this._8944 = Math.max(this._8944,_loc4_.preferredWidth);
                  this._8921 = Math.max(this._8921,_loc4_.preferredHeight);
               }
               _loc3_++;
            }
         }
      }
      
      private function _8935() : void
      {
         var _loc3_:_1122 = null;
         var _loc1_:int = target._2249;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = target.getElementAt(_loc2_) as _1122;
            if(!(!_loc3_ || !_loc3_.includeInLayout))
            {
               this._8944 = Math.max(this._8944,_loc3_.preferredWidth);
               this._8921 = Math.max(this._8921,_loc3_.preferredHeight);
            }
            _loc2_++;
         }
      }
      
      override public function _7479() : void
      {
         super._7479();
         this._8944 = 0;
         this._8921 = 0;
      }
      
      override protected function _7839() : void
      {
         var _loc1_:Boolean = false;
         super._7839();
         if(_6056)
         {
            _loc1_ = this._8927();
            if(_loc1_)
            {
               this._8916 = true;
               target.invalidateDisplayList();
            }
         }
      }
      
      private function _8927() : Boolean
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         if(!target || target._2249 == 0)
         {
            this.startIndex = this.endIndex = -1;
            return false;
         }
         var _loc1_:int = target._2249;
         if(!_6056)
         {
            this.startIndex = 0;
            this.endIndex = _loc1_ - 1;
            return false;
         }
         if(isNaN(target.width) || target.width == 0 || isNaN(target.height) || target.height == 0)
         {
            this.startIndex = this.endIndex = -1;
            return false;
         }
         var _loc2_:int = this.startIndex;
         var _loc3_:int = this.endIndex;
         var _loc4_:Number = isNaN(this._padding) ? 0 : this._padding;
         var _loc5_:Number = isNaN(this._8023) ? _loc4_ : this._8023;
         var _loc6_:Number = isNaN(this._8024) ? _loc4_ : this._8024;
         var _loc7_:Number = isNaN(this._8945) ? 0 : this._8945;
         var _loc8_:Number = isNaN(this._8947) ? 0 : this._8947;
         if(this.orientation == _1195.COLUMNS)
         {
            _loc9_ = this._8949 + _loc7_;
            if(_loc9_ <= 0)
            {
               this.startIndex = 0;
               this.endIndex = _loc1_ - 1;
               return false;
            }
            _loc10_ = target.horizontalScrollPosition;
            _loc11_ = target.horizontalScrollPosition + target.width;
            _loc12_ = Math.floor((_loc10_ - _loc5_) / _loc9_);
            if(_loc12_ < 0)
            {
               _loc12_ = 0;
            }
            _loc13_ = Math.ceil((_loc11_ - _loc5_) / _loc9_);
            if(_loc13_ < 0)
            {
               _loc13_ = 0;
            }
            this.startIndex = Math.min(_loc1_ - 1,Math.max(0,_loc12_ * this._7762));
            this.endIndex = Math.min(_loc1_ - 1,Math.max(0,_loc13_ * this._7762 - 1));
         }
         else
         {
            _loc14_ = this._7752 + _loc8_;
            if(_loc14_ <= 0)
            {
               this.startIndex = 0;
               this.endIndex = _loc1_ - 1;
               return false;
            }
            _loc15_ = target.verticalScrollPosition;
            _loc16_ = target.verticalScrollPosition + target.height;
            _loc17_ = Math.floor((_loc15_ - _loc6_) / _loc14_);
            if(_loc17_ < 0)
            {
               _loc17_ = 0;
            }
            _loc18_ = Math.ceil((_loc16_ - _loc6_) / _loc14_);
            if(_loc18_ < 0)
            {
               _loc18_ = 0;
            }
            this.startIndex = Math.min(_loc1_ - 1,Math.max(0,_loc17_ * this._7761));
            this.endIndex = Math.min(_loc1_ - 1,Math.max(0,_loc18_ * this._7761 - 1));
         }
         return this.startIndex != _loc2_ || this.endIndex != _loc3_;
      }
      
      override public function _5823(param1:Number, param2:Number) : void
      {
         var _loc8_:_1122 = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         super._5823(param1,param2);
         if(!target)
         {
            return;
         }
         var _loc3_:Number = isNaN(this._padding) ? 0 : this._padding;
         var _loc4_:Number = isNaN(this._8023) ? _loc3_ : this._8023;
         var _loc5_:Number = isNaN(this._8022) ? _loc3_ : this._8022;
         var _loc6_:Number = isNaN(this._8024) ? _loc3_ : this._8024;
         var _loc7_:Number = isNaN(this._8021) ? _loc3_ : this._8021;
         if(this._8916)
         {
            this._8916 = false;
         }
         else
         {
            this._8938(param1,param2);
            if(this._7762 == 0 || this._7761 == 0)
            {
               target._7729(_loc4_ + _loc5_,_loc6_ + _loc7_);
               return;
            }
            this._8943(param1,param2);
            this._8927();
         }
         if(_6056)
         {
            this._8938(param1,param2);
            this._8943(param1,param2);
         }
         if(this.startIndex == -1 || this.endIndex == -1)
         {
            target._7729(0,0);
            return;
         }
         target._7577(this.startIndex,this.endIndex);
         var _loc13_:* = this.orientation == _1195.COLUMNS;
         var _loc14_:int = this.startIndex;
         var _loc15_:Number = isNaN(this._8945) ? 0 : this._8945;
         var _loc16_:Number = isNaN(this._8947) ? 0 : this._8947;
         var _loc17_:int = this.startIndex;
         while(_loc17_ <= this.endIndex)
         {
            if(_6056)
            {
               _loc8_ = target._7596(_loc17_) as _1122;
            }
            else
            {
               _loc8_ = target.getElementAt(_loc17_) as _1122;
            }
            if(!(_loc8_ == null || !_loc8_.includeInLayout))
            {
               if(_loc13_)
               {
                  _loc11_ = Math.ceil((_loc14_ + 1) / this._7762) - 1;
                  _loc12_ = Math.ceil((_loc14_ + 1) % this._7762) - 1;
                  if(_loc12_ == -1)
                  {
                     _loc12_ = this._7762 - 1;
                  }
               }
               else
               {
                  _loc11_ = Math.ceil((_loc14_ + 1) % this._7761) - 1;
                  if(_loc11_ == -1)
                  {
                     _loc11_ = this._7761 - 1;
                  }
                  _loc12_ = Math.ceil((_loc14_ + 1) / this._7761) - 1;
               }
               _loc9_ = _loc11_ * (this._8949 + _loc15_) + _loc4_;
               _loc10_ = _loc12_ * (this._7752 + _loc16_) + _loc6_;
               this._8936(_loc8_,_loc9_,_loc10_,this._8949,this.rowHeight);
               _loc14_++;
            }
            _loc17_++;
         }
         var _loc18_:Number = _loc4_ + _loc5_;
         var _loc19_:Number = _loc6_ + _loc7_;
         var _loc20_:Number = (this._8949 + _loc15_) * this._7761 - _loc15_;
         var _loc21_:Number = (this._7752 + _loc16_) * this._7762 - _loc16_;
         target._7729(Math.ceil(_loc20_ + _loc18_),Math.ceil(_loc21_ + _loc19_));
      }
      
      override public function _7988(param1:int) : Rectangle
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(!_6056)
         {
            return super._7988(param1);
         }
         var _loc2_:_1093 = _1093(target);
         if(!_loc2_ || param1 < 0 || param1 >= _loc2_._2249)
         {
            return null;
         }
         if(this.orientation == _1195.ROWS)
         {
            _loc3_ = param1 % this._7761;
            _loc4_ = param1 / this._7761;
         }
         else
         {
            _loc3_ = param1 / this._7762;
            _loc4_ = param1 % this._7762;
         }
         return new Rectangle(this._8954(_loc3_),this._8955(_loc4_),this._8949,this._7752);
      }
      
      private function _8936(param1:_1122, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(this._2401 == _1188.JUSTIFY)
         {
            _loc6_ = param4;
         }
         else if(!isNaN(param1.percentWidth))
         {
            _loc6_ = param4 * param1.percentWidth * 0.01;
         }
         if(this.verticalAlign == _1196.JUSTIFY)
         {
            _loc7_ = param5;
         }
         else if(!isNaN(param1.percentHeight))
         {
            _loc7_ = param5 * param1.percentHeight * 0.01;
         }
         if(!_1141._8325(this))
         {
            _loc10_ = Math.min(param1._8506(),param4);
            _loc11_ = Math.min(param1._8505(),param5);
            _loc6_ = Math.max(param1._8490(),Math.min(_loc10_,_loc6_));
            _loc7_ = Math.max(param1._8487(),Math.min(_loc11_,_loc7_));
         }
         param1._7599(Math.round(_loc6_),Math.round(_loc7_));
         var _loc8_:Number = param2;
         switch(this._2401)
         {
            case _1188.RIGHT:
               _loc8_ += param4 - param1.layoutBoundsWidth;
               break;
            case _1188.CENTER:
               _loc8_ = param2 + (param4 - param1.layoutBoundsWidth) / 2;
         }
         var _loc9_:Number = param3;
         switch(this.verticalAlign)
         {
            case _1196.BOTTOM:
               _loc9_ += param5 - param1.layoutBoundsHeight;
               break;
            case _1196.MIDDLE:
               _loc9_ += (param5 - param1.layoutBoundsHeight) / 2;
         }
         param1._7777(Math.round(_loc8_),Math.round(_loc9_));
      }
      
      private function _8943(param1:Number, param2:Number) : void
      {
         var _loc14_:int = 0;
         var _loc3_:Number = isNaN(this._padding) ? 0 : this._padding;
         var _loc4_:Number = isNaN(this._8023) ? _loc3_ : this._8023;
         var _loc5_:Number = isNaN(this._8022) ? _loc3_ : this._8022;
         var _loc6_:Number = isNaN(this._8024) ? _loc3_ : this._8024;
         var _loc7_:Number = isNaN(this._8021) ? _loc3_ : this._8021;
         var _loc8_:Number = Math.max(0,param1 - _loc4_ - _loc5_);
         var _loc9_:Number = Math.max(0,param2 - _loc6_ - _loc7_);
         if(!isNaN(this._8940))
         {
            this._8947 = this._8940;
         }
         if(!isNaN(this._8937))
         {
            this._8945 = this._8937;
         }
         this._8947 = isNaN(this._8947) ? 0 : this._8947;
         this._8945 = isNaN(this._8945) ? 0 : this._8945;
         var _loc10_:Number = this._8949 + this._8945;
         if(_loc10_ <= 0)
         {
            _loc10_ = 1;
         }
         var _loc11_:Number = this._7752 + this._8947;
         if(_loc11_ <= 0)
         {
            _loc11_ = 1;
         }
         var _loc12_:Number = _loc9_ - this._7752 * this._7762;
         var _loc13_:Number = _loc8_ - this._8949 * this._7761;
         if(_loc12_ > 0)
         {
            if(this._8932 == _1190.JUSTIFY_USING_GAP)
            {
               _loc14_ = Math.max(1,this._7762 - 1);
               this._8947 = _loc12_ / _loc14_;
            }
            else if(this._8932 == _1190.JUSTIFY_USING_HEIGHT)
            {
               if(this._7762 > 0)
               {
                  this._7752 += (_loc12_ - (this._7762 - 1) * this._8947) / this._7762;
               }
            }
         }
         if(_loc13_ > 0)
         {
            if(this._8911 == _1187.JUSTIFY_USING_GAP)
            {
               _loc14_ = Math.max(1,this._7761 - 1);
               this._8945 = _loc13_ / _loc14_;
            }
            else if(this._8911 == _1187.JUSTIFY_USING_WIDTH)
            {
               if(this._7761 > 0)
               {
                  this._8949 += (_loc13_ - (this._7761 - 1) * this._8945) / this._7761;
               }
            }
         }
      }
      
      override protected function _7923(param1:Rectangle) : Rectangle
      {
         var _loc7_:int = 0;
         var _loc2_:Rectangle = new Rectangle();
         var _loc3_:Number = isNaN(this._padding) ? 0 : this._padding;
         var _loc4_:Number = isNaN(this._8023) ? _loc3_ : this._8023;
         var _loc5_:Number = isNaN(this._8022) ? _loc3_ : this._8022;
         var _loc6_:Number = isNaN(this._8945) ? 0 : this._8945;
         if(param1.left > target.contentWidth - _loc5_)
         {
            _loc2_.left = target.contentWidth - _loc5_;
            _loc2_.right = target.contentWidth;
         }
         else if(param1.left > _loc4_)
         {
            _loc7_ = Math.floor((param1.left - 1 - _loc4_) / (this._8949 + _loc6_));
            _loc2_.left = this._8954(_loc7_);
            _loc2_.right = this._8952(_loc7_);
         }
         else
         {
            _loc2_.left = 0;
            _loc2_.right = _loc4_;
         }
         return _loc2_;
      }
      
      override protected function _7922(param1:Rectangle) : Rectangle
      {
         var _loc7_:int = 0;
         var _loc2_:Number = isNaN(this._padding) ? 0 : this._padding;
         var _loc3_:Number = isNaN(this._8023) ? _loc2_ : this._8023;
         var _loc4_:Number = isNaN(this._8022) ? _loc2_ : this._8022;
         var _loc5_:Number = isNaN(this._8945) ? 0 : this._8945;
         var _loc6_:Rectangle = new Rectangle();
         if(param1.right < _loc3_)
         {
            _loc6_.left = 0;
            _loc6_.right = _loc3_;
         }
         else if(param1.right < target.contentWidth - _loc4_)
         {
            _loc7_ = Math.floor((param1.right + 1 + _loc5_ - _loc3_) / (this._8949 + _loc5_));
            _loc6_.left = this._8954(_loc7_);
            _loc6_.right = this._8952(_loc7_);
         }
         else
         {
            _loc6_.left = target.contentWidth - _loc4_;
            _loc6_.right = target.contentWidth;
         }
         return _loc6_;
      }
      
      override protected function _7926(param1:Rectangle) : Rectangle
      {
         var _loc7_:int = 0;
         var _loc2_:Number = isNaN(this._padding) ? 0 : this._padding;
         var _loc3_:Number = isNaN(this._8024) ? _loc2_ : this._8024;
         var _loc4_:Number = isNaN(this._8021) ? _loc2_ : this._8021;
         var _loc5_:Number = isNaN(this._8947) ? 0 : this._8947;
         var _loc6_:Rectangle = new Rectangle();
         if(param1.top > target.contentHeight - _loc4_)
         {
            _loc6_.top = target.contentHeight - _loc4_;
            _loc6_.bottom = target.contentHeight;
         }
         else if(param1.top > _loc3_)
         {
            _loc7_ = Math.floor((param1.top - 1 - _loc3_) / (this._7752 + _loc5_));
            _loc6_.top = this._8955(_loc7_);
            _loc6_.bottom = this._8951(_loc7_);
         }
         else
         {
            _loc6_.top = 0;
            _loc6_.bottom = _loc3_;
         }
         return _loc6_;
      }
      
      override protected function _7925(param1:Rectangle) : Rectangle
      {
         var _loc7_:int = 0;
         var _loc2_:Number = isNaN(this._padding) ? 0 : this._padding;
         var _loc3_:Number = isNaN(this._8024) ? _loc2_ : this._8024;
         var _loc4_:Number = isNaN(this._8021) ? _loc2_ : this._8021;
         var _loc5_:Number = isNaN(this._8947) ? 0 : this._8947;
         var _loc6_:Rectangle = new Rectangle();
         if(param1.bottom < _loc3_)
         {
            _loc6_.top = 0;
            _loc6_.bottom = _loc3_;
         }
         else if(param1.bottom < target.contentHeight - _loc4_)
         {
            _loc7_ = Math.floor((param1.bottom + 1 + _loc5_ - _loc3_) / (this._7752 + _loc5_));
            _loc6_.top = this._8955(_loc7_);
            _loc6_.bottom = this._8951(_loc7_);
         }
         else
         {
            _loc6_.top = target.contentHeight - _loc4_;
            _loc6_.bottom = target.contentHeight;
         }
         return _loc6_;
      }
      
      private function _8954(param1:int) : Number
      {
         if(param1 < 0)
         {
            return 0;
         }
         var _loc2_:Number = isNaN(this._padding) ? 0 : this._padding;
         var _loc3_:Number = isNaN(this._8023) ? _loc2_ : this._8023;
         var _loc4_:Number = isNaN(this._8945) ? 0 : this._8945;
         return Math.max(0,param1 * (this._8949 + _loc4_)) + _loc3_;
      }
      
      private function _8952(param1:int) : Number
      {
         if(param1 < 0)
         {
            return 0;
         }
         var _loc2_:Number = isNaN(this._padding) ? 0 : this._padding;
         var _loc3_:Number = isNaN(this._8023) ? _loc2_ : this._8023;
         var _loc4_:Number = isNaN(this._8945) ? 0 : this._8945;
         return Math.min(target.contentWidth,param1 * (this._8949 + _loc4_) + this._8949) + _loc3_;
      }
      
      final private function _8955(param1:int) : Number
      {
         if(param1 < 0)
         {
            return 0;
         }
         var _loc2_:Number = isNaN(this._padding) ? 0 : this._padding;
         var _loc3_:Number = isNaN(this._8024) ? _loc2_ : this._8024;
         var _loc4_:Number = isNaN(this._8947) ? 0 : this._8947;
         return Math.max(0,param1 * (this._7752 + _loc4_)) + _loc3_;
      }
      
      final private function _8951(param1:int) : Number
      {
         if(param1 < 0)
         {
            return 0;
         }
         var _loc2_:Number = isNaN(this._padding) ? 0 : this._padding;
         var _loc3_:Number = isNaN(this._8024) ? _loc2_ : this._8024;
         var _loc4_:Number = isNaN(this._8947) ? 0 : this._8947;
         return Math.min(target.contentHeight,param1 * (this._7752 + _loc4_) + this._7752) + _loc3_;
      }
   }
}

