package _226
{
   import _1404._1407;
   import _388._390;
   import _470._469;
   import _51._50;
   import _51._52;
   import _51._70;
   import _51._78;
   import _51._79;
   import _521._532;
   import _555.AnimationPanelController;
   import _555.LibraryPanelController;
   import _555._558;
   import _555._571;
   import _573.TimelinePanelController;
   import _586._598;
   import _676._677;
   import _676._687;
   import _708._715;
   import _93._92;
   
   public class _10548 extends _92
   {
      public function _10548()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2893();
         this._2894();
         this._2226._2484 = null;
      }
      
      private function _2914(param1:Boolean) : void
      {
         var _loc2_:_390 = new _390();
         _loc2_._1572({
            "isRemove":param1,
            "items":this._1837
         });
         _loc2_.execute();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._2857();
         this._2894();
         this._2226._2484 = this._1837;
      }
      
      private function _2918(param1:Array, param2:String) : void
      {
         var _loc3_:Array = null;
         var _loc4_:_232 = null;
         for each(_loc3_ in param1)
         {
            _loc4_ = new _232();
            _loc4_._1572(_469._2895(_loc3_[0],param2,this._1837,_loc3_[1],false));
            _loc4_._2893();
         }
      }
      
      override protected function _2211() : *
      {
         var _loc2_:_78 = null;
         var _loc1_:Object = {};
         _loc1_.parentBone = this._1837.parentBoneData;
         _loc1_.zOrder = this._1837.zOrder;
         _loc1_._1711 = this._1837._1711;
         _loc1_._1995 = this._1837._1995;
         if(_loc1_._1995)
         {
            _loc1_.skinDisplayDic = {};
            for each(_loc2_ in this._1886._1781)
            {
               _loc1_.skinDisplayDic[_loc2_.name] = this._2915(_loc2_);
            }
         }
         else
         {
            _loc1_.skinDisplayDic = this._2915(this._1886._1795);
         }
         return _loc1_;
      }
      
      private function _2915(param1:_78) : Array
      {
         var _loc3_:_70 = null;
         var _loc2_:Array = [];
         for each(_loc3_ in param1._1765[this._1837])
         {
            _loc2_.push([_loc3_,_loc3_._1733]);
         }
         return _loc2_;
      }
      
      public function _2893() : void
      {
         this._2914(true);
         this._1886._1978(this._1837);
         this._2879._2932(this._1837);
         this._2911._2932(this._1837);
      }
      
      public function _2857() : void
      {
         this._2914(false);
         var _loc1_:_233 = new _233();
         _loc1_._1572(_469._2897(this._1837,this._2930,this._2933));
         _loc1_._2893();
      }
      
      public function _2894() : void
      {
         this._2909.refresh();
         this._2880._2891();
         this._2908._2891();
         if(_2220._2873 == _715.ANIMATE)
         {
            (_1407.getInstance(AnimationPanelController) as AnimationPanelController)._2886();
            (_1407.getInstance(TimelinePanelController) as TimelinePanelController)._2875();
         }
         LibraryPanelController(_1407.getInstance(LibraryPanelController)).refreshItemNum();
      }
      
      protected function get _1837() : _79
      {
         return _2223._1837;
      }
      
      protected function get _2930() : _52
      {
         return _2208.parentBone;
      }
      
      protected function get _2933() : Number
      {
         return _2208.zOrder;
      }
      
      protected function get _2931() : Boolean
      {
         return _2208._1995;
      }
      
      protected function get _2929() : Object
      {
         return _2208.skinDisplayDic;
      }
      
      protected function get _1886() : _50
      {
         return this._1837.parentBoneData.rootArmatureData as _50;
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
      
      protected function get _2911() : _687
      {
         return this._2908._2910._2911;
      }
      
      protected function get _2226() : _532
      {
         return _1407.getInstance(_532);
      }
   }
}

