package _226
{
   import _1404._1407;
   import _51._50;
   import _51._77;
   import _555._570;
   import _555._571;
   import _703._705;
   import _93._92;
   
   public class _240 extends _92
   {
      public function _240()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
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
         this._2857();
         this._2894();
      }
      
      public function _2893() : void
      {
         this._1886._1991(this._2942);
      }
      
      public function _2857() : void
      {
         this._1886._1822(this._2942);
      }
      
      public function _2894() : void
      {
         _2212._2939();
         _570(_1407.getInstance(_570)).refresh();
         this._2880._2943(_705._2944[this._2942.target]);
      }
      
      protected function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
      
      protected function get _2942() : _77
      {
         return _2223 as _77;
      }
      
      protected function get _1886() : _50
      {
         return this._2942.target.rootArmatureData as _50;
      }
   }
}

