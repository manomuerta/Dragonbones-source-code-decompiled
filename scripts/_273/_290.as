package _273
{
   import _1404._1407;
   import _555.LibraryPanelController;
   import _93._92;
   
   public class _290 extends _92
   {
      public function _290()
      {
         super();
         _2219 = false;
         _2215 = false;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2861._3111();
      }
      
      public function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
   }
}

