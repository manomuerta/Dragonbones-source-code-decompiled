package _413
{
   import _13492._13496;
   import _13505._13509;
   import _13505._13510;
   import _1404._1407;
   import _555.AnimationPanelController;
   import _573.TimelinePanelController;
   import _93._92;
   
   public class _437 extends _92
   {
      private var _11565:Boolean;
      
      public function _437()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         var _loc1_:_13510 = null;
         var _loc2_:_13496 = null;
         var _loc3_:Array = null;
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         for(_loc4_ in this.data._3429)
         {
            _loc1_ = _loc4_ as _13510;
            _loc3_ = this.data._3429[_loc4_];
            _loc5_ = 0;
            _loc6_ = int(_loc3_.length);
            while(_loc5_ < _loc6_)
            {
               _loc2_ = _loc3_[_loc5_];
               _loc1_._1943(_loc2_);
               _loc5_++;
            }
            if(_loc1_ is _13509)
            {
               this._11565 = true;
            }
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         var _loc1_:_13510 = null;
         var _loc2_:_13496 = null;
         var _loc3_:Array = null;
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         for(_loc4_ in this.data._3429)
         {
            _loc1_ = _loc4_ as _13510;
            _loc3_ = this.data._3429[_loc4_];
            _loc5_ = 0;
            _loc6_ = int(_loc3_.length);
            while(_loc5_ < _loc6_)
            {
               _loc2_ = _loc3_[_loc5_];
               _loc1_.addKeyFrameAt(_loc2_,_loc2_.startPos);
               _loc5_++;
            }
         }
         this._2894();
      }
      
      private function _2894() : void
      {
         this._2962._3002();
         if(this._11565)
         {
            this._2858._2886();
            this._2962._2891();
         }
         this._2962.refresh();
         this._2962._3186();
         this._2962._3133();
         this._2962._3140();
      }
      
      private function get data() : _460
      {
         return _2223 as _460;
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
      
      private function get _2962() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
      
      private function get _2858() : AnimationPanelController
      {
         return _1407.getInstance(AnimationPanelController) as AnimationPanelController;
      }
   }
}

