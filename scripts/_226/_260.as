package _226
{
   import _1404._1407;
   import _51._79;
   import _555._570;
   import _81._83;
   import _93._92;
   
   public class _260 extends _92
   {
      public function _260()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2955(this.newColor);
      }
      
      override public function revert() : void
      {
         super.revert();
         this._2955(this._3007);
      }
      
      override protected function _2211() : *
      {
         return this._1837._2152;
      }
      
      protected function _2955(param1:_83) : void
      {
         this._1837._2152 = param1;
         _2212._3006(this._1837);
         this._2853.refresh(this._1837);
      }
      
      protected function get _1837() : _79
      {
         return _2223._1837;
      }
      
      protected function get newColor() : _83
      {
         return _2223.newColor;
      }
      
      protected function get _3007() : _83
      {
         return _2223._3007;
      }
      
      protected function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
   }
}

