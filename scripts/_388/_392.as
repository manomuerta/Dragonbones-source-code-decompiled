package _388
{
   import _1404._1407;
   import _472._577;
   import _555.AnimationPanelController;
   import _573.TimelinePanelController;
   import _708._715;
   import _93._92;
   
   public class _392 extends _92
   {
      public function _392()
      {
         super();
         _2215 = false;
         _2219 = true;
      }
      
      override public function execute() : void
      {
         var _loc1_:_577 = null;
         if(_2214._3328 == _2223.projectPath)
         {
            if(_2220._2873 != this._2872)
            {
               _loc1_ = _1407.getInstance(_577);
               _loc1_._3327();
               if(_2223._2872 == _715.ANIMATE)
               {
                  (_1407.getInstance(AnimationPanelController) as AnimationPanelController)._2886();
                  (_1407.getInstance(TimelinePanelController) as TimelinePanelController)._2886();
               }
               _2220._2873 = this._2872;
            }
         }
      }
      
      override public function revert() : void
      {
      }
      
      protected function get _2872() : _715
      {
         return _2223._2872;
      }
   }
}

