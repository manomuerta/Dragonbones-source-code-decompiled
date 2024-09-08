package _425
{
   import _1404._1407;
   import _226._227;
   import _226._233;
   import _226._239;
   import _470._469;
   import _521._532;
   import _555.AnimationPanelController;
   import _573.TimelinePanelController;
   import _93._92;
   
   public class _424 extends _92
   {
      public function _424()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         var _loc1_:_227 = new _227();
         _loc1_._1572(_469._2916(_2223.newBoneVO,_2223._3052));
         _loc1_._2893();
         var _loc2_:_233 = new _233();
         _loc2_._1572(_469._2897(_2223.newSlotVO,_2223.newBoneVO));
         _loc2_._2893();
         _loc2_._2894();
         this._2894();
         _2223._1992._1874();
         this._2226._2484 = _2223.newSlotVO;
      }
      
      override public function revert() : void
      {
         super.revert();
         var _loc1_:_239 = new _239();
         _loc1_._1572([_2223.newSlotVO]);
         _loc1_.execute();
         var _loc2_:_239 = new _239();
         _loc2_._1572([_2223.newBoneVO]);
         _loc2_.execute();
         this._2894();
         this._2226._2484 = null;
      }
      
      private function _2894() : void
      {
         this._2858._2886();
         this._2852._2886();
      }
      
      protected function get _2858() : AnimationPanelController
      {
         return _1407.getInstance(AnimationPanelController) as AnimationPanelController;
      }
      
      protected function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
      
      protected function get _2226() : _532
      {
         return _1407.getInstance(_532);
      }
   }
}

