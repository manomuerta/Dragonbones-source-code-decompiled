package _226
{
   import _1404._1407;
   import _470._469;
   import _51._52;
   import _51._69;
   import _51._70;
   import _51._79;
   import _521._532;
   import _555.AnimationPanelController;
   import _555.LibraryPanelController;
   import _573.TimelinePanelController;
   import _708._715;
   
   public class _269 extends _268
   {
      public function _269()
      {
         super();
      }
      
      override protected function _2211() : *
      {
         var _loc5_:_70 = null;
         var _loc6_:_79 = null;
         var _loc1_:Array = [];
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         var _loc7_:int = 0;
         var _loc8_:int = int(_3038.length);
         while(_loc7_ < _loc8_)
         {
            _loc5_ = _3038[_loc7_];
            _loc6_ = this._3042[_loc7_];
            _loc1_.push(_loc5_._1733);
            _loc2_.push(_loc5_._1760);
            _loc3_.push(_loc5_._1760._2156);
            _loc4_.push(_loc6_._2156);
            _loc7_++;
         }
         return {
            "parentPlaceHolderList":_loc1_,
            "parentSlotVOList":_loc2_,
            "_3032":_loc3_,
            "toParentSlotDefaultDisplayVOList":_loc4_
         };
      }
      
      override public function execute() : void
      {
         var _loc1_:_233 = null;
         var _loc2_:_79 = null;
         super.execute();
         for each(_loc2_ in this._3042)
         {
            _loc1_ = new _233();
            _loc1_._1572(_469._2897(_loc2_,this._2885));
            _loc1_._2893();
         }
         this._3040(this._3042,null,_3032,null);
         this._2894();
      }
      
      override public function revert() : void
      {
         var _loc1_:_238 = null;
         var _loc2_:_79 = null;
         super.revert();
         this._3040(_3036,_3035,this._3041,_3031,true);
         for each(_loc2_ in this._3042)
         {
            _loc1_ = new _238();
            _loc1_._1572(_469._2896(_loc2_));
            _loc1_._2893();
            _loc1_._2894();
         }
         this._2894();
      }
      
      protected function _3040(param1:Array, param2:Array, param3:Array, param4:Array, param5:Boolean = false) : void
      {
         var _loc6_:_70 = null;
         var _loc9_:_79 = null;
         var _loc10_:_79 = null;
         var _loc7_:int = 0;
         var _loc8_:int = int(_3038.length);
         while(_loc7_ < _loc8_)
         {
            _loc6_ = _3038[_loc7_];
            _loc9_ = _loc6_._1760;
            _loc10_ = param1[_loc7_];
            _3037(_loc6_,_loc10_,!!param2 ? param2[_loc7_] : null,param3[_loc7_],!!param4 ? param4[_loc7_] : _loc6_);
            if(!param5)
            {
               _3039(_loc9_);
            }
            _3039(_loc10_);
            _loc7_++;
         }
      }
      
      override public function _2894() : void
      {
         _2909.refresh();
         _2880._2891();
         _2908._2891();
         if(_2220._2873 == _715.ANIMATE)
         {
            (_1407.getInstance(AnimationPanelController) as AnimationPanelController)._2886();
            (_1407.getInstance(TimelinePanelController) as TimelinePanelController)._2875();
         }
         LibraryPanelController(_1407.getInstance(LibraryPanelController)).refreshItemNum();
      }
      
      public function get _2885() : _52
      {
         return _2223.toParentBoneVO;
      }
      
      public function get _3042() : Array
      {
         return _2223.toParentSlotVOList;
      }
      
      protected function get _3041() : Array
      {
         return _2208.toParentSlotDefaultDisplayVOList;
      }
      
      protected function get _2226() : _532
      {
         return _1407.getInstance(_532);
      }
   }
}

