package _1049
{
   import _1038._1039;
   import _1045.DataGrid;
   import _1045.Grid;
   import _1045.Group;
   import _1045._1068;
   import _1088._1093;
   import _1177.CollectionEvent;
   import _1177._1178;
   import _1193._1192;
   import egret.core._1133;
   import egret.core.ns_egret;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   use namespace ns_egret;
   
   public class _1054 extends _1192
   {
      private var rendererLayer:Group;
      
      private var overlayLayer:Group;
      
      private var _7852:Array;
      
      private var _7847:Number = 0;
      
      private var _7834:Rectangle;
      
      private var _7835:Vector.<_1066>;
      
      private var _7833:Vector.<_1133>;
      
      private var _7853:Dictionary;
      
      private var _7842:Dictionary;
      
      private var _7840:Boolean = false;
      
      private var _columns:_1039;
      
      public function _1054()
      {
         this._7852 = new Array();
         this._7834 = new Rectangle();
         this._7835 = new Vector.<_1066>();
         this._7833 = new Vector.<_1133>();
         this._7853 = new Dictionary();
         this._7842 = new Dictionary();
         super();
      }
      
      override public function set target(param1:_1093) : void
      {
         super.target = param1;
         var _loc2_:_1068 = param1 as _1068;
         if(_loc2_)
         {
            this.rendererLayer = new Group();
            this.rendererLayer.layout = new _1192();
            _loc2_.addElement(this.rendererLayer);
            this.overlayLayer = new Group();
            this.overlayLayer.layout = new _1192();
            _loc2_.addElement(this.overlayLayer);
         }
      }
      
      override public function get _6056() : Boolean
      {
         return true;
      }
      
      override public function set _6056(param1:Boolean) : void
      {
      }
      
      override public function _7479() : void
      {
         this._7852.length = 0;
         this._7835.length = 0;
         this._7833.length = 0;
         this._7834.setEmpty();
         this._7842 = new Dictionary();
         this._7853 = new Dictionary();
         if(this.rendererLayer)
         {
            this.rendererLayer._2426();
         }
         if(this.overlayLayer)
         {
            this.overlayLayer._2426();
         }
      }
      
      override protected function _7839() : void
      {
         var _loc1_:_1068 = this._7506;
         if(!_loc1_)
         {
            return;
         }
         super._7839();
         var _loc2_:Rectangle = _loc1_.scrollRect;
         if(Boolean(_loc2_) && !this._7834.containsRect(_loc2_))
         {
            _loc1_.invalidateDisplayList();
         }
      }
      
      override public function _7028() : void
      {
         var _loc1_:_1068 = this._7506;
         var _loc2_:Grid = this.grid;
         if(!_loc1_ || !_loc2_)
         {
            return;
         }
         this._7837();
         var _loc3_:Number = _loc1_._2419;
         var _loc4_:Number = _loc1_._2416;
         var _loc5_:Number = _loc1_._2420;
         var _loc6_:Number = _loc1_._2410;
         var _loc7_:Number = Math.ceil(_loc3_ + _loc4_);
         var _loc8_:Number = Math.ceil(this._7847 + _loc5_ + _loc6_);
         _loc1_.measuredWidth = Math.max(_loc7_,_loc1_.minWidth);
         _loc1_.measuredHeight = Math.max(_loc8_,_loc1_.minHeight);
      }
      
      override public function _5823(param1:Number, param2:Number) : void
      {
         var _loc10_:_1066 = null;
         var _loc11_:_1133 = null;
         var _loc12_:_1053 = null;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:_1039 = null;
         var _loc19_:int = 0;
         var _loc27_:* = false;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         var _loc30_:Class = null;
         var _loc31_:Number = NaN;
         var _loc32_:Number = NaN;
         var _loc3_:_1068 = this._7506;
         var _loc4_:Grid = this.grid;
         if(!_loc3_ || !_loc4_)
         {
            return;
         }
         var _loc5_:Vector.<int> = _loc4_._7683();
         var _loc6_:Array = [];
         var _loc7_:Group = this.rendererLayer;
         var _loc8_:Group = this.overlayLayer;
         var _loc9_:Class = _loc3_._7279;
         var _loc13_:int = -1;
         for each(_loc10_ in this._7835)
         {
            _loc12_ = _loc10_.column;
            if((_loc13_ = !!_loc12_ ? _loc12_.columnIndex : -1) != -1 && _loc5_.indexOf(_loc13_) != -1 && _loc6_[_loc13_] == null)
            {
               _loc6_[_loc13_] = _loc10_;
            }
            else
            {
               this._7848(_loc10_);
               _loc10_.discard(true);
            }
         }
         this._7835.length = 0;
         for each(_loc11_ in this._7833)
         {
            this._7848(_loc11_);
         }
         this._7833.length = 0;
         _loc14_ = _loc3_._2419;
         _loc15_ = _loc3_._2416;
         _loc16_ = _loc3_._2420;
         _loc17_ = _loc3_._2410;
         _loc18_ = this.columns;
         _loc19_ = !!_loc18_ ? _loc18_.length : 0;
         var _loc20_:int = _loc4_.ns_egret::_7456(_loc19_);
         var _loc21_:Number = _loc16_;
         var _loc22_:Number = param2 - _loc16_ - _loc17_;
         var _loc23_:Number = _loc3_.horizontalScrollPosition + param1;
         var _loc24_:Number = 0;
         var _loc25_:Number = 0;
         var _loc26_:int = 0;
         while(true)
         {
            if(_loc26_ < _loc5_.length)
            {
               _loc13_ = _loc5_[_loc26_];
            }
            else
            {
               _loc13_ = _loc4_.ns_egret::_7471(_loc13_);
            }
            if(_loc13_ < 0 || _loc13_ >= _loc19_)
            {
               break;
            }
            _loc12_ = _loc18_.getItemAt(_loc13_) as _1053;
            _loc10_ = _loc6_[_loc13_];
            _loc6_[_loc13_] = null;
            if(!_loc10_)
            {
               _loc30_ = _loc12_._7817;
               if(!_loc30_)
               {
                  _loc30_ = _loc3_._7817;
               }
               _loc10_ = this._7838(_loc30_) as _1066;
            }
            this._7835.push(_loc10_);
            this._7836(_loc10_,_loc13_,_loc12_,true);
            if(_loc10_.parent != _loc7_)
            {
               _loc7_.addElement(_loc10_);
            }
            _loc27_ = _loc13_ == _loc20_;
            _loc28_ = _loc4_._7756(0,_loc13_) + _loc14_;
            _loc29_ = _loc4_._7539(_loc13_);
            if(_loc27_)
            {
               _loc29_ = horizontalScrollPosition + param1 - _loc28_ - _loc15_;
            }
            _loc10_._7599(_loc29_,_loc22_);
            _loc10_._7777(_loc28_,_loc21_);
            if(_loc26_ == 0)
            {
               _loc24_ = _loc28_;
            }
            _loc25_ = _loc28_ + _loc29_;
            _loc10_.prepare(!this._7840);
            if(_loc28_ + _loc29_ > _loc23_)
            {
               break;
            }
            if(Boolean(_loc9_) && !_loc27_)
            {
               _loc11_ = this._7838(_loc9_);
               this._7833.push(_loc11_);
               _loc11_.visible = true;
               if(_loc11_.parent != _loc8_)
               {
                  _loc8_.addElement(_loc11_);
               }
               _loc31_ = Number(_loc11_.preferredWidth);
               _loc32_ = _loc28_ + _loc29_;
               _loc11_._7599(_loc31_,_loc22_);
               _loc11_._7777(_loc32_,_loc21_);
            }
            _loc26_++;
         }
         _loc3_._7729(_loc4_.contentWidth,_loc22_);
         this._7834.left = _loc24_ - _loc14_;
         this._7834.right = _loc25_ = _loc15_;
         this._7834.top = _loc21_ - _loc16_;
         this._7834.height = _loc22_ + _loc16_ + _loc17_;
         _loc3_._2449();
         this._7837(true);
      }
      
      public function _7849(param1:Number, param2:Number) : int
      {
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc3_:_1068 = this._7506;
         var _loc4_:Grid = this.grid;
         var _loc5_:_1039 = this.columns;
         if(!_loc3_ || !_loc4_ || !_loc5_)
         {
            return -1;
         }
         var _loc6_:Number = _loc3_._2419;
         var _loc7_:Number = _loc3_._2416;
         var _loc8_:Number = param1 + _loc6_;
         var _loc9_:int = _loc4_._7719(_loc8_,0);
         if(_loc9_ < 0)
         {
            _loc10_ = _loc3_.contentWidth;
            _loc11_ = horizontalScrollPosition + _loc3_.width - _loc7_;
            if(_loc8_ >= _loc10_ && _loc8_ < _loc11_)
            {
               _loc9_ = _loc4_.ns_egret::_7456(_loc5_.length);
            }
         }
         return _loc9_;
      }
      
      public function _7846(param1:Number, param2:Number) : int
      {
         var _loc3_:_1068 = this._7506;
         var _loc4_:Grid = this.grid;
         var _loc5_:_1039 = this.columns;
         if(!_loc3_ || !_loc4_ || !_loc5_)
         {
            return -1;
         }
         var _loc6_:Number = _loc3_._2419;
         var _loc7_:int = _loc4_._7719(param1 + _loc6_,0);
         if(_loc7_ == -1)
         {
            return -1;
         }
         var _loc8_:* = _loc7_ == _loc4_.ns_egret::_7471(-1);
         var _loc9_:* = _loc7_ == _loc4_.ns_egret::_7456(_loc5_.length);
         var _loc10_:Number = _loc4_._7756(0,_loc7_);
         var _loc11_:Number = _loc10_ + _loc4_._7539(_loc7_);
         var _loc12_:Number = _loc3_._7844;
         if(!_loc8_ && param1 > _loc10_ - _loc12_ && param1 < _loc10_ + _loc12_)
         {
            return _loc4_.ns_egret::_7456(_loc7_);
         }
         if(!_loc9_ && param1 > _loc11_ - _loc12_ && param1 < _loc11_ + _loc12_)
         {
            return _loc7_;
         }
         return -1;
      }
      
      public function _7851(param1:int) : Rectangle
      {
         var _loc2_:_1068 = this._7506;
         var _loc3_:Grid = this.grid;
         if(!_loc2_ || !_loc3_)
         {
            return null;
         }
         var _loc4_:_1039 = this.columns;
         var _loc5_:int = !!_loc4_ ? _loc4_.length : 0;
         if(param1 >= _loc5_)
         {
            return null;
         }
         var _loc6_:_1053 = _loc4_.getItemAt(param1) as _1053;
         if(!_loc6_.visible)
         {
            return null;
         }
         var _loc7_:Number = _loc2_._2419;
         var _loc8_:Number = _loc2_._2416;
         var _loc9_:Number = _loc2_._2420;
         var _loc10_:Number = _loc2_._2410;
         var _loc11_:* = param1 == _loc3_.ns_egret::_7456(_loc5_);
         var _loc12_:Number = _loc3_._7756(0,param1) + _loc7_;
         var _loc13_:Number = _loc9_;
         var _loc14_:Number = _loc3_._7539(param1);
         var _loc15_:Number = _loc2_.height - _loc9_ - _loc10_;
         if(_loc11_)
         {
            _loc14_ = horizontalScrollPosition + _loc2_.width - _loc12_ - _loc8_;
         }
         return new Rectangle(_loc12_,_loc13_,_loc14_,_loc15_);
      }
      
      public function _7843(param1:int) : _1066
      {
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:_1066 = null;
         var _loc2_:_1068 = this._7506;
         var _loc3_:Grid = this.grid;
         if(!_loc2_ || !_loc3_ || param1 < 0)
         {
            return null;
         }
         var _loc4_:Group = this.rendererLayer;
         var _loc5_:Vector.<int> = _loc3_._7683();
         var _loc6_:int;
         if((_loc6_ = int(_loc5_.indexOf(param1))) != -1)
         {
            _loc20_ = _loc4_._2249;
            _loc21_ = 0;
            while(_loc21_ < _loc20_)
            {
               _loc22_ = _loc4_.getElementAt(_loc21_) as _1066;
               if((_loc22_) && _loc22_.visible && _loc22_.column && _loc22_.column.columnIndex == param1)
               {
                  return _loc22_;
               }
               _loc21_++;
            }
            return null;
         }
         var _loc7_:_1039 = this.columns;
         if(!_loc7_ || _loc7_.length <= param1)
         {
            return null;
         }
         var _loc8_:_1053 = _loc7_.getItemAt(param1) as _1053;
         if(!_loc8_.visible)
         {
            return null;
         }
         var _loc9_:Class = _loc8_._7817;
         if(!_loc9_)
         {
            _loc9_ = _loc2_._7817;
         }
         var _loc10_:_1066 = this._7838(_loc9_) as _1066;
         _loc4_.addElement(_loc10_);
         this._7836(_loc10_,param1,_loc8_,_loc10_.visible);
         var _loc11_:Number = _loc2_._2419;
         var _loc12_:Number = _loc2_._2416;
         var _loc13_:Number = _loc2_._2420;
         var _loc14_:Number = _loc2_._2410;
         var _loc15_:* = param1 == _loc3_.ns_egret::_7456(_loc7_.length);
         var _loc16_:Number = _loc3_._7756(0,param1) + _loc11_;
         var _loc17_:Number = _loc13_;
         var _loc18_:Number = _loc2_.height - _loc13_ - _loc14_;
         var _loc19_:Number = _loc3_._7539(param1);
         if(_loc15_)
         {
            _loc19_ = horizontalScrollPosition + _loc2_.width - _loc16_ - _loc12_;
         }
         _loc10_._7599(_loc19_,_loc18_);
         _loc10_._7777(_loc16_,_loc17_);
         _loc4_.removeElement(_loc10_);
         _loc10_.visible = false;
         return _loc10_;
      }
      
      private function _7836(param1:_1066, param2:int, param3:_1053, param4:Boolean = true) : void
      {
         param1.visible = param4;
         param1.column = param3;
         param1.label = param3._6572;
         var _loc5_:_1068 = this._7506;
         var _loc6_:DataGrid;
         if(_loc6_ = _loc5_._5598)
         {
            param1._6967(_loc6_);
         }
         param1._7854 = param2 == _loc5_._7512;
         param1.down = param2 == _loc5_._7850;
      }
      
      private function _7841(param1:Class) : _1133
      {
         this._7840 = true;
         var _loc2_:_1133 = new param1() as _1133;
         this._7842[_loc2_] = param1;
         return _loc2_;
      }
      
      private function _7838(param1:Class) : _1133
      {
         var _loc3_:_1133 = null;
         this._7840 = false;
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
         return this._7841(param1);
      }
      
      private function _7848(param1:_1133) : void
      {
         var _loc2_:Class = this._7842[param1];
         var _loc3_:Vector.<_1133> = this._7853[_loc2_];
         if(!_loc3_)
         {
            _loc3_ = new Vector.<_1133>();
            this._7853[_loc2_] = _loc3_;
         }
         _loc3_.push(param1);
         param1.visible = false;
      }
      
      private function _7837(param1:Boolean = false) : void
      {
         var _loc4_:_1066 = null;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc2_:_1039 = this.columns;
         this._7852.length = !!_loc2_ ? uint(_loc2_.length) : 0;
         var _loc3_:Number = 0;
         for each(_loc4_ in this._7835)
         {
            _loc5_ = Number(_loc4_.preferredHeight);
            this._7852[_loc4_.column.columnIndex] = _loc5_;
            if(_loc5_ > _loc3_)
            {
               _loc3_ = _loc5_;
            }
         }
         if(_loc3_ == this._7847)
         {
            return;
         }
         if(_loc3_ < this._7847)
         {
            _loc6_ = 0;
            while(_loc6_ < this._7852.length)
            {
               _loc7_ = Number(this._7852[_loc6_]);
               if(!isNaN(_loc7_) && _loc7_ > _loc3_)
               {
                  _loc3_ = _loc7_;
               }
               _loc6_++;
            }
         }
         this._7847 = _loc3_;
         if(param1)
         {
            this._7506.invalidateSize();
         }
      }
      
      private function get _7506() : _1068
      {
         return target as _1068;
      }
      
      private function get grid() : Grid
      {
         var _loc1_:_1068 = this._7506;
         if(_loc1_._5598)
         {
            return _loc1_._5598.grid;
         }
         return null;
      }
      
      private function get columns() : _1039
      {
         var _loc1_:Grid = this.grid;
         var _loc2_:_1039 = !!_loc1_ ? _loc1_.columns : null;
         if(_loc2_ != this._columns)
         {
            if(this._columns)
            {
               this._columns.removeEventListener(CollectionEvent.COLLECTION_CHANGE,this._7668);
            }
            this._columns = _loc2_;
            if(this._columns)
            {
               this._columns.addEventListener(CollectionEvent.COLLECTION_CHANGE,this._7668);
            }
         }
         return this._columns;
      }
      
      private function _7668(param1:CollectionEvent) : void
      {
         switch(param1.kind)
         {
            case _1178.ADD:
               this._7832(param1);
               break;
            case _1178.REMOVE:
               this._7830(param1);
               break;
            case _1178.MOVE:
               this._7831(param1);
               break;
            case _1178.REPLACE:
            case _1178.UPDATE:
               break;
            case _1178.REFRESH:
            case _1178.RESET:
               this._7506._7461 = null;
         }
      }
      
      private function _7832(param1:CollectionEvent) : void
      {
         var _loc2_:int = int(param1.items.length);
         if(_loc2_ <= 0)
         {
            return;
         }
         var _loc3_:_1068 = this._7506;
         var _loc4_:Vector.<int> = _loc3_._7461;
         var _loc5_:int = int(_loc4_.length);
         var _loc6_:int = param1.location;
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            if(_loc4_[_loc7_] >= _loc6_)
            {
               _loc4_[_loc7_] += _loc2_;
            }
            _loc7_++;
         }
         _loc3_._7461 = _loc4_;
      }
      
      private function _7830(param1:CollectionEvent) : void
      {
         var _loc9_:int = 0;
         var _loc2_:int = int(param1.items.length);
         if(_loc2_ <= 0)
         {
            return;
         }
         var _loc3_:_1068 = this._7506;
         var _loc4_:Vector.<int> = _loc3_._7461;
         var _loc5_:int = int(_loc4_.length);
         var _loc6_:int = param1.location;
         var _loc7_:int = _loc6_ + _loc2_;
         var _loc8_:Vector.<int> = new Vector.<int>();
         for each(_loc9_ in _loc4_)
         {
            if(_loc9_ < _loc6_)
            {
               _loc8_.push(_loc9_);
            }
            else if(_loc9_ >= _loc7_)
            {
               _loc8_.push(_loc9_ - _loc7_);
            }
         }
         _loc3_._7461 = _loc8_;
      }
      
      private function _7831(param1:CollectionEvent) : void
      {
         var _loc10_:int = 0;
         var _loc2_:int = int(param1.items.length);
         if(_loc2_ <= 0)
         {
            return;
         }
         var _loc3_:_1068 = this._7506;
         var _loc4_:Vector.<int> = _loc3_._7461;
         var _loc5_:int = int(_loc4_.length);
         var _loc6_:int = param1.oldLocation;
         var _loc7_:int = param1.oldLocation + _loc2_;
         var _loc8_:int = param1.location;
         var _loc9_:int = param1.location + _loc2_;
         var _loc11_:int = 0;
         while(_loc11_ < _loc5_)
         {
            _loc10_ = _loc4_[_loc11_];
            if(_loc10_ >= _loc6_ && _loc10_ < _loc7_)
            {
               _loc4_[_loc11_] = _loc8_ + (_loc10_ - _loc6_);
            }
            else if(_loc8_ > _loc6_)
            {
               if(_loc10_ >= _loc7_ && _loc10_ < _loc9_)
               {
                  _loc4_[_loc11_] -= _loc2_;
               }
            }
            else if(_loc8_ < _loc6_)
            {
               if(_loc10_ >= _loc8_ && _loc10_ < _loc6_)
               {
                  _loc4_[_loc11_] += _loc2_;
               }
            }
            _loc11_++;
         }
         _loc3_._7461 = _loc4_;
      }
   }
}

