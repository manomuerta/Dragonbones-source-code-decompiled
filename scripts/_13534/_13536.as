package _13534
{
   import _1404._1407;
   import _555.LibraryPanelController;
   import _724._13550;
   import _93._92;
   
   public class _13536 extends _92
   {
      public function _13536()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2893();
         this._2861.renameVitualFolder(this._2952,this.newName);
      }
      
      override public function revert() : void
      {
         super.revert();
         this._13736.name = this._2952;
         this._2861.renameVitualFolder(this.newName,this._2952);
      }
      
      public function _2893() : void
      {
         this._13736.name = this.newName;
      }
      
      override protected function _2211() : *
      {
         return this._13736.name;
      }
      
      protected function get _13736() : _13550
      {
         return _2223._1897 as _13550;
      }
      
      protected function get newName() : String
      {
         return _2223.name;
      }
      
      protected function get _2952() : String
      {
         return _2208;
      }
      
      protected function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
   }
}

