package _413
{
   import _13492._13496;
   import _13505._13510;
   import _1404._1407;
   import _555._570;
   import _555._576;
   import _573.TimelinePanelController;
   import _93._92;
   
   public class _462 extends _92
   {
      private var _13763:Vector.<_13496>;
      
      public function _462()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         var _loc2_:int = 0;
         var _loc3_:_13496 = null;
         var _loc4_:_13510 = null;
         var _loc1_:int = 0;
         this._13763 = new Vector.<_13496>();
         _loc1_ = 0;
         _loc2_ = int(this.data.frames.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this.data.frames[_loc1_];
            _loc4_ = _loc3_.parent;
            if(Boolean(_loc3_) && Boolean(_loc4_))
            {
               this._13762(_loc3_,_loc4_);
            }
            _loc1_++;
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         var _loc2_:int = 0;
         var _loc3_:_13496 = null;
         var _loc4_:_13510 = null;
         var _loc1_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this.data.frames.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this.data.frames[_loc1_];
            _loc4_ = _loc3_.parent;
            if(Boolean(_loc3_) && Boolean(_loc4_))
            {
               _loc4_._1943(_loc3_);
            }
            _loc1_++;
         }
         if(Boolean(this._13763) && this._13763.length > 0)
         {
            _loc1_ = 0;
            _loc2_ = int(this._13763.length);
            while(_loc1_ < _loc2_)
            {
               _loc3_ = this._13763[_loc1_];
               _loc4_ = _loc3_.parent;
               if(Boolean(_loc3_) && Boolean(_loc4_))
               {
                  _loc4_.addKeyFrameAt(_loc3_,_loc3_.startPos);
               }
               _loc1_++;
            }
         }
         this._2894();
      }
      
      private function _2894() : void
      {
         this._2852._3024();
         this._2852._3132();
         this._2852._2891();
         this._2852.refresh();
         this._2852._3002();
         _570(_1407.getInstance(_570)).refresh();
         _576(_1407.getInstance(_576)).refresh();
      }
      
      private function _13762(param1:_13496, param2:_13510) : void
      {
         var _loc3_:_13496 = param2.getFrameByIndex(param1.startPos);
         if(_loc3_)
         {
            this._13763.push(_loc3_);
            param2._1943(_loc3_);
         }
         param2.addKeyFrameAt(param1,param1.startPos);
      }
      
      private function get data() : _435
      {
         return _2223 as _435;
      }
      
      override protected function _2211() : *
      {
         return _2208;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         _2208 = param1;
      }
      
      private function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
   }
}

