package _13534
{
   import _1404._1407;
   import _226._267;
   import _51._50;
   import _51._71;
   import _555.LibraryPanelController;
   import _648._665;
   import _692._13549;
   import _724._13550;
   import _755._757;
   import _783.StageNotification;
   import _93._92;
   
   public class _13535 extends _92
   {
      private var _10285:_267;
      
      public function _13535()
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
            _loc2_.oldArmature = this._13742;
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
         this._2871.libraryData._13743(this._13741);
         this._2861._3678._13738(this._13741);
         var _loc1_:int = 0;
         while(_loc1_ < this._13740.length)
         {
            this.dragonBonesVO._2125(this._13740[_loc1_]);
            _loc1_++;
         }
         this._2861._3678._13737(this._13740);
         this._2861._13735(this._13741[0]);
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
         var _loc2_:_13550 = null;
         var _loc3_:_13549 = null;
         var _loc4_:_13549 = null;
         var _loc5_:_13549 = null;
         var _loc6_:_50 = null;
         var _loc7_:String = null;
         super.revert();
         var _loc1_:int = 0;
         while(_loc1_ < this._13741.length)
         {
            this._2871.libraryData._13744(this._13741[_loc1_]);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this._13740.length)
         {
            this.dragonBonesVO._2128(this._13740[_loc1_]);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this._13741.length)
         {
            _loc2_ = this._13741[_loc1_];
            if(_loc2_._13695 is _757)
            {
               _loc3_ = _13549._3996(this._2861._3678,_loc2_);
               this._2861._3678._13739[_loc2_] = _loc3_;
            }
            else if(_loc2_._13695 is _13550)
            {
               _loc4_ = this._2861._3678._13739[_loc2_._13695];
               _loc5_ = _13549._3996(_loc4_,_loc2_);
               this._2861._3678._13739[_loc2_] = _loc5_;
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this._13740.length)
         {
            _loc6_ = this._13740[_loc1_];
            _loc7_ = this._2861._3678._4138(_loc6_.name);
            this._2861.addArmatureVOByPanretVO(_loc6_,_loc7_,_loc6_._13655);
            _loc1_++;
         }
         this._2861._2891();
         if(this._2912 != null && Boolean(this._2871))
         {
            this._2871._2865 = this._13742;
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
      
      private function get _13742() : _50
      {
         return _2223._13742;
      }
      
      private function get _13740() : Array
      {
         return _2223._13740;
      }
      
      private function get _13741() : Array
      {
         return _2223._13741;
      }
      
      private function get _2912() : _50
      {
         return _2223._2912 as _50;
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

