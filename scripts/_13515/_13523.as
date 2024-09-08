package _13515
{
   import _1404._1407;
   import _51._50;
   import _555.AnimationPanelController;
   import _555._558;
   import _573.TimelinePanelController;
   import _93._92;
   
   public class _13523 extends _92
   {
      private var _3108:Vector.<_92>;
      
      public function _13523()
      {
         super();
         this._3108 = new Vector.<_92>();
      }
      
      override public function execute() : void
      {
         this._1886._10662 = this.newValue;
         _2209._10710(this._1886);
         this._1886._10663(this.newValue);
         this._2894();
      }
      
      private function _2894() : void
      {
         this._2852._10708();
         this._2858._2886();
         this._2852._2891();
         this._2852.refresh();
         this._2852._3002();
         this._2908._10687();
      }
      
      protected function get _1886() : _50
      {
         return _2223._1897 as _50;
      }
      
      private function get newValue() : Array
      {
         return _2223.newValue;
      }
      
      protected function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
      
      protected function get _2908() : _558
      {
         return _1407.getInstance(_558) as _558;
      }
      
      private function get _2858() : AnimationPanelController
      {
         return _1407.getInstance(AnimationPanelController) as AnimationPanelController;
      }
   }
}

