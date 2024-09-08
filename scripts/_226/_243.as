package _226
{
   import _1404._1407;
   import _51._50;
   import _555.AnimationPanelController;
   import _555.LibraryPanelController;
   import _555._570;
   import _555._571;
   import _703._705;
   import _93._92;
   
   public class _243 extends _92
   {
      public function _243()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2893();
         this._2861.saveLastSelectArmature();
         this._2861._2950(this._2952,this.newName);
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._1886.name = this._2952;
         this._2861.saveLastSelectArmature();
         this._2861._2950(this.newName,this._2952);
         this._2894();
      }
      
      override protected function _2211() : *
      {
         return this._1886.name;
      }
      
      public function _2893() : void
      {
         this._1886.name = this.newName;
      }
      
      public function _2894() : void
      {
         if(this._2880._2871._2865 == this._1886)
         {
            this._2880._2943(_705._2951[this._1886]);
            this._2858.modifyArmatureName(this._1886);
         }
         this._2853.refresh();
         this._2861.refreshSelectedArmature();
      }
      
      protected function get _1886() : _50
      {
         return _2223._1897;
      }
      
      protected function get newName() : String
      {
         return _2223.name;
      }
      
      protected function get _2952() : String
      {
         return _2208;
      }
      
      protected function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
      
      protected function get _2858() : AnimationPanelController
      {
         return _1407.getInstance(AnimationPanelController) as AnimationPanelController;
      }
      
      protected function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
      
      protected function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
   }
}

