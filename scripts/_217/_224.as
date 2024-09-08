package _217
{
   import _13503._13502;
   import _1404._1407;
   import _555.AnimationPanelController;
   import _573.TimelinePanelController;
   import _93._92;
   
   public class _224 extends _92
   {
      public function _224()
      {
         super();
      }
      
      override public function execute() : void
      {
         this._2852._2854(this._13596);
         this._13700._2854(this._13596);
      }
      
      private function get _13596() : _13502
      {
         return _2223 as _13502;
      }
      
      private function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
      
      private function get _13700() : AnimationPanelController
      {
         return _1407.getInstance(AnimationPanelController) as AnimationPanelController;
      }
   }
}

