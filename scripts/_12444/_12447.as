package _12444
{
   import _1404._1407;
   import _14101._14103;
   import _226._230;
   import _226._233;
   import _51._50;
   import _51._52;
   import _521._532;
   import _555.AnimationPanelController;
   import _555._571;
   import _573.TimelinePanelController;
   import _586._588;
   import _676._677;
   import _708._715;
   import _93._92;
   
   public class _12447 extends _92
   {
      private var _12538:Vector.<_233>;
      
      private var _12537:Vector.<_230>;
      
      private var _14393:Vector.<_14053>;
      
      private var _14392:Vector.<_14058>;
      
      private var _14394:Vector.<_14056>;
      
      public function _12447()
      {
         super();
         _2215 = true;
         _2219 = true;
         this._12538 = new Vector.<_233>();
         this._12537 = new Vector.<_230>();
         this._14393 = new Vector.<_14053>();
         this._14392 = new Vector.<_14058>();
         this._14394 = new Vector.<_14056>();
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc11_:_233 = null;
         var _loc12_:_230 = null;
         var _loc13_:_14053 = null;
         var _loc14_:_14058 = null;
         var _loc15_:_14056 = null;
         super._1572(param1);
         var _loc2_:Vector.<_52> = new Vector.<_52>();
         if(_14103._14395(this.flag,_14103.CHILD_BONE))
         {
            _loc2_ = _loc2_.concat(this._12539._2021());
         }
         _loc2_.unshift(this._12539);
         var _loc3_:Object = {};
         _loc4_ = int(_loc2_.length - 1);
         while(_loc4_ >= 0)
         {
            _loc3_[_loc2_[_loc4_].name] = _loc2_[_loc4_].parentBoneData;
            _loc4_--;
         }
         _2223._12541 = _loc2_;
         _2223._12540 = _loc3_;
         var _loc6_:Vector.<Object> = _2223.addSlots;
         var _loc7_:Vector.<Object> = _2223.addDisplays;
         var _loc8_:Vector.<Object> = _2223.pasteBoneTimeLineData;
         var _loc9_:Vector.<Object> = _2223.pasteSlotTimeLineData;
         var _loc10_:Vector.<Object> = _2223.pasteFFDTimeLineData;
         if(Boolean(_loc6_) && _loc6_.length > 0)
         {
            _loc4_ = 0;
            _loc5_ = int(_loc6_.length);
            while(_loc4_ < _loc5_)
            {
               _loc11_ = new _233();
               _loc11_._1572(_loc6_[_loc4_]);
               this._12538.push(_loc11_);
               _loc4_++;
            }
         }
         if(Boolean(_loc7_) && _loc7_.length > 0)
         {
            _loc4_ = 0;
            _loc5_ = int(_loc7_.length);
            while(_loc4_ < _loc5_)
            {
               _loc12_ = new _230();
               _loc12_._1572(_loc7_[_loc4_]);
               this._12537.push(_loc12_);
               _loc4_++;
            }
         }
         if(Boolean(_loc8_) && _loc8_.length > 0)
         {
            _loc4_ = 0;
            _loc5_ = int(_loc8_.length);
            while(_loc4_ < _loc5_)
            {
               _loc13_ = new _14053();
               _loc13_._1572(_loc8_[_loc4_]);
               this._14393.push(_loc13_);
               _loc4_++;
            }
         }
         if(Boolean(_loc9_) && _loc9_.length > 0)
         {
            _loc4_ = 0;
            _loc5_ = int(_loc9_.length);
            while(_loc4_ < _loc5_)
            {
               _loc14_ = new _14058();
               _loc14_._1572(_loc9_[_loc4_]);
               this._14392.push(_loc14_);
               _loc4_++;
            }
         }
         if(Boolean(_loc10_) && _loc10_.length > 0)
         {
            _loc4_ = 0;
            _loc5_ = int(_loc10_.length);
            while(_loc4_ < _loc5_)
            {
               _loc15_ = new _14056();
               _loc15_._1572(_loc10_[_loc4_]);
               this._14394.push(_loc15_);
               _loc4_++;
            }
         }
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_52 = null;
         super.execute();
         _loc1_ = 0;
         _loc2_ = int(this._12541.length);
         while(_loc1_ < _loc2_)
         {
            _loc4_ = this._12541[_loc1_];
            if(_loc4_.parentBoneData == null && this._12540[_loc4_.name] is _52)
            {
               _loc4_.parentBoneData = this._12540[_loc4_.name] as _52;
            }
            _loc1_++;
         }
         this._12539.parentBoneData = this._2890;
         _loc1_ = 0;
         _loc2_ = int(this._12541.length);
         while(_loc1_ < _loc2_)
         {
            _loc4_ = this._12541[_loc1_];
            this._1886._1794(_loc4_);
            this._2879.addBone(_loc4_);
            _loc1_++;
         }
         this._1886._1741();
         _2212._2881(this._12539);
         if(Boolean(this._12539.parentBoneData) && this._12539.parentBoneData._2027)
         {
            _2212._2881(this._12539.parentBoneData);
         }
         this._2894();
         if(Boolean(this._12538) && this._12538.length > 0)
         {
            _loc1_ = 0;
            _loc2_ = int(this._12538.length);
            while(_loc1_ < _loc2_)
            {
               this._12538[_loc1_].execute();
               _loc1_++;
            }
         }
         if(Boolean(this._12537) && this._12537.length > 0)
         {
            _loc1_ = 0;
            _loc2_ = int(this._12537.length);
            while(_loc1_ < _loc2_)
            {
               this._12537[_loc1_].execute();
               _loc1_++;
            }
         }
         if(Boolean(this._14393) && this._14393.length > 0)
         {
            _loc1_ = 0;
            _loc2_ = int(this._14393.length);
            while(_loc1_ < _loc2_)
            {
               this._14393[_loc1_].execute();
               _loc1_++;
            }
         }
         if(Boolean(this._14392) && this._14392.length > 0)
         {
            _loc1_ = 0;
            _loc2_ = int(this._14392.length);
            while(_loc1_ < _loc2_)
            {
               this._14392[_loc1_].execute();
               _loc1_++;
            }
         }
         if(Boolean(this._14394) && this._14394.length > 0)
         {
            _loc1_ = 0;
            _loc2_ = int(this._14394.length);
            while(_loc1_ < _loc2_)
            {
               this._14394[_loc1_].execute();
               _loc1_++;
            }
         }
         this._2226._2484 = null;
      }
      
      override public function revert() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_52 = null;
         super.revert();
         var _loc1_:Vector.<_52> = new Vector.<_52>();
         if(_14103._14395(this.flag,_14103.CHILD_BONE))
         {
            _loc1_ = _loc1_.concat(this._12539._2021());
         }
         _loc1_.unshift(this._12539);
         _loc2_ = int(_loc1_.length - 1);
         while(_loc2_ >= 0)
         {
            _loc4_ = _loc1_[_loc2_];
            this._1886._1983(_loc4_);
            this._2879._2892(_loc4_);
            _loc2_--;
         }
         this._2894();
         if(Boolean(this._12537) && this._12537.length > 0)
         {
            _loc2_ = int(this._12537.length - 1);
            while(_loc2_ >= 0)
            {
               this._12537[_loc2_].revert();
               _loc2_--;
            }
         }
         if(Boolean(this._12538) && this._12538.length > 0)
         {
            _loc2_ = int(this._12538.length - 1);
            while(_loc2_ >= 0)
            {
               this._12538[_loc2_].revert();
               _loc2_--;
            }
         }
         this._2226._2484 = null;
      }
      
      private function _2894() : void
      {
         this._2877.refresh();
         this._2880._2891();
         this._2226._2484 = null;
         if(_2220._2873 == _715.ANIMATE)
         {
            this._2858._2886();
            this._2852._2875();
         }
      }
      
      private function get _12541() : Vector.<_52>
      {
         return _2223._12541 as Vector.<_52>;
      }
      
      private function get _12540() : Object
      {
         return _2223._12540;
      }
      
      private function get _2890() : _52
      {
         return _2223._2890 as _52;
      }
      
      private function get _12539() : _52
      {
         return _2223._12539 as _52;
      }
      
      private function get _1886() : _50
      {
         return _2223._1886 as _50;
      }
      
      private function get flag() : uint
      {
         return _2223.flag;
      }
      
      protected function get _2877() : _588
      {
         return _1407.getInstance(_588) as _588;
      }
      
      protected function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
      
      protected function get _2879() : _677
      {
         return this._2880._2882._2879;
      }
      
      private function get _2858() : AnimationPanelController
      {
         return _1407.getInstance(AnimationPanelController) as AnimationPanelController;
      }
      
      private function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
      
      protected function get _2226() : _532
      {
         return _1407.getInstance(_532);
      }
   }
}

