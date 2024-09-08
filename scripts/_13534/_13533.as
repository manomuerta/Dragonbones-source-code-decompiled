package _13534
{
   import _1404._1407;
   import _555.LibraryPanelController;
   import _724._13550;
   import _93._92;
   
   public class _13533 extends _92
   {
      public function _13533()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2861.addVitualFolderVO(this._13736);
      }
      
      override public function revert() : void
      {
         super.revert();
         this._2861._13735(this._13736);
      }
      
      private function get _13736() : _13550
      {
         return _2223._13736 as _13550;
      }
      
      private function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
   }
}

