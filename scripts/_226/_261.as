package _226
{
   import _1404._1407;
   import _51._70;
   import _51._79;
   import _555._558;
   import _555._570;
   import _555._571;
   import _555._576;
   import _586._11247;
   import _586._594;
   import _703._702;
   import _703._705;
   import _93._92;
   
   public class _261 extends _92
   {
      public function _261()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._3011(this._3013);
      }
      
      override public function revert() : void
      {
         this._3011(this._3012);
      }
      
      override protected function _2211() : *
      {
         return this._1837._2156;
      }
      
      protected function _3011(param1:_70) : void
      {
         var _loc3_:_702 = null;
         var _loc4_:_702 = null;
         var _loc2_:_70 = this._1837._2156;
         this._1837._2156 = param1;
         if(_loc2_)
         {
            this._2880._2943(_705._3014[_loc2_]);
            _loc3_ = _705._3014[_loc2_];
            if(_loc3_)
            {
               this._2880._2943(_loc3_.parent);
            }
         }
         if(param1)
         {
            _loc4_ = _705._3014[param1];
            this._2880._2943(_loc4_);
            if(_loc4_)
            {
               this._2880._2943(_loc4_.parent);
            }
         }
         _2212._2907(this._1837);
         this._3009.refresh(this._1837);
         this._2853.refresh(this._1837);
         this._3008.refresh(this._1837);
         this._11296.refresh(this._1837);
         this._2908._2891();
      }
      
      protected function get _1837() : _79
      {
         return _2223._1837 as _79;
      }
      
      protected function get _3013() : _70
      {
         return _2223._3013 as _70;
      }
      
      protected function get _3012() : _70
      {
         return _2208;
      }
      
      protected function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
      
      protected function get _3009() : _576
      {
         return _1407.getInstance(_576) as _576;
      }
      
      protected function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
      
      protected function get _3008() : _594
      {
         return _1407.getInstance(_594) as _594;
      }
      
      protected function get _11296() : _11247
      {
         return _1407.getInstance(_11247) as _11247;
      }
      
      protected function get _2908() : _558
      {
         return _1407.getInstance(_558) as _558;
      }
   }
}

