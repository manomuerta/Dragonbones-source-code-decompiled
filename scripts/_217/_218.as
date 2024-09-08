package _217
{
   import _13503._13502;
   import _1404._1407;
   import _51._50;
   import _555.AnimationPanelController;
   import _555._570;
   import _573.TimelinePanelController;
   import _93._92;
   
   public class _218 extends _92
   {
      public function _218()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         _2208 = this.data;
         this._1886._13651(this._1992);
         this._13699.delAnimation(this._1992);
         this._2852._2855();
         this._2853.refresh();
      }
      
      override public function revert() : void
      {
         this._1886._13580(this._1992);
         this._13699.addAnimation(this._1992);
         this._2853.refresh();
      }
      
      private function get _1886() : _50
      {
         return this.data.armature as _50;
      }
      
      private function get _1992() : _13502
      {
         return this.data.animation as _13502;
      }
      
      private function get data() : Object
      {
         return _2223;
      }
      
      private function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
      
      private function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
      
      private function get _13699() : AnimationPanelController
      {
         return _1407.getInstance(AnimationPanelController) as AnimationPanelController;
      }
   }
}

