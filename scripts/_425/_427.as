package _425
{
   import _1404._1407;
   import _226._239;
   import _51._52;
   import _521._532;
   import _555.AnimationPanelController;
   import _555.LibraryPanelController;
   import _555._558;
   import _555._571;
   import _573.TimelinePanelController;
   import _586._588;
   import _586._598;
   import _81._87;
   import _93._92;
   
   public class _427 extends _92
   {
      public function _427()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc4_:_239 = null;
         var _loc5_:int = 0;
         var _loc2_:Array = [];
         super._1572({
            "_2938":param1._2889,
            "_2889":(param1._2889 as Array).concat(),
            "_2941":_loc2_,
            "_3412":param1._3412
         });
         var _loc3_:int = _87._2199(param1._2889,{
            "convertDisplayToSlot":false,
            "convertSlotToBone":true,
            "filterRootBone":true
         });
         _loc4_ = new _239();
         _loc4_._1572(param1._2889);
         _loc4_._2213();
         _loc2_.push(_loc4_);
      }
      
      private function get _2936() : Array
      {
         return _2223._2938 as Array;
      }
      
      protected function get _2941() : Array
      {
         return _2223._2941;
      }
      
      override public function execute() : void
      {
         super.execute();
         var _loc1_:int = 0;
         var _loc2_:int = int(this._2941.length);
         while(_loc1_ < _loc2_)
         {
            (this._2941[_loc1_] as _92).execute();
            _loc1_++;
         }
         this._2894();
         this._2226._2484 = this._3412;
      }
      
      override public function revert() : void
      {
         super.revert();
         var _loc1_:int = int(this._2941.length);
         while(_loc1_--)
         {
            this._2941[_loc1_].revert();
         }
         this._2894();
         this._2226._2889 = this._2889;
      }
      
      public function _2894() : void
      {
         this._2909.refresh();
         this._2880._2891();
         this._2908._2891();
         this._2858._2886();
         this._2852._2875();
         this._2852._2886();
         this._2852._3411();
         this._2861.refreshItemNum();
         this._2226._2484 = null;
      }
      
      private function get _3412() : _52
      {
         return _2223._3412 as _52;
      }
      
      private function get _2889() : Array
      {
         return _2223._2889 as Array;
      }
      
      protected function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
      
      protected function get _2858() : AnimationPanelController
      {
         return _1407.getInstance(AnimationPanelController) as AnimationPanelController;
      }
      
      protected function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
      
      protected function get _2877() : _588
      {
         return _1407.getInstance(_588) as _588;
      }
      
      protected function get _2909() : _598
      {
         return _1407.getInstance(_598) as _598;
      }
      
      protected function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
      
      protected function get _2908() : _558
      {
         return _1407.getInstance(_558) as _558;
      }
      
      protected function get _2226() : _532
      {
         return _1407.getInstance(_532);
      }
   }
}

