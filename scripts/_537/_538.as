package _537
{
   import _1038._1042;
   import _40.BoneFrameVO;
   import _40.TimelineVOBase;
   import _40._10598;
   import _40._42;
   import _40._45;
   import _40._47;
   import _676._10613;
   import _676._675;
   import _676._683;
   import _676._688;
   import _676._689;
   import _676._690;
   import _676._699;
   import _703._704;
   import _703._705;
   import _93._94;
   import flash.utils.Dictionary;
   
   public class _538 extends _94
   {
      protected var _3889:_1042;
      
      protected var _3896:_675;
      
      protected var _3894:Array;
      
      protected var _3887:Vector.<_690>;
      
      protected var _3902:Vector.<_539>;
      
      protected var _3930:Vector.<_539>;
      
      protected var _3901:_539;
      
      public var _3445:int = -1;
      
      public function _538()
      {
         this._3894 = [];
         this._3887 = new Vector.<_690>();
         this._3902 = new Vector.<_539>();
         this._3930 = new Vector.<_539>();
         super();
      }
      
      public function set _3912(param1:_1042) : void
      {
         this._3889 = param1;
         this._3896 = this._3889.source as _675;
      }
      
      public function get _3910() : Vector.<_690>
      {
         return this._3887;
      }
      
      public function get _3916() : Array
      {
         return this._3894;
      }
      
      public function get _3915() : Boolean
      {
         return this._3887.length > 0;
      }
      
      public function get _3929() : Boolean
      {
         return this._3887.length == 1;
      }
      
      public function get _3918() : Boolean
      {
         var _loc1_:_690 = null;
         var _loc2_:int = 0;
         var _loc3_:int = int(this._3887.length);
         while(_loc2_ < _loc3_)
         {
            _loc1_ = this._3887[_loc2_];
            if(!_loc1_._1946.tweenEnabled)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function get _3911() : Boolean
      {
         var _loc1_:_690 = null;
         if(this._3894.length == 0)
         {
            return false;
         }
         return !this._3918;
      }
      
      protected function _3899(param1:int) : _539
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._3902.length);
         while(_loc2_ < _loc3_)
         {
            if(this._3902[_loc2_].id == param1)
            {
               this._3901 = this._3902[_loc2_];
               return this._3901;
            }
            _loc2_++;
         }
         if(this._3930.length > 0)
         {
            this._3901 = this._3930.pop();
         }
         else
         {
            this._3901 = new _539();
         }
         this._3901.id = param1;
         this._3902.push(this._3901);
         return this._3901;
      }
      
      public function isSelected(param1:_45) : Boolean
      {
         return this._3894.indexOf(param1) != -1;
      }
      
      private function _3931(param1:_45, param2:int) : Boolean
      {
         var _loc3_:_539 = null;
         var _loc4_:int = 0;
         var _loc5_:int = int(this._3902.length);
         while(_loc4_ < _loc5_)
         {
            _loc3_ = this._3902[_loc4_];
            if(_loc3_.id != param2)
            {
               if(_loc3_._3897.indexOf(param1) != -1)
               {
                  return true;
               }
            }
            _loc4_++;
         }
         return false;
      }
      
      public function _3884(param1:Array, param2:int) : Array
      {
         var _loc4_:_45 = null;
         var _loc3_:Array = [];
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         var _loc7_:int = int(param1.length);
         while(_loc6_ < _loc7_)
         {
            _loc4_ = param1[_loc6_];
            if(!this._3931(_loc4_,param2))
            {
               _loc3_.push(_loc4_);
            }
            _loc6_++;
         }
         return _loc3_;
      }
      
      public function _3900(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean) : Boolean
      {
         return false;
      }
      
      protected function _3886(param1:_704) : TimelineVOBase
      {
         var _loc2_:TimelineVOBase = null;
         if(param1 is _683)
         {
            _loc2_ = (param1 as _683)._1880;
         }
         else if(param1 is _699)
         {
            _loc2_ = (param1 as _699)._1879;
         }
         else if(param1 is _689)
         {
            _loc2_ = (param1 as _689)._1770;
         }
         else if(param1 is _688)
         {
            _loc2_ = (param1 as _688)._3917;
         }
         else if(param1 is _10613)
         {
            _loc2_ = (param1 as _10613)._10696;
         }
         return _loc2_;
      }
      
      public function _3024() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = int(this._3902.length);
         while(_loc1_ < _loc2_)
         {
            this._3930.push(this._3902[_loc1_]);
            _loc1_++;
         }
         this._3902.length = 0;
         this._3894.length = 0;
         this._3445 = -1;
         this._3893();
      }
      
      protected function _3890(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         this._3894.length = 0;
         _loc2_ = 0;
         _loc3_ = int(param1.length);
         while(_loc2_ < _loc3_)
         {
            this._3894.push(param1[_loc2_]);
            _loc2_++;
         }
         this._3893();
      }
      
      protected function _3888(param1:Array, param2:Boolean) : void
      {
         var _loc5_:int = 0;
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         var _loc6_:int = 0;
         var _loc7_:int = int(this._3894.length);
         while(_loc6_ < _loc7_)
         {
            _loc5_ = int(param1.indexOf(this._3894[_loc6_]));
            if(_loc5_ == -1)
            {
               _loc4_.push(this._3894[_loc6_]);
            }
            else
            {
               _loc3_.push(param1.splice(_loc5_,1)[0]);
            }
            _loc6_++;
         }
         _loc7_ = int(param1.length);
         _loc6_ = 0;
         while(_loc6_ < _loc7_)
         {
            _loc4_.push(param1[_loc6_]);
            _loc6_++;
         }
         if(!param2)
         {
            _loc7_ = int(_loc3_.length);
            _loc6_ = 0;
            while(_loc6_ < _loc7_)
            {
               _loc4_.push(_loc3_[_loc6_]);
               _loc6_++;
            }
         }
         this._3894.length = 0;
         _loc6_ = 0;
         _loc7_ = int(_loc4_.length);
         while(_loc6_ < _loc7_)
         {
            this._3894.push(_loc4_[_loc6_]);
            _loc6_++;
         }
      }
      
      public function _3897(param1:Array) : void
      {
         this._3445 = -1;
         this._3890(param1);
      }
      
      public function _3892(param1:Array, param2:Boolean = true) : void
      {
         this._3445 = -1;
         this._3888(param1,param2);
      }
      
      public function _3895(param1:int) : void
      {
         this._3445 = param1;
         var _loc2_:Array = this._3896._3905(param1);
         this._3890(_loc2_);
      }
      
      public function _3891(param1:int, param2:Boolean = true) : void
      {
         if(this._3445 != -1 && this._3445 > param1)
         {
            this._3445 = param1;
         }
         var _loc3_:Array = this._3896._3905(param1);
         this._3888(_loc3_,param2);
      }
      
      public function _3893() : void
      {
         var _loc1_:_45 = null;
         var _loc2_:_690 = null;
         var _loc3_:int = 0;
         var _loc4_:int = int(this._3887.length);
         while(_loc3_ < _loc4_)
         {
            this._3887[_loc3_].selected = false;
            _loc3_++;
         }
         this._3887.length = 0;
         _loc3_ = 0;
         _loc4_ = int(this._3894.length);
         while(_loc3_ < _loc4_)
         {
            _loc1_ = this._3894[_loc3_] as _45;
            _loc2_ = _705._3137[_loc1_];
            _loc2_.selected = true;
            this._3887.push(_loc2_);
            _loc3_++;
         }
      }
      
      public function _3904() : Dictionary
      {
         var _loc1_:_45 = null;
         var _loc2_:_690 = null;
         var _loc3_:TimelineVOBase = null;
         var _loc4_:Dictionary = new Dictionary();
         var _loc5_:int = 0;
         var _loc6_:int = int(this._3887.length);
         while(_loc5_ < _loc6_)
         {
            _loc2_ = this._3887[_loc5_];
            _loc1_ = _loc2_._1946;
            _loc3_ = this._3896._3908(_loc2_);
            if(_loc4_[_loc3_] == null)
            {
               _loc4_[_loc3_] = [];
            }
            _loc4_[_loc3_].push(_loc1_);
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function _3903() : Dictionary
      {
         var _loc1_:_45 = null;
         var _loc2_:_690 = null;
         var _loc3_:TimelineVOBase = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Array = null;
         var _loc4_:Dictionary = new Dictionary();
         if(this._3445 == -1)
         {
            _loc6_ = 0;
            _loc7_ = int(this._3887.length);
            while(_loc6_ < _loc7_)
            {
               _loc2_ = this._3887[_loc6_];
               _loc1_ = _loc2_._1946;
               if(_loc1_.startPos >= 0)
               {
                  _loc3_ = this._3896._3908(_loc2_);
                  if(_loc3_)
                  {
                     if(_loc4_[_loc3_] == null)
                     {
                        _loc5_ = _loc3_._1936(_loc1_.startPos - 1);
                        if(_loc5_.length > 0)
                        {
                           _loc4_[_loc3_] = _loc5_;
                        }
                     }
                     else
                     {
                        _loc5_ = _loc3_._1936(_loc1_.startPos - 1);
                        if(_loc4_[_loc3_].length < _loc5_.length)
                        {
                           _loc4_[_loc3_] = _loc5_;
                        }
                     }
                  }
               }
               _loc6_++;
            }
         }
         else
         {
            _loc8_ = this._3896._3914();
            _loc6_ = 0;
            _loc7_ = int(_loc8_.length);
            while(_loc6_ < _loc7_)
            {
               _loc3_ = _loc8_[_loc6_];
               if(_loc4_[_loc3_] == null)
               {
                  _loc5_ = _loc3_._1936(this._3445 - 1);
                  if(_loc5_.length > 0)
                  {
                     _loc4_[_loc3_] = _loc5_;
                  }
               }
               _loc6_++;
            }
         }
         return _loc4_;
      }
      
      public function _3442(param1:int) : void
      {
         if(this._3445 != -1)
         {
            this._3445 += param1;
         }
      }
      
      public function _3920() : void
      {
         var _loc1_:_45 = null;
         var _loc2_:_690 = null;
         var _loc3_:TimelineVOBase = null;
         var _loc4_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc5_:Array = [];
         if(this._3887.length > 0)
         {
            _loc6_ = 0;
            _loc7_ = int(this._3887.length);
            while(_loc6_ < _loc7_)
            {
               _loc2_ = this._3887[_loc6_];
               _loc1_ = _loc2_._1946;
               _loc5_.push(_loc1_);
               _loc1_.startDrag();
               _loc2_.frameIndex = _loc1_.startPos;
               _loc6_++;
            }
            _loc4_ = this._3906(_loc5_);
            _loc6_ = 0;
            _loc7_ = int(_loc4_.length);
            while(_loc6_ < _loc7_)
            {
               _loc3_ = _loc4_[_loc6_];
               _loc3_.startDrag();
               _loc6_++;
            }
         }
      }
      
      public function _3926() : void
      {
         var _loc1_:_45 = null;
         var _loc2_:_690 = null;
         var _loc3_:TimelineVOBase = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc4_:Array = [];
         var _loc5_:Array = [];
         if(this._3887.length > 0)
         {
            _loc6_ = 0;
            _loc7_ = int(this._3887.length);
            while(_loc6_ < _loc7_)
            {
               _loc1_ = this._3887[_loc6_]._1946;
               _loc1_.endDrag();
               _loc4_.push(_loc1_);
               _loc2_ = _705._3137[_loc1_];
               _loc2_.frameIndex = _loc1_.startPos;
               _loc6_++;
            }
            _loc5_ = this._3906(_loc4_);
            _loc6_ = 0;
            _loc7_ = int(_loc5_.length);
            while(_loc6_ < _loc7_)
            {
               _loc3_ = _loc5_[_loc6_];
               _loc3_._1939();
               _loc3_.endDrag();
               _loc6_++;
            }
         }
      }
      
      private function _3906(param1:Array) : Array
      {
         var _loc3_:_45 = null;
         var _loc4_:_690 = null;
         var _loc5_:TimelineVOBase = null;
         var _loc2_:Array = [];
         var _loc6_:int = 0;
         var _loc7_:int = int(param1.length);
         while(_loc6_ < _loc7_)
         {
            _loc3_ = param1[_loc6_];
            _loc4_ = _705._3137[_loc3_];
            _loc5_ = this._3896._3908(_loc4_);
            if(_loc5_ != null && _loc2_.indexOf(_loc5_) == -1)
            {
               _loc2_.push(_loc5_);
            }
            _loc6_++;
         }
         return _loc2_;
      }
      
      public function _3921(param1:Array, param2:int) : Boolean
      {
         var _loc3_:_45 = null;
         var _loc4_:_690 = null;
         var _loc5_:TimelineVOBase = null;
         var _loc8_:Boolean = false;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc6_:Object = {};
         var _loc7_:Array = [];
         var _loc11_:int = 0;
         var _loc12_:int = int(param1.length);
         while(_loc11_ < _loc12_)
         {
            _loc3_ = param1[_loc11_];
            _loc9_ = _loc3_.duration;
            _loc3_.startPos += param2;
            _loc4_ = _705._3137[_loc3_];
            if(_loc4_)
            {
               _loc4_.frameIndex = _loc3_.startPos;
               _loc10_ = _loc3_.duration;
               if((_loc9_ == 0 || _loc10_ == 0) && _loc9_ != _loc10_)
               {
                  _loc8_ = true;
               }
            }
            _loc11_++;
         }
         _loc7_ = this._3906(param1);
         _loc11_ = 0;
         _loc12_ = int(_loc7_.length);
         while(_loc11_ < _loc12_)
         {
            _loc5_ = _loc7_[_loc11_];
            _loc5_._1939();
            _loc11_++;
         }
         this._3924(param2);
         return _loc8_;
      }
      
      public function _3927(param1:int, param2:Boolean) : Boolean
      {
         return false;
      }
      
      public function _3922() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = int(this._3902.length);
         while(_loc1_ < _loc2_)
         {
            this._3902[_loc1_]._3928();
            _loc1_++;
         }
      }
      
      public function _3924(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._3902.length);
         while(_loc2_ < _loc3_)
         {
            this._3902[_loc2_]._3924(param1);
            _loc2_++;
         }
      }
      
      public function _3919(param1:Array, param2:int, param3:int, param4:int, param5:Boolean) : Boolean
      {
         var _loc6_:_45 = null;
         var _loc7_:_690 = null;
         var _loc8_:TimelineVOBase = null;
         var _loc11_:Boolean = false;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc17_:int = 0;
         var _loc9_:Object = {};
         var _loc10_:Array = [];
         var _loc14_:Number = param2 / (param4 - param3);
         var _loc15_:int = 0;
         var _loc16_:int = int(param1.length);
         while(_loc15_ < _loc16_)
         {
            _loc6_ = param1[_loc15_];
            _loc12_ = _loc6_.duration;
            _loc17_ = param5 ? int(Math.round((_loc6_._1916 - param3) * _loc14_)) : int(Math.round((param4 - _loc6_._1916) * _loc14_));
            _loc6_.startPos = _loc6_._1916 + _loc17_;
            if(_loc6_.startPos < 0)
            {
               _loc6_.startPos = 0;
            }
            (_loc7_ = _705._3137[_loc6_]).frameIndex = _loc6_.startPos;
            _loc13_ = _loc6_.duration;
            if((_loc12_ == 0 || _loc13_ == 0) && _loc12_ != _loc13_)
            {
               _loc11_ = true;
            }
            _loc15_++;
         }
         _loc10_ = this._3906(param1);
         _loc15_ = 0;
         _loc16_ = int(_loc10_.length);
         while(_loc15_ < _loc16_)
         {
            _loc8_ = _loc10_[_loc15_];
            _loc8_._1939();
            _loc15_++;
         }
         return _loc11_;
      }
      
      public function _3909() : Object
      {
         var _loc2_:TimelineVOBase = null;
         var _loc3_:_690 = null;
         var _loc4_:String = null;
         var _loc7_:String = null;
         var _loc1_:Object = {
            "bones":{},
            "slots":{},
            "_2851":{},
            "event":[],
            "zOrder":[]
         };
         var _loc5_:int = 0;
         var _loc6_:int = int(this._3887.length);
         while(_loc5_ < _loc6_)
         {
            _loc3_ = this._3887[_loc5_];
            if(_loc3_._1946 is BoneFrameVO)
            {
               _loc4_ = (_loc3_._1946 as BoneFrameVO)._1823.name;
               if(_loc1_.bones[_loc4_] == null)
               {
                  _loc1_.bones[_loc4_] = [];
               }
               _loc1_.bones[_loc4_].push(_loc3_._1946);
            }
            else if(_loc3_._1946 is _47)
            {
               _loc4_ = (_loc3_._1946 as _47)._1824.name;
               if(_loc1_.slots[_loc4_] == null)
               {
                  _loc1_.slots[_loc4_] = [];
               }
               _loc1_.slots[_loc4_].push(_loc3_._1946);
            }
            else if(_loc3_._1946 is _42)
            {
               _loc7_ = (_loc3_._1946 as _42)._1826._1760.name;
               _loc4_ = (_loc3_._1946 as _42)._1826.name;
               if(_loc1_._2851[_loc7_] == null)
               {
                  _loc1_._2851[_loc7_] = {};
               }
               if(_loc1_._2851[_loc7_][_loc4_] == null)
               {
                  _loc1_._2851[_loc7_][_loc4_] = [];
               }
               _loc1_._2851[_loc7_][_loc4_].push(_loc3_._1946);
            }
            else if(_loc3_._1946 is _10598)
            {
               _loc1_.zOrder.push(_loc3_._1946);
            }
            else if(_loc3_._1946 is _45)
            {
               _loc1_.event.push(_loc3_._1946);
            }
            _loc5_++;
         }
         return _loc1_;
      }
      
      public function get _3907() : Boolean
      {
         var _loc1_:_45 = null;
         var _loc2_:_690 = null;
         var _loc3_:TimelineVOBase = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Array = null;
         var _loc4_:Object = {};
         var _loc5_:int = 0;
         if(this._3445 == -1)
         {
            _loc6_ = 0;
            _loc7_ = int(this._3887.length);
            while(_loc6_ < _loc7_)
            {
               _loc2_ = this._3887[_loc6_];
               _loc1_ = _loc2_._1946;
               _loc3_ = this._3896._3908(_loc2_);
               if(_loc3_ != null)
               {
                  if(_loc4_[_loc3_.id] == null)
                  {
                     _loc4_[_loc3_.id] = [];
                  }
                  _loc5_ += _loc3_._1936(_loc1_.startPos - 1).length;
                  if(_loc5_ += _loc3_._1936(_loc1_.startPos - 1).length > 0)
                  {
                     return true;
                  }
               }
               _loc6_++;
            }
         }
         else
         {
            _loc8_ = this._3896._3914();
            _loc6_ = 0;
            _loc7_ = int(_loc8_.length);
            while(_loc6_ < _loc7_)
            {
               _loc3_ = _loc8_[_loc6_];
               if(_loc4_[_loc3_.id] == null)
               {
                  _loc4_[_loc3_.id] = _loc3_._1936(this._3445 - 1);
                  _loc5_ += _loc3_._1936(this._3445 - 1).length;
                  if(_loc5_ += _loc3_._1936(this._3445 - 1).length > 0)
                  {
                     return true;
                  }
               }
               _loc6_++;
            }
         }
         return _loc5_ > 0;
      }
      
      public function get _3913() : Boolean
      {
         var _loc1_:_45 = null;
         var _loc2_:_690 = null;
         var _loc3_:TimelineVOBase = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
         var _loc4_:Dictionary = new Dictionary();
         var _loc5_:int = 0;
         var _loc6_:Array = [];
         if(this._3445 == -1)
         {
            _loc7_ = 0;
            _loc8_ = int(this._3887.length);
            while(_loc7_ < _loc8_)
            {
               _loc2_ = this._3887[_loc7_];
               _loc1_ = _loc2_._1946;
               if(_loc1_.startPos > 0)
               {
                  _loc3_ = this._3896._3908(_loc2_);
                  if(_loc3_ != null)
                  {
                     if(_loc4_[_loc3_] == null)
                     {
                        _loc4_[_loc3_] = _loc1_;
                        if(Boolean(_loc3_) && _loc6_.indexOf(_loc3_) == -1)
                        {
                           _loc6_.push(_loc3_);
                        }
                     }
                     else if(_loc1_.startPos < _loc4_[_loc3_].startPos)
                     {
                        _loc4_[_loc3_] = _loc1_;
                     }
                  }
               }
               _loc7_++;
            }
            _loc7_ = 0;
            _loc8_ = int(_loc6_.length);
            while(_loc7_ < _loc8_)
            {
               _loc3_ = _loc6_[_loc7_];
               _loc1_ = _loc4_[_loc3_];
               if(_loc1_)
               {
                  if(_loc3_.getFrameByIndex(_loc1_.startPos - 1) != null)
                  {
                     return false;
                  }
                  _loc5_ += _loc3_._1936(_loc1_.startPos - 1).length;
               }
               _loc7_++;
            }
         }
         else
         {
            if(this._3445 <= 0)
            {
               return false;
            }
            _loc9_ = this._3896._3914();
            _loc7_ = 0;
            _loc8_ = int(_loc9_.length);
            while(_loc7_ < _loc8_)
            {
               _loc3_ = _loc9_[_loc7_];
               if(_loc3_.getFrameByIndex(this._3445 - 1) != null)
               {
                  return false;
               }
               if(_loc4_[_loc3_.id] == null)
               {
                  _loc4_[_loc3_.id] = _loc3_._1936(this._3445 - 1);
                  _loc5_ += _loc3_._1936(this._3445 - 1).length;
               }
               _loc7_++;
            }
         }
         return _loc5_ > 0;
      }
   }
}

