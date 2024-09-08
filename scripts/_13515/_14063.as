package _13515
{
   import _13492._14034;
   import _13503._13502;
   import _13505._13510;
   import _1404._1407;
   import _18.IAction;
   import _51._77;
   import _555._570;
   import _573.TimelinePanelController;
   import _93._92;
   
   public class _14063 extends _92
   {
      public function _14063()
      {
         super();
         _2215 = true;
         _2219 = true;
         _2224 = true;
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         var _loc2_:_14063 = param1 as _14063;
         if(_loc2_ && _loc2_._2942 == this._2942 && _loc2_._1992 == this._1992 && _loc2_.frameIndex == this.frameIndex && _loc2_.autoKey == this.autoKey && _loc2_._2989 == this._2989)
         {
            _2223._2991 = _loc2_._2991;
            return true;
         }
         return false;
      }
      
      override public function execute() : void
      {
         super.execute();
         if(!this.autoKey)
         {
            this._14429(this._2990,this._2991);
         }
         else if(this._3005)
         {
            this._1946.value = this._2991;
            this._1946.bend = this._2990;
            this._1945._4589(this._1946);
            if(this._1945._1816.length == 1)
            {
               this._2852._2891();
            }
         }
         else
         {
            this._1946.value = this._2991;
            this._1946.bend = this._2990;
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         if(!this.autoKey)
         {
            this._14429(this._2989,this._2992);
            if(_2223.addBendCache)
            {
               _2209._14428(this._2942);
            }
            if(_2223.addWeightCache)
            {
               _2209._14426(this._2942);
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
            this._1946.value = this._2992;
            this._1946.bend = this._2989;
         }
         this._2894();
      }
      
      protected function _2894() : void
      {
         if(this.autoKey)
         {
            this._14431();
            this._2852.refresh();
         }
         this._2852._3002();
         this._2853._14432();
      }
      
      protected function _14429(param1:int, param2:Number) : void
      {
         if(this._2942._2134 != param1 && this._2942._14310 != param1)
         {
            if(this._2942._2134 == 0)
            {
               _2223.addBendCache = true;
            }
            this._2942._2134 = param1;
            _2209._14430(this._2942);
         }
         if(this._2942._2133 != param2 && this._2942._14311 != param2)
         {
            if(this._2942._2133 == -1)
            {
               _2223.addWeightCache = true;
            }
            this._2942._2133 = param2;
            _2209._14427(this._2942);
         }
      }
      
      private function _14431() : void
      {
         _2209._14431(this._2942);
      }
      
      protected function get _2990() : int
      {
         return _2223._2990;
      }
      
      protected function get _2989() : int
      {
         return _2223._2989;
      }
      
      protected function get _2991() : Number
      {
         return _2223._2991;
      }
      
      protected function get _2992() : Number
      {
         return _2223._2992;
      }
      
      protected function get _2942() : _77
      {
         return _2223._2942;
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
      
      protected function get _1946() : _14034
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

