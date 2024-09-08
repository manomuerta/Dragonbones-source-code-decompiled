package _273
{
   import _1404._1407;
   import _51._79;
   import _555._556;
   import _555._576;
   import _586._589;
   import _586._605;
   import _81._83;
   import _93._92;
   
   public class _10431 extends _92
   {
      public function _10431()
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
         if(this._1837)
         {
            this._3112._2907(this._1837);
         }
         this._3112.refresh();
         this._3113._3114();
         this._3113._3115();
         this._3113._2064();
         this._3056.refresh();
         this._3009.refresh();
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
      
      protected function get _3112() : _589
      {
         return _1407.getInstance(_589) as _589;
      }
      
      protected function get _3113() : _605
      {
         return _1407.getInstance(_605) as _605;
      }
      
      protected function get _3056() : _556
      {
         return _1407.getInstance(_556) as _556;
      }
      
      protected function get _3009() : _576
      {
         return _1407.getInstance(_576) as _576;
      }
   }
}

