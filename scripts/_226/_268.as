package _226
{
   import _1404._1407;
   import _51._50;
   import _51._52;
   import _51._69;
   import _51._70;
   import _51._79;
   import _555.AnimationPanelController;
   import _555.LibraryPanelController;
   import _555._558;
   import _555._571;
   import _573.TimelinePanelController;
   import _586._598;
   import _676._677;
   import _708._715;
   import _81._86;
   import _81._88;
   import _93._92;
   import flash.geom.Matrix;
   
   public class _268 extends _92
   {
      public function _268()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      protected function _3037(param1:_70, param2:_79, param3:_69, param4:_70, param5:_70) : void
      {
         var _loc6_:_86 = param1.localTransform;
         var _loc7_:_52 = param1._1760.parentBoneData;
         var _loc8_:_86 = _loc7_.globalTransform;
         var _loc9_:_86 = param2.parentBoneData.globalTransform;
         var _loc10_:Matrix = new Matrix();
         _88._2013(_loc6_,_loc10_);
         _loc10_.concat(_loc7_._2009);
         var _loc11_:Matrix = param2.parentBoneData._2009.clone();
         _loc11_.invert();
         _loc10_.concat(_loc11_);
         _88._2014(_loc10_,param1.localTransform,_loc6_.scaleX * _loc8_.scaleX * _loc9_.scaleX > 0,_loc6_.scaleY * _loc8_.scaleY * _loc9_.scaleY > 0);
         param1._1760._2156 = param4;
         var _loc12_:String = param1._1985.name;
         this._1886._1965(param1);
         this._1886._1766(param1,param2,param3,_loc12_);
         param2._2156 = param5;
      }
      
      protected function _3039(param1:_79) : void
      {
         this._2879._2901(param1);
         _2212._2907(param1);
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
      
      protected function get _3038() : Array
      {
         return _2223._3038;
      }
      
      protected function get _3032() : Array
      {
         return _2223._3032;
      }
      
      protected function get _3036() : Array
      {
         return _2208.parentSlotVOList;
      }
      
      protected function get _3035() : Array
      {
         return _2208.parentPlaceHolderList;
      }
      
      protected function get _3031() : Array
      {
         return _2208._3032;
      }
      
      protected function get _3033() : _70
      {
         return _2208._3034;
      }
      
      protected function get _1886() : _50
      {
         return this._2879._1886;
      }
      
      protected function get _2879() : _677
      {
         return this._2880._2882._2879;
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
   }
}

