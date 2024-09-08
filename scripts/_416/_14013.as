package _416
{
   import _13492._13495;
   import _13503._13502;
   import _13505._13510;
   import _1404._1407;
   import _51._70;
   import _51._79;
   import _555._570;
   import _555._571;
   import _555._576;
   import _573.TimelinePanelController;
   import _586._594;
   import _93._92;
   
   public class _14013 extends _92
   {
      private var _3010:_70;
      
      private var _14018:Boolean;
      
      private var _14019:String;
      
      public function _14013()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._3010 = this._1837._2049;
         if(!this.autoKey)
         {
            this._14018 = _2209._14017(this._1837);
            this._14019 = this._1837._2161;
            this._3407(this._14020);
         }
         else
         {
            if(this._3005)
            {
               this._1946._13603 = this._14020 == _79.CACHE_NO_ANIM ? null : this._14020;
               this._1945._4589(this._1946);
               if(this._1945._1816.length == 1)
               {
                  this._2852._2891();
               }
            }
            else
            {
               this._1946._13603 = this._14020 == _79.CACHE_NO_ANIM ? null : this._14020;
            }
            this._13755();
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         this._3010 = this._1837._2049;
         if(!this.autoKey)
         {
            if(this._14018)
            {
               this._3407(this._14019);
            }
            else
            {
               this._13755();
            }
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
            this._1946._13603 = this._14021;
         }
         this._2894();
      }
      
      override protected function _2211() : *
      {
         return this._1837._2149;
      }
      
      protected function _2894() : void
      {
         _2212._2907(this._1837);
         if(this.autoKey)
         {
            this._2852.refresh();
         }
         this._3009.refresh(this._1837);
         this._2852._3002();
         this._2853.refresh(this._1837);
         this._3008.refresh(this._1837);
      }
      
      protected function _3407(param1:String) : void
      {
         this._1837._2161 = param1;
         _2209._3404(this._1837);
      }
      
      private function _13755() : void
      {
         _2209._3394(this._1837);
      }
      
      protected function get _14020() : String
      {
         return _2223._14020;
      }
      
      protected function get _14021() : String
      {
         return _2223._14021;
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
      
      protected function get _1946() : _13495
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
      
      protected function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
      
      protected function get _3009() : _576
      {
         return _1407.getInstance(_576) as _576;
      }
      
      protected function get _3008() : _594
      {
         return _1407.getInstance(_594) as _594;
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

