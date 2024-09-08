package _309
{
   import _13492._13493;
   import _13492._13494;
   import _13492._13495;
   import _13492._13498;
   import _13492._13499;
   import _13503._13502;
   import _13505._13504;
   import _13505._13508;
   import _13515._13514;
   import _1404._1407;
   import _226._227;
   import _226._232;
   import _226._233;
   import _226._236;
   import _226._237;
   import _226._238;
   import _470._469;
   import _51._52;
   import _51._70;
   import _51._79;
   import _521._532;
   import _555.AnimationPanelController;
   import _555.LibraryPanelController;
   import _555._558;
   import _555._570;
   import _555._571;
   import _555._576;
   import _573.TimelinePanelController;
   import _586._598;
   import _81._86;
   import _93._92;
   
   public class _310 extends _92
   {
      private var _13734:_13514;
      
      public function _310()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         var _loc6_:_227 = null;
         var _loc7_:_233 = null;
         var _loc8_:_232 = null;
         var _loc9_:_13495 = null;
         var _loc10_:_13498 = null;
         var _loc11_:Object = null;
         super.execute();
         var _loc1_:_79 = _2223._1837 as _79;
         var _loc2_:_70 = _2223.displayVO as _70;
         if(_2223.newBoneVO)
         {
            _loc6_ = new _227();
            _loc6_._1572(_469._2916(_2223.newBoneVO,this._3052));
            _loc6_._2893();
            _loc7_ = new _233();
            _loc7_._1572(_469._2897(_2223.newSlotVO,_2223.newBoneVO));
            _loc7_._2893();
         }
         if(_2223.needAddDisplayVO)
         {
            _loc8_ = new _232();
            _loc8_._1572(_469._2895(_loc2_,this._2898,_loc1_,_2223._1733,false));
            _loc8_._2893();
         }
         this._1992._1874();
         this._2852._1871();
         var _loc3_:_13508 = this._1992._1875(_loc1_);
         var _loc4_:_13504 = this._1992._1873(_2223._1836);
         var _loc5_:int = int(_2223.frameIndex);
         if(_2223.addDisplayToEmptyFrame)
         {
            (_loc9_ = _loc3_._13572.getFrameByIndex(_2223.frameIndex) as _13495).value = _loc2_._1733;
            _loc10_ = _loc4_._13581.getFrameByIndex(_loc5_) as _13498;
            _loc10_._13641(this.transform.x,this.transform.y);
         }
         else
         {
            this._13734 = new _13514();
            (_loc11_ = {})._1897 = this._1836;
            _loc11_._1992 = this._1992;
            _loc11_.frameIndex = _loc5_;
            _loc11_._13581 = _loc4_._13581;
            _loc11_._13595 = _loc4_._13586;
            _loc11_._13598 = _loc4_._13598;
            _loc11_._13627 = this._13627;
            _loc11_._13710 = this._13710;
            _loc11_._13631 = this._13631;
            _loc11_._13599 = _loc3_._13599;
            _loc11_._13593 = _loc3_._13572;
            _loc11_._13592 = _loc3_._13592;
            _loc11_._13632 = this._13632;
            _loc11_._13707 = this._13707;
            _loc11_._13708 = this._13708;
            this._13707.value = _loc2_._1733;
            this._13734._1572(_loc11_);
            this._13734.execute();
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         var _loc4_:_13495 = null;
         var _loc5_:_237 = null;
         var _loc6_:_238 = null;
         var _loc7_:_236 = null;
         super.revert();
         var _loc1_:_79 = _2223._1837 as _79;
         var _loc2_:_13508 = this._1992._1875(_loc1_);
         var _loc3_:_13504 = this._1992._1873(_2223._1836);
         if(_2223.addDisplayToEmptyFrame)
         {
            (_loc4_ = _loc2_._13572.getFrameByIndex(_2223.frameIndex) as _13495).value = null;
         }
         else if(this._13734)
         {
            this._13734.revert();
         }
         if(_2223.needAddDisplayVO)
         {
            _loc5_ = new _237();
            _loc5_._1572(_469._2900(_2223.displayVO));
            _loc5_._2893();
         }
         if(_2223.newBoneVO)
         {
            _loc6_ = new _238();
            _loc6_._1572(_469._2896(_2223.newSlotVO));
            _loc6_._2893();
            _loc7_ = new _236();
            _loc7_._1572(_469._2934(_2223.newBoneVO));
            _loc7_._2893();
            this._2852._1871();
         }
         this._2894();
      }
      
      public function _2894() : void
      {
         this._2858._2886();
         this._2852._2886();
         if(_2223.addDisplayToEmptyFrame)
         {
            this._2852._3149([_2223._1837],_2223.frameIndex);
         }
         this._2908._2891();
         _2209._3151();
         this._2852._3133();
         this._2852.refresh();
         this._2852._3002();
         this._2852._3140();
         this._2909.refresh();
         LibraryPanelController(_1407.getInstance(LibraryPanelController)).refreshItemNum();
         (_1407.getInstance(_576) as _576).refresh();
         if(this._2226._3150)
         {
            _570(_1407.getInstance(_570)).refresh(this._2226._3150);
         }
      }
      
      protected function get _2898() : String
      {
         return _2223._2898;
      }
      
      protected function get _3052() : _52
      {
         return _2223._3052 as _52;
      }
      
      protected function get _1992() : _13502
      {
         return _2223._1992;
      }
      
      protected function get frameIndex() : int
      {
         return _2223.frameIndex;
      }
      
      protected function get _13627() : _13498
      {
         return _2223._13627;
      }
      
      protected function get _13710() : _13499
      {
         return _2223._13710;
      }
      
      protected function get _13631() : _13498
      {
         return _2223._13631;
      }
      
      protected function get _13632() : _13494
      {
         return _2223._13632;
      }
      
      protected function get _13707() : _13495
      {
         return _2223._13707;
      }
      
      protected function get _13708() : _13493
      {
         return _2223._13708;
      }
      
      protected function get transform() : _86
      {
         return _2223.transform;
      }
      
      protected function get _1836() : _52
      {
         return _2223._1836;
      }
      
      protected function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
      
      protected function get _2909() : _598
      {
         return _1407.getInstance(_598) as _598;
      }
      
      protected function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
      
      protected function get _2908() : _558
      {
         return _1407.getInstance(_558) as _558;
      }
      
      protected function get _2858() : AnimationPanelController
      {
         return _1407.getInstance(AnimationPanelController) as AnimationPanelController;
      }
      
      protected function get _2226() : _532
      {
         return _1407.getInstance(_532);
      }
   }
}

