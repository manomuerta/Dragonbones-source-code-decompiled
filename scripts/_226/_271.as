package _226
{
   import _1404._1407;
   import _51._52;
   import _51._70;
   import _51._79;
   import _555.AnimationPanelController;
   import _555._571;
   import _573.TimelinePanelController;
   import _676._700;
   import _703._705;
   import _708._715;
   import _81._86;
   import _81._88;
   import _93._92;
   import flash.geom.Matrix;
   
   public class _271 extends _92
   {
      public function _271()
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
      }
      
      override public function revert() : void
      {
         super.revert();
         this._3027(this._3025);
         this._2894();
      }
      
      override protected function _2211() : *
      {
         var _loc2_:_79 = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.slots)
         {
            _loc1_.push(_loc2_.parentBoneData);
         }
         return _loc1_;
      }
      
      public function _2893() : void
      {
         this.setParent(this._2885);
      }
      
      protected function setParent(param1:_52) : void
      {
         var _loc2_:_79 = null;
         for each(_loc2_ in this.slots)
         {
            this._3047(_loc2_,param1);
         }
      }
      
      protected function _3027(param1:Array) : void
      {
         var _loc2_:int = int(this.slots.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._3047(this.slots[_loc3_],param1[_loc3_]);
            _loc3_++;
         }
      }
      
      protected function _3047(param1:_79, param2:_52) : void
      {
         var _loc7_:_86 = null;
         var _loc8_:Matrix = null;
         var _loc9_:_70 = null;
         var _loc10_:_700 = null;
         var _loc3_:Matrix = param1.parentBoneData._2009;
         var _loc4_:Matrix = param2._2009.clone();
         _loc4_.invert();
         var _loc5_:Number = param1.parentBoneData.globalTransform.scaleX * param2.globalTransform.scaleX;
         var _loc6_:Number = param1.parentBoneData.globalTransform.scaleY * param2.globalTransform.scaleY;
         for each(_loc9_ in param1._1765)
         {
            _loc7_ = _loc9_.localTransform;
            _loc8_ = new Matrix();
            _88._2013(_loc7_,_loc8_);
            _loc8_.concat(_loc3_);
            _loc8_.concat(_loc4_);
            _88._2014(_loc8_,_loc9_.localTransform,_loc7_.scaleX * _loc5_ > 0,_loc7_.scaleY * _loc6_ > 0);
         }
         param1.parentBoneData = param2;
         _2212._2907(param1);
         (_loc10_ = _705._2273[param1]).parentBone = _705._2944[param2];
      }
      
      public function _2894() : void
      {
         this._2880._2891();
         if(_2220._2873 == _715.ANIMATE)
         {
            (_1407.getInstance(AnimationPanelController) as AnimationPanelController)._2886();
            (_1407.getInstance(TimelinePanelController) as TimelinePanelController)._2886();
         }
      }
      
      protected function get slots() : Array
      {
         return _2223.items;
      }
      
      public function get _2885() : _52
      {
         return _2223._2890;
      }
      
      protected function get _3025() : Array
      {
         return _2208;
      }
      
      protected function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
   }
}

