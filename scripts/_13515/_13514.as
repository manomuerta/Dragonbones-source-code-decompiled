package _13515
{
   import _13492._13493;
   import _13492._13494;
   import _13492._13495;
   import _13492._13498;
   import _13492._13499;
   import _13503._13502;
   import _13505._13510;
   import _1404._1407;
   import _51._52;
   import _555._576;
   import _573.TimelinePanelController;
   import _93._92;
   
   public class _13514 extends _92
   {
      private var _3108:Vector.<_92>;
      
      public function _13514()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         this._3108 = new Vector.<_92>();
         this.addFrame();
      }
      
      private function addFrame() : void
      {
         var _loc1_:_13521 = null;
         var _loc2_:Object = null;
         if(Boolean(this._13581) && Boolean(this._13627))
         {
            _loc1_ = new _13521();
            _loc2_ = {};
            _loc2_._1945 = this._13581;
            _loc2_._1946 = this._13627;
            _loc1_._1572(_loc2_);
            this._3108.push(_loc1_);
         }
         if(Boolean(this._13598) && Boolean(this._13631))
         {
            _loc1_ = new _13521();
            _loc2_ = {};
            _loc2_._1945 = this._13598;
            _loc2_._1946 = this._13631;
            _loc1_._1572(_loc2_);
            this._3108.push(_loc1_);
         }
         if(Boolean(this._13595) && Boolean(this._13710))
         {
            _loc1_ = new _13521();
            _loc2_ = {};
            _loc2_._1945 = this._13595;
            _loc2_._1946 = this._13710;
            _loc1_._1572(_loc2_);
            this._3108.push(_loc1_);
         }
         if(Boolean(this._13599) && Boolean(this._13632))
         {
            _loc1_ = new _13521();
            _loc2_ = {};
            _loc2_._1945 = this._13599;
            _loc2_._1946 = this._13632;
            _loc1_._1572(_loc2_);
            this._3108.push(_loc1_);
         }
         if(Boolean(this._13593) && Boolean(this._13707))
         {
            _loc1_ = new _13521();
            _loc2_ = {};
            _loc2_._1945 = this._13593;
            _loc2_._1946 = this._13707;
            _loc1_._1572(_loc2_);
            this._3108.push(_loc1_);
         }
         if(Boolean(this._13592) && Boolean(this._13708))
         {
            _loc1_ = new _13521();
            _loc2_ = {};
            _loc2_._1945 = this._13592;
            _loc2_._1946 = this._13708;
            _loc1_._1572(_loc2_);
            this._3108.push(_loc1_);
         }
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this._3108.length);
         while(_loc1_ < _loc2_)
         {
            this._3108[_loc1_].execute();
            _loc1_++;
         }
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
      }
      
      public function _2894() : void
      {
         this._2852._3133();
         this._2852.refresh();
         this._2852._3002();
         this._2852._3140();
         _576(_1407.getInstance(_576)).refresh();
      }
      
      protected function get _1836() : _52
      {
         return _2223._1897 as _52;
      }
      
      protected function get _1992() : _13502
      {
         return _2223._1992;
      }
      
      protected function get frameIndex() : int
      {
         return _2223.frameIndex;
      }
      
      protected function get _13581() : _13510
      {
         return _2223._13581;
      }
      
      protected function get _13595() : _13510
      {
         return _2223._13595;
      }
      
      protected function get _13598() : _13510
      {
         return _2223._13598;
      }
      
      protected function get _13627() : _13498
      {
         return _2223._13627;
      }
      
      protected function get _13710() : _13499
      {
         return _2223._13710;
      }
      
      protected function get _13631() : _13498
      {
         return _2223._13631;
      }
      
      protected function get _13599() : _13510
      {
         return _2223._13599;
      }
      
      protected function get _13632() : _13494
      {
         return _2223._13632;
      }
      
      protected function get _13593() : _13510
      {
         return _2223._13593;
      }
      
      protected function get _13707() : _13495
      {
         return _2223._13707;
      }
      
      protected function get _13592() : _13510
      {
         return _2223._13592;
      }
      
      protected function get _13708() : _13493
      {
         return _2223._13708;
      }
      
      protected function get _3005() : Boolean
      {
         return _2223._3005;
      }
      
      protected function get autoKey() : Boolean
      {
         return _2223.autoKey;
      }
      
      protected function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
   }
}

