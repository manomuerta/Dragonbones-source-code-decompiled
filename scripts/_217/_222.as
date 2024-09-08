package _217
{
   import _1404._1407;
   import _555.AnimationPanelController;
   import _555._570;
   import _573.TimelinePanelController;
   import _93._92;
   
   public class _222 extends _92
   {
      public function _222()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         this._2858.rename(this.data._1896,this.data.name);
         this._2852.rename(this.data._1896);
         this._2853.refresh();
      }
      
      override public function revert() : void
      {
         this._2858.rename(_223(_1634)._1896,_223(_1634).name);
         this._2852.rename(_223(_1634)._1896);
         this._2853.refresh();
      }
      
      private function get data() : _223
      {
         return _2223 as _223;
      }
      
      override protected function _2211() : *
      {
         return _2208;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         var _loc2_:_223 = new _223();
         _loc2_._1896 = this.data._1896;
         _loc2_.name = this.data._1896.name;
         _2208 = _loc2_;
      }
      
      private function get _2858() : AnimationPanelController
      {
         return _1407.getInstance(AnimationPanelController) as AnimationPanelController;
      }
      
      private function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
      
      private function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
   }
}

