package _319
{
   import _1404._1407;
   import _51._70;
   import _51._79;
   import _521._532;
   import _555._558;
   import _555._570;
   import _555._571;
   import _579._580;
   import _676._685;
   import _703._705;
   import _73._74;
   import _93._92;
   
   public class _322 extends _92
   {
      public function _322()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         this._1838.type = _74.IMAGE;
         var _loc1_:_685 = _705._3014[this._1838];
         this._1837.rootArmatureData._1871();
         this._2880._2943(_loc1_);
         this._2880._2943(_loc1_.parent);
         this._2894();
      }
      
      override public function revert() : void
      {
         this._1838.type = _74.MESH;
         var _loc1_:_685 = _705._3014[this._1838];
         this._1837.rootArmatureData._1871();
         this._2880._2943(_loc1_);
         if(this._2880._3175)
         {
            this._2880._2943(_loc1_.parent);
         }
         this._2894();
         if(this._2226._2484 == this._1838)
         {
            this._2226._2484 = null;
            this._2226._2484 = this._1838;
         }
      }
      
      private function _2894() : void
      {
         var _loc1_:Object = null;
         this._3176._2212._2907(this._1837);
         if(this._2226._2484)
         {
            _loc1_ = this._2226._2484;
            this._2226._2484 = null;
            this._2226._2484 = _loc1_;
         }
         this._14372._2891();
      }
      
      protected function get _1837() : _79
      {
         return _2223._1837 as _79;
      }
      
      protected function get _1838() : _70
      {
         return _2223._1838 as _70;
      }
      
      private function get _3176() : _580
      {
         return _1407.getInstance(_580) as _580;
      }
      
      private function get _2226() : _532
      {
         return _1407.getInstance(_532) as _532;
      }
      
      protected function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
      
      protected function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
      
      protected function get _14372() : _558
      {
         return _1407.getInstance(_558) as _558;
      }
   }
}

