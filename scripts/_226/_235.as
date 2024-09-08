package _226
{
   import _1404._1407;
   import _51._50;
   import _51._71;
   import _555.LibraryPanelController;
   import _648._665;
   import _783.StageNotification;
   import _93._92;
   
   public class _235 extends _92
   {
      private var _10285:_267;
      
      public function _235()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc2_:Object = null;
         super._1572(param1);
         if(_2223._4154)
         {
            this._10285 = new _267();
            _loc2_ = {};
            _loc2_.curArmature = this._2912;
            _loc2_.oldArmature = this._2870;
            this._10285._1572(_loc2_);
         }
      }
      
      override public function execute() : void
      {
         super.execute();
         if(this._10285)
         {
            this._10285.execute();
         }
         this.dragonBonesVO._2125(this._2870);
         this._2861._2863(this._2870.name);
         if(this._2912 != null)
         {
            this._2871._2865 = this._2912;
            this._2861._1567(new StageNotification(StageNotification.UPDATE_CURRENT_ARMATURE));
         }
         else
         {
            this._2861._1567(new StageNotification(StageNotification.CHECK_CURRENT_ARMATURE));
         }
      }
      
      override public function revert() : void
      {
         super.revert();
         this.dragonBonesVO._2128(this._2870);
         this._2861.addArmatureVOByPanretVO(this._2870,this._2913,this._2870._13655);
         if(this._2912 != null && Boolean(this._2871))
         {
            this._2871._2865 = this._2870;
            this._2861._1567(new StageNotification(StageNotification.UPDATE_CURRENT_ARMATURE));
         }
         else
         {
            this._2861._1567(new StageNotification(StageNotification.CHECK_CURRENT_ARMATURE));
         }
         if(this._10285)
         {
            this._10285.revert();
         }
      }
      
      private function get _2870() : _50
      {
         return _2223._2870 as _50;
      }
      
      private function get _2912() : _50
      {
         return _2223._2912 as _50;
      }
      
      private function get _2913() : String
      {
         return _2223._2913 as String;
      }
      
      private function get dragonBonesVO() : _71
      {
         return _2223.dragonBonesVO as _71;
      }
      
      private function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
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

