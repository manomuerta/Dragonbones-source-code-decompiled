package _226
{
   import _1404._1407;
   import _51._50;
   import _51._79;
   import _555._570;
   import _93._92;
   
   public class _259 extends _92
   {
      public function _259()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         if(this._1837)
         {
            this._1837.gotoAndPlay = this.newAnimation;
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         if(this._1837)
         {
            this._1837.gotoAndPlay = this._2945;
         }
         this._2894();
      }
      
      private function get _1886() : _50
      {
         return _2223._1886 as _50;
      }
      
      private function get _2945() : String
      {
         return _2223._2945;
      }
      
      private function get newAnimation() : String
      {
         return _2223.newAnimation;
      }
      
      private function get _1837() : _79
      {
         return _2223._1837 as _79;
      }
      
      private function _2894() : void
      {
         this._2853.refresh();
         if(this._1837)
         {
            _2212._2907(this._1837);
         }
      }
      
      private function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
   }
}

