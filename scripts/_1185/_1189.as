package _1185
{
   import _1088._1093;
   import _1193._1192;
   import egret.core._1122;
   import egret.core._1133;
   import egret.core._1137;
   import egret.core._1141;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class _1189 extends _1192
   {
      private static var _8928:Dictionary = new Dictionary(true);
      
      private var _8919:String = "left";
      
      private var _7650:String = "top";
      
      private var _7007:Number = 6;
      
      private var _padding:Number = 0;
      
      private var _8023:Number = NaN;
      
      private var _8022:Number = NaN;
      
      private var _8024:Number = NaN;
      
      private var _8021:Number = NaN;
      
      private var _8920:Array;
      
      private var startIndex:int = -1;
      
      private var endIndex:int = -1;
      
      private var _8916:Boolean = false;
      
      private var _8921:Number = 0;
      
      public function _1189()
      {
         this._8920 = [];
         super();
      }
      
      public static function _8913(param1:Number, param2:Number, param3:Number, param4:Array) : void
      {
         var _loc6_:Boolean = false;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         var _loc10_:ChildInfo = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc5_:int = int(param4.length);
         do
         {
            _loc6_ = true;
            _loc7_ = param2 - param1 * param3 / 100;
            if(_loc7_ > 0)
            {
               param2 -= _loc7_;
            }
            else
            {
               _loc7_ = 0;
            }
            _loc8_ = param2 / param3;
            _loc9_ = 0;
            while(_loc9_ < _loc5_)
            {
               _loc10_ = param4[_loc9_];
               if((_loc11_ = _loc10_.percent * _loc8_) < _loc10_.min)
               {
                  _loc12_ = _loc10_.min;
                  _loc10_.size = _loc12_;
                  param4[_loc9_] = param4[--_loc5_];
                  param4[_loc5_] = _loc10_;
                  param3 -= _loc10_.percent;
                  if(_loc7_ >= _loc12_)
                  {
                     _loc7_ -= _loc12_;
                  }
                  else
                  {
                     param2 -= _loc12_ - _loc7_;
                     _loc7_ = 0;
                  }
                  _loc6_ = false;
                  break;
               }
               if(_loc11_ > _loc10_.max)
               {
                  _loc13_ = _loc10_.max;
                  _loc10_.size = _loc13_;
                  param4[_loc9_] = param4[--_loc5_];
                  param4[_loc5_] = _loc10_;
                  param3 -= _loc10_.percent;
                  if(_loc7_ >= _loc13_)
                  {
                     _loc7_ -= _loc13_;
                  }
                  else
                  {
                     param2 -= _loc13_ - _loc7_;
                     _loc7_ = 0;
                  }
                  _loc6_ = false;
                  break;
               }
               _loc10_.size = _loc11_;
               _loc9_++;
            }
         }
         while(!_loc6_);
         
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
         if(target)
         {
            target.invalidateDisplayList();
         }
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
         if(target)
         {
            target.invalidateDisplayList();
         }
      }
      
      public function get gap() : Number
      {
         return this._7007;
      }
      
      public function set gap(param1:Number) : void
      {
         if(this._7007 == param1)
         {
            return;
         }
         this._7007 = param1;
         this._8912();
         if(hasEventListener("gapChanged"))
         {
            dispatchEvent(new Event("gapChanged"));
         }
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
         super._7028();
         if(!target)
         {
            return;
         }
         if(_6056)
         {
            this._8926();
         }
         else
         {
            this._8930();
         }
      }
      
      private function _8926() : void
      {
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc15_:_1122 = null;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc1_:int = target._2249;
         var _loc2_:Number = !!_7607 ? _7607.height : 22;
         var _loc3_:Number = !!_7607 ? _7607.width : 71;
         var _loc4_:Number = this._8918();
         var _loc5_:Number = Math.max(this._8921,_loc2_);
         var _loc6_:Vector.<int> = target._7581();
         for each(_loc7_ in _loc6_)
         {
            _loc15_ = target.getElementAt(_loc7_) as _1122;
            if(!(_loc15_ == null || !_loc15_.includeInLayout))
            {
               _loc16_ = _loc15_.preferredWidth;
               _loc17_ = _loc15_.preferredHeight;
               _loc4_ += _loc16_;
               _loc4_ = _loc4_ += _loc16_ - (isNaN(this._8920[_loc7_]) ? _loc3_ : this._8920[_loc7_]);
               _loc5_ = Math.max(_loc5_,_loc17_);
            }
         }
         _loc8_ = isNaN(this._padding) ? 0 : this._padding;
         var _loc9_:Number = isNaN(this._8023) ? _loc8_ : this._8023;
         var _loc10_:Number = isNaN(this._8022) ? _loc8_ : this._8022;
         var _loc11_:Number = isNaN(this._8024) ? _loc8_ : this._8024;
         var _loc12_:Number = isNaN(this._8021) ? _loc8_ : this._8021;
         var _loc13_:Number = _loc9_ + _loc10_;
         var _loc14_:Number = _loc11_ + _loc12_;
         target.measuredWidth = Math.ceil(_loc4_ + _loc13_);
         target.measuredHeight = Math.ceil(_loc5_ + _loc14_);
         if(!_1141._8325(this))
         {
            target._7983 = Math.ceil(target.measuredWidth);
            target._7980 = this.verticalAlign == _1196.JUSTIFY ? _loc14_ : target.measuredHeight;
         }
      }
      
      private function _8930() : void
      {
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:_1122 = null;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc1_:SizesAndLimit = new SizesAndLimit();
         var _loc2_:* = this.verticalAlign == _1196.JUSTIFY;
         var _loc3_:int = target._2249;
         var _loc4_:int = _loc3_;
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         if(!_1141._8325(this))
         {
            _loc16_ = 0;
            _loc17_ = 0;
         }
         var _loc7_:int = 0;
         while(_loc7_ < _loc3_)
         {
            _loc18_ = target.getElementAt(_loc7_) as _1122;
            if(!_loc18_ || !_loc18_.includeInLayout)
            {
               _loc4_--;
            }
            else if(_1141._8325(this))
            {
               _loc19_ = _loc18_.preferredWidth;
               _loc20_ = _loc18_.preferredHeight;
               _loc5_ += _loc19_;
               _loc6_ = Math.max(_loc6_,_loc20_);
            }
            else
            {
               this._8924(_loc18_,NaN,_loc1_);
               _loc19_ = _loc1_.preferredSize;
               _loc5_ += _loc19_;
               _loc17_ += _loc1_.minSize;
               this._8922(_loc18_,_loc2_,_loc1_);
               _loc20_ = _loc1_.preferredSize;
               _loc6_ = Math.max(_loc6_,_loc20_);
               _loc16_ = Math.max(_loc16_,_loc1_.minSize);
            }
            _loc7_++;
         }
         var _loc8_:Number = isNaN(this._7007) ? 0 : this._7007;
         _loc5_ += (_loc4_ - 1) * _loc8_;
         if(!_1141._8325(this))
         {
            _loc17_ += (_loc4_ - 1) * _loc8_;
         }
         var _loc9_:Number = isNaN(this._padding) ? 0 : this._padding;
         var _loc10_:Number = isNaN(this._8023) ? _loc9_ : this._8023;
         var _loc11_:Number = isNaN(this._8022) ? _loc9_ : this._8022;
         var _loc12_:Number = isNaN(this._8024) ? _loc9_ : this._8024;
         var _loc13_:Number = isNaN(this._8021) ? _loc9_ : this._8021;
         var _loc14_:Number = _loc10_ + _loc11_;
         _loc15_ = _loc12_ + _loc13_;
         target.measuredWidth = Math.ceil(_loc5_ + _loc14_);
         target.measuredHeight = Math.ceil(_loc6_ + _loc15_);
         if(!_1141._8325(this))
         {
            target._7980 = Math.ceil(_loc16_ + _loc15_);
            target._7983 = Math.ceil(_loc17_ + _loc14_);
         }
      }
      
      override public function _5823(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         super._5823(param1,param2);
         if(!target)
         {
            return;
         }
         if(target._2249 == 0)
         {
            _loc3_ = isNaN(this._padding) ? 0 : this._padding;
            _loc4_ = isNaN(this._8023) ? _loc3_ : this._8023;
            _loc5_ = isNaN(this._8022) ? _loc3_ : this._8022;
            _loc6_ = isNaN(this._8024) ? _loc3_ : this._8024;
            _loc7_ = isNaN(this._8021) ? _loc3_ : this._8021;
            target._7729(Math.ceil(_loc4_ + _loc5_),Math.ceil(_loc6_ + _loc7_));
            return;
         }
         if(_6056)
         {
            this._8914(param1,param2);
         }
         else
         {
            this._8917(param1,param2);
         }
      }
      
      override public function _8090(param1:int, param2:uint) : int
      {
         var _loc4_:int = 0;
         var _loc5_:Rectangle = null;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         if(!target || target._2249 < 1)
         {
            return -1;
         }
         var _loc3_:int = target._2249 - 1;
         if(param1 == -1)
         {
            if(param2 == _1137.LEFT)
            {
               return -1;
            }
            if(param2 == _1137.RIGHT)
            {
               return 0;
            }
         }
         param1 = Math.max(0,Math.min(_loc3_,param1));
         switch(param2)
         {
            case _1137.LEFT:
               _loc4_ = param1 - 1;
               break;
            case _1137.RIGHT:
               _loc4_ = param1 + 1;
               break;
            case _1137.PAGE_UP:
            case _1137.PAGE_LEFT:
               _loc7_ = this._8931(target.scrollRect.left,0,target._2249 - 1);
               _loc8_ = this._8931(target.scrollRect.right,0,target._2249 - 1);
               _loc9_ = _loc7_;
               if(this._8915(_loc9_) < 1)
               {
                  _loc9_ += 1;
               }
               if(_loc9_ < param1 && param1 <= _loc8_)
               {
                  _loc4_ = _loc9_;
               }
               else
               {
                  if(param1 == _loc9_ || param1 == _loc7_)
                  {
                     _loc6_ = _7624(_1137.PAGE_LEFT) + _8929().left;
                  }
                  else
                  {
                     _loc6_ = this._7988(param1).right - _8929().width;
                  }
                  _loc4_ = param1 - 1;
                  while(0 <= _loc4_)
                  {
                     _loc5_ = this._7988(_loc4_);
                     if((Boolean(_loc5_)) && _loc5_.left < _loc6_)
                     {
                        _loc4_ = Math.min(param1 - 1,_loc4_ + 1);
                        break;
                     }
                     _loc4_--;
                  }
               }
               break;
            case _1137.PAGE_DOWN:
            case _1137.PAGE_RIGHT:
               _loc7_ = this._8931(target.scrollRect.left,0,target._2249 - 1);
               _loc10_ = _loc8_ = this._8931(target.scrollRect.right,0,target._2249 - 1);
               if(this._8915(_loc10_) < 1)
               {
                  _loc10_--;
               }
               if(_loc7_ <= param1 && param1 < _loc10_)
               {
                  _loc4_ = _loc10_;
               }
               else
               {
                  if(param1 == _loc10_ || param1 == _loc8_)
                  {
                     _loc6_ = _7624(_1137.PAGE_RIGHT) + _8929().right;
                  }
                  else
                  {
                     _loc6_ = this._7988(param1).left + _8929().width;
                  }
                  _loc4_ = param1 + 1;
                  while(_loc4_ <= _loc3_)
                  {
                     _loc5_ = this._7988(_loc4_);
                     if((Boolean(_loc5_)) && _loc5_.right > _loc6_)
                     {
                        _loc4_ = Math.max(param1 + 1,_loc4_ - 1);
                        break;
                     }
                     _loc4_++;
                  }
               }
               break;
            default:
               return super._8090(param1,param2);
         }
         return Math.max(0,Math.min(_loc3_,_loc4_));
      }
      
      public function _8915(param1:int) : Number
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc9_:_1122 = null;
         var _loc2_:_1093 = _1093(target);
         if(!_loc2_)
         {
            return 0;
         }
         if(param1 < 0 || param1 >= _loc2_._2249)
         {
            return 0;
         }
         if(!clipAndEnableScrolling)
         {
            return 1;
         }
         if(_6056)
         {
            _loc3_ = this._8923(param1);
            _loc4_ = this._8925(param1);
         }
         else
         {
            _loc9_ = _loc2_.getElementAt(param1) as _1122;
            if(!_loc9_ || !_loc9_.includeInLayout)
            {
               return 0;
            }
            _loc3_ = _loc9_.layoutBoundsX;
            _loc4_ = _loc9_.layoutBoundsWidth;
         }
         var _loc5_:Number = _loc2_.horizontalScrollPosition;
         var _loc6_:Number = _loc5_ + _loc2_.width;
         var _loc7_:Number = _loc3_;
         var _loc8_:Number = _loc7_ + _loc4_;
         if(_loc7_ >= _loc8_)
         {
            return 1;
         }
         if(_loc7_ >= _loc5_ && _loc8_ <= _loc6_)
         {
            return 1;
         }
         if(_loc8_ <= _loc5_ || _loc7_ >= _loc6_)
         {
            return 0;
         }
         return (Math.min(_loc6_,_loc8_) - Math.max(_loc5_,_loc7_)) / (_loc8_ - _loc7_);
      }
      
      private function _8923(param1:int) : Number
      {
         var _loc8_:_1133 = null;
         var _loc9_:Number = NaN;
         var _loc2_:Number = isNaN(this._padding) ? 0 : this._padding;
         var _loc3_:Number = isNaN(this._8023) ? _loc2_ : this._8023;
         var _loc4_:Number = isNaN(this._7007) ? 0 : this._7007;
         if(!_6056)
         {
            if(target)
            {
               _loc8_ = target.getElementAt(param1);
            }
            return !!_loc8_ ? _loc8_.x : _loc3_;
         }
         var _loc5_:Number = !!_7607 ? _7607.width : 71;
         var _loc6_:Number = _loc3_;
         var _loc7_:int = 0;
         while(_loc7_ < param1)
         {
            _loc9_ = Number(this._8920[_loc7_]);
            if(isNaN(_loc9_))
            {
               _loc9_ = _loc5_;
            }
            _loc6_ += _loc9_ + _loc4_;
            _loc7_++;
         }
         return _loc6_;
      }
      
      private function _8925(param1:int) : Number
      {
         var _loc2_:Number = NaN;
         if(_6056)
         {
            _loc2_ = Number(this._8920[param1]);
            if(isNaN(_loc2_))
            {
               _loc2_ = !!_7607 ? _7607.width : 71;
            }
            return _loc2_;
         }
         if(target)
         {
            return target.getElementAt(param1).width;
         }
         return 0;
      }
      
      private function _8918() : Number
      {
         var _loc6_:Number = NaN;
         var _loc1_:Number = !!_7607 ? _7607.width : 71;
         var _loc2_:Number = isNaN(this._7007) ? 0 : this._7007;
         var _loc3_:Number = 0;
         var _loc4_:int = target._2249;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = Number(this._8920[_loc5_]);
            if(isNaN(_loc6_))
            {
               _loc6_ = _loc1_;
            }
            _loc3_ += _loc6_ + _loc2_;
            _loc5_++;
         }
         return _loc3_ - _loc2_;
      }
      
      override public function elementAdded(param1:int) : void
      {
         if(!_6056)
         {
            return;
         }
         super.elementAdded(param1);
         var _loc2_:Number = !!_7607 ? _7607.width : 71;
         this._8920.splice(param1,0,_loc2_);
      }
      
      override public function elementRemoved(param1:int) : void
      {
         if(!_6056)
         {
            return;
         }
         super.elementRemoved(param1);
         this._8920.splice(param1,1);
      }
      
      override public function _7479() : void
      {
         if(!_6056)
         {
            return;
         }
         super._7479();
         this._8920 = [];
         this._8921 = 0;
      }
      
      private function _8931(param1:Number, param2:int, param3:int) : int
      {
         var _loc4_:int = (param2 + param3) / 2;
         var _loc5_:Number = this._8923(_loc4_);
         var _loc6_:Number = this._8925(_loc4_);
         var _loc7_:Number = isNaN(this._7007) ? 0 : this._7007;
         if(param1 >= _loc5_ && param1 < _loc5_ + _loc6_ + _loc7_)
         {
            return _loc4_;
         }
         if(param2 == param3)
         {
            return -1;
         }
         if(param1 < _loc5_)
         {
            return this._8931(param1,param2,Math.max(param2,_loc4_ - 1));
         }
         return this._8931(param1,Math.min(_loc4_ + 1,param3),param3);
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
         if(!target || target._2249 == 0)
         {
            this.startIndex = this.endIndex = -1;
            return false;
         }
         if(isNaN(target.width) || target.width == 0 || isNaN(target.height) || target.height == 0)
         {
            this.startIndex = this.endIndex = -1;
            return false;
         }
         var _loc1_:Number = isNaN(this._padding) ? 0 : this._padding;
         var _loc2_:Number = isNaN(this._8023) ? _loc1_ : this._8023;
         var _loc3_:Number = isNaN(this._8022) ? _loc1_ : this._8022;
         var _loc4_:Number = isNaN(this._8024) ? _loc1_ : this._8024;
         var _loc5_:Number = isNaN(this._8021) ? _loc1_ : this._8021;
         var _loc6_:int = target._2249;
         var _loc7_:Number = this._8923(_loc6_ - 1) + this._8920[_loc6_ - 1] + _loc3_;
         var _loc8_:Number = target.horizontalScrollPosition;
         if(_loc8_ > _loc7_ - _loc3_)
         {
            this.startIndex = -1;
            this.endIndex = -1;
            return false;
         }
         var _loc9_:Number = target.horizontalScrollPosition + target.width;
         if(_loc9_ < _loc2_)
         {
            this.startIndex = -1;
            this.endIndex = -1;
            return false;
         }
         var _loc10_:int = this.startIndex;
         var _loc11_:int = this.endIndex;
         this.startIndex = this._8931(_loc8_,0,_loc6_ - 1);
         if(this.startIndex == -1)
         {
            this.startIndex = 0;
         }
         this.endIndex = this._8931(_loc9_,0,_loc6_ - 1);
         if(this.endIndex == -1)
         {
            this.endIndex = _loc6_ - 1;
         }
         return _loc10_ != this.startIndex || _loc11_ != this.endIndex;
      }
      
      private function _8914(param1:Number, param2:Number) : void
      {
         var _loc8_:Number = NaN;
         var _loc15_:_1122 = null;
         var _loc22_:Number = NaN;
         var _loc25_:int = 0;
         var _loc26_:Number = NaN;
         if(this._8916)
         {
            this._8916 = false;
         }
         else
         {
            this._8927();
         }
         var _loc3_:Number = isNaN(this._padding) ? 0 : this._padding;
         var _loc4_:Number = isNaN(this._8022) ? _loc3_ : this._8022;
         var _loc5_:Number = isNaN(this._8024) ? _loc3_ : this._8024;
         var _loc6_:Number = isNaN(this._8021) ? _loc3_ : this._8021;
         var _loc7_:Number = isNaN(this._7007) ? 0 : this._7007;
         var _loc9_:int = target._2249;
         if(this.startIndex == -1 || this.endIndex == -1)
         {
            _loc8_ = this._8923(_loc9_) - _loc7_ + _loc4_;
            target._7729(Math.ceil(_loc8_),target.contentHeight);
            return;
         }
         target._7577(this.startIndex,this.endIndex);
         var _loc10_:Boolean = this._7650 == _1196.JUSTIFY || this._7650 == _1196.CONTENT_JUSTIFY;
         var _loc11_:* = this._7650 == _1196.CONTENT_JUSTIFY;
         var _loc12_:Number = 0;
         if(!_loc10_)
         {
            if(this._7650 == _1196.MIDDLE)
            {
               _loc12_ = 0.5;
            }
            else if(this._7650 == _1196.BOTTOM)
            {
               _loc12_ = 1;
            }
         }
         var _loc13_:Number = Math.max(0,param2 - _loc5_ - _loc6_);
         var _loc14_:Number = Math.ceil(_loc13_);
         var _loc16_:Number = !!_7607 ? _7607.height : 22;
         var _loc17_:Number = !!_7607 ? _7607.width : 71;
         var _loc18_:Number = Math.max(_loc16_,this._8921);
         if(_loc11_)
         {
            _loc25_ = this.startIndex;
            while(_loc25_ <= this.endIndex)
            {
               _loc15_ = target._7596(_loc25_) as _1122;
               if(!(!_loc15_ || !_loc15_.includeInLayout))
               {
                  this._8921 = Math.max(this._8921,_loc15_.preferredHeight);
               }
               _loc25_++;
            }
            _loc14_ = Math.ceil(Math.max(_loc13_,this._8921));
         }
         var _loc19_:Number = 0;
         var _loc20_:Number = 0;
         var _loc21_:Number = 0;
         var _loc23_:Boolean = false;
         var _loc24_:int = this.startIndex;
         while(_loc24_ <= this.endIndex)
         {
            _loc26_ = 0;
            _loc15_ = target._7596(_loc24_) as _1122;
            if(_loc15_)
            {
               if(!_loc15_.includeInLayout)
               {
                  this._8920[_loc24_] = 0;
               }
               else
               {
                  if(_loc10_)
                  {
                     _loc20_ = _loc5_;
                     _loc15_._7599(NaN,_loc14_);
                  }
                  else
                  {
                     _loc26_ = (_loc13_ - _loc15_.layoutBoundsHeight) * _loc12_;
                     _loc26_ = _loc26_ > 0 ? _loc26_ : 0;
                     _loc20_ = _loc5_ + _loc26_;
                  }
                  if(!_loc11_)
                  {
                     this._8921 = Math.max(this._8921,_loc15_.preferredHeight);
                  }
                  _loc21_ = Math.max(_loc21_,_loc15_.layoutBoundsHeight);
                  if(!_loc23_)
                  {
                     _loc22_ = isNaN(this._8920[_loc24_]) ? _loc17_ : Number(this._8920[_loc24_]);
                     if(_loc22_ != _loc15_.layoutBoundsWidth)
                     {
                        _loc23_ = true;
                     }
                  }
                  if(_loc24_ == 0 && this._8920.length > 0 && this._8920[_loc24_] != _loc15_.layoutBoundsWidth)
                  {
                     _7607 = null;
                  }
                  this._8920[_loc24_] = _loc15_.layoutBoundsWidth;
                  _loc19_ = this._8923(_loc24_);
                  _loc15_._7777(Math.round(_loc19_),Math.round(_loc20_));
               }
            }
            _loc24_++;
         }
         _loc21_ += _loc5_ + _loc6_;
         _loc8_ = this._8923(_loc9_) - _loc7_ + _loc4_;
         target._7729(Math.ceil(_loc8_),Math.ceil(_loc21_));
         if(_loc23_ || _loc18_ < this._8921)
         {
            target.invalidateSize();
         }
      }
      
      private function _8917(param1:Number, param2:Number) : void
      {
         var _loc18_:int = 0;
         var _loc19_:_1122 = null;
         var _loc23_:ChildInfo = null;
         var _loc26_:Number = NaN;
         var _loc34_:Number = NaN;
         var _loc35_:Number = NaN;
         var _loc36_:Number = NaN;
         var _loc37_:Number = NaN;
         var _loc38_:int = 0;
         var _loc39_:Number = NaN;
         var _loc40_:Number = NaN;
         var _loc41_:Number = NaN;
         var _loc3_:Number = isNaN(this._padding) ? 0 : this._padding;
         var _loc4_:Number = isNaN(this._8023) ? _loc3_ : this._8023;
         var _loc5_:Number = isNaN(this._8022) ? _loc3_ : this._8022;
         var _loc6_:Number = isNaN(this._8024) ? _loc3_ : this._8024;
         var _loc7_:Number = isNaN(this._8021) ? _loc3_ : this._8021;
         var _loc8_:Number = isNaN(this._7007) ? 0 : this._7007;
         var _loc9_:Number = Math.max(0,param1 - _loc4_ - _loc5_);
         var _loc10_:Number = Math.max(0,param2 - _loc6_ - _loc7_);
         var _loc11_:* = this._8919 == _1188.JUSTIFY;
         var _loc12_:Boolean = this._7650 == _1196.JUSTIFY || this._7650 == _1196.CONTENT_JUSTIFY;
         var _loc13_:Number = 0;
         if(!_loc12_)
         {
            if(this._7650 == _1196.MIDDLE)
            {
               _loc13_ = 0.5;
            }
            else if(this._7650 == _1196.BOTTOM)
            {
               _loc13_ = 1;
            }
         }
         var _loc14_:int;
         var _loc15_:int = _loc14_ = target._2249;
         var _loc16_:Number = _loc4_;
         var _loc17_:Number = _loc6_;
         var _loc20_:Number = 0;
         var _loc21_:Number = 0;
         var _loc22_:Array = [];
         var _loc24_:Number = _loc9_;
         _loc18_ = 0;
         while(_loc18_ < _loc14_)
         {
            _loc19_ = target.getElementAt(_loc18_) as _1122;
            if(!_loc19_ || !_loc19_.includeInLayout)
            {
               _loc15_--;
            }
            else
            {
               this._8921 = Math.max(this._8921,_loc19_.preferredHeight);
               if(_loc11_)
               {
                  _loc20_ += _loc19_.preferredWidth;
               }
               else if(!isNaN(_loc19_.percentWidth))
               {
                  _loc21_ += _loc19_.percentWidth;
                  (_loc23_ = new ChildInfo()).layoutElement = _loc19_;
                  _loc23_.percent = _loc19_.percentWidth;
                  if(_1141._8325(this))
                  {
                     _loc23_.min = _loc19_.minWidth;
                     _loc23_.max = _loc19_.maxWidth;
                  }
                  else
                  {
                     _loc23_.min = _loc19_._8490();
                     _loc23_.max = _loc19_._8506();
                  }
                  _loc22_.push(_loc23_);
               }
               else
               {
                  _loc24_ -= _loc19_.preferredWidth;
               }
            }
            _loc18_++;
         }
         _loc24_ -= _loc8_ * (_loc15_ - 1);
         _loc24_ = _loc24_ -= _loc8_ * (_loc15_ - 1) > 0 ? _loc24_ : 0;
         var _loc25_:Number = _loc9_ - _loc20_ - _loc8_ * (_loc15_ - 1);
         var _loc27_:int = _loc15_;
         var _loc28_:Dictionary = _8928;
         if(_loc11_)
         {
            if(_loc25_ < 0)
            {
               _loc26_ = _loc24_ / _loc15_;
               _loc18_ = 0;
               while(_loc18_ < _loc14_)
               {
                  _loc19_ = target.getElementAt(_loc18_);
                  if(!(!_loc19_ || !_loc19_.includeInLayout))
                  {
                     _loc36_ = _loc19_.preferredWidth;
                     if(_loc36_ <= _loc26_)
                     {
                        _loc24_ -= _loc36_;
                        _loc27_--;
                     }
                  }
                  _loc18_++;
               }
               _loc24_ = _loc24_ > 0 ? _loc24_ : 0;
            }
         }
         else if(_loc21_ > 0)
         {
            _8913(_loc9_,_loc24_,_loc21_,_loc22_);
            _loc37_ = 0;
            for each(_loc23_ in _loc22_)
            {
               _loc38_ = Math.round(_loc23_.size + _loc37_);
               _loc37_ += _loc23_.size - _loc38_;
               _loc28_[_loc23_.layoutElement] = _loc38_;
               _loc24_ -= _loc38_;
            }
            _loc24_ = _loc24_ > 0 ? _loc24_ : 0;
         }
         if(this._8919 == _1188.CENTER)
         {
            _loc16_ = _loc4_ + _loc24_ * 0.5;
         }
         else if(this._8919 == _1188.RIGHT)
         {
            _loc16_ = _loc4_ + _loc24_;
         }
         var _loc29_:Number = _loc4_;
         var _loc30_:Number = _loc6_;
         var _loc31_:Number = 0;
         var _loc32_:Number = 0;
         var _loc33_:Number = Math.ceil(_loc10_);
         if(this._7650 == _1196.CONTENT_JUSTIFY)
         {
            _loc33_ = Math.ceil(Math.max(_loc10_,this._8921));
         }
         _loc37_ = 0;
         _loc18_ = 0;
         while(_loc18_ < _loc14_)
         {
            _loc39_ = 0;
            _loc19_ = target.getElementAt(_loc18_) as _1122;
            if(!(!_loc19_ || !_loc19_.includeInLayout))
            {
               _loc34_ = NaN;
               if(_loc11_)
               {
                  _loc35_ = NaN;
                  if(_loc25_ > 0)
                  {
                     _loc35_ = _loc24_ * _loc19_.preferredWidth / _loc20_;
                  }
                  else if(_loc25_ < 0 && _loc19_.preferredWidth > _loc26_)
                  {
                     _loc35_ = _loc24_ / _loc27_;
                  }
                  if(!isNaN(_loc35_))
                  {
                     _loc34_ = Math.round(_loc35_ + _loc37_);
                     _loc37_ += _loc35_ - _loc34_;
                  }
               }
               else
               {
                  _loc34_ = Number(_loc28_[_loc19_]);
               }
               if(_loc12_)
               {
                  _loc17_ = _loc6_;
                  _loc19_._7599(_loc34_,_loc33_);
               }
               else
               {
                  _loc40_ = NaN;
                  if(!isNaN(_loc19_.percentHeight))
                  {
                     _loc41_ = Math.min(100,_loc19_.percentHeight);
                     _loc40_ = Math.round(_loc10_ * _loc41_ * 0.01);
                  }
                  _loc19_._7599(_loc34_,_loc40_);
                  _loc39_ = (_loc10_ - _loc19_.layoutBoundsHeight) * _loc13_;
                  _loc39_ = _loc39_ > 0 ? _loc39_ : 0;
                  _loc17_ = _loc6_ + _loc39_;
               }
               _loc19_._7777(Math.round(_loc16_),Math.round(_loc17_));
               _loc31_ = Math.ceil(_loc19_.layoutBoundsWidth);
               _loc32_ = Math.ceil(_loc19_.layoutBoundsHeight);
               _loc29_ = Math.max(_loc29_,_loc16_ + _loc31_);
               _loc30_ = Math.max(_loc30_,_loc17_ + _loc32_);
               _loc16_ += _loc31_ + _loc8_;
            }
            _loc18_++;
         }
         target._7729(Math.ceil(_loc29_ + _loc5_),Math.ceil(_loc30_ + _loc7_));
      }
      
      override public function _7988(param1:int) : Rectangle
      {
         if(!_6056)
         {
            return super._7988(param1);
         }
         var _loc2_:_1093 = _1093(target);
         if(!_loc2_ || param1 < 0 || param1 >= _loc2_._2249)
         {
            return null;
         }
         var _loc3_:Rectangle = new Rectangle();
         var _loc4_:Number = !!_7607 ? _7607.height : 22;
         _loc3_.y = 0;
         _loc3_.height = _loc4_;
         _loc3_.left = this._8923(param1);
         _loc3_.right = this._8925(param1) + _loc3_.left;
         return _loc3_;
      }
      
      override protected function _7923(param1:Rectangle) : Rectangle
      {
         var _loc2_:Rectangle = new Rectangle();
         if(!target)
         {
            return _loc2_;
         }
         var _loc3_:Number = isNaN(this._padding) ? 0 : this._padding;
         var _loc4_:Number = isNaN(this._8023) ? _loc3_ : this._8023;
         var _loc5_:Number = isNaN(this._8022) ? _loc3_ : this._8022;
         var _loc6_:int = this._8931(param1.left,0,target._2249 - 1);
         if(_loc6_ == -1)
         {
            if(param1.left > target.contentWidth - _loc5_)
            {
               _loc2_.left = target.contentWidth - _loc5_;
               _loc2_.right = target.contentWidth;
            }
            else
            {
               _loc2_.left = 0;
               _loc2_.right = _loc4_;
            }
            return _loc2_;
         }
         _loc2_.left = this._8923(_loc6_);
         _loc2_.right = this._8925(_loc6_) + _loc2_.left;
         if(_loc2_.left == param1.left)
         {
            if(--_loc6_ != -1)
            {
               _loc2_.left = this._8923(_loc6_);
               _loc2_.right = this._8925(_loc6_) + _loc2_.left;
            }
            else
            {
               _loc2_.left = 0;
               _loc2_.right = _loc4_;
            }
         }
         return _loc2_;
      }
      
      override protected function _7922(param1:Rectangle) : Rectangle
      {
         var _loc2_:Rectangle = new Rectangle();
         if(!target)
         {
            return _loc2_;
         }
         var _loc3_:int = target._2249;
         var _loc4_:Number = isNaN(this._padding) ? 0 : this._padding;
         var _loc5_:Number = isNaN(this._8023) ? _loc4_ : this._8023;
         var _loc6_:Number = isNaN(this._8022) ? _loc4_ : this._8022;
         var _loc7_:int = this._8931(param1.right,0,_loc3_ - 1);
         if(_loc7_ == -1)
         {
            if(param1.right < _loc5_)
            {
               _loc2_.left = 0;
               _loc2_.right = _loc5_;
            }
            else
            {
               _loc2_.left = target.contentWidth - _loc6_;
               _loc2_.right = target.contentWidth;
            }
            return _loc2_;
         }
         _loc2_.left = this._8923(_loc7_);
         _loc2_.right = this._8925(_loc7_) + _loc2_.left;
         if(_loc2_.right <= param1.right)
         {
            _loc7_++;
            if(_loc7_ < _loc3_)
            {
               _loc2_.left = this._8923(_loc7_);
               _loc2_.right = this._8925(_loc7_) + _loc2_.left;
            }
            else
            {
               _loc2_.left = target.contentWidth - _loc6_;
               _loc2_.right = target.contentWidth;
            }
         }
         return _loc2_;
      }
      
      private function _8924(param1:_1122, param2:Number, param3:SizesAndLimit) : void
      {
         var _loc4_:Number = isNaN(param2) ? Math.ceil(param1.preferredWidth) : param2;
         var _loc5_:* = !isNaN(param1.percentWidth);
         var _loc6_:Number = _loc5_ ? Math.ceil(param1._8490()) : _loc4_;
         param3.preferredSize = _loc4_;
         param3.minSize = _loc6_;
      }
      
      private function _8922(param1:_1122, param2:Boolean, param3:SizesAndLimit) : void
      {
         var _loc4_:Number = Math.ceil(param1.preferredHeight);
         var _loc5_:Boolean = !isNaN(param1.percentHeight) || param2;
         var _loc6_:Number = _loc5_ ? Math.ceil(param1._8487()) : _loc4_;
         param3.preferredSize = _loc4_;
         param3.minSize = _loc6_;
      }
   }
}

import egret.core._1122;

class ChildInfo
{
   public var layoutElement:_1122;
   
   public var size:Number = 0;
   
   public var percent:Number;
   
   public var min:Number;
   
   public var max:Number;
   
   public function ChildInfo()
   {
      super();
   }
}

class SizesAndLimit
{
   public var preferredSize:Number;
   
   public var minSize:Number;
   
   public function SizesAndLimit()
   {
      super();
   }
}

