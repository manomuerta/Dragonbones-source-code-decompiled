package _226
{
   import _1404._1407;
   import _51._52;
   import _555._570;
   import _555._571;
   import _573.TimelinePanelController;
   import _703._705;
   import _93._92;
   
   public class _246 extends _92
   {
      public function _246()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2893();
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._1836.name = this._2952;
         this._2894();
      }
      
      override protected function _2211() : *
      {
         return this._1836.name;
      }
      
      public function _2893() : void
      {
         this._1836.name = this.newName;
      }
      
      public function _2894() : void
      {
         this._2880._2943(_705._2944[this._1836]);
         _570(_1407.getInstance(_570)).refresh();
         this._2962._2963(this._1836);
      }
      
      public function get _1836() : _52
      {
         return _2223._1897;
      }
      
      public function get newName() : String
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
      
      protected function get _2962() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
   }
}

