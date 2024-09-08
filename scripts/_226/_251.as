package _226
{
   import _1404._1407;
   import _521._532;
   import _555.AnimationPanelController;
   import _573.TimelinePanelController;
   import _708._715;
   import _93._92;
   
   public class _251 extends _92
   {
      private var _2988:_228;
      
      private var _2987:_250;
      
      public function _251()
      {
         this._2988 = new _228();
         this._2987 = new _250();
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         this._2987._1572(this._2942);
         this._2988._1572(this._1836);
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2988.execute();
         this._2987.execute();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._2987.revert();
         this._2988.revert();
         this._2226._2889 = _2208;
         if(_2220._2873 == _715.ANIMATE)
         {
            (_1407.getInstance(AnimationPanelController) as AnimationPanelController)._2886();
            (_1407.getInstance(TimelinePanelController) as TimelinePanelController)._2875();
         }
      }
      
      protected function get _1836() : Object
      {
         return _2223.bone;
      }
      
      protected function get _2942() : Object
      {
         return _2223.ikConstraint;
      }
      
      protected function get _2226() : _532
      {
         return _1407.getInstance(_532);
      }
      
      override protected function _2211() : *
      {
         return this._2226._2889;
      }
   }
}

