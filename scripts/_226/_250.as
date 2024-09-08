package _226
{
   import _1404._1407;
   import _51._50;
   import _51._52;
   import _51._77;
   import _521._532;
   import _555.AnimationPanelController;
   import _555._570;
   import _555._571;
   import _573.TimelinePanelController;
   import _703._705;
   import _708._715;
   import _93._92;
   
   public class _250 extends _92
   {
      public function _250()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
      }
      
      override public function execute() : void
      {
         var _loc2_:_52 = null;
         super.execute();
         this._1897.target._1957 = true;
         this._1886._1822(this._1897);
         var _loc1_:Array = [];
         for each(_loc2_ in this._1897.bones)
         {
            _loc1_.push(_loc2_);
         }
         this._2226._2889 = _loc1_;
         if(_2220._2873 == _715.ANIMATE)
         {
            (_1407.getInstance(AnimationPanelController) as AnimationPanelController)._2886();
            (_1407.getInstance(TimelinePanelController) as TimelinePanelController)._2875();
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._1886._1991(this._1897);
         this._2894();
      }
      
      public function _2894() : void
      {
         _2212._2939();
         _570(_1407.getInstance(_570)).refresh();
         this._2880._2943(_705._2944[this._1897.target]);
      }
      
      protected function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
      
      protected function get _1886() : _50
      {
         return this._1897.target.rootArmatureData as _50;
      }
      
      protected function get _1897() : _77
      {
         return _2223._1897 as _77;
      }
      
      protected function get _2226() : _532
      {
         return _1407.getInstance(_532);
      }
   }
}

