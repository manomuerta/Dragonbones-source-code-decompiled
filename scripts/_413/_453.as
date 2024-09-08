package _413
{
   import _1404._1407;
   import _573.TimelinePanelController;
   import _93._92;
   
   public class _453 extends _92
   {
      public function _453()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         var _loc1_:TimelinePanelController = _1407.getInstance(TimelinePanelController) as TimelinePanelController;
         _loc1_._3439(this._3438._1946,this._3438._3440);
      }
      
      override public function revert() : void
      {
         var _loc1_:TimelinePanelController = _1407.getInstance(TimelinePanelController) as TimelinePanelController;
         _loc1_._3439(this._3438._1946,-this._3438._3440);
      }
      
      private function get _3438() : _454
      {
         return _2223 as _454;
      }
   }
}

