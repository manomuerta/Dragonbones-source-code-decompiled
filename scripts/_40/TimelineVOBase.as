package _40
{
   import _35.HashObject;
   
   public class TimelineVOBase extends HashObject
   {
      protected var _1941:Array;
      
      protected var _1885:Array;
      
      protected var _1940:Array;
      
      public var currentPosition:Number;
      
      public var _1870:int;
      
      public var _1890:Boolean;
      
      public function TimelineVOBase(param1:Array = null, param2:int = 0, param3:Object = null)
      {
         super(param2,param3);
         this._1816 = !!param1 ? param1 : [];
         this.refresh();
      }
      
      public function refresh() : void
      {
         this.currentPosition = 0;
         this._1870 = 0;
         this._1890 = false;
      }
      
      public function moveFrame(param1:int, param2:int) : void
      {
         var _loc3_:_45 = this.getFrameByIndex(param1);
         var _loc4_:_45 = this.getFrameByIndex(param2);
         if(_loc4_)
         {
            throw new Error("bug moveFrame command");
         }
         this._1943(_loc3_);
         this.addKeyFrameAt(_loc3_,param2);
      }
      
      public function addKeyFrameAt(param1:_45, param2:int) : int
      {
         param1.startPos = param2;
         this._1885.push(param1);
         this._1942();
         this._1932();
         return this._1885.indexOf(param1);
      }
      
      public function _1942() : void
      {
         var _loc1_:_45 = null;
         var _loc2_:_45 = null;
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
      
      public function _1943(param1:_45) : int
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
         var _loc4_:_45 = null;
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
            (this._1940[_loc4_.endPos] as _45).startPos = _loc4_.endPos;
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
         var _loc4_:_45 = null;
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
            _loc4_.duration -= param2;
            (this._1940[_loc4_.endPos] as _45).startPos = _loc4_.endPos;
            this._1940.splice(param1,param2);
         }
      }
      
      public function _1934(param1:int) : _45
      {
         var _loc2_:_45 = this._1938(param1);
         var _loc3_:int = int(this._1885.indexOf(_loc2_));
         return this._1885[_loc3_ + 1];
      }
      
      public function _11281(param1:int) : _45
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
         if(this._1940[param1] is _45)
         {
            return this._1940[param1];
         }
         if(this._1940[param1] == 0 && this._1940[0] == 0)
         {
            return null;
         }
         return this._1940[this._1940[param1]];
      }
      
      public function _1933(param1:int) : _45
      {
         var _loc2_:_45 = null;
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
      
      public function _1938(param1:int) : _45
      {
         if(param1 < 0 || param1 >= this._1940.length)
         {
            return null;
         }
         if(this._1940[param1] is _45)
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
         var _loc4_:_45 = null;
         var _loc5_:int = 0;
         this._1940 = [];
         var _loc3_:_45 = this._1885[0];
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
         var _loc3_:_45 = this._1940[_loc2_] as _45;
         if(_loc3_ == null)
         {
            _loc3_ = this._1940[this._1940[_loc2_]] as _45;
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
         var _loc2_:_45 = null;
         var _loc3_:_45 = null;
         var _loc6_:_45 = null;
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
      
      public function getFrameByIndex(param1:int) : _45
      {
         if(param1 < this._1940.length && this._1940[param1] is _45)
         {
            return this._1940[param1];
         }
         return null;
      }
      
      public function _1936(param1:int) : Array
      {
         var _loc2_:_45 = null;
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         var _loc5_:int = int(this._1885.length);
         while(_loc4_ < _loc5_)
         {
            _loc2_ = this._1885[_loc4_] as _45;
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
         return this._1885.length > 0 ? (this._1885[this._1885.length - 1] as _45).endPos : 0;
      }
      
      public function _1944(param1:int, param2:int) : Array
      {
         var _loc4_:_45 = null;
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
      
      public function clone() : TimelineVOBase
      {
         var _loc1_:TimelineVOBase = new TimelineVOBase();
         _loc1_.currentPosition = this.currentPosition;
         _loc1_._1870 = this._1870;
         _loc1_._1890 = this._1890;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:int = int(this._1885.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_.push(this._1885[_loc3_].clone());
            _loc3_++;
         }
         _loc1_._1816 = _loc2_;
         return _loc1_;
      }
   }
}

