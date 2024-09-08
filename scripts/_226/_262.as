package _226
{
   import _1404._1407;
   import _51._50;
   import _51._79;
   import _555._558;
   import _555._570;
   import _573.TimelinePanelController;
   import _586._598;
   import _708._715;
   import _93._92;
   
   public class _262 extends _92
   {
      public function _262()
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
         this._3022.reverse();
         this._3020(this._3018);
         this._3022.reverse();
      }
      
      protected function _3020(param1:Array) : void
      {
         var _loc3_:_79 = null;
         var _loc5_:int = 0;
         var _loc2_:_50 = this._3021;
         var _loc4_:int = int(this._3022.length);
         while(_loc4_--)
         {
            _loc3_ = this._3022[_loc4_];
            _loc5_ = int(param1[_loc4_]);
            _loc2_._1974(_loc3_,param1[_loc4_]);
            this._3016.refresh(_loc3_);
            if(_2220._2873 == _715.ARMATURE)
            {
               this._2908._3017(_loc3_,_loc5_);
            }
         }
         _loc2_._10654();
         if(_2220._2873 == _715.ARMATURE)
         {
            _loc2_._10663(_loc2_._10658);
         }
         this._2908._2891();
         this._2909.refresh();
         this._2852._3015();
      }
      
      protected function get _3022() : Array
      {
         return _2223._3022;
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
         return (this._3022[0] as _79).parentBoneData.rootArmatureData;
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

