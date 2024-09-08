package _13505
{
   import _13492._13496;
   import _35.HashObject;
   import _40.BoneFrameVO;
   
   public class _13510 extends HashObject
   {
      public static const FLAG_TRANSLATE:String = "translate";
      
      public static const FLAG_ROTATE:String = "rotate";
      
      public static const FLAG_SCALE:String = "scale";
      
      public static const FLAG_BONE:String = "bone";
      
      public static const FLAG_SLOT:String = "slot";
      
      public static const FLAG_DISPLAY_INDEX:String = "displayIndex";
      
      public static const FLAG_COLOR:String = "color";
      
      public static const FLAG_VISIBLE:String = "visible";
      
      public static const FLAG_FFD:String = "ffd";
      
      public static const FLAG_EVENT:String = "event";
      
      public static const FLAG_ANIMATION:String = "animation";
      
      public static const FLAG_ZORDER:String = "zorder";
      
      public static const FLAG_IK:String = "IK";
      
      public var flag:String;
      
      protected var _1885:Array;
      
      protected var _1940:Array;
      
      public var currentPosition:Number;
      
      public var _1870:int;
      
      public var _13680:_13496;
      
      public var scale:Number = 1;
      
      public var offset:Number = 0;
      
      protected var _1948:Boolean = true;
      
      public var parent:_13510;
      
      protected var _1941:Array;
      
      public var selected:Boolean;
      
      public function _13510(param1:Array = null)
      {
         super(-1);
         this._1816 = !!param1 ? param1 : [];
         this.refresh();
      }
      
      public function get isEmpty() : Boolean
      {
         return this._1816.length == 0;
      }
      
      public function refresh() : void
      {
         this.currentPosition = 0;
         this._1870 = 0;
      }
      
      public function moveFrame(param1:int, param2:int) : void
      {
         var _loc3_:_13496 = this.getFrameByIndex(param1);
         var _loc4_:_13496 = this.getFrameByIndex(param2);
         if(_loc4_)
         {
            throw new Error("bug moveFrame command");
         }
         this._1943(_loc3_);
         this.addKeyFrameAt(_loc3_,param2);
      }
      
      public function _4589(param1:_13496) : int
      {
         this._1885.push(param1);
         this._1942();
         this._1932();
         return this._1885.indexOf(param1);
      }
      
      public function addKeyFrameAt(param1:_13496, param2:int) : int
      {
         param1.startPos = param2;
         this._1885.push(param1);
         this._1942();
         this._1932();
         return this._1885.indexOf(param1);
      }
      
      public function _1942() : void
      {
         var _loc1_:_13496 = null;
         var _loc2_:_13496 = null;
         this._1885.sortOn("startPos",Array.NUMERIC);
         var _loc3_:int = 0;
         var _loc4_:int = int(this._1885.length);
         while(_loc3_ < _loc4_)
         {
            _loc1_ = this._1885[_loc3_];
            if(_loc3_ + 1 < this._1885.length)
            {
               _loc2_ = this._1885[_loc3_ + 1];
            }
            else
            {
               _loc2_ = null;
            }
            if(_loc2_)
            {
               _loc1_.duration = _loc2_.startPos - _loc1_.startPos;
            }
            else
            {
               _loc1_.duration = 0;
            }
            _loc3_++;
         }
      }
      
      public function _13685() : void
      {
         this._1942();
         this._1932();
      }
      
      public function _1943(param1:_13496) : int
      {
         var _loc2_:int = int(this._1885.indexOf(param1));
         if(_loc2_ != -1)
         {
            this._1885.splice(_loc2_,1);
            this._1942();
            this._1932();
         }
         return _loc2_;
      }
      
      public function _1935(param1:int, param2:int = 1) : void
      {
         var _loc3_:int = 0;
         var _loc4_:_13496 = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         if(param1 > 0 && param1 < this._1940.length)
         {
            if(this._1940[param1 - 1] is BoneFrameVO)
            {
               _loc3_ = param1 - 1;
            }
            else
            {
               _loc3_ = int(this._1940[param1 - 1]);
            }
            _loc4_ = this._1940[param1 - 1];
            _loc4_.duration += param2;
            (this._1940[_loc4_.endPos] as _13496).startPos = _loc4_.endPos;
            _loc5_ = [param1,0];
            _loc6_ = 0;
            while(_loc6_ < param2)
            {
               _loc5_.push(_loc3_);
               _loc6_++;
            }
            this._1940.splice.call(this._1885,_loc5_);
         }
      }
      
      public function _1937(param1:int, param2:int = 1) : void
      {
         var _loc3_:int = 0;
         var _loc4_:_13496 = null;
         if(param1 > 0 && param1 < this._1940.length)
         {
            _loc3_ = int(this._1940[param1 - 1]);
            _loc4_ = this._1940[param1 - 1];
            _loc4_.duration -= param2;
            (this._1940[_loc4_.endPos] as _13496).startPos = _loc4_.endPos;
            this._1940.splice(param1,param2);
         }
      }
      
      public function _1934(param1:int) : _13496
      {
         var _loc2_:_13496 = this._1938(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc3_:int = int(this._1885.indexOf(_loc2_));
         return this._1885[_loc3_ + 1];
      }
      
      public function _11281(param1:int) : _13496
      {
         if(param1 < 0)
         {
            return null;
         }
         if(param1 >= this._1940.length)
         {
            if(this._1885.length > 0)
            {
               return this._1885[this._1885.length - 1];
            }
            return null;
         }
         if(this._1940[param1] is _13496)
         {
            return this._1940[param1];
         }
         if(this._1940[param1] == 0 && this._1940[0] == 0)
         {
            return null;
         }
         return this._1940[this._1940[param1]];
      }
      
      public function _1933(param1:int) : _13496
      {
         var _loc2_:_13496 = null;
         if(param1 >= 0)
         {
            _loc2_ = this._1938(param1);
            if(_loc2_ == null && this._1885.length > 0)
            {
               _loc2_ = this._1885[this._1885.length - 1];
            }
         }
         return _loc2_;
      }
      
      public function _1938(param1:int) : _13496
      {
         if(param1 < 0 || param1 >= this._1940.length)
         {
            return null;
         }
         if(this._1940[param1] is _13496)
         {
            return this._1940[param1];
         }
         if(this._1940[param1] == 0 && this._1940[0] == 0)
         {
            return null;
         }
         return this._1940[this._1940[param1]];
      }
      
      protected function _1932() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc4_:_13496 = null;
         var _loc5_:int = 0;
         this._1940 = [];
         var _loc3_:_13496 = this._1885[0];
         if(Boolean(_loc3_) && _loc3_.startPos > 0)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc3_.startPos)
            {
               this._1940.push(0);
               _loc5_++;
            }
         }
         for each(_loc4_ in this._1885)
         {
            _loc4_.parent = this;
            _loc4_.flag = this.flag;
            this._1940[_loc4_.startPos] = _loc4_;
            _loc1_ = _loc4_.startPos + 1;
            _loc2_ = _loc4_.endPos;
            while(_loc1_ < _loc2_)
            {
               this._1940[_loc1_] = _loc4_.startPos;
               _loc1_++;
            }
         }
      }
      
      protected function _1931(param1:Number) : int
      {
         var _loc2_:int = int(param1);
         var _loc3_:_13496 = this._1940[_loc2_] as _13496;
         if(_loc3_ == null)
         {
            _loc3_ = this._1940[this._1940[_loc2_]] as _13496;
         }
         if(_loc3_ == null)
         {
            return -1;
         }
         return this._1885.indexOf(_loc3_);
      }
      
      public function startDrag() : void
      {
         this._1941 = this._1885.concat();
      }
      
      public function _1939() : void
      {
         var _loc2_:_13496 = null;
         var _loc3_:_13496 = null;
         var _loc6_:_13496 = null;
         if(this._1941 == null)
         {
            return;
         }
         var _loc1_:Object = {};
         var _loc4_:int = 0;
         var _loc5_:int = int(this._1941.length);
         while(_loc4_ < _loc5_)
         {
            _loc2_ = this._1941[_loc4_];
            _loc3_ = _loc1_[_loc2_.startPos];
            if(_loc3_ == null)
            {
               _loc1_[_loc2_.startPos] = _loc2_;
            }
            else if(!_loc3_._1915 && _loc2_._1915)
            {
               _loc1_[_loc2_.startPos] = _loc2_;
            }
            _loc4_++;
         }
         this._1885.length = 0;
         for each(_loc6_ in _loc1_)
         {
            this._1885.push(_loc6_);
         }
         this._1942();
         this._1932();
      }
      
      public function endDrag() : void
      {
         this._1941 = null;
      }
      
      public function getFrameByIndex(param1:int) : _13496
      {
         if(param1 < this._1940.length && this._1940[param1] is _13496)
         {
            return this._1940[param1];
         }
         return null;
      }
      
      public function _1936(param1:int) : Array
      {
         var _loc2_:_13496 = null;
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         var _loc5_:int = int(this._1885.length);
         while(_loc4_ < _loc5_)
         {
            _loc2_ = this._1885[_loc4_] as _13496;
            if(_loc2_.startPos > param1)
            {
               _loc3_.push(_loc2_);
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function get _1816() : Array
      {
         return this._1885;
      }
      
      public function set _1816(param1:Array) : void
      {
         this._1885 = param1;
         this._1932();
      }
      
      public function get duration() : int
      {
         return this._1885.length > 0 ? (this._1885[this._1885.length - 1] as _13496).endPos : 0;
      }
      
      public function _1944(param1:int, param2:int) : Array
      {
         var _loc4_:_13496 = null;
         var _loc3_:Array = [];
         var _loc5_:int = 0;
         var _loc6_:int = int(this._1885.length);
         while(_loc5_ < _loc6_)
         {
            _loc4_ = this._1885[_loc5_];
            if(_loc4_.startPos >= param1 && _loc4_.startPos <= param2)
            {
               _loc3_.push(_loc4_);
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function _1858(param1:Number) : void
      {
         this._1947(param1);
      }
      
      public function _1947(param1:Number) : void
      {
         if(this._1816.length <= 0)
         {
            this._1948 = false;
            this.currentPosition = 0;
            this._1870 = -1;
            if(this._13680)
            {
               this._13680._13664 = false;
            }
         }
         else
         {
            if(param1 <= 0)
            {
               param1 = 0;
               this.currentPosition = param1;
               this._1870 = this._1931(this.currentPosition);
            }
            else if(param1 >= this.duration)
            {
               this.currentPosition = param1;
               this._1870 = this._1816.length - 1;
            }
            else
            {
               this.currentPosition = param1;
               this._1870 = this._1931(this.currentPosition);
            }
            this._13684();
         }
      }
      
      protected function _13684() : void
      {
         var _loc1_:_13496 = null;
         var _loc2_:_13496 = null;
         var _loc3_:Number = NaN;
         this._1948 = false;
         if(this._1870 >= 0)
         {
            _loc1_ = this._1885[this._1870];
            _loc3_ = 0;
            if(_loc1_._13642)
            {
               _loc2_ = this._1885[this._1870 + 1];
               if(_loc2_)
               {
                  _loc3_ = (this.currentPosition - _loc1_.startPos) / _loc1_.duration;
               }
            }
            this._13680 = _loc1_._1905(_loc3_,_loc2_,this._13680);
            this._13680._13664 = true;
         }
         else if(this._13680)
         {
            this._13680._13664 = false;
         }
      }
      
      public function clone() : _13510
      {
         var _loc1_:_13510 = new _13510();
         _loc1_.parent = this.parent;
         _loc1_._13679(this);
         return _loc1_;
      }
      
      protected function _13679(param1:_13510) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_13496 = null;
         this.flag = param1.flag;
         this._1870 = param1._1870;
         this.currentPosition = param1.currentPosition;
         this.scale = param1.scale;
         this.offset = param1.offset;
         var _loc5_:Array = [];
         _loc2_ = 0;
         _loc3_ = int(param1._1816.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = param1._1816[_loc2_];
            _loc5_.push(_loc4_.clone());
            _loc2_++;
         }
         this._1816 = _loc5_;
      }
      
      public function _5819(param1:int) : Boolean
      {
         return this.getFrameByIndex(param1) != null;
      }
   }
}

