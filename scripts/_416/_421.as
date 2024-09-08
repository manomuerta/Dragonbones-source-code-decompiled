package _416
{
   import _13492._13496;
   import _13503._13502;
   import _13505._13510;
   import _1404._1407;
   import _18.IAction;
   import _51._79;
   import _555._570;
   import _573.TimelinePanelController;
   import _81._83;
   import _93._92;
   
   public class _421 extends _92
   {
      public function _421()
      {
         super();
         _2215 = true;
         _2219 = true;
         _2224 = true;
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         var _loc2_:_421 = param1 as _421;
         if(_loc2_ && _loc2_._1837 == this._1837 && _loc2_._1992 == this._1992 && _loc2_.frameIndex == this.frameIndex && _loc2_.autoKey == this.autoKey)
         {
            _2223.newColor = _loc2_.newColor;
            return true;
         }
         return false;
      }
      
      override public function execute() : void
      {
         super.execute();
         if(!this.autoKey)
         {
            this._3398(this.newColor);
         }
         else if(this._3005)
         {
            this._1946.value = this.newColor;
            this._1945._4589(this._1946);
            if(this._1945._1816.length == 1)
            {
               this._2852._2891();
            }
         }
         else
         {
            this._1946.value = this.newColor;
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         if(!this.autoKey)
         {
            this._3398(this._3007);
         }
         else if(this._3005)
         {
            this._1945._1943(this._1946);
            if(this._1945._1816.length == 0)
            {
               this._2852._2891();
            }
         }
         else
         {
            this._1946.value = this._3007;
         }
         this._2894();
         _2209._3151();
      }
      
      override protected function _2211() : *
      {
         return this._1837._2147;
      }
      
      protected function _2894() : void
      {
         _2212._3006(this._1837);
         if(this.autoKey)
         {
            this._13754();
            this._2852.refresh();
         }
         this._2852._3002();
         this._2853.refresh();
         _2212._3006(this._1837);
      }
      
      protected function _3398(param1:_83) : void
      {
         this._1837._2147 = param1;
         this._1837._13689 = this.alpha;
         this._1837._13688 = !this.alpha;
         _2209._3397(this._1837);
      }
      
      private function _13754() : void
      {
         _2209._3394(this._1837);
      }
      
      protected function get newColor() : _83
      {
         return _2223.newColor;
      }
      
      protected function get _3007() : _83
      {
         return _2223._3007;
      }
      
      protected function get _1837() : _79
      {
         return _2223._1837 as _79;
      }
      
      protected function get _1992() : _13502
      {
         return _2223._1992;
      }
      
      protected function get frameIndex() : int
      {
         return _2223.frameIndex;
      }
      
      protected function get _1945() : _13510
      {
         return _2223._1945;
      }
      
      protected function get _1946() : _13496
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
      
      protected function get alpha() : Boolean
      {
         return _2223.alpha;
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

