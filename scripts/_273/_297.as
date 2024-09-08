package _273
{
   import _1404._1407;
   import _470._469;
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
   
   public class _297 extends _92
   {
      private var _3128:_277;
      
      private var _3126:_287;
      
      public function _297()
      {
         this._3128 = new _277();
         this._3126 = new _287();
         super();
         _2219 = true;
         _2215 = true;
         _2224 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         this._3128._1572(this.addData);
         this._3126._1572(this._3127);
      }
      
      override public function execute() : void
      {
         this._3128.execute();
         this._3126.execute();
         this._2894();
      }
      
      private function _2894() : void
      {
         this._3058.refresh();
         this._3056.refresh();
         this._3055._2894();
         this._3113._3115();
         if(this._3077)
         {
            this._3058._3076(this._3077);
            this._3058._1567(new ComicNotification(ComicNotification.PREVIEW_TRACK,this._3077));
         }
      }
      
      override public function revert() : void
      {
         this._3126.revert();
         this._3128.revert();
         this._2894();
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
      
      public function get _3075() : int
      {
         return _2223._3075;
      }
      
      public function get parent() : _57
      {
         return this._2071.parent;
      }
      
      public function get addData() : Object
      {
         return _469._3125(this._2069,this._3117,this._3075,this._3077);
      }
      
      public function get _3127() : Object
      {
         var _loc1_:Object = {};
         _loc1_._1992 = this.parent.parent.parent;
         _loc1_._2070 = this.parent.parent;
         _loc1_._2069 = this._2069;
         _loc1_._2071 = this._3117;
         _loc1_._3070 = this._3070;
         _loc1_._3077 = this._3077;
         return _loc1_;
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

