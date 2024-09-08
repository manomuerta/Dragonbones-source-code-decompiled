package _226
{
   import _1404._1407;
   import _51._52;
   import _51._79;
   import _555._558;
   import _555._570;
   import _555._571;
   import _573.TimelinePanelController;
   import _703._705;
   import _93._92;
   
   public class _257 extends _92
   {
      public function _257()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2999(this.newName);
      }
      
      override public function revert() : void
      {
         super.revert();
         this._2999(this._2952);
      }
      
      protected function _2999(param1:String) : void
      {
         this._1836.name = param1;
         this._2880._2943(_705._2944[this._1836]);
         this._2962._2963(this._1836);
         this._1837.name = param1;
         this._2880._2943(_705._2273[this._1837]);
         this._2908._2943(_705._2997[this._1837]);
         _570(_1407.getInstance(_570)).refresh();
         this._2962._2998(this._1837);
      }
      
      protected function get _1836() : _52
      {
         return _2223._1836;
      }
      
      protected function get _1837() : _79
      {
         return _2223._1837;
      }
      
      protected function get newName() : String
      {
         return _2223.newValue;
      }
      
      protected function get _2952() : String
      {
         return _2223.oldValue;
      }
      
      protected function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
      
      protected function get _2962() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
      
      protected function get _2908() : _558
      {
         return _1407.getInstance(_558) as _558;
      }
   }
}

