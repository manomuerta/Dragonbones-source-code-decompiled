package _226
{
   import _1404._1407;
   import _388._392;
   import _470._469;
   import _51._50;
   import _521._532;
   import _555.LibraryPanelController;
   import _648._665;
   import _708._715;
   import _73.SymbolType;
   import _783.StageNotification;
   import _93._92;
   
   public class _267 extends _92
   {
      private var _2862:_392;
      
      public function _267()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc2_:_715 = null;
         super._1572(param1);
         if(this._2871._2865._1811 != this._3028._1811)
         {
            if(this._3028._1811 == SymbolType.MC || this._3028._1811 == SymbolType.STAGE)
            {
               _loc2_ = _715.GENERAL;
            }
            else if(this._3028._1811 == SymbolType.ARMATURE)
            {
               _loc2_ = _715.ARMATURE;
            }
            else if(this._3028._1811 == SymbolType.SHEET)
            {
               _loc2_ = _715.SHEET;
            }
            if(_2220._2873 != _loc2_)
            {
               this._2862 = new _392();
               this._2862._1572(_469._2860(this._2871.projectPath,_loc2_));
               this._2862._2213();
               _2223._3030 = _2220._2873;
            }
         }
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2871._2865 = this._3028;
         if(this._3028._1811 == SymbolType.ARMATURE)
         {
            this._3028._1976();
         }
         this._2226._2484 = null;
         if(this._2862)
         {
            this._2862.execute();
         }
         this._2861._1567(new StageNotification(StageNotification.UPDATE_CURRENT_ARMATURE));
      }
      
      override public function revert() : void
      {
         var _loc1_:_392 = null;
         super.revert();
         this._2871._2865 = this._3029;
         this._2226._2484 = null;
         if(this._2862)
         {
            _loc1_ = new _392();
            _loc1_._1572(_469._2860(this._2871.projectPath,this._3030));
            _loc1_._2213();
            _loc1_.execute();
         }
         this._2861._1567(new StageNotification(StageNotification.UPDATE_CURRENT_ARMATURE));
      }
      
      private function get _3030() : _715
      {
         return _2223._3030 as _715;
      }
      
      private function get _3028() : _50
      {
         return _2223.curArmature as _50;
      }
      
      private function get _3029() : _50
      {
         return _2223.oldArmature as _50;
      }
      
      private function get _2871() : _665
      {
         return _2214._1844._2871;
      }
      
      private function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
      
      protected function get _2226() : _532
      {
         return _1407.getInstance(_532);
      }
   }
}

