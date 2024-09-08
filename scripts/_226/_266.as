package _226
{
   import _1404._1407;
   import _51._52;
   import _521._532;
   import _555.AnimationPanelController;
   import _555._571;
   import _573.TimelinePanelController;
   import _586._588;
   import _676._684;
   import _703._705;
   import _708._715;
   import _81._86;
   import _93._92;
   
   public class _266 extends _92
   {
      public function _266()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this.setParent(this._2885);
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._3027(this._3025);
         this._2894();
      }
      
      override protected function _2211() : *
      {
         var _loc2_:_52 = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.bones)
         {
            _loc1_.push(_loc2_.parentBoneData);
         }
         return _loc1_;
      }
      
      protected function setParent(param1:_52) : void
      {
         var _loc2_:_52 = null;
         for each(_loc2_ in this.bones)
         {
            this._3026(_loc2_,param1);
         }
      }
      
      protected function _3027(param1:Array) : void
      {
         var _loc2_:int = int(this.bones.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._3026(this.bones[_loc3_],param1[_loc3_]);
            _loc3_++;
         }
      }
      
      protected function _3026(param1:_52, param2:_52) : void
      {
         var _loc4_:_86 = null;
         if(param1 == null || param2 == null || param1.rootArmatureData == null)
         {
            return;
         }
         param1.parentBoneData = param2;
         param1.rootArmatureData._1741();
         var _loc3_:_86 = param1.globalTransform;
         if(param2)
         {
            _loc4_ = _loc3_._2195(param2._2009,param2.globalTransform,param1._2036,true);
         }
         else
         {
            _loc4_ = _loc3_;
         }
         param1._1724.copyFrom(_loc4_,true);
         _2212._2881(param1);
         var _loc5_:_684 = _705._2944[param1];
         if(_loc5_)
         {
            _loc5_.parentBone = _705._2944[param2];
         }
      }
      
      protected function _2894() : void
      {
         this._2877.refresh();
         this._2880._2891();
         this._2226._2889 = this.bones.concat();
         if(_2220._2873 == _715.ANIMATE)
         {
            (_1407.getInstance(AnimationPanelController) as AnimationPanelController)._2886();
            (_1407.getInstance(TimelinePanelController) as TimelinePanelController)._2886();
         }
      }
      
      protected function get bones() : Array
      {
         return _2223.items;
      }
      
      protected function get _2885() : _52
      {
         return _2223._2890;
      }
      
      protected function get _3025() : Array
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
      
      protected function get _2226() : _532
      {
         return _1407.getInstance(_532);
      }
   }
}

