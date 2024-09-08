package _13515
{
   import _13492._13491;
   import _13503._13502;
   import _13505._13509;
   import _1404._1407;
   import _51._50;
   import _555.AnimationPanelController;
   import _555._558;
   import _573.TimelinePanelController;
   import _93._92;
   
   public class _13524 extends _92
   {
      private var _3108:Vector.<_92>;
      
      public function _13524()
      {
         super();
         this._3108 = new Vector.<_92>();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this._3108.length == 0)
         {
            if(this._3005)
            {
               this.addFrame();
            }
            else
            {
               this._3135();
            }
         }
         _loc1_ = 0;
         _loc2_ = int(this._3108.length);
         while(_loc1_ < _loc2_)
         {
            this._3108[_loc1_].execute();
            _loc1_++;
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         var _loc1_:int = 0;
         _loc1_ = int(this._3108.length - 1);
         while(_loc1_ >= 0)
         {
            this._3108[_loc1_].revert();
            _loc1_--;
         }
         this._2894();
      }
      
      private function _2894() : void
      {
         _2209._10707(this._1886);
         this._2852._10708();
         this._2858._2886();
         this._2852._2891();
         this._2852.refresh();
         this._2852._3002();
         this._2908._10687();
      }
      
      protected function _3135() : void
      {
         var _loc1_:_13532 = null;
         var _loc2_:Object = null;
         if(Boolean(this._13730) && Boolean(this._13731))
         {
            _loc1_ = new _13532();
            _loc2_ = {};
            _loc2_._1945 = this._13730;
            _loc2_._1946 = this._13731;
            _loc2_.newValue = this.newValue;
            _loc2_.oldValue = this.oldValue;
            _loc1_._1572(_loc2_);
            this._3108.push(_loc1_);
         }
      }
      
      private function addFrame() : void
      {
         var _loc1_:_13521 = null;
         var _loc2_:Object = null;
         if(Boolean(this._13730) && Boolean(this._13731))
         {
            this._13731.value = this.newValue;
            _loc1_ = new _13521();
            _loc2_ = {};
            _loc2_._1945 = this._13730;
            _loc2_._1946 = this._13731;
            _loc1_._1572(_loc2_);
            this._3108.push(_loc1_);
         }
      }
      
      protected function get _1886() : _50
      {
         return _2223._1897 as _50;
      }
      
      protected function get _1992() : _13502
      {
         return _2223._1992;
      }
      
      protected function get frameIndex() : int
      {
         return _2223.frameIndex;
      }
      
      protected function get _13730() : _13509
      {
         return _2223._1945;
      }
      
      protected function get _13731() : _13491
      {
         return _2223._1946;
      }
      
      protected function get _3005() : Boolean
      {
         return _2223._3005;
      }
      
      private function get newValue() : Array
      {
         return _2223.newValue;
      }
      
      private function get oldValue() : Array
      {
         return _2223.oldValue;
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

