package _416
{
   import _1404._1407;
   import _40._10598;
   import _40._39;
   import _413._412;
   import _413._436;
   import _413._452;
   import _51._50;
   import _555.AnimationPanelController;
   import _555._558;
   import _573.TimelinePanelController;
   import _93._92;
   
   public class _10608 extends _92
   {
      public var _10676:Boolean;
      
      public function _10608()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         if(!this._2852._3001 || this._2852.timeline == null || this._2852._3001._10657 == null)
         {
            this._10676 = true;
            return;
         }
         _2223.frameIndex = this._2852.timeline.curFrame;
         _2223._1992 = this._2852._3001;
         _2223._1886 = this._2852._3001.rootArmatureData;
         _2223._1946 = this._1992._10657.getFrameByIndex(_2223.frameIndex);
         _2223._3005 = false;
         if(!_2223._1946)
         {
            _2223._2933 = this._1886._10659;
            _2223._3005 = true;
            _2223._1946 = _10598._1572(this.zOrder);
         }
         else
         {
            _2223._2933 = this._1946.zOrder;
         }
         _2223.autoKey = this._2852.autoKey;
      }
      
      override public function execute() : void
      {
         if(this._10676)
         {
            return;
         }
         super.execute();
         if(!this.autoKey)
         {
            this._10709(this.zOrder);
         }
         else if(this._3005)
         {
            this.addFrame();
         }
         else
         {
            this._1946.zOrder = this.zOrder;
         }
         this._2894();
      }
      
      private function _2894() : void
      {
         this._2852._10708();
         if(this.autoKey)
         {
            this._2858._2886();
            this._2852._2891();
            this._2852.refresh();
         }
         this._2852._3002();
         this._2908._10687();
      }
      
      override public function revert() : void
      {
         if(this._10676)
         {
            return;
         }
         if(!this.autoKey)
         {
            this._10709(this._2933);
         }
         else if(this._3005)
         {
            this.delFrame();
         }
         else
         {
            this._1946.zOrder = this._2933;
         }
         this._2894();
      }
      
      protected function _3406() : _452
      {
         var _loc1_:_452 = new _452();
         _loc1_._1946 = this._1946;
         _loc1_._1945 = this._1992._10657;
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
      
      private function _10709(param1:Array) : void
      {
         this._1886._10662 = param1;
         _2209._10710(this._1886);
         this._1886._10663(param1);
      }
      
      protected function get frameIndex() : int
      {
         return _2223.frameIndex;
      }
      
      protected function get _3005() : Boolean
      {
         return _2223._3005;
      }
      
      protected function get autoKey() : Boolean
      {
         return _2223.autoKey;
      }
      
      private function get _1946() : _10598
      {
         return _2223._1946;
      }
      
      protected function get _2933() : Array
      {
         return _2223._2933;
      }
      
      protected function get zOrder() : Array
      {
         return _2223.zOrder;
      }
      
      protected function get _1992() : _39
      {
         return _2223._1992;
      }
      
      protected function get _1886() : _50
      {
         return _2223._1886;
      }
      
      protected function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
      
      protected function get _2908() : _558
      {
         return _1407.getInstance(_558) as _558;
      }
      
      private function get _2858() : AnimationPanelController
      {
         return _1407.getInstance(AnimationPanelController) as AnimationPanelController;
      }
   }
}

