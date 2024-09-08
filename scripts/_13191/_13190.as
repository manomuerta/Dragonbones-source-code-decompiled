package _13191
{
   import _1404._1407;
   import _51._50;
   import _51._69;
   import _51._70;
   import _51._79;
   import _521._532;
   import _555.LibraryPanelController;
   import _555._13201;
   import _555._13202;
   import _555._570;
   import _93._92;
   
   public class _13190 extends _92
   {
      public function _13190()
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
         this._1886._1965(this.displayVO,false);
         if(this._2903)
         {
            this._2899._2156 = this._2903;
         }
         this._2894();
      }
      
      public function _2893() : void
      {
         this._1886._1766(this.displayVO,this._2899,this._1733,this._2898);
         if(this._2904)
         {
            this._2899._2156 = this.displayVO;
         }
      }
      
      public function _2894() : void
      {
         _2212._2907(this._2899);
         _570(_1407.getInstance(_570)).refresh();
         LibraryPanelController(_1407.getInstance(LibraryPanelController)).refreshItemNum();
         this._13241._13244();
         this._13242._13243();
      }
      
      override protected function _2211() : *
      {
         return {"defaultDisplayVO":this._2899._2156};
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
      
      protected function get _2226() : _532
      {
         return _1407.getInstance(_532);
      }
      
      private function get _13241() : _13202
      {
         return _1407.getInstance(_13202) as _13202;
      }
      
      private function get _13242() : _13201
      {
         return _1407.getInstance(_13201) as _13201;
      }
   }
}

