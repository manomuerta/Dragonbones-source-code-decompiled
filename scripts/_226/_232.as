package _226
{
   import _1404._1407;
   import _470._469;
   import _51._50;
   import _51._69;
   import _51._70;
   import _51._79;
   import _521._532;
   import _555.LibraryPanelController;
   import _555._558;
   import _555._570;
   import _555._571;
   import _586._594;
   import _676._677;
   import _93._92;
   
   public class _232 extends _92
   {
      public function _232()
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
         this._2226._2484 = this._2899;
      }
      
      override public function revert() : void
      {
         super.revert();
         var _loc1_:_237 = new _237();
         _loc1_._1572(_469._2900(this.displayVO,this._2903));
         _loc1_._2893();
         _loc1_._2894();
         this._2226._2484 = this._2884;
      }
      
      public function _2893() : void
      {
         this._1886._1766(this.displayVO,this._2899,this._1733,this._2898);
         if(this._2904)
         {
            this._2899._2156 = this.displayVO;
         }
         if(this.displayVO && this.displayVO._2165 && Boolean(this.displayVO.mesh._1831))
         {
            this.displayVO._1789();
         }
         this._2879._2906(this.displayVO);
         _2212._2907(this._2899);
         this._2879._2901(this._2899);
      }
      
      public function _2894() : void
      {
         this._2880._2891();
         _570(_1407.getInstance(_570)).refresh();
         LibraryPanelController(_1407.getInstance(LibraryPanelController)).refreshItemNum();
         _594(_1407.getInstance(_594))._2902();
         _558(_1407.getInstance(_558))._2891();
      }
      
      override protected function _2211() : *
      {
         return {
            "defaultDisplayVO":this._2899._2156,
            "_2484":this._2226._2484
         };
      }
      
      protected function get displayVO() : _70
      {
         return _2223.displayVO;
      }
      
      protected function get _2898() : String
      {
         return _2223._2898;
      }
      
      protected function get _2899() : _79
      {
         return _2223._2899;
      }
      
      protected function get _1733() : _69
      {
         return _2223._1733;
      }
      
      protected function get _2904() : Boolean
      {
         return _2223._2904;
      }
      
      protected function get _2884() : Object
      {
         return _2208._2484;
      }
      
      protected function get _2903() : _70
      {
         return _2208.defaultDisplayVO;
      }
      
      protected function get _1886() : _50
      {
         return this._2899.parentBoneData.rootArmatureData as _50;
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

