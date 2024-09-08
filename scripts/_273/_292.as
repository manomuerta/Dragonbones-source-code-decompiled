package _273
{
   import _1404._1407;
   import _472._473;
   import _54._57;
   import _54._67;
   import _555._556;
   import _586._589;
   import _586._605;
   import _644._645;
   import _644._646;
   import _783.ComicNotification;
   import _93._92;
   
   public class _292 extends _92
   {
      public function _292()
      {
         super();
         _2219 = true;
         _2215 = true;
         _2224 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
      }
      
      override public function execute() : void
      {
         var _loc1_:_646 = new _646(this._3070);
         _loc1_.track = this._2069;
         _loc1_.tweens.push(this._3117);
         this._3070._3107 = _loc1_;
         this._3070._3107.track.tweens[0] = this._3117;
         this._2894();
         this._3058._1567(new ComicNotification(ComicNotification.PREVIEW_TRACK,_loc1_));
      }
      
      override public function revert() : void
      {
         this._3070._3107 = this._3077;
         this._3070._3107.track.tweens[0] = this._2071;
         this._2894();
      }
      
      private function _2894() : void
      {
         if(this._3070._3107)
         {
            this._3058._3076(this._3070._3107);
         }
         this._3058.refresh();
         this._3056.refresh();
         this._3055._2894();
         this._3113._3115();
      }
      
      private function get _2069() : _57
      {
         return _2223._2069 as _57;
      }
      
      public function get _2071() : _67
      {
         return _2223._2071 as _67;
      }
      
      public function get _3117() : _67
      {
         return _2223._3117 as _67;
      }
      
      private function get _3077() : _646
      {
         return _2223._3077 as _646;
      }
      
      public function get parent() : _57
      {
         return this._2071.parent;
      }
      
      public function get _3070() : _645
      {
         return this._3055._3058._3116(this._2071);
      }
      
      public function get _3055() : _473
      {
         return _1407.getInstance(_473) as _473;
      }
      
      private function get _3058() : _589
      {
         return _1407.getInstance(_589) as _589;
      }
      
      private function get _3056() : _556
      {
         return _1407.getInstance(_556) as _556;
      }
      
      protected function get _3113() : _605
      {
         return _1407.getInstance(_605) as _605;
      }
   }
}

