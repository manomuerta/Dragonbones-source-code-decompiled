package _413
{
   import _13505._13510;
   import _1404._1407;
   import _573.TimelinePanelController;
   import _586._596;
   import _93._92;
   
   public class _464 extends _92
   {
      private var _3108:Vector.<_92>;
      
      public function _464()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         var _loc1_:_13510 = null;
         var _loc2_:_463 = null;
         var _loc3_:_456 = null;
         var _loc4_:Object = null;
         _2208 = [];
         this._3108 = new Vector.<_92>();
         for(_loc4_ in this.data._3448)
         {
            _loc2_ = new _463();
            _loc3_ = new _456();
            _loc3_._1945 = _loc4_ as _13510;
            _loc3_.frames = this.data._3448[_loc4_];
            _loc2_._1572(_loc3_);
            _loc2_.execute();
            this._3108.push(_loc2_);
         }
         if(this._3443.open)
         {
            this._3443._3444(null,null);
         }
         this._2852._3002();
         this._2852.refresh();
         this._2852._3140();
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
         if(this._3443.open)
         {
            this._3443._3444(null,null);
         }
         this._2852._3002();
         this._2852.refresh();
         this._2852._3140();
         this._2852._3446();
      }
      
      private function get data() : _458
      {
         return _2223 as _458;
      }
      
      private function get _3443() : _596
      {
         return _1407.getInstance(_596) as _596;
      }
      
      private function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
   }
}

