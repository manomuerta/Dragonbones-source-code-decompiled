package _226
{
   import _1404._1407;
   import _40._10598;
   import _40._39;
   import _470._469;
   import _51._50;
   import _51._52;
   import _51._70;
   import _51._79;
   import _521._532;
   import _541._540;
   import _555.AnimationPanelController;
   import _555.LibraryPanelController;
   import _555._558;
   import _555._571;
   import _573.TimelinePanelController;
   import _586._588;
   import _586._598;
   import _676._677;
   import _708._715;
   import _81._87;
   import _93._92;
   
   public class _239 extends _92
   {
      public function _239()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc4_:_238 = null;
         var _loc5_:_237 = null;
         var _loc10_:int = 0;
         var _loc12_:_50 = null;
         var _loc13_:int = 0;
         var _loc14_:_79 = null;
         var _loc15_:_236 = null;
         var _loc16_:_52 = null;
         var _loc17_:_79 = null;
         var _loc18_:Object = null;
         var _loc19_:_70 = null;
         var _loc20_:_70 = null;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:_39 = null;
         var _loc24_:Object = null;
         var _loc25_:_10598 = null;
         var _loc2_:Array = [];
         super._1572({
            "_2938":param1,
            "_2889":(param1 as Array).concat(),
            "_2941":_loc2_
         });
         var _loc3_:int = _87._2199(param1,{
            "convertDisplayToSlot":false,
            "filterBlankSlot":false,
            "filterRootBone":true
         });
         var _loc6_:int = int(this._2936.length);
         var _loc7_:Array = [];
         var _loc8_:Array = [];
         var _loc9_:Array = [];
         var _loc11_:int = _loc3_;
         while(_loc11_ < _loc6_)
         {
            _loc18_ = this._2936[_loc11_];
            if(_loc18_ is _79)
            {
               _loc7_.push(_loc18_);
            }
            else if(_loc18_ is _70)
            {
               _loc5_ = new _237();
               _loc19_ = (_loc18_ as _70)._1760._2049;
               _loc20_ = _loc19_ == _loc18_ ? null : _loc19_;
               _loc5_._1572(_469._2900(_loc18_ as _70,_loc20_));
               _loc5_._2213();
               _loc2_.push(_loc5_);
            }
            _loc11_++;
         }
         _loc7_.sort(this._2935);
         for each(_loc14_ in _loc7_)
         {
            _loc4_ = new _238();
            _loc4_._1572(_469._2896(_loc14_));
            _loc4_._2213();
            _loc2_.push(_loc4_);
            if(_loc12_ == null)
            {
               _loc12_ = _loc14_.rootArmatureData;
            }
            if(_loc12_)
            {
               _loc8_.push(_loc14_);
               _loc10_ = int(_loc12_._1780.length);
               _loc13_ = _loc10_ - _loc12_._1780.indexOf(_loc14_) - 1;
               _loc9_.push(_loc13_);
            }
         }
         _loc11_ = 0;
         while(_loc11_ < _loc3_)
         {
            _loc15_ = new _236();
            _loc15_._1572(_469._2934(this._2936[_loc11_]));
            _loc15_._2213();
            _loc2_.push(_loc15_);
            _loc16_ = this._2936[_loc11_] as _52;
            if(_loc16_)
            {
               if(_loc12_ == null)
               {
                  _loc12_ = _loc16_.rootArmatureData;
                  if(_loc12_)
                  {
                     _loc21_ = 0;
                     _loc22_ = int(_loc12_._1780.length);
                     while(_loc21_ < _loc22_)
                     {
                        _loc17_ = _loc12_._1780[_loc21_];
                        if(_loc17_)
                        {
                           _loc8_.push(_loc17_);
                           _loc10_ = int(_loc12_._1780.length);
                           _loc13_ = _loc10_ - _loc12_._1780.indexOf(_loc17_) - 1;
                           _loc9_.push(_loc13_);
                        }
                        _loc21_++;
                     }
                  }
               }
            }
            _loc11_++;
         }
         _2223.deleteSlots = _loc8_;
         _2223.deleteSlotOrders = _loc9_;
         if(Boolean(_loc12_) && Boolean(_loc12_._10658))
         {
            _2223._1886 = _loc12_;
            _2223.originZorder = _loc12_._10658.concat();
            if(Boolean(_loc12_._1963) && Boolean(_loc12_._1963.length))
            {
               _loc24_ = {};
               _loc11_ = 0;
               _loc10_ = int(_loc12_._1963.length);
               while(_loc11_ < _loc10_)
               {
                  _loc23_ = _loc12_._1963[_loc11_];
                  if((_loc23_) && _loc23_._10657 && Boolean(_loc23_._10657._1816.length))
                  {
                     _loc24_[_loc23_.name] = [];
                     _loc21_ = 0;
                     _loc22_ = int(_loc23_._10657._1816.length);
                     while(_loc21_ < _loc22_)
                     {
                        _loc25_ = _loc23_._10657._1816[_loc21_];
                        if(_loc25_)
                        {
                           _loc24_[_loc23_.name].push({
                              "startPos":_loc25_.startPos,
                              "zOrder":_loc25_.zOrder.concat()
                           });
                        }
                        _loc21_++;
                     }
                  }
                  _loc11_++;
               }
               _2223.animationZOrder = _loc24_;
            }
         }
      }
      
      override public function execute() : void
      {
         var _loc1_:_92 = null;
         this._2226._2484 = null;
         super.execute();
         for each(_loc1_ in this._2941)
         {
            (_loc1_ as Object)._2893();
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         var _loc4_:Object = null;
         var _loc5_:_262 = null;
         var _loc6_:int = 0;
         super.revert();
         var _loc1_:int = int(this._2941.length);
         while(_loc1_--)
         {
            this._2941[_loc1_]._2857();
         }
         this._2226._2889 = this._2937;
         var _loc2_:Array = _2223.deleteSlots;
         var _loc3_:Array = _2223.deleteSlotOrders;
         if(_loc2_ && _loc2_.length > 0 && _loc3_ && _loc3_.length > 0)
         {
            _loc4_ = _469._3473(_loc2_,_loc3_,_loc3_);
            _loc5_ = new _262();
            _loc5_._1572(_loc4_);
            _loc5_.execute();
         }
         if(this._1886 != null && Boolean(this._1886._10658))
         {
            this._1886._10658.length = 0;
            _loc1_ = 0;
            _loc6_ = int(_2223.originZorder.length);
            while(_loc1_ < _loc6_)
            {
               this._1886._10658.push(_2223.originZorder[_loc1_]);
               _loc1_++;
            }
            this._1886._10663(this._1886._10658);
         }
         this._2894();
      }
      
      public function _2894() : void
      {
         _2212._2939();
         this._2877.refresh();
         this._2909.refresh();
         this._2880._2891();
         if(_2220._2873 == _715.ANIMATE)
         {
            (_1407.getInstance(AnimationPanelController) as AnimationPanelController)._2886();
            (_1407.getInstance(TimelinePanelController) as TimelinePanelController)._2875();
            this._2908._10687();
         }
         this._2908._2891();
         LibraryPanelController(_1407.getInstance(LibraryPanelController)).refreshItemNum();
         this._3975._11294();
      }
      
      private function _2935(param1:_79, param2:_79) : int
      {
         if(param1.zOrder > param2.zOrder)
         {
            return -1;
         }
         return 1;
      }
      
      protected function get _2936() : Array
      {
         return _2223._2938;
      }
      
      protected function get _2937() : Array
      {
         return _2223._2889;
      }
      
      protected function get _2941() : Array
      {
         return _2223._2941;
      }
      
      protected function get _1886() : _50
      {
         return _2223._1886 as _50;
      }
      
      protected function get _2940() : int
      {
         return this._2936[this._2936.length - 1];
      }
      
      protected function get _2877() : _588
      {
         return _1407.getInstance(_588) as _588;
      }
      
      protected function get _2909() : _598
      {
         return _1407.getInstance(_598) as _598;
      }
      
      protected function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
      
      protected function get _2879() : _677
      {
         return this._2880._2882._2879;
      }
      
      protected function get _2908() : _558
      {
         return _1407.getInstance(_558) as _558;
      }
      
      protected function get _2226() : _532
      {
         return _1407.getInstance(_532);
      }
      
      protected function get _3975() : _540
      {
         return _1407.getInstance(_540) as _540;
      }
   }
}

