package _413
{
   import _1404._1407;
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
   import _439._445;
   import _51._52;
   import _51._70;
   import _51._79;
   import _555.AnimationPanelController;
   import _555._570;
   import _573.TimelinePanelController;
   import _586._596;
   import _676._690;
   import _676._701;
   import _703._705;
   import _81._86;
   import _93._92;
   
   public class _414 extends _92
   {
      private var _11565:Boolean;
      
      public function _414()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         var _loc1_:Object = null;
         var _loc2_:_452 = null;
         var _loc3_:_445 = null;
         var _loc4_:int = 0;
         var _loc5_:int = int(this.data.length);
         while(_loc4_ < _loc5_)
         {
            _loc1_ = this.data[_loc4_];
            if(_loc1_ is _452)
            {
               _loc2_ = _loc1_ as _452;
               this.addFrame(_loc2_._1945,_loc2_._1946);
            }
            if(_loc1_ is _445)
            {
               _loc3_ = _loc1_ as _445;
               this._3135(_loc3_);
            }
            _loc4_++;
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         var _loc1_:Object = null;
         var _loc2_:_452 = null;
         var _loc3_:_445 = null;
         var _loc4_:Array = _2208 as Array;
         var _loc5_:int = 0;
         var _loc6_:int = int(_loc4_.length);
         while(_loc5_ < _loc6_)
         {
            _loc1_ = _loc4_[_loc5_];
            if(_loc1_ is _452)
            {
               _loc2_ = _loc1_ as _452;
               this.delFrame(_loc2_._1945,_loc2_._1946);
            }
            if(_loc1_ is _445)
            {
               _loc3_ = _loc1_ as _445;
               this._3135(_loc3_);
            }
            _loc5_++;
         }
         this._2894();
      }
      
      private function get data() : Array
      {
         return _2223 as Array;
      }
      
      override protected function _2211() : *
      {
         var _loc2_:_445 = null;
         var _loc5_:_445 = null;
         var _loc1_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:int = int(this.data.length);
         while(_loc3_ < _loc4_)
         {
            if(this.data[_loc3_] is _452)
            {
               _loc1_.push(this.data[_loc3_]);
            }
            else if(this.data[_loc3_] is _445)
            {
               _loc2_ = this.data[_loc3_] as _445;
               _loc5_ = this._3131(_loc2_);
               _loc1_.push(_loc5_);
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      private function _3131(param1:_445) : _445
      {
         var _loc2_:_445 = new _445();
         _loc2_._1946 = param1._1946;
         _loc2_._3136 = param1._3136;
         switch(param1._3136)
         {
            case _445.TWEEN_ENABLED:
               _loc2_.value = param1._1946.tweenEnabled;
               break;
            case _445.ALL:
               _loc2_.value = param1._1946.clone();
               break;
            case _445.TRANSFORM:
               _loc2_.value = BoneFrameVO(param1._1946).transform.clone();
         }
         return _loc2_;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
      }
      
      private function addFrame(param1:TimelineVOBase, param2:_45) : void
      {
         var _loc3_:_701 = null;
         var _loc4_:_79 = null;
         var _loc5_:_52 = null;
         var _loc6_:_70 = null;
         if(param1 is _41 && param2 is BoneFrameVO)
         {
            _loc3_ = _705._1876[param1];
            _loc5_ = (param2 as BoneFrameVO)._1823;
            _2209._3395(_loc5_);
         }
         else if(param1 is _48 && param2 is _47)
         {
            _loc3_ = _705._1877[param1];
            _loc4_ = (param2 as _47)._1824;
            _2209._3394(_loc4_);
         }
         else if(param1 is _43 && param2 is _42)
         {
            _loc3_ = _705._1878[param1];
            _loc6_ = (param2 as _42)._1826;
            _2209._3134(_loc6_);
         }
         else if(param1 is _10599 && param2 is _10598)
         {
            _loc3_ = _705._10706[param1];
            _2209._10707();
            this._11565 = true;
         }
         else if(param1 is _39 && param2 is _45)
         {
            _loc3_ = _705._3393[param1];
         }
         if(_loc3_)
         {
            _loc3_.addFrame(param2);
         }
      }
      
      private function delFrame(param1:TimelineVOBase, param2:_45) : void
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
            this._11565 = true;
         }
         else if(param1 is _39 && param2 is _45)
         {
            _loc3_ = _705._3393[param1];
         }
         if(_loc3_)
         {
            _loc3_.delFrame(param2);
         }
      }
      
      private function _3135(param1:_445) : void
      {
         var _loc2_:_79 = null;
         var _loc3_:_52 = null;
         var _loc4_:_70 = null;
         if(param1._1946 is _47)
         {
            _loc2_ = (param1._1946 as _47)._1824;
            if(_loc2_)
            {
               _2209._3394(_loc2_);
            }
         }
         else if(param1._1946 is BoneFrameVO)
         {
            _loc3_ = (param1._1946 as BoneFrameVO)._1823;
            if(_loc3_)
            {
               _2209._3395(_loc3_);
            }
         }
         else if(param1._1946 is _42)
         {
            _loc4_ = (param1._1946 as _42)._1826;
            if(_loc4_)
            {
               _2209._3134(_loc4_);
            }
         }
         else if(param1._1946 is _10598)
         {
            _2209._10707();
         }
         switch(param1._3136)
         {
            case _445.TWEEN_ENABLED:
               param1._1946.tweenType = !!param1.value ? 1 : 0;
               break;
            case _445.ALL:
               param1._1946.copyFrom(param1.value as _45);
               break;
            case _445.ALL_WITHOUT_PLACEHOLDER:
               if(param1._1946 is _47)
               {
                  (param1._1946 as _47)._1918(param1.value);
               }
               else
               {
                  param1._1946.copyFrom(param1.value as _45);
               }
               break;
            case _445.TRANSFORM:
               BoneFrameVO(param1._1946).transform.copyFrom(param1.value as _86);
         }
         var _loc5_:_690 = _705._3137[param1._1946];
         _loc5_.dataChange();
      }
      
      private function _2894() : void
      {
         if(this._11565)
         {
            this._2858._2886();
            this._2852._2891();
         }
         this._2852._3132();
         this._2852._3024();
         this._2852._3133();
         this._2852.refresh();
         this._2852._3002();
         this._2853.refresh();
      }
      
      private function get _3392() : _596
      {
         return _1407.getInstance(_596) as _596;
      }
      
      private function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
      
      private function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
      
      private function get _2858() : AnimationPanelController
      {
         return _1407.getInstance(AnimationPanelController) as AnimationPanelController;
      }
   }
}

