package _226
{
   import _1404._1407;
   import _51._77;
   import _555._570;
   import _93._92;
   
   public class _252 extends _92
   {
      public function _252()
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
         this._2942.bendDirection = this._2989;
         this._2894();
      }
      
      override protected function _2211() : *
      {
         return this._2942.bendDirection;
      }
      
      public function _2893() : void
      {
         this._2942.bendDirection = this._2990;
      }
      
      public function _2894() : void
      {
         _2212._2939();
         _570(_1407.getInstance(_570)).refresh();
      }
      
      public function get _2942() : _77
      {
         return _2223._1897;
      }
      
      public function get _2990() : int
      {
         return _2223.bendDirection;
      }
      
      protected function get _2989() : int
      {
         return _2208;
      }
   }
}

