package _273
{
   import _1404._1407;
   import _51._50;
   import _51._52;
   import _51._69;
   import _51._70;
   import _51._79;
   import _521._523;
   import _555._558;
   import _586._605;
   import _93._92;
   
   public class _274 extends _92
   {
      public function _274()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         var _loc1_:_79 = _2223._1837 as _79;
         if(_2223._1836)
         {
            this._1836.parentBoneData = this._3052;
            this._1886._1794(this._1836);
            this._1836._1751();
            _loc1_.parentBoneData = this._1836;
            if(isNaN(this.zOrder))
            {
               this._1886._1792(_loc1_);
            }
            else
            {
               this._1886._1986(_loc1_,this.zOrder);
            }
         }
         if(_2223.needAddDisplayVO)
         {
            this._1886._1766(this.displayVO,_loc1_,this._1733,this._2898);
            _loc1_._2156 = this.displayVO;
            _loc1_._1751();
         }
         this._2894();
         this._2226._2986(null,_loc1_);
      }
      
      override public function revert() : void
      {
         super.revert();
         var _loc1_:_79 = _2223._1837 as _79;
         if(_2223.needAddDisplayVO)
         {
            _loc1_._2156 = null;
            this._1886._1965(this.displayVO);
         }
         if(_2223._1836)
         {
            this._1886._1978(_loc1_);
            this._1886._1983(this._1836);
         }
         this._2894();
         if(this._2226._3054 == _loc1_)
         {
            this._2226._3053 = null;
         }
         if(this._2226._3050.indexOf(_loc1_) != -1)
         {
            this._2226._2986(null);
         }
      }
      
      public function _2894() : void
      {
         this._3049._3051();
      }
      
      protected function get _2898() : String
      {
         return _2223._2898;
      }
      
      protected function get _1886() : _50
      {
         return this._3052.rootArmatureData as _50;
      }
      
      protected function get displayVO() : _70
      {
         return _2223.displayVO as _70;
      }
      
      protected function get _1733() : _69
      {
         return _2223._1733;
      }
      
      protected function get zOrder() : Number
      {
         return _2223.zOrder;
      }
      
      private function get _1836() : _52
      {
         return _2223._1836 as _52;
      }
      
      protected function get _3052() : _52
      {
         return _2223._3052 as _52;
      }
      
      protected function get _3049() : _605
      {
         return _1407.getInstance(_605) as _605;
      }
      
      protected function get _2908() : _558
      {
         return _1407.getInstance(_558) as _558;
      }
      
      protected function get _2226() : _523
      {
         return _1407.getInstance(_523);
      }
   }
}

