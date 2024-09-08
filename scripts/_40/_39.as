package _40
{
   import _51._50;
   import _51._52;
   import _51._70;
   import _51._79;
   import _73._74;
   import _81._90;
   import flash.utils.Dictionary;
   
   public class _39 extends TimelineVOBase implements _90
   {
      private var _1865:Dictionary;
      
      private var _1864:Dictionary;
      
      private var _1867:Dictionary;
      
      private var _name:String;
      
      public var rootArmatureData:_50;
      
      public var frameRate:Number;
      
      public var fadeInTime:Number = 0;
      
      public var playTimes:int;
      
      public var _1746:Array;
      
      public var _1745:Array;
      
      public var _1753:Array;
      
      public var _10657:_10599;
      
      private var _1892:int = 0;
      
      public var tweenEasing:Number;
      
      public var autoTween:Boolean;
      
      public function _39(param1:Array = null, param2:int = 0, param3:Object = null)
      {
         this._1865 = new Dictionary();
         this._1864 = new Dictionary();
         this._1867 = new Dictionary();
         super(param1,param2,param3);
      }
      
      public static function _1869(param1:String, param2:Array = null, param3:int = 0, param4:Object = null) : _39
      {
         var _loc5_:_39;
         (_loc5_ = new _39(param2,param3,param4)).name = param1;
         return _loc5_;
      }
      
      public function _1871() : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:_43 = null;
         var _loc7_:_41 = null;
         var _loc8_:_48 = null;
         var _loc9_:_52 = null;
         var _loc10_:_79 = null;
         var _loc11_:* = undefined;
         var _loc12_:* = undefined;
         var _loc13_:* = undefined;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:_70 = null;
         if(!this.rootArmatureData)
         {
            return;
         }
         var _loc1_:Dictionary = new Dictionary();
         var _loc2_:Dictionary = new Dictionary();
         var _loc3_:Dictionary = new Dictionary();
         for each(_loc7_ in this._1746)
         {
            _loc1_[_loc7_._1823] = _loc7_;
         }
         for each(_loc8_ in this._1745)
         {
            _loc2_[_loc8_._1824] = _loc8_;
         }
         _loc4_ = 0;
         _loc5_ = int(this._1753.length);
         while(_loc4_ < _loc5_)
         {
            _loc6_ = this._1753[_loc4_] as _43;
            _loc3_[_loc6_._1826] = _loc6_;
            _loc4_++;
         }
         for each(_loc9_ in this.rootArmatureData._1779)
         {
            if(_loc1_[_loc9_])
            {
               delete _loc1_[_loc9_];
            }
            else
            {
               this._1746.push(this._1863(_loc9_));
            }
         }
         for each(_loc10_ in this.rootArmatureData._1780)
         {
            if(_loc2_[_loc10_])
            {
               delete _loc2_[_loc10_];
            }
            else
            {
               this._1745.push(this._1861(_loc10_));
            }
            _loc14_ = 0;
            _loc15_ = int(_loc10_._1715.length);
            while(_loc14_ < _loc15_)
            {
               _loc16_ = _loc10_._1765[_loc10_._1715[_loc14_]] as _70;
               if((Boolean(_loc16_)) && _loc16_.type == _74.MESH)
               {
                  if(_loc3_[_loc16_])
                  {
                     delete _loc3_[_loc16_];
                  }
                  else
                  {
                     this._1753.push(this._1866(_loc16_));
                  }
               }
               _loc14_++;
            }
         }
         for(_loc11_ in _loc1_)
         {
            _loc7_ = _loc1_[_loc11_] as _41;
            _loc7_._1888();
            this._1865[_loc11_] = _loc7_;
            this._1746.splice(this._1746.indexOf(_loc7_),1);
         }
         for(_loc12_ in _loc2_)
         {
            _loc8_ = _loc2_[_loc12_] as _48;
            _loc8_._1889();
            this._1864[_loc12_] = _loc8_;
            this._1745.splice(this._1745.indexOf(_loc8_),1);
         }
         for(_loc13_ in _loc3_)
         {
            _loc6_ = _loc3_[_loc13_] as _43;
            _loc6_._1887();
            this._1867[_loc13_] = _loc6_;
            this._1753.splice(this._1753.indexOf(_loc6_),1);
         }
      }
      
      private function _1863(param1:_52) : _41
      {
         var _loc2_:_41 = null;
         if(this._1865[param1] is _41)
         {
            _loc2_ = this._1865[param1] as _41;
            this._1865[param1] = null;
         }
         else
         {
            _loc2_ = _41._1869(param1);
         }
         return _loc2_;
      }
      
      private function _1861(param1:_79) : _48
      {
         var _loc2_:_48 = null;
         if(this._1864[param1] is _48)
         {
            _loc2_ = this._1864[param1] as _48;
            this._1864[param1] = null;
         }
         else
         {
            _loc2_ = _48._1869(param1);
         }
         return _loc2_;
      }
      
      private function _1866(param1:_70) : _43
      {
         var _loc2_:_43 = null;
         if(this._1867[param1] is _43)
         {
            _loc2_ = this._1867[param1] as _43;
            this._1864[param1] = null;
         }
         else
         {
            _loc2_ = _43._1869(param1);
         }
         return _loc2_;
      }
      
      public function _1874() : void
      {
         var _loc1_:_41 = null;
         var _loc2_:_48 = null;
         var _loc3_:_43 = null;
         for each(_loc1_ in this._1746)
         {
            _loc1_._1894();
         }
         for each(_loc2_ in this._1745)
         {
            _loc2_._1895();
         }
         for each(_loc3_ in this._1753)
         {
            _loc3_._1893();
         }
      }
      
      public function _1868() : void
      {
         var _loc1_:_41 = null;
         var _loc2_:_48 = null;
         var _loc3_:_43 = null;
         for each(_loc1_ in this._1746)
         {
            _loc1_._1888();
         }
         for each(_loc2_ in this._1745)
         {
            _loc2_._1889();
         }
         for each(_loc3_ in this._1753)
         {
            _loc3_._1887();
         }
         if(this._10657)
         {
            this._10657._10661();
         }
      }
      
      public function _1858(param1:Number) : void
      {
         var _loc2_:_41 = null;
         var _loc3_:_48 = null;
         var _loc4_:_43 = null;
         for each(_loc2_ in this._1746)
         {
            _loc2_._1858(param1);
         }
         for each(_loc3_ in this._1745)
         {
            _loc3_._1858(param1);
         }
         for each(_loc4_ in this._1753)
         {
            _loc4_._1858(param1);
         }
         if(this._10657)
         {
            this._10657._1858(param1);
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      override public function get duration() : int
      {
         return this._1892;
      }
      
      public function set duration(param1:int) : void
      {
         this._1892 = param1;
      }
      
      public function _1873(param1:_52) : _41
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._1746.length);
         while(_loc2_ < _loc3_)
         {
            if(this._1746[_loc2_]._1823 == param1)
            {
               return this._1746[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function _1860(param1:String) : _41
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._1746.length);
         while(_loc2_ < _loc3_)
         {
            if(this._1746[_loc2_]._1823.name == param1)
            {
               return this._1746[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function _1875(param1:_79) : _48
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._1745.length);
         while(_loc2_ < _loc3_)
         {
            if(this._1745[_loc2_]._1824 == param1)
            {
               return this._1745[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function _1859(param1:String) : _48
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._1745.length);
         while(_loc2_ < _loc3_)
         {
            if(this._1745[_loc2_]._1824.name == param1)
            {
               return this._1745[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function _1881(param1:_70) : _43
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._1753.length);
         while(_loc2_ < _loc3_)
         {
            if(this._1753[_loc2_]._1826 == param1)
            {
               return this._1753[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function _1862(param1:String, param2:String) : _43
      {
         var _loc3_:_43 = null;
         var _loc4_:int = 0;
         var _loc5_:int = int(this._1753.length);
         while(_loc4_ < _loc5_)
         {
            _loc3_ = this._1753[_loc4_] as _43;
            if(_loc3_._1826._1760.name == param2 && _loc3_._1826.name == param1)
            {
               return _loc3_;
            }
            _loc4_++;
         }
         return null;
      }
      
      override public function clone() : TimelineVOBase
      {
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:Array = null;
         var _loc1_:_39 = new _39();
         _loc1_.currentPosition = this.currentPosition;
         _loc1_._1870 = this._1870;
         _loc1_._1890 = this._1890;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:int = int(_1885.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_.push(_1885[_loc3_].clone());
            _loc3_++;
         }
         _loc1_._1816 = _loc2_;
         _loc1_.name = this._name;
         _loc1_.frameRate = this.frameRate;
         _loc1_.fadeInTime = this.fadeInTime;
         _loc1_.playTimes = this.playTimes;
         if(this._1746)
         {
            _loc5_ = [];
            _loc3_ = 0;
            _loc4_ = int(this._1746.length);
            while(_loc3_ < _loc4_)
            {
               _loc5_.push(this._1746[_loc3_].clone());
               _loc3_++;
            }
            _loc1_._1746 = _loc5_;
         }
         if(this._1745)
         {
            _loc6_ = [];
            _loc3_ = 0;
            _loc4_ = int(this._1745.length);
            while(_loc3_ < _loc4_)
            {
               _loc6_.push(this._1745[_loc3_].clone());
               _loc3_++;
            }
            _loc1_._1745 = _loc6_;
         }
         if(this._1753)
         {
            _loc7_ = [];
            _loc3_ = 0;
            _loc4_ = int(this._1753.length);
            while(_loc3_ < _loc4_)
            {
               _loc7_.push(this._1753[_loc3_].clone());
               _loc3_++;
            }
            _loc1_._1753 = _loc7_;
         }
         if(this._10657)
         {
            _loc1_._10657 = this._10657.clone() as _10599;
         }
         return _loc1_;
      }
      
      public function _1891(param1:BoneFrameVO) : Boolean
      {
         var _loc2_:_52 = param1._1823;
         var _loc3_:_79 = _loc2_._1882;
         var _loc4_:_48 = this._1875(_loc3_);
         var _loc5_:_47;
         return (Boolean(_loc5_ = _loc4_.getFrameByIndex(param1.startPos) as _47)) && _loc5_._1732 == null;
      }
   }
}

