package _13191
{
   import _1404._1407;
   import _51._50;
   import _51._70;
   import _51._78;
   import _51._79;
   import _555.LibraryPanelController;
   import _555._13201;
   import _555._13202;
   import _93._92;
   
   public class _13193 extends _92
   {
      public function _13193()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_70 = null;
         super.execute();
         _loc1_ = 0;
         _loc2_ = int(this._13229.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._13229[_loc1_] as _70;
            this._1886._1965(_loc3_,false);
            _loc1_++;
         }
         this._1837._2156 = this._13246;
         this._2894();
      }
      
      override public function revert() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_70 = null;
         super.revert();
         _loc1_ = 0;
         _loc2_ = int(this._13229.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._13229[_loc1_] as _70;
            this._1886._1766(_loc3_,this._1837,_loc3_._1733,this._1839.name);
            _loc1_++;
         }
         this._1837._1715.length = 0;
         _loc1_ = 0;
         _loc2_ = int(this.origin.length);
         while(_loc1_ < _loc2_)
         {
            this._1837._1715.push(this.origin[_loc1_]);
            _loc1_++;
         }
         this._1837._2156 = this._13245;
         this._2894();
      }
      
      private function _2894() : void
      {
         this._13242.refresh();
         this._13242._13243();
         _2212._2907(this._1837);
         LibraryPanelController(_1407.getInstance(LibraryPanelController)).refreshItemNum();
         this._13241._13244();
      }
      
      protected function get _1837() : _79
      {
         return _2223._1837;
      }
      
      protected function get _1839() : _78
      {
         return _2223._1839;
      }
      
      protected function get _13229() : Array
      {
         return _2223._13229;
      }
      
      protected function get origin() : Array
      {
         return _2223.origin;
      }
      
      protected function get _1886() : _50
      {
         return _2223._1886;
      }
      
      protected function get _13246() : _70
      {
         return _2223._13246;
      }
      
      protected function get _13245() : _70
      {
         return _2223._13245;
      }
      
      private function get _13242() : _13201
      {
         return _1407.getInstance(_13201) as _13201;
      }
      
      private function get _13241() : _13202
      {
         return _1407.getInstance(_13202) as _13202;
      }
   }
}

