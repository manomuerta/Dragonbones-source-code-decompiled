package _416
{
   import _1404._1407;
   import _40._39;
   import _40._47;
   import _40._48;
   import _413._412;
   import _413._436;
   import _413._452;
   import _51._79;
   import _555._570;
   import _573.TimelinePanelController;
   import _93._92;
   
   public class _420 extends _92
   {
      public function _420()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         if(!this._2852._3001 || this._2852.timeline == null)
         {
            return;
         }
         if(this._2852._3001._1875(this._1837) == null)
         {
            return;
         }
         _2223.frameIndex = this._2852.timeline.curFrame;
         _2223._1992 = this._2852._3001;
         _2223._1946 = this._1992._1875(this._1837).getFrameByIndex(_2223.frameIndex);
         _2223._3005 = false;
         if(!_2223._1946)
         {
            _2223._3005 = true;
            _2223._1946 = _47._1572(this._1837,true,this._1837._1923,this._1837._1926.clone());
         }
         _2223.autoKey = this._2852.autoKey;
      }
      
      override public function _1574() : void
      {
         if(this._1992)
         {
            super._1574();
         }
      }
      
      protected function _3406() : _452
      {
         var _loc1_:_452 = new _452();
         _loc1_._1946 = this._1946;
         _loc1_._1945 = this._1879;
         return _loc1_;
      }
      
      protected function addFrame() : void
      {
         this._1946.startPos = this.frameIndex;
         var _loc1_:_412 = new _412();
         _loc1_._1572(this._3406());
         _loc1_.execute();
      }
      
      protected function delFrame() : void
      {
         var _loc1_:_436 = new _436();
         _loc1_._1572(this._3406());
         _loc1_.execute();
      }
      
      protected function get _1837() : _79
      {
         return _2223._1837 as _79;
      }
      
      protected function get _1992() : _39
      {
         return _2223._1992;
      }
      
      protected function get frameIndex() : int
      {
         return _2223.frameIndex;
      }
      
      protected function get _1879() : _48
      {
         return this._1992._1875(this._1837);
      }
      
      protected function get _1946() : _47
      {
         return _2223._1946;
      }
      
      protected function get _3005() : Boolean
      {
         return _2223._3005;
      }
      
      protected function get autoKey() : Boolean
      {
         return _2223.autoKey;
      }
      
      protected function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
      
      protected function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
   }
}

