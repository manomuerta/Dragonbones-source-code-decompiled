package _425
{
   import _13515._13532;
   import _1404._1407;
   import _40.BoneFrameVO;
   import _40._39;
   import _40._41;
   import _40._45;
   import _40._47;
   import _40._48;
   import _439._445;
   import _51._52;
   import _51._79;
   import _555._570;
   import _573.TimelinePanelController;
   import _586._596;
   import _676._690;
   import _703._705;
   import _81._86;
   import _93._92;
   
   public class _426 extends _92
   {
      private var _3108:Vector.<_92>;
      
      public function _426()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_13532 = null;
         super._1572(param1);
         this._3108 = new Vector.<_92>();
         _loc2_ = 0;
         _loc3_ = int(this._3410.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new _13532();
            _loc4_._1572(this._3410[_loc2_]);
            this._3108.push(_loc4_);
            _loc2_++;
         }
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this._3108.length);
         while(_loc1_ < _loc2_)
         {
            this._3108[_loc1_].execute();
            _loc1_++;
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         var _loc1_:int = int(this._3108.length - 1);
         while(_loc1_ >= 0)
         {
            this._3108[_loc1_].revert();
            _loc1_--;
         }
         this._2894();
      }
      
      private function _3149(param1:Array, param2:_39, param3:int) : void
      {
         var _loc4_:_79 = null;
         var _loc5_:_52 = null;
         var _loc6_:_48 = null;
         var _loc7_:_41 = null;
         var _loc8_:_47 = null;
         var _loc9_:BoneFrameVO = null;
         var _loc10_:_690 = null;
         var _loc11_:int = 0;
         var _loc12_:int = int(param1.length);
         while(_loc11_ < _loc12_)
         {
            _loc4_ = param1[_loc11_] as _79;
            _loc5_ = _loc4_.parentBoneData;
            _loc6_ = param2._1875(_loc4_);
            _loc7_ = param2._1873(_loc5_);
            _loc8_ = _loc6_._1933(param3) as _47;
            _loc9_ = _loc7_._1933(param3) as BoneFrameVO;
            (_loc10_ = _705._3137[_loc9_])._3409 = _loc8_._1732 == null;
            _loc11_++;
         }
      }
      
      private function get _3410() : Array
      {
         return _2223 as Array;
      }
      
      private function get _1992() : _39
      {
         return _2223._1992 as _39;
      }
      
      private function get frameIndex() : int
      {
         return _2223.frameIndex as int;
      }
      
      override protected function _2211() : *
      {
         var _loc2_:_445 = null;
         var _loc5_:_445 = null;
         var _loc1_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:int = int(this._3410.length);
         while(_loc3_ < _loc4_)
         {
            if(this._3410[_loc3_] is _445)
            {
               _loc2_ = this._3410[_loc3_] as _445;
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
      
      private function _3135(param1:_445) : void
      {
         if(param1 == null || param1._1946 == null)
         {
            return;
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
               if(param1._1946 is BoneFrameVO)
               {
                  BoneFrameVO(param1._1946).transform.copyFrom(param1.value as _86);
               }
         }
         var _loc2_:_690 = _705._3137[param1._1946];
         _loc2_.dataChange();
      }
      
      private function _2894() : void
      {
         _2209._3151();
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
   }
}

