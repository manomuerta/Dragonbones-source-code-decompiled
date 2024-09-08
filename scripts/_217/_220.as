package _217
{
   import _1404._1407;
   import _555.AnimationPanelController;
   import _93._92;
   
   public class _220 extends _92
   {
      public function _220()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function execute() : void
      {
         var _loc1_:AnimationPanelController = _1407.getInstance(AnimationPanelController) as AnimationPanelController;
         _loc1_.modify(this.data.target,this.data.fadeInTime,this.data.playTimes);
      }
      
      override public function revert() : void
      {
         var _loc1_:AnimationPanelController = _1407.getInstance(AnimationPanelController) as AnimationPanelController;
         _loc1_.modify(this._2857.target,this._2857.fadeInTime,this._2857.playTimes);
      }
      
      private function get _2857() : _221
      {
         return _2208 as _221;
      }
      
      private function get data() : _221
      {
         return _2223 as _221;
      }
      
      override protected function _2211() : *
      {
         return _2208;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         var _loc2_:_221 = new _221();
         _loc2_.target = this.data.target;
         _loc2_.fadeInTime = this.data.target.fadeInTime;
         _loc2_.playTimes = this.data.target.playTimes;
         _2208 = _loc2_;
      }
   }
}

