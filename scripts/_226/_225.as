package _226
{
   import _13503._13502;
   import _13505._13508;
   import _1404._1407;
   import _388._392;
   import _470._469;
   import _51._50;
   import _51._71;
   import _51._79;
   import _521._532;
   import _555.LibraryPanelController;
   import _648._665;
   import _708._715;
   import _73.SymbolType;
   import _783.StageNotification;
   import _93._92;
   
   public class _225 extends _92
   {
      private var _2862:_392;
      
      public function _225()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
      }
      
      override public function execute() : void
      {
         this._2226._2484 = null;
         this._2864(this._2869);
         super.execute();
         this.dragonBonesVO._2128(this._2869);
         this._2861._2867(this._2869,this._2866);
         this._2871._2865 = this._2869;
         if(this._2862)
         {
            this._2862.execute();
         }
         this._2861._1567(new StageNotification(StageNotification.UPDATE_CURRENT_ARMATURE));
         this._13263(this._2869);
      }
      
      private function _13263(param1:_50) : void
      {
         var _loc2_:_79 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:_13508 = null;
         var _loc7_:_13502 = null;
         if(param1._1811 == SymbolType.SHEET)
         {
            _loc2_ = param1._1780[0];
            if(_loc2_)
            {
               _loc5_ = [];
               _loc6_ = new _13508();
               _loc6_._13572._1816 = _loc5_;
               _loc6_._1824 = _loc2_;
               (_loc7_ = new _13502()).playTimes = param1.playTimes;
               _loc7_.frameRate = param1.frameRate;
               _loc7_.name = param1.name;
               _loc7_.duration = _loc2_._1715.length;
               _loc7_._1745 = [_loc6_];
               _loc7_._1746 = [];
               param1._13619[0] = _loc7_;
            }
         }
      }
      
      override public function revert() : void
      {
         this._2864(this._2870);
         super.revert();
         this.dragonBonesVO._2125(this._2869);
         this._2861._2863(this._2869.name);
         if(this._2871)
         {
            this._2871._2865 = this._2870;
            if(this._2862)
            {
               this._2862.revert();
            }
            if(this._2862)
            {
               this._2862.execute();
            }
            this._2861._1567(new StageNotification(StageNotification.UPDATE_CURRENT_ARMATURE));
         }
      }
      
      private function _2864(param1:_50) : void
      {
         var _loc2_:_715 = null;
         if(this._2871._2865._1811 != param1._1811)
         {
            if(param1._1811 == SymbolType.MC || param1._1811 == SymbolType.STAGE)
            {
               _loc2_ = _715.GENERAL;
            }
            else if(param1._1811 == SymbolType.ARMATURE)
            {
               _loc2_ = _715.ARMATURE;
            }
            else if(param1._1811 == SymbolType.SHEET)
            {
               _loc2_ = _715.SHEET;
            }
            if(_2220._2873 != _loc2_)
            {
               this._2862 = new _392();
               this._2862._1572(_469._2860(this._2871.projectPath,_loc2_));
               this._2862._2213();
            }
         }
      }
      
      private function get _2870() : _50
      {
         return _2223._2870 as _50;
      }
      
      private function get _2869() : _50
      {
         return _2223._2869 as _50;
      }
      
      private function get _2866() : String
      {
         return _2223._2866 as String;
      }
      
      private function get dragonBonesVO() : _71
      {
         return _2223.dragonBonesVO as _71;
      }
      
      private function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
      
      private function get _2226() : _532
      {
         return _1407.getInstance(_532) as _532;
      }
      
      private function get _2871() : _665
      {
         if(_2214._1844)
         {
            return _2214._1844._2871;
         }
         return null;
      }
   }
}

