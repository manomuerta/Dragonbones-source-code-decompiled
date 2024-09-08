package _354
{
   import _1404._1407;
   import _555.LibraryPanelController;
   import _93._92;
   
   public class _11098 extends _92
   {
      public function _11098()
      {
         super();
         _2219 = false;
         _2215 = false;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2861.importSequenceImagesToStage();
      }
      
      public function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
   }
}

