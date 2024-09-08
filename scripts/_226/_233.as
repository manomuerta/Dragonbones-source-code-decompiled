package _226
{
   import _1404._1407;
   import _40._10598;
   import _40._39;
   import _470._469;
   import _51._50;
   import _51._52;
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
   
   public class _233 extends _92
   {
      public function _233()
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
         this._2226._2484 = this._1837;
      }
      
      override public function revert() : void
      {
         super.revert();
         var _loc1_:_238 = new _238();
         _loc1_._1572(_469._2896(this._1837));
         _loc1_._2893();
         this._2226._2484 = this._2884;
         _loc1_._2894();
      }
      
      override protected function _2211() : *
      {
         super._2211();
         return this._2226._2484;
      }
      
      public function _2893() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:_39 = null;
         var _loc6_:_10598 = null;
         this._1837.parentBoneData = this._2890;
         if(isNaN(this.zOrder))
         {
            this._1886._1792(this._1837);
         }
         else
         {
            this._1886._1986(this._1837,this.zOrder);
         }
         if(this._1886._10658)
         {
            if(this._1886._10658.indexOf(this._1837.name) == -1)
            {
               this._1886._10658.push(this._1837.name);
            }
            if(Boolean(this._1886._1963) && Boolean(this._1886._1963.length))
            {
               _loc1_ = 0;
               _loc2_ = int(this._1886._1963.length);
               while(_loc1_ < _loc2_)
               {
                  _loc5_ = this._1886._1963[_loc1_];
                  if((_loc5_) && _loc5_._10657 && Boolean(_loc5_._10657._1816.length))
                  {
                     _loc3_ = 0;
                     _loc4_ = int(_loc5_._10657._1816.length);
                     while(_loc3_ < _loc4_)
                     {
                        _loc6_ = _loc5_._10657._1816[_loc3_];
                        if(_loc6_)
                        {
                           if(_loc6_.zOrder.indexOf(this._1837.name) == -1)
                           {
                              _loc6_.zOrder.push(this._1837.name);
                           }
                        }
                        _loc3_++;
                     }
                  }
                  _loc1_++;
               }
            }
         }
         this._2879.addSlot(this._1837);
         this._2911.addSlot(this._1837);
         _2212._2907(this._1837);
         this._2879._2901(this._1837);
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
      
      protected function get _2890() : _52
      {
         return _2223._2890;
      }
      
      protected function get zOrder() : Number
      {
         return _2223.zOrder;
      }
      
      protected function get _1886() : _50
      {
         return this._2890.rootArmatureData as _50;
      }
      
      protected function get _2884() : Object
      {
         return _2208;
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
      
      protected function get _2879() : _677
      {
         return this._2880._2882._2879;
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

