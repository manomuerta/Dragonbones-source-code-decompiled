package _226
{
   import _1404._1407;
   import _18.IAction;
   import _470._469;
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
   
   public class _228 extends _92
   {
      public var _2878:_249;
      
      public var _2883:_271;
      
      public function _228()
      {
         super();
         _2215 = true;
         _2219 = true;
         _2224 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         if(Boolean(this._2887) && this._2887.length > 0)
         {
            this._2883 = new _271();
            this._2883._1572(_469._2874(this._2887,this._1836));
            this._2883._2213();
         }
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2893();
         this._2894();
         if(_2220._2873 == _715.ANIMATE)
         {
            (_1407.getInstance(AnimationPanelController) as AnimationPanelController)._2886();
            (_1407.getInstance(TimelinePanelController) as TimelinePanelController)._2875();
         }
      }
      
      override public function revert() : void
      {
         super.revert();
         if(this._2883)
         {
            this._2883.revert();
         }
         this._1886._1983(this._1836);
         this._2877.refresh();
         _2212._2881(this._1836.parentBoneData);
         this._2879._2892(this._1836);
         this._2880._2891();
         this._2226._2484 = this._2884;
         if(_2220._2873 == _715.ANIMATE)
         {
            (_1407.getInstance(AnimationPanelController) as AnimationPanelController)._2886();
            (_1407.getInstance(TimelinePanelController) as TimelinePanelController)._2875();
         }
      }
      
      public function _2893() : void
      {
         this._1836.parentBoneData = this._2890;
         this._1886._1794(this._1836);
         this._2879.addBone(this._1836);
         this._1886._1741();
         _2212._2881(this._1836);
         if(Boolean(this._1836.parentBoneData) && this._1836.parentBoneData._2027)
         {
            _2212._2881(this._1836.parentBoneData);
         }
         if(this._2878)
         {
            this._2878._2893();
         }
         if(this._2883)
         {
            this._2883.execute();
         }
      }
      
      public function _2894() : void
      {
         this._2877.refresh();
         this._2880._2891();
      }
      
      override protected function _2211() : *
      {
         return this._2226._2484;
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         var _loc2_:_249 = null;
         var _loc3_:_271 = null;
         var _loc4_:_246 = null;
         if(param1 is _249)
         {
            _loc2_ = param1 as _249;
            if(_loc2_._1836 != this._1836)
            {
               return false;
            }
            if(this._2878)
            {
               this._2878.merge(_loc2_);
            }
            else
            {
               this._2878 = _loc2_;
            }
            return true;
         }
         if(param1 is _271)
         {
            _loc3_ = param1 as _271;
            if(_loc3_._2885 != this._1836)
            {
               return false;
            }
            this._2883 = _loc3_;
            return true;
         }
         if(param1 is _246)
         {
            _loc4_ = param1 as _246;
            if(_loc4_._1836 != this._1836)
            {
               return false;
            }
            this._1836.name = _loc4_.newName;
            return true;
         }
         return false;
      }
      
      protected function get _1836() : _52
      {
         return _2223._1836 as _52;
      }
      
      protected function get _2890() : _52
      {
         return _2223._2890 as _52;
      }
      
      protected function get _2887() : Array
      {
         return _2223._2887;
      }
      
      protected function get _1886() : _50
      {
         return this._2890.rootArmatureData as _50;
      }
      
      protected function get _2884() : Object
      {
         return _2208;
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
      
      protected function get _2226() : _532
      {
         return _1407.getInstance(_532);
      }
   }
}

