package _226
{
   import _1404._1407;
   import _51._50;
   import _555._558;
   import _555._570;
   import _573.TimelinePanelController;
   import _586._598;
   import _93._92;
   
   public class _14059 extends _92
   {
      public function _14059()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._3020(this._3019);
      }
      
      override public function revert() : void
      {
         super.revert();
         this._3020(this._3018);
      }
      
      protected function _3020(param1:Array) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:_50 = this._3021;
         if(_loc2_._1780.length == param1.length)
         {
            _loc2_._1780.length = 0;
            _loc3_ = int(param1.length - 1);
            while(_loc3_ >= 0)
            {
               _loc2_._1780.push(param1[_loc3_]);
               _loc3_--;
            }
         }
         _loc2_._10654();
         _loc2_._10663(_loc2_._10658);
         this._2908._2891();
         this._2909.refresh();
         this._2852._3015();
      }
      
      protected function get _3019() : Array
      {
         return _2223._3019;
      }
      
      protected function get _3018() : Array
      {
         return _2223._3018;
      }
      
      protected function get _3021() : _50
      {
         return _2223._1886;
      }
      
      protected function get _2908() : _558
      {
         return _1407.getInstance(_558) as _558;
      }
      
      protected function get _2909() : _598
      {
         return _1407.getInstance(_598) as _598;
      }
      
      protected function get _3016() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
      
      protected function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
   }
}

