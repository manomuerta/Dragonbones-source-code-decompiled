package _676
{
   import _1038._1037;
   import _40.BoneFrameVO;
   import _40.TimelineVOBase;
   import _40._10598;
   import _40._10599;
   import _40._39;
   import _40._41;
   import _40._42;
   import _40._43;
   import _40._45;
   import _40._47;
   import _40._48;
   import _51._50;
   import _51._52;
   import _51._70;
   import _51._79;
   import _703._702;
   import _703._704;
   import _703._705;
   import flash.utils.Dictionary;
   
   public class _675 extends _704
   {
      private static var _1865:Dictionary = new Dictionary();
      
      private static var _1864:Dictionary = new Dictionary();
      
      private static var _1867:Dictionary = new Dictionary();
      
      private static var _10801:Dictionary = new Dictionary();
      
      private var _5820:Vector.<_690>;
      
      public var frames:_1037;
      
      private var _11745:int;
      
      private var _5228:int;
      
      public var locked:Boolean = true;
      
      public function _675()
      {
         super();
         this._5820 = new Vector.<_690>();
      }
      
      public static function _3996(param1:_702, param2:_39) : _675
      {
         var _loc3_:_675 = new _675();
         _loc3_.parent = param1;
         _loc3_._1992 = param2;
         _705._4015[param2] = _loc3_;
         return _loc3_;
      }
      
      public static function _2886(param1:_50, param2:_675) : void
      {
         param2._4570();
      }
      
      private static function _5814(param1:_52, param2:_39) : _41
      {
         var _loc3_:_41 = null;
         if(Boolean(_1865[param2]) && _1865[param2][param1] is _41)
         {
            _loc3_ = _1865[param2][param1] as _41;
            _loc3_._1894();
            _1865[param2][param1] = null;
         }
         else
         {
            _loc3_ = _41._1869(param1);
         }
         return _loc3_;
      }
      
      private static function _5813(param1:_79, param2:_39) : _48
      {
         var _loc3_:_48 = null;
         if(Boolean(_1864[param2]) && _1864[param2][param1] is _48)
         {
            _loc3_ = _1864[param2][param1] as _48;
            _loc3_._1895();
            _1864[param2][param1] = null;
         }
         else
         {
            _loc3_ = _48._1869(param1);
         }
         return _loc3_;
      }
      
      private static function _5816(param1:_70, param2:_39) : _43
      {
         var _loc3_:_43 = null;
         if(Boolean(_1867[param2]) && _1867[param2][param1] is _43)
         {
            _loc3_ = _1867[param2][param1] as _43;
            _loc3_._1893();
            _1867[param2][param1] = null;
         }
         else
         {
            _loc3_ = _43._1869(param1);
         }
         return _loc3_;
      }
      
      private static function _10802(param1:_39) : _10599
      {
         var _loc2_:_10599 = null;
         if(_10801[param1] is _10599)
         {
            _loc2_ = _10801[param1] as _10599;
            _10801[param1] = null;
         }
         else
         {
            _loc2_ = _10599._1869(param1.rootArmatureData);
         }
         return _loc2_;
      }
      
      private static function _10804(param1:TimelineVOBase, param2:_45) : _701
      {
         var _loc3_:_701 = null;
         if(param1 is _41 && param2 is BoneFrameVO)
         {
            _loc3_ = _705._1876[param1];
         }
         else if(param1 is _48 && param2 is _47)
         {
            _loc3_ = _705._1877[param1];
         }
         else if(param1 is _43 && param2 is _42)
         {
            _loc3_ = _705._1878[param1];
         }
         else if(param1 is _10599 && param2 is _10598)
         {
            _loc3_ = _705._10706[param1];
         }
         else if(param1 is _39 && param2 is _45)
         {
            _loc3_ = _705._3393[param1];
         }
         return _loc3_;
      }
      
      public static function addFrame(param1:TimelineVOBase, param2:_45) : void
      {
         var _loc3_:_701 = null;
         var _loc4_:_79 = null;
         var _loc5_:_52 = null;
         if(param1 == null || param2 == null)
         {
            return;
         }
         _loc3_ = _10804(param1,param2);
         if(_loc3_)
         {
            _loc3_.addFrame(param2);
         }
         else
         {
            param1.addKeyFrameAt(param2,param2.startPos);
         }
      }
      
      public static function delFrame(param1:TimelineVOBase, param2:_45) : void
      {
         var _loc3_:_701 = null;
         if(param1 == null || param2 == null)
         {
            return;
         }
         _loc3_ = _10804(param1,param2);
         if(_loc3_)
         {
            _loc3_.delFrame(param2);
         }
         else
         {
            param1._1943(param2);
         }
      }
      
      public static function _3441(param1:TimelineVOBase, param2:Array, param3:int) : Array
      {
         var _loc4_:_45 = null;
         var _loc5_:_701 = null;
         _loc4_ = param2[0];
         _loc5_ = _10804(param1,_loc4_);
         if(_loc5_ == null)
         {
            return null;
         }
         return _loc5_._3413(param2,param3);
      }
      
      public static function _3450(param1:TimelineVOBase, param2:Array) : Array
      {
         var _loc3_:_45 = null;
         var _loc4_:_701 = null;
         _loc3_ = param2[0].frame;
         _loc4_ = _10804(param1,_loc3_);
         if(_loc4_ == null)
         {
            return null;
         }
         return _loc4_._5818(param2);
      }
      
      public static function _11629(param1:TimelineVOBase, param2:int = -1) : Vector.<_45>
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Vector.<_45> = new Vector.<_45>();
         if(param1 is _41)
         {
            if(Boolean(param1._1816) && param1._1816.length > 2)
            {
               _loc3_ = 1;
               _loc4_ = int(param1._1816.length);
               while(_loc3_ < _loc4_)
               {
                  if(_11739(param1._1816[_loc3_ - 1] as BoneFrameVO,param1._1816[_loc3_] as BoneFrameVO,_loc3_ < _loc4_ - 1 ? param1._1816[_loc3_ + 1] as BoneFrameVO : null))
                  {
                     _loc5_.push(param1._1816[_loc3_]);
                  }
                  _loc3_++;
               }
            }
         }
         else if(param1 is _48)
         {
            if(Boolean(param1._1816) && param1._1816.length > 2)
            {
               _loc3_ = 1;
               _loc4_ = int(param1._1816.length);
               while(_loc3_ < _loc4_)
               {
                  if(_11740(param1._1816[_loc3_ - 1] as _47,param1._1816[_loc3_] as _47,_loc3_ < _loc4_ - 1 ? param1._1816[_loc3_ + 1] as _47 : null))
                  {
                     _loc5_.push(param1._1816[_loc3_]);
                  }
                  _loc3_++;
               }
            }
         }
         else if(param1 is _10599)
         {
            if(Boolean(param1._1816) && param1._1816.length > 2)
            {
               _loc3_ = 1;
               _loc4_ = int(param1._1816.length);
               while(_loc3_ < _loc4_)
               {
                  if(_11737(param1._1816[_loc3_ - 1] as _10598,param1._1816[_loc3_] as _10598,_loc3_ < _loc4_ - 1 ? param1._1816[_loc3_ + 1] as _10598 : null))
                  {
                     _loc5_.push(param1._1816[_loc3_]);
                  }
                  _loc3_++;
               }
            }
         }
         else if(param1 is _43)
         {
            if(Boolean(param1._1816) && param1._1816.length > 2)
            {
               _loc3_ = 1;
               _loc4_ = int(param1._1816.length);
               while(_loc3_ < _loc4_)
               {
                  if(_11742(param1._1816[_loc3_ - 1] as _42,param1._1816[_loc3_] as _42,_loc3_ < _loc4_ - 1 ? param1._1816[_loc3_ + 1] as _42 : null))
                  {
                     _loc5_.push(param1._1816[_loc3_]);
                  }
                  _loc3_++;
               }
            }
         }
         else if(param1 is _39)
         {
            if(Boolean(param1._1816) && param1._1816.length > 1)
            {
               _loc3_ = 0;
               _loc4_ = int(param1._1816.length);
               while(_loc3_ < _loc4_)
               {
                  if(_11738(_loc3_ > 0 ? param1._1816[_loc3_ - 1] : null,param1._1816[_loc3_],_loc3_ < _loc4_ - 1 ? param1._1816[_loc3_ + 1] : null,param2))
                  {
                     _loc5_.push(param1._1816[_loc3_]);
                  }
                  _loc3_++;
               }
            }
         }
         return _loc5_;
      }
      
      public static function _11739(param1:BoneFrameVO, param2:BoneFrameVO, param3:BoneFrameVO) : Boolean
      {
         if(Boolean(param1) && Boolean(param2) && Boolean(param3))
         {
            if(param1.tweenRotate == 0 && param2.tweenRotate == 0)
            {
               if(param1.tweenEnabled || param2.tweenEnabled)
               {
                  if(param1.transform._2207(param2.transform) && param2.transform._2207(param3.transform) && (param2._1636 == null || param2._1636.length == 0))
                  {
                     return true;
                  }
               }
               else if(param1.transform._2207(param2.transform) && (param2._1636 == null || param2._1636.length == 0))
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public static function _11740(param1:_47, param2:_47, param3:_47) : Boolean
      {
         if(Boolean(param1) && Boolean(param2) && Boolean(param3))
         {
            if(param1.tweenEnabled || param2.tweenEnabled)
            {
               if(param1.colorTransform._2196(param2.colorTransform) && param2.colorTransform._2196(param3.colorTransform) && param1._1732 == param2._1732 && param2._1732 == param3._1732 && (param2.gotoAndPlay == "" || param2.gotoAndPlay == null))
               {
                  return true;
               }
            }
            else if(param1.colorTransform._2196(param2.colorTransform) && param1._1732 == param2._1732 && (param2.gotoAndPlay == "" || param2.gotoAndPlay == null))
            {
               return true;
            }
         }
         return false;
      }
      
      public static function _11737(param1:_10598, param2:_10598, param3:_10598) : Boolean
      {
         if(Boolean(param1) && Boolean(param2) && Boolean(param3))
         {
            if(_11747(param1.zOrder,param2.zOrder))
            {
               return true;
            }
         }
         return false;
      }
      
      public static function _11738(param1:_45, param2:_45, param3:_45, param4:int) : Boolean
      {
         if(param2)
         {
            if(param4 < 0)
            {
               if(Boolean(param3) && (param2._1636 == null || param2._1636.length == 0))
               {
                  return true;
               }
            }
            else if(param2.startPos < param4 && (param2._1636 == null || param2._1636.length == 0))
            {
               return true;
            }
         }
         return false;
      }
      
      private static function _11747(param1:Array, param2:Array) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(Boolean(param1) && Boolean(param2))
         {
            if(param1.length != param2.length)
            {
               return false;
            }
            _loc3_ = 0;
            _loc4_ = int(param1.length);
            while(_loc3_ < _loc4_)
            {
               if(param1[_loc3_] != param2[_loc3_])
               {
                  return false;
               }
               _loc3_++;
            }
            return true;
         }
         return false;
      }
      
      public static function _11742(param1:_42, param2:_42, param3:_42) : Boolean
      {
         if(Boolean(param1) && Boolean(param2) && Boolean(param3))
         {
            if(param1.tweenEnabled || param2.tweenEnabled)
            {
               if(param1._1826 == param2._1826 && param2._1826 == param3._1826 && _11748(param1.ffd,param2.ffd) && _11748(param2.ffd,param3.ffd))
               {
                  return true;
               }
            }
            else if(param1._1826 == param2._1826 && _11748(param1.ffd,param2.ffd))
            {
               return true;
            }
         }
         return false;
      }
      
      private static function _11748(param1:Vector.<Number>, param2:Vector.<Number>) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(Boolean(param1) && Boolean(param1))
         {
            if(param1.length != param2.length)
            {
               return false;
            }
            _loc3_ = 0;
            _loc4_ = int(param1.length);
            while(_loc3_ < _loc4_)
            {
               if(param1[_loc3_] != param2[_loc3_])
               {
                  return false;
               }
               _loc3_++;
            }
            return true;
         }
         return false;
      }
      
      public function set name(param1:String) : void
      {
         if(this._1992)
         {
            this._1992.name = param1;
         }
      }
      
      protected function init() : void
      {
         var _loc2_:_699 = null;
         var _loc3_:_41 = null;
         var _loc4_:_683 = null;
         var _loc5_:_48 = null;
         var _loc6_:_43 = null;
         var _loc7_:_688 = null;
         var _loc8_:_10613 = null;
         this.frames = new _1037();
         var _loc1_:Array = [];
         for each(_loc3_ in this._1992._1746)
         {
            _loc4_ = _683._3996(this,_loc3_);
            for each(_loc5_ in this._1992._1745)
            {
               if(_loc5_._1824)
               {
                  if(Boolean(_loc5_._1824.parentBoneData) && _loc5_._1824.parentBoneData.name == _loc3_.name)
                  {
                     _loc2_ = _699._3996(_loc4_,_loc5_);
                     _loc4_.children.push(_loc2_);
                     for each(_loc6_ in this._1992._1753)
                     {
                        if(_loc6_._1826)
                        {
                           if(_loc6_._1826._1760 == _loc2_._1879._1824)
                           {
                              _loc4_.children.push(_689._3996(_loc4_,_loc6_));
                           }
                        }
                     }
                  }
               }
            }
            this.children.push(_loc4_);
         }
         if(parent != null)
         {
            _loc7_ = _688._3996(this,this._1992);
            this.children.push(_loc7_);
         }
         if(parent != null && Boolean(this._1992._10657))
         {
            _loc8_ = _10613._3996(this,this._1992._10657);
            if(this._1992._10657._1816.length > 0)
            {
               this.children.push(_loc8_);
            }
         }
         this.update();
      }
      
      public function _4570() : void
      {
         var _loc2_:_41 = null;
         var _loc3_:_683 = null;
         var _loc4_:_48 = null;
         var _loc5_:_699 = null;
         var _loc6_:_43 = null;
         var _loc7_:_689 = null;
         var _loc1_:Array = [];
         children.length = 0;
         for each(_loc2_ in this._1992._1746)
         {
            _loc3_ = _705._1876[_loc2_];
            if(_loc3_ == null)
            {
               _loc3_ = _683._3996(this,_loc2_);
            }
            _loc3_.children.length = 0;
            for each(_loc4_ in this._1992._1745)
            {
               if(_loc4_._1824.parentBoneData == _loc2_._1823)
               {
                  _loc5_ = _705._1877[_loc4_];
                  if(_loc5_ == null)
                  {
                     _loc5_ = _699._3996(_loc3_,_loc4_);
                  }
                  _loc3_.children.push(_loc5_);
                  for each(_loc6_ in this._1992._1753)
                  {
                     if(_loc6_._1826._1760 == _loc5_._1879._1824)
                     {
                        _loc7_ = _705._1878[_loc6_];
                        if(_loc7_ == null)
                        {
                           _loc7_ = _689._3996(_loc3_,_loc6_);
                        }
                        _loc3_.children.push(_loc7_);
                     }
                  }
               }
            }
            this.children.push(_loc3_);
         }
         children.push(_705._3393[this._1992]);
         if(Boolean(this._1992._10657) && this._1992._10657._1816.length > 0)
         {
            children.push(_705._10706[this._1992._10657]);
         }
         this.update();
      }
      
      public function _11633(param1:Vector.<_52>) : void
      {
         var _loc2_:Boolean = false;
         var _loc4_:_41 = null;
         var _loc5_:_683 = null;
         var _loc6_:_48 = null;
         var _loc7_:_699 = null;
         var _loc8_:_43 = null;
         var _loc9_:_689 = null;
         _loc2_ = Boolean(param1) && param1.length > 0;
         var _loc3_:Array = [];
         children.length = 0;
         for each(_loc4_ in this._1992._1746)
         {
            if(!_loc2_ || _loc4_._1823 && param1.indexOf(_loc4_._1823) != -1)
            {
               _loc5_ = _705._1876[_loc4_];
               if(_loc5_ == null)
               {
                  _loc5_ = _683._3996(this,_loc4_);
               }
               _loc5_.children.length = 0;
               for each(_loc6_ in this._1992._1745)
               {
                  if(_loc6_._1824.parentBoneData == _loc4_._1823)
                  {
                     _loc7_ = _705._1877[_loc6_];
                     if(_loc7_ == null)
                     {
                        _loc7_ = _699._3996(_loc5_,_loc6_);
                     }
                     _loc5_.children.push(_loc7_);
                     for each(_loc8_ in this._1992._1753)
                     {
                        if(_loc8_._1826._1760 == _loc7_._1879._1824)
                        {
                           _loc9_ = _705._1878[_loc8_];
                           if(_loc9_ == null)
                           {
                              _loc9_ = _689._3996(_loc5_,_loc8_);
                           }
                           _loc5_.children.push(_loc9_);
                        }
                     }
                  }
               }
               this.children.push(_loc5_);
            }
         }
         children.push(_705._3393[this._1992]);
         if(Boolean(this._1992._10657) && this._1992._10657._1816.length > 0)
         {
            children.push(_705._10706[this._1992._10657]);
         }
         this.update();
      }
      
      private function _5815(param1:_683, param2:_683) : int
      {
         if(Boolean(param1) && Boolean(param2))
         {
            if(param1._1880._1823.name < param2._1880._1823.name)
            {
               return -1;
            }
         }
         return 1;
      }
      
      private function getItemIndex(param1:Array, param2:int) : int
      {
         var _loc3_:int = 0;
         var _loc4_:int = int(param1.length);
         while(_loc3_ < _loc4_)
         {
            if(param2 == param1[_loc3_].frameIndex)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      private function _5817(param1:Array, param2:int) : Object
      {
         var _loc3_:int = 0;
         var _loc4_:int = int(param1.length);
         while(_loc3_ < _loc4_)
         {
            if(param2 == param1[_loc3_].frameIndex)
            {
               return param1[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      public function get _1992() : _39
      {
         return _3670 as _39;
      }
      
      public function set _1992(param1:_39) : void
      {
         if(_3670 != param1)
         {
            _3670 = param1;
            this.init();
         }
      }
      
      public function get _11746() : int
      {
         return this._11745;
      }
      
      public function get _4642() : int
      {
         return this._5228;
      }
      
      public function get _4612() : _688
      {
         var _loc1_:_701 = null;
         for each(_loc1_ in children)
         {
            if(_loc1_ is _688)
            {
               return _loc1_ as _688;
            }
         }
         return null;
      }
      
      public function get _10803() : _10613
      {
         var _loc1_:_701 = null;
         for each(_loc1_ in children)
         {
            if(_loc1_ is _10613)
            {
               return _loc1_ as _10613;
            }
         }
         return null;
      }
      
      public function update() : void
      {
         var _loc2_:_690 = null;
         var _loc6_:_701 = null;
         var _loc7_:int = 0;
         var _loc8_:_690 = null;
         var _loc9_:_690 = null;
         var _loc10_:_701 = null;
         var _loc11_:_699 = null;
         var _loc12_:_689 = null;
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = this.frames.length;
         while(_loc3_ < _loc4_)
         {
            _loc2_ = this.frames.getItemAt(_loc3_) as _690;
            if(_loc2_)
            {
               _loc2_.selected = false;
               _loc2_.parent = null;
            }
            this._5820.push(_loc2_);
            _loc3_++;
         }
         var _loc5_:Array = [];
         for each(_loc6_ in children)
         {
            if(_loc6_.frames)
            {
               _loc7_ = 0;
               _loc3_ = 0;
               _loc4_ = _loc6_.frames.length;
               while(_loc3_ < _loc4_)
               {
                  _loc8_ = _loc6_.frames.getItemAt(_loc3_) as _690;
                  if((_loc7_ = _loc8_.frameIndex) > _loc1_)
                  {
                     _loc1_ = _loc7_;
                  }
                  _loc9_ = this._5817(_loc5_,_loc7_) as _690;
                  if(_loc9_ == null)
                  {
                     (_loc9_ = this._5808(_loc8_)).selected = false;
                     _loc9_.parent = this.frames;
                     _loc9_.frames.push(_loc8_);
                     _loc5_.push(_loc9_);
                  }
                  else
                  {
                     _loc9_.frames.push(_loc8_);
                  }
                  _loc3_++;
               }
               if(_loc6_ is _683)
               {
                  for each(_loc10_ in _loc6_.children)
                  {
                     if(_loc10_ is _699)
                     {
                        _loc11_ = _loc10_ as _699;
                        _loc3_ = 0;
                        _loc4_ = _loc11_.frames.length;
                        while(_loc3_ < _loc4_)
                        {
                           _loc8_ = _loc11_.frames.getItemAt(_loc3_) as _690;
                           if((_loc7_ = _loc8_.frameIndex) > _loc1_)
                           {
                              _loc1_ = _loc7_;
                           }
                           _loc9_ = this._5817(_loc5_,_loc7_) as _690;
                           if(_loc9_ == null)
                           {
                              (_loc9_ = this._5808(_loc8_)).selected = false;
                              _loc9_.parent = this.frames;
                              _loc9_.frames.push(_loc8_);
                              _loc5_.push(_loc9_);
                           }
                           else
                           {
                              _loc9_.frames.push(_loc8_);
                           }
                           _loc3_++;
                        }
                     }
                     else if(_loc10_ is _689)
                     {
                        _loc12_ = _loc10_ as _689;
                        _loc3_ = 0;
                        _loc4_ = _loc12_.frames.length;
                        while(_loc3_ < _loc4_)
                        {
                           _loc8_ = _loc12_.frames.getItemAt(_loc3_) as _690;
                           if((_loc7_ = _loc8_.frameIndex) > _loc1_)
                           {
                              _loc1_ = _loc7_;
                           }
                           _loc9_ = this._5817(_loc5_,_loc7_) as _690;
                           if(_loc9_ == null)
                           {
                              (_loc9_ = this._5808(_loc8_)).selected = false;
                              _loc9_.parent = this.frames;
                              _loc9_.frames.push(_loc8_);
                              _loc5_.push(_loc9_);
                           }
                           else
                           {
                              _loc9_.frames.push(_loc8_);
                           }
                           _loc3_++;
                        }
                     }
                  }
               }
            }
            this.frames.source = _loc5_;
            if(_loc1_ != this._11745)
            {
               this._11745 = _loc1_;
            }
            this._11744();
         }
      }
      
      private function _11744() : void
      {
         var _loc3_:int = 0;
         var _loc4_:_41 = null;
         var _loc5_:_45 = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this._1992)
         {
            _loc3_ = this._11741(this._1992._1746,_loc3_);
            _loc3_ = this._11741(this._1992._1745,_loc3_);
            _loc3_ = this._11741(this._1992._1753,_loc3_);
            _loc3_ = this._11743(this._1992._10657,_loc3_);
            _loc3_ = this._11743(this._1992,_loc3_);
         }
         if(this._5228 != _loc3_)
         {
            this._5228 = _loc3_;
            this._1992.duration = this._5228;
         }
      }
      
      private function _11741(param1:Array, param2:int) : int
      {
         var _loc5_:TimelineVOBase = null;
         var _loc6_:_45 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1)
         {
            _loc3_ = 0;
            _loc4_ = int(param1.length);
            while(_loc3_ < _loc4_)
            {
               _loc5_ = param1[_loc3_] as TimelineVOBase;
               param2 = this._11743(_loc5_,param2);
               _loc3_++;
            }
         }
         return param2;
      }
      
      private function _11743(param1:TimelineVOBase, param2:int) : int
      {
         var _loc5_:_45 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1)
         {
            if(param1 && param1._1816 && param1._1816.length > 0)
            {
               _loc5_ = param1._1816[param1._1816.length - 1] as _45;
               if((Boolean(_loc5_)) && _loc5_.startPos > param2)
               {
                  param2 = _loc5_.startPos;
               }
            }
         }
         return param2;
      }
      
      private function _5808(param1:_690) : _690
      {
         var _loc2_:_690 = null;
         if(this._5820.length > 0)
         {
            _loc2_ = this._5820.pop();
            _loc2_._1946 = param1._1946;
            _loc2_.frameIndex = param1.frameIndex;
            _loc2_.selected = param1.selected;
         }
         else
         {
            _loc2_ = param1.clone();
         }
         _loc2_._1707 = true;
         if(_loc2_.frames)
         {
            _loc2_.frames.length = 0;
         }
         else
         {
            _loc2_.frames = new Vector.<_690>();
         }
         return _loc2_;
      }
      
      public function _4584(param1:Array) : Array
      {
         var _loc3_:_701 = null;
         var _loc4_:_701 = null;
         var _loc5_:Object = null;
         var _loc6_:_701 = null;
         var _loc7_:_688 = null;
         var _loc8_:_10613 = null;
         var _loc9_:_683 = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:_701 = null;
         var _loc13_:_699 = null;
         var _loc14_:_689 = null;
         var _loc2_:Array = [];
         for each(_loc6_ in children)
         {
            if(_loc6_ is _688)
            {
               (_loc7_ = _688(_loc6_)).selected = false;
               _loc10_ = 0;
               _loc11_ = int(param1.length);
               while(_loc10_ < _loc11_)
               {
                  _loc5_ = param1[_loc10_];
                  if(_loc5_ is TimelineVOBase && !(_loc5_ is _10599))
                  {
                     _loc7_.selected = true;
                     _loc4_ = _loc7_;
                     _loc2_.push(_loc7_);
                  }
                  _loc10_++;
               }
            }
            else if(_loc6_ is _10613)
            {
               (_loc8_ = _loc6_ as _10613).selected = false;
               _loc10_ = 0;
               _loc11_ = int(param1.length);
               while(_loc10_ < _loc11_)
               {
                  _loc5_ = param1[_loc10_];
                  if(_loc5_ is _10599)
                  {
                     _loc8_.selected = true;
                     _loc4_ = _loc8_;
                     _loc2_.push(_loc8_);
                  }
                  _loc10_++;
               }
            }
            else if(_loc6_ is _683)
            {
               (_loc9_ = _683(_loc6_)).selected = false;
               _loc10_ = 0;
               _loc11_ = int(param1.length);
               while(_loc10_ < _loc11_)
               {
                  _loc5_ = param1[_loc10_];
                  if(_loc5_ is _52)
                  {
                     if(_loc9_._1880._1823 == _52(_loc5_))
                     {
                        _loc9_.selected = true;
                        _loc2_.push(_loc9_);
                     }
                  }
                  _loc10_++;
               }
               for each(_loc12_ in _loc9_.children)
               {
                  if(_loc12_ is _699)
                  {
                     (_loc13_ = _loc12_ as _699).selected = false;
                     _loc10_ = 0;
                     _loc11_ = int(param1.length);
                     while(_loc10_ < _loc11_)
                     {
                        _loc5_ = param1[_loc10_];
                        if(_loc5_ is _79)
                        {
                           if(_loc13_._1879._1824 == _79(_loc5_))
                           {
                              _loc13_.selected = true;
                              _loc2_.push(_loc13_);
                           }
                        }
                        _loc10_++;
                     }
                  }
                  else if(_loc12_ is _689)
                  {
                     (_loc14_ = _loc12_ as _689).selected = false;
                     _loc10_ = 0;
                     _loc11_ = int(param1.length);
                     while(_loc10_ < _loc11_)
                     {
                        _loc5_ = param1[_loc10_];
                        if(_loc5_ is _70)
                        {
                           if(_loc14_._1770._1826 == _70(_loc5_))
                           {
                              _loc14_.selected = true;
                              _loc2_.push(_loc14_);
                           }
                        }
                        _loc10_++;
                     }
                  }
               }
            }
         }
         return _loc2_;
      }
      
      public function _5821(param1:Object) : _701
      {
         var _loc2_:_701 = null;
         var _loc3_:_701 = null;
         var _loc4_:_688 = null;
         var _loc5_:_10613 = null;
         var _loc6_:_683 = null;
         var _loc7_:_701 = null;
         var _loc8_:_699 = null;
         var _loc9_:_689 = null;
         for each(_loc3_ in children)
         {
            if(_loc3_ is _688)
            {
               (_loc4_ = _688(_loc3_)).selected = false;
               if(param1 is TimelineVOBase)
               {
                  _loc4_.selected = true;
                  _loc2_ = _loc4_;
               }
            }
            else if(_loc3_ is _10613)
            {
               (_loc5_ = _loc3_ as _10613).selected = false;
               if(param1 is _10599)
               {
                  _loc5_.selected = true;
                  _loc2_ = _loc5_;
               }
            }
            else if(_loc3_ is _683)
            {
               (_loc6_ = _683(_loc3_)).selected = false;
               if(param1 is _52)
               {
                  if(_loc6_._1880._1823 == _52(param1))
                  {
                     _loc6_.selected = true;
                     _loc2_ = _loc6_;
                  }
               }
               for each(_loc7_ in _loc6_.children)
               {
                  if(_loc7_ is _699)
                  {
                     (_loc8_ = _loc7_ as _699).selected = false;
                     if(param1 is _79)
                     {
                        if(_loc8_._1879._1824 == _79(param1))
                        {
                           _loc8_.selected = true;
                           _loc2_ = _loc8_;
                        }
                     }
                  }
                  else if(_loc7_ is _689)
                  {
                     (_loc9_ = _loc7_ as _689).selected = false;
                     if(param1 is _70)
                     {
                        if(_loc9_._1770._1826 == _70(param1))
                        {
                           _loc9_.selected = true;
                           _loc2_ = _loc9_;
                        }
                     }
                  }
               }
            }
         }
         return _loc2_;
      }
      
      public function _3914() : Array
      {
         var _loc2_:_701 = null;
         var _loc3_:_701 = null;
         var _loc1_:Array = [];
         for each(_loc2_ in children)
         {
            if(_loc2_ is _683)
            {
               _loc1_.push(_loc2_.vo);
               for each(_loc3_ in _loc2_.children)
               {
                  _loc1_.push(_loc3_.vo);
               }
            }
            else
            {
               _loc1_.push(_loc2_.vo);
            }
         }
         return _loc1_;
      }
      
      public function _4677(param1:_52) : _41
      {
         var _loc2_:_690 = null;
         var _loc3_:_701 = null;
         for each(_loc3_ in children)
         {
            if(_loc3_ is _683)
            {
               if((_loc3_ as _683)._1880._1823 == param1)
               {
                  return (_loc3_ as _683)._1880;
               }
            }
         }
         return null;
      }
      
      public function _4676(param1:_79) : _48
      {
         var _loc2_:_690 = null;
         var _loc3_:_701 = null;
         var _loc4_:_701 = null;
         var _loc5_:_699 = null;
         for each(_loc3_ in children)
         {
            if(_loc3_ is _683)
            {
               for each(_loc4_ in _loc3_.children)
               {
                  if(_loc4_ is _699)
                  {
                     _loc5_ = _loc4_ as _699;
                     if(_loc5_._1879._1824 == param1)
                     {
                        return (_loc5_ as _699)._1879;
                     }
                  }
               }
            }
         }
         return null;
      }
      
      public function _5811(param1:_70) : _43
      {
         var _loc2_:_690 = null;
         var _loc3_:_701 = null;
         var _loc4_:_701 = null;
         var _loc5_:_689 = null;
         for each(_loc3_ in children)
         {
            if(_loc3_ is _683)
            {
               for each(_loc4_ in _loc3_.children)
               {
                  if(_loc4_ is _689)
                  {
                     _loc5_ = _loc4_ as _689;
                     if(_loc5_._1770._1826 == param1)
                     {
                        return _loc5_._1770;
                     }
                  }
               }
            }
         }
         return null;
      }
      
      public function _3908(param1:_690) : TimelineVOBase
      {
         var _loc2_:_690 = null;
         var _loc3_:_701 = null;
         var _loc4_:_683 = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:_701 = null;
         var _loc8_:_699 = null;
         var _loc9_:_689 = null;
         if(param1 == null)
         {
            return null;
         }
         for each(_loc3_ in children)
         {
            if(param1._1946 is BoneFrameVO && _loc3_ is _683)
            {
               _loc4_ = _683(_loc3_);
               _loc5_ = 0;
               _loc6_ = _loc4_.frames.length;
               while(_loc5_ < _loc6_)
               {
                  _loc2_ = _loc4_.frames.getItemAt(_loc5_) as _690;
                  if(param1 == _loc2_)
                  {
                     return _loc4_._1880;
                  }
                  _loc5_++;
               }
            }
            else if(param1._1946 is _47 && _loc3_ is _683)
            {
               for each(_loc7_ in _loc3_.children)
               {
                  if(_loc7_ is _699)
                  {
                     _loc8_ = _loc7_ as _699;
                     _loc5_ = 0;
                     _loc6_ = _loc8_.frames.length;
                     while(_loc5_ < _loc6_)
                     {
                        _loc2_ = _loc8_.frames.getItemAt(_loc5_) as _690;
                        if(param1 == _loc2_)
                        {
                           return _loc8_._1879;
                        }
                        _loc5_++;
                     }
                  }
               }
            }
            else if(param1._1946 is _42 && _loc3_ is _683)
            {
               for each(_loc7_ in _loc3_.children)
               {
                  if(_loc7_ is _689)
                  {
                     _loc9_ = _loc7_ as _689;
                     _loc5_ = 0;
                     _loc6_ = _loc9_.frames.length;
                     while(_loc5_ < _loc6_)
                     {
                        _loc2_ = _loc9_.frames.getItemAt(_loc5_) as _690;
                        if(param1 == _loc2_)
                        {
                           return _loc9_._1770;
                        }
                        _loc5_++;
                     }
                  }
               }
            }
            else
            {
               if(param1._1946 is _10598 && _loc3_ is _10613)
               {
                  return _loc3_.vo as TimelineVOBase;
               }
               if(!(param1._1946 is BoneFrameVO || param1._1946 is _47 || param1._1946 is _42 || param1._1946 is _10598) && _loc3_ is _688)
               {
                  return _loc3_.vo as TimelineVOBase;
               }
            }
         }
         return null;
      }
      
      public function _4634(param1:_690) : _52
      {
         var _loc2_:_690 = null;
         var _loc3_:_701 = null;
         var _loc4_:_683 = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         for each(_loc3_ in children)
         {
            if(_loc3_ is _683)
            {
               _loc4_ = _683(_loc3_);
               _loc5_ = 0;
               _loc6_ = _loc4_.frames.length;
               while(_loc5_ < _loc6_)
               {
                  _loc2_ = _loc4_.frames.getItemAt(_loc5_) as _690;
                  if(param1 == _loc2_)
                  {
                     return _loc4_._1880._1823;
                  }
                  _loc5_++;
               }
            }
         }
         return null;
      }
      
      public function _4633(param1:_690) : _79
      {
         var _loc2_:_690 = null;
         var _loc3_:_701 = null;
         var _loc4_:_701 = null;
         var _loc5_:_699 = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         for each(_loc3_ in children)
         {
            if(_loc3_ is _683)
            {
               for each(_loc4_ in _loc3_.children)
               {
                  if(_loc4_ is _699)
                  {
                     _loc5_ = _loc4_ as _699;
                     _loc6_ = 0;
                     _loc7_ = _loc5_.frames.length;
                     while(_loc6_ < _loc7_)
                     {
                        _loc2_ = _loc5_.frames.getItemAt(_loc6_) as _690;
                        if(param1 == _loc2_)
                        {
                           return _loc5_._1879._1824;
                        }
                        _loc6_++;
                     }
                  }
               }
            }
         }
         return null;
      }
      
      public function _4632(param1:_690) : _70
      {
         var _loc2_:_690 = null;
         var _loc3_:_701 = null;
         var _loc4_:_701 = null;
         var _loc5_:_689 = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         for each(_loc3_ in children)
         {
            if(_loc3_ is _683)
            {
               for each(_loc4_ in _loc3_.children)
               {
                  if(_loc4_ is _689)
                  {
                     _loc5_ = _loc4_ as _689;
                     _loc6_ = 0;
                     _loc7_ = _loc5_.frames.length;
                     while(_loc6_ < _loc7_)
                     {
                        _loc2_ = _loc5_.frames.getItemAt(_loc6_) as _690;
                        if(param1 == _loc2_)
                        {
                           return _loc5_._1770._1826;
                        }
                        _loc6_++;
                     }
                  }
               }
            }
         }
         return null;
      }
      
      public function _5812(param1:_690) : _690
      {
         var _loc2_:_690 = null;
         var _loc3_:_701 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:_701 = null;
         var _loc7_:_699 = null;
         var _loc8_:_689 = null;
         for each(_loc3_ in children)
         {
            if(_loc3_ is _683)
            {
               if(param1._1946 is BoneFrameVO)
               {
                  _loc2_ = null;
                  _loc4_ = 0;
                  _loc5_ = _loc3_.frames.length;
                  while(_loc4_ < _loc5_)
                  {
                     if(param1 == _loc2_)
                     {
                        return _loc3_.frames.getItemAt(_loc4_) as _690;
                     }
                     _loc2_ = _loc3_.frames.getItemAt(_loc4_) as _690;
                     _loc4_++;
                  }
               }
               else if(param1._1946 is _47)
               {
                  for each(_loc6_ in _loc3_.children)
                  {
                     if(_loc6_ is _699)
                     {
                        _loc7_ = _loc6_ as _699;
                        _loc2_ = null;
                        _loc4_ = 0;
                        _loc5_ = _loc7_.frames.length;
                        while(_loc4_ < _loc5_)
                        {
                           if(param1 == _loc2_)
                           {
                              return _loc7_.frames.getItemAt(_loc4_) as _690;
                           }
                           _loc2_ = _loc7_.frames.getItemAt(_loc4_) as _690;
                           _loc4_++;
                        }
                     }
                  }
               }
               else if(param1._1946 is _42)
               {
                  for each(_loc6_ in _loc3_.children)
                  {
                     if(_loc6_ is _689)
                     {
                        _loc8_ = _loc6_ as _689;
                        _loc2_ = null;
                        _loc4_ = 0;
                        _loc5_ = _loc8_.frames.length;
                        while(_loc4_ < _loc5_)
                        {
                           if(param1 == _loc2_)
                           {
                              return _loc8_.frames.getItemAt(_loc4_) as _690;
                           }
                           _loc2_ = _loc8_.frames.getItemAt(_loc4_) as _690;
                           _loc4_++;
                        }
                     }
                  }
               }
            }
         }
         return null;
      }
      
      public function _5819(param1:int) : Boolean
      {
         var _loc2_:_690 = null;
         var _loc3_:int = 0;
         var _loc4_:int = this.frames.length;
         while(_loc3_ < _loc4_)
         {
            _loc2_ = this.frames.getItemAt(_loc3_) as _690;
            if(Boolean(_loc2_) && _loc2_.frameIndex == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function _3439(param1:_45, param2:int) : void
      {
         var _loc3_:_690 = _705._3137[param1];
         if(_loc3_._1707)
         {
            this._5809(_loc3_.frameIndex,param2);
         }
         else
         {
            this._5810(_loc3_,param2);
         }
         this.update();
      }
      
      public function _5809(param1:int, param2:int) : void
      {
         var _loc3_:_690 = null;
         var _loc4_:_701 = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:_701 = null;
         var _loc8_:_699 = null;
         var _loc9_:_689 = null;
         for each(_loc4_ in children)
         {
            if(_loc4_ is _683)
            {
               _loc5_ = 0;
               _loc6_ = _loc4_.frames.length;
               while(_loc5_ < _loc6_)
               {
                  _loc3_ = _loc4_.frames.getItemAt(_loc5_) as _690;
                  if(_loc3_.frameIndex > param1)
                  {
                     _loc3_.frameIndex += param2;
                  }
                  _loc5_++;
               }
               for each(_loc7_ in _loc4_.children)
               {
                  if(_loc7_ is _699)
                  {
                     _loc8_ = _loc7_ as _699;
                     _loc5_ = 0;
                     _loc6_ = _loc8_.frames.length;
                     while(_loc5_ < _loc6_)
                     {
                        _loc3_ = _loc8_.frames.getItemAt(_loc5_) as _690;
                        if(_loc3_.frameIndex > param1)
                        {
                           _loc3_.frameIndex += param2;
                        }
                        _loc5_++;
                     }
                  }
                  else if(_loc7_ is _689)
                  {
                     _loc9_ = _loc7_ as _689;
                     _loc5_ = 0;
                     _loc6_ = _loc9_.frames.length;
                     while(_loc5_ < _loc6_)
                     {
                        _loc3_ = _loc9_.frames.getItemAt(_loc5_) as _690;
                        if(_loc3_.frameIndex > param1)
                        {
                           _loc3_.frameIndex += param2;
                        }
                        _loc5_++;
                     }
                  }
               }
            }
         }
      }
      
      public function _5810(param1:_690, param2:int) : void
      {
         var _loc3_:_690 = null;
         var _loc4_:Boolean = false;
         var _loc5_:_701 = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:_701 = null;
         var _loc9_:_699 = null;
         var _loc10_:_689 = null;
         for each(_loc5_ in children)
         {
            if(_loc5_ is _683)
            {
               if(param1._1946 is BoneFrameVO)
               {
                  _loc3_ = null;
                  _loc6_ = 0;
                  _loc7_ = _loc5_.frames.length;
                  while(_loc6_ < _loc7_)
                  {
                     if(param1 == _loc3_)
                     {
                        _loc4_ = true;
                     }
                     _loc3_ = _loc5_.frames.getItemAt(_loc6_) as _690;
                     if(_loc4_)
                     {
                        _loc3_.frameIndex += param2;
                     }
                     _loc6_++;
                  }
                  if(_loc4_)
                  {
                     return;
                  }
               }
               else if(param1._1946 is _47)
               {
                  for each(_loc8_ in _loc5_.children)
                  {
                     if(_loc8_ is _699)
                     {
                        _loc9_ = _loc8_ as _699;
                        _loc3_ = null;
                        _loc6_ = 0;
                        _loc7_ = _loc9_.frames.length;
                        while(_loc6_ < _loc7_)
                        {
                           if(param1 == _loc3_)
                           {
                              _loc4_ = true;
                           }
                           _loc3_ = _loc9_.frames.getItemAt(_loc6_) as _690;
                           if(_loc4_)
                           {
                              _loc3_.frameIndex += param2;
                           }
                           _loc6_++;
                        }
                        if(_loc4_)
                        {
                           return;
                        }
                     }
                  }
               }
               else if(param1._1946 is _42)
               {
                  for each(_loc8_ in _loc5_.children)
                  {
                     if(_loc8_ is _689)
                     {
                        _loc10_ = _loc8_ as _689;
                        _loc3_ = null;
                        _loc6_ = 0;
                        _loc7_ = _loc10_.frames.length;
                        while(_loc6_ < _loc7_)
                        {
                           if(param1 == _loc3_)
                           {
                              _loc4_ = true;
                           }
                           _loc3_ = _loc10_.frames.getItemAt(_loc6_) as _690;
                           if(_loc4_)
                           {
                              _loc3_.frameIndex += param2;
                           }
                           _loc6_++;
                        }
                        if(_loc4_)
                        {
                           return;
                        }
                     }
                  }
               }
            }
         }
      }
      
      public function _3905(param1:int) : Array
      {
         var _loc3_:_690 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:_701 = null;
         var _loc7_:_683 = null;
         var _loc8_:* = undefined;
         var _loc9_:_699 = null;
         var _loc10_:_689 = null;
         var _loc2_:Array = [];
         for each(_loc6_ in children)
         {
            if(_loc6_ is _683)
            {
               _loc7_ = _683(_loc6_);
               _loc4_ = 0;
               _loc5_ = _loc7_.frames.length;
               while(_loc4_ < _loc5_)
               {
                  _loc3_ = _loc7_.frames.getItemAt(_loc4_) as _690;
                  if(_loc3_.frameIndex == param1)
                  {
                     _loc2_.push(_loc3_._1946);
                  }
                  _loc4_++;
               }
               for each(_loc8_ in _loc7_.children)
               {
                  if(_loc8_ is _699)
                  {
                     _loc9_ = _loc8_ as _699;
                     _loc4_ = 0;
                     _loc5_ = _loc9_.frames.length;
                     while(_loc4_ < _loc5_)
                     {
                        _loc3_ = _loc9_.frames.getItemAt(_loc4_) as _690;
                        if(_loc3_.frameIndex == param1)
                        {
                           _loc2_.push(_loc3_._1946);
                        }
                        _loc4_++;
                     }
                  }
                  else if(_loc8_ is _689)
                  {
                     _loc10_ = _loc8_ as _689;
                     _loc4_ = 0;
                     _loc5_ = _loc10_.frames.length;
                     while(_loc4_ < _loc5_)
                     {
                        _loc3_ = _loc10_.frames.getItemAt(_loc4_) as _690;
                        if(_loc3_.frameIndex == param1)
                        {
                           _loc2_.push(_loc3_._1946);
                        }
                        _loc4_++;
                     }
                  }
               }
            }
            else if(_loc6_ is _688 || _loc6_ is _10613)
            {
               _loc4_ = 0;
               _loc5_ = _loc6_.frames.length;
               while(_loc4_ < _loc5_)
               {
                  _loc3_ = _loc6_.frames.getItemAt(_loc4_) as _690;
                  if(_loc3_.frameIndex == param1)
                  {
                     _loc2_.push(_loc3_._1946);
                  }
                  _loc4_++;
               }
            }
         }
         return _loc2_;
      }
      
      public function _13773(param1:int) : Array
      {
         var _loc3_:_690 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:_701 = null;
         var _loc7_:_683 = null;
         var _loc2_:Array = [];
         for each(_loc6_ in children)
         {
            if(_loc6_ is _683)
            {
               _loc7_ = _683(_loc6_);
               _loc4_ = 0;
               _loc5_ = _loc7_.frames.length;
               while(_loc4_ < _loc5_)
               {
                  _loc3_ = _loc7_.frames.getItemAt(_loc4_) as _690;
                  if(_loc3_.frameIndex == param1)
                  {
                     _loc2_.push(_loc3_._1946);
                  }
                  _loc4_++;
               }
            }
            else if(_loc6_ is _688 || _loc6_ is _10613)
            {
               _loc4_ = 0;
               _loc5_ = _loc6_.frames.length;
               while(_loc4_ < _loc5_)
               {
                  _loc3_ = _loc6_.frames.getItemAt(_loc4_) as _690;
                  if(_loc3_.frameIndex == param1)
                  {
                     _loc2_.push(_loc3_._1946);
                  }
                  _loc4_++;
               }
            }
         }
         return _loc2_;
      }
      
      public function _3882(param1:int) : Array
      {
         var _loc3_:_690 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:_701 = null;
         var _loc7_:_683 = null;
         var _loc2_:Array = [];
         for each(_loc6_ in children)
         {
            if(_loc6_ is _683)
            {
               _loc7_ = _683(_loc6_);
               _loc4_ = 0;
               _loc5_ = _loc7_.frames.length;
               while(_loc4_ < _loc5_)
               {
                  _loc3_ = _loc7_.frames.getItemAt(_loc4_) as _690;
                  if(_loc3_.frameIndex == param1)
                  {
                     _loc2_.push(_loc3_._1946);
                  }
                  _loc4_++;
               }
            }
            else if(_loc6_ is _688)
            {
               _loc4_ = 0;
               _loc5_ = _loc6_.frames.length;
               while(_loc4_ < _loc5_)
               {
                  _loc3_ = _loc6_.frames.getItemAt(_loc4_) as _690;
                  if(_loc3_.frameIndex == param1)
                  {
                     _loc2_.push(_loc3_._1946);
                  }
                  _loc4_++;
               }
            }
         }
         return _loc2_;
      }
      
      public function _4591() : void
      {
         var _loc1_:_701 = null;
         var _loc2_:_683 = null;
         var _loc3_:_701 = null;
         var _loc4_:_699 = null;
         for each(_loc1_ in children)
         {
            if(_loc1_ is _683)
            {
               _loc2_ = _683(_loc1_);
               _loc2_.locked = this.locked;
               for each(_loc3_ in _loc2_.children)
               {
                  if(_loc3_ is _699)
                  {
                     (_loc4_ = _loc3_ as _699).locked = this.locked;
                  }
               }
            }
         }
      }
      
      public function _4575() : void
      {
         var _loc1_:_701 = null;
         var _loc2_:_683 = null;
         var _loc3_:_701 = null;
         var _loc4_:_699 = null;
         for each(_loc1_ in children)
         {
            if(_loc1_ is _683)
            {
               _loc2_ = _683(_loc1_);
               _loc2_.visible = this.visible;
               for each(_loc3_ in _loc2_.children)
               {
                  if(_loc3_ is _699)
                  {
                     (_loc4_ = _loc3_ as _699).visible = this.visible;
                  }
               }
            }
         }
      }
      
      public function clone() : _675
      {
         return _675._3996(this.parent,this._1992.clone() as _39);
      }
      
      public function _4597(param1:int) : Boolean
      {
         var _loc2_:_690 = null;
         var _loc3_:_45 = null;
         var _loc4_:_701 = null;
         for each(_loc4_ in children)
         {
            _loc3_ = _loc4_.getFrameByIndex(param1);
            if(_loc3_)
            {
               _loc2_ = _705._3137[_loc3_] as _690;
               if(!_loc2_.selected)
               {
                  return false;
               }
            }
         }
         return true;
      }
      
      public function _4553(param1:Array) : _52
      {
         var _loc3_:_701 = null;
         var _loc4_:_701 = null;
         var _loc5_:Object = null;
         var _loc6_:_701 = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc10_:_683 = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:_701 = null;
         var _loc14_:_699 = null;
         var _loc2_:Array = [];
         var _loc9_:int = 0;
         _loc7_ = 0;
         _loc8_ = int(children.length);
         while(_loc7_ < _loc8_)
         {
            _loc6_ = _5822[_loc7_] as _701;
            if(_loc6_ is _683)
            {
               _loc10_ = _loc6_ as _683;
               _loc11_ = 0;
               _loc12_ = int(param1.length);
               while(_loc11_ < _loc12_)
               {
                  _loc5_ = param1[_loc11_];
                  if(_loc5_ is _52)
                  {
                     if(_loc10_._1880._1823 == _52(_loc5_))
                     {
                        if(_loc9_ < _loc7_ + 1)
                        {
                           _loc9_ = _loc7_ + 1;
                        }
                     }
                  }
                  else if(_loc5_ is _79)
                  {
                     for each(_loc13_ in _loc10_.children)
                     {
                        if(_loc13_ is _699)
                        {
                           _loc14_ = _loc13_ as _699;
                           if(_loc5_ is _79)
                           {
                              if(_loc14_._1879._1824 == _79(_loc5_))
                              {
                                 if(_loc9_ < _loc7_ + 1)
                                 {
                                    _loc9_ = _loc7_ + 1;
                                 }
                              }
                           }
                        }
                     }
                  }
                  _loc11_++;
               }
            }
            _loc7_++;
         }
         _loc6_ = _5822[_loc9_] as _683;
         if(_loc6_)
         {
            return (_loc6_ as _683)._1880._1823;
         }
         return null;
      }
   }
}

