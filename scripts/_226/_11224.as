package _226
{
   import _11220._11219;
   import _1404._1407;
   import _51._70;
   import _555._558;
   import _555._570;
   import _555._571;
   import _573.TimelinePanelController;
   import _703._705;
   import _93._92;
   
   public class _11224 extends _92
   {
      public function _11224()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2893(this.newName);
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._2893(this._2952);
         this._2894();
      }
      
      override protected function _2211() : *
      {
         return this.displayVO.name;
      }
      
      public function _2893(param1:String) : void
      {
         var _loc2_:_11219 = this.displayVO._11278;
         if(_loc2_)
         {
            _loc2_.name = param1;
            this.displayVO._11284();
         }
      }
      
      public function _2894() : void
      {
         this._2880._2943(_705._3014[this.displayVO]);
         this._2853.refresh();
      }
      
      protected function get displayVO() : _70
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
      
      protected function get _2962() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
      
      protected function get _2908() : _558
      {
         return _1407.getInstance(_558) as _558;
      }
      
      protected function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
   }
}

