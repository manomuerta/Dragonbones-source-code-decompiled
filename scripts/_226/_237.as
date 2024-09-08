package _226
{
   import _1404._1407;
   import _388._390;
   import _470._469;
   import _51._50;
   import _51._69;
   import _51._70;
   import _51._79;
   import _521._532;
   import _555.LibraryPanelController;
   import _555._570;
   import _555._571;
   import _586._594;
   import _676._677;
   import _93._92;
   
   public class _237 extends _92
   {
      public function _237()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         _2223._2899 = this.displayVO._1760;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2893();
         this._2894();
         this._2226._2484 = null;
      }
      
      override public function revert() : void
      {
         super.revert();
         this._2857();
         this._2894();
         this._2226._2484 = this.displayVO;
      }
      
      override protected function _2211() : *
      {
         return {
            "_2898":this.displayVO._1985.name,
            "parentSlot":this.displayVO._1760,
            "_1733":this.displayVO._1733,
            "defaultDisplayVO":this._2899._2156
         };
      }
      
      public function _2893() : void
      {
         this._2914(true);
         this._2899._2156 = this._2924;
         this._1886._1965(this.displayVO);
         this._2879._2927(this.displayVO);
         _2212._2907(this._2899);
         this._2879._2901(this._2899);
      }
      
      private function _2914(param1:Boolean) : void
      {
         var _loc2_:_390 = new _390();
         _loc2_._1572({
            "isRemove":param1,
            "items":this.displayVO
         });
         _loc2_.execute();
      }
      
      public function _2857() : void
      {
         this._2914(false);
         var _loc1_:_232 = new _232();
         _loc1_._1572(_469._2895(this.displayVO,this._2925,this._2926,this._2923,this._2903 == this.displayVO));
         _loc1_._2893();
      }
      
      public function _2894() : void
      {
         this._2880._2891();
         _570(_1407.getInstance(_570)).refresh();
         LibraryPanelController(_1407.getInstance(LibraryPanelController)).refreshItemNum();
         _594(_1407.getInstance(_594))._2902();
      }
      
      protected function get displayVO() : _70
      {
         return _2223.displayVO;
      }
      
      protected function get _2924() : _70
      {
         return _2223._2924;
      }
      
      protected function get _2899() : _79
      {
         return _2223._2899;
      }
      
      protected function get _1886() : _50
      {
         return this.displayVO._1760.parentBoneData.rootArmatureData as _50;
      }
      
      protected function get _2925() : String
      {
         return _2208._2898;
      }
      
      protected function get _2926() : _79
      {
         return _2208.parentSlot as _79;
      }
      
      protected function get _2923() : _69
      {
         return _2208._1733 as _69;
      }
      
      protected function get _2903() : _70
      {
         return _2208.defaultDisplayVO;
      }
      
      protected function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
      
      protected function get _2879() : _677
      {
         return this._2880._2882._2879;
      }
      
      protected function get _2226() : _532
      {
         return _1407.getInstance(_532);
      }
   }
}

