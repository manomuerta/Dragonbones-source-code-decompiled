package _226
{
   import _1404._1407;
   import _333._334;
   import _388._390;
   import _470._469;
   import _51._50;
   import _51._52;
   import _51._70;
   import _51._77;
   import _51._78;
   import _51._79;
   import _521._532;
   import _541._540;
   import _555.AnimationPanelController;
   import _555.LibraryPanelController;
   import _555._558;
   import _555._571;
   import _573.TimelinePanelController;
   import _586._588;
   import _586._598;
   import _658._660;
   import _676._677;
   import _708._715;
   import _73._74;
   import _93._92;
   import _97._103;
   
   public class _236 extends _92
   {
      public function _236()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc3_:_52 = null;
         var _loc4_:_52 = null;
         var _loc5_:Array = null;
         var _loc6_:_238 = null;
         var _loc7_:Vector.<_334> = null;
         var _loc8_:_79 = null;
         var _loc9_:_77 = null;
         var _loc10_:Array = null;
         var _loc11_:_77 = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:_70 = null;
         var _loc15_:_660 = null;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:Object = null;
         var _loc19_:_334 = null;
         super._1572(param1);
         if(this._1886 == null || this._1779 == null)
         {
            return;
         }
         var _loc2_:Array = [];
         for each(_loc3_ in this._1886._1779)
         {
            if(Boolean(_loc3_) && this._1779.indexOf(_loc3_.parentBoneData) != -1)
            {
               this._1779.push(_loc3_);
            }
         }
         for each(_loc4_ in this._1779)
         {
            if(_loc4_ != null)
            {
               _loc9_ = this._1886._1966(_loc4_);
               if(_loc9_)
               {
                  if(_loc2_.indexOf(_loc9_) == -1)
                  {
                     _loc2_.push(_loc9_);
                  }
               }
               _loc10_ = this._1886._1981(_loc4_);
               if((Boolean(_loc10_)) && Boolean(_loc10_.length))
               {
                  for each(_loc11_ in _loc10_)
                  {
                     if(_loc2_.indexOf(_loc11_) == -1)
                     {
                        _loc2_.push(_loc11_);
                     }
                  }
               }
            }
         }
         _2223._1999 = _loc2_;
         _loc5_ = [];
         _loc7_ = new Vector.<_334>();
         for each(_loc8_ in this._1886._1780)
         {
            if(this._1779.indexOf(_loc8_.parentBoneData) != -1)
            {
               _loc6_ = new _238();
               _loc6_._1572(_469._2896(_loc8_));
               _loc6_._2213();
               _loc5_.push(_loc6_);
            }
            _loc12_ = 0;
            _loc13_ = int(_loc8_._1715.length);
            while(_loc12_ < _loc13_)
            {
               _loc14_ = _loc8_._1765[_loc8_._1715[_loc12_]] as _70;
               if((_loc14_) && _loc14_.type == _74.MESH && _loc14_.mesh && _loc14_.mesh._2119())
               {
                  _loc15_ = _loc14_.mesh.meshRig;
                  if((Boolean(_loc15_)) && Boolean(_loc15_._2922))
                  {
                     _loc16_ = 0;
                     _loc17_ = int(_loc15_._2922.length);
                     while(_loc16_ < _loc17_)
                     {
                        if(this._1779.indexOf(_loc15_._2922[_loc16_]) != -1)
                        {
                           (_loc18_ = {})._1836 = _loc15_._2922[_loc16_];
                           _loc18_.mesh = _loc14_.mesh;
                           _loc18_.meshRig = _loc15_;
                           _loc18_._1837 = _loc8_;
                           _loc19_ = new _334();
                           _loc19_._1572(_loc18_);
                           _loc7_.push(_loc19_);
                        }
                        _loc16_++;
                     }
                  }
               }
               _loc12_++;
            }
         }
         _2223._2920 = _loc5_;
         if(_loc7_.length > 0)
         {
            _2223.deleteRigBoneCmdList = _loc7_;
         }
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2893();
         this._2894();
         this._2226._2484 = null;
      }
      
      override public function revert() : void
      {
         super.revert();
         this._2857();
         this._2909.refresh();
         this._2908._2891();
         this._2894();
         this._2226._2484 = this._1779[0];
      }
      
      private function _2918(param1:Array, param2:_79, param3:String) : void
      {
         var _loc4_:Array = null;
         var _loc5_:_232 = null;
         for each(_loc4_ in param1)
         {
            _loc5_ = new _232();
            _loc5_._1572(_469._2895(_loc4_[0],param3,param2,_loc4_[1],false));
            _loc5_._2893();
         }
      }
      
      override protected function _2211() : *
      {
         var _loc2_:_52 = null;
         var _loc1_:Object = {};
         _loc1_.parentBoneList = [];
         for each(_loc2_ in this._1779)
         {
            _loc1_.parentBoneList.push(_loc2_.parentBoneData);
         }
         return _loc1_;
      }
      
      private function _2915(param1:_78, param2:_79) : Array
      {
         var _loc4_:_70 = null;
         var _loc3_:Array = [];
         for each(_loc4_ in param1._1765[param2])
         {
            _loc3_.push([_loc4_,_loc4_._1733]);
         }
         return _loc3_;
      }
      
      public function _2893() : void
      {
         var _loc1_:_238 = null;
         var _loc2_:_52 = null;
         this._2921();
         this._2914(true);
         for each(_loc1_ in this._2920)
         {
            _loc1_._2893();
         }
         for each(_loc2_ in this._1779)
         {
            if(_loc2_.parentBoneData)
            {
               _103.addItem(_loc2_.parentBoneData);
            }
            this._1886._1983(_loc2_);
            this._2879._2892(_loc2_);
         }
      }
      
      private function _2921() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(_2223.deleteRigBoneCmdList)
         {
            _loc1_ = 0;
            _loc2_ = int(_2223.deleteRigBoneCmdList.length);
            while(_loc1_ < _loc2_)
            {
               _2223.deleteRigBoneCmdList[_loc1_].execute();
               _loc1_++;
            }
         }
      }
      
      private function _2917() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(_2223.deleteRigBoneCmdList)
         {
            _loc1_ = _2223.deleteRigBoneCmdList.length - 1;
            while(_loc1_ >= 0)
            {
               _2223.deleteRigBoneCmdList[_loc1_].revert();
               _loc1_--;
            }
         }
      }
      
      private function _2914(param1:Boolean) : void
      {
         var _loc2_:_390 = new _390();
         _loc2_._1572({
            "isRemove":param1,
            "items":this._1779
         });
         _loc2_.execute();
      }
      
      public function _2857() : void
      {
         var _loc1_:_227 = null;
         var _loc4_:_250 = null;
         var _loc6_:_238 = null;
         this._2917();
         this._2914(false);
         var _loc2_:int = 0;
         var _loc3_:int = int(this._1779.length);
         while(_loc2_ < _loc3_)
         {
            _loc1_ = new _227();
            _loc1_._1572(_469._2916(this._1779[_loc2_],this._2919[_loc2_]));
            _loc1_._2893();
            _loc2_++;
         }
         this._1886._1741();
         var _loc5_:int = 0;
         while(_loc5_ < this._1999.length)
         {
            _loc4_ = new _250();
            _loc4_._1572({"_1897":this._1999[_loc5_]});
            _loc4_.execute();
            _loc5_++;
         }
         this._2920.reverse();
         for each(_loc6_ in this._2920)
         {
            _loc6_._2857();
         }
         this._2920.reverse();
      }
      
      public function _2894() : void
      {
         this._2877.refresh();
         this._2909.refresh();
         this._2880._2891();
         this._2908._2891();
         this._2861.refreshItemNum();
         if(_2220._2873 == _715.ANIMATE)
         {
            (_1407.getInstance(AnimationPanelController) as AnimationPanelController)._2886();
            (_1407.getInstance(TimelinePanelController) as TimelinePanelController)._2875();
         }
         this._3975._11294();
      }
      
      protected function get _1999() : Array
      {
         return _2223._1999;
      }
      
      protected function get _1779() : Array
      {
         return _2223._1779;
      }
      
      protected function get _1886() : _50
      {
         return (_2223._1779[0] as _52).rootArmatureData;
      }
      
      protected function get _2920() : Array
      {
         return _2223._2920;
      }
      
      protected function get _2919() : Array
      {
         return _2208.parentBoneList;
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
      
      protected function get _2879() : _677
      {
         return this._2880._2882._2879;
      }
      
      protected function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
      
      protected function get _3975() : _540
      {
         return _1407.getInstance(_540) as _540;
      }
      
      protected function get _2226() : _532
      {
         return _1407.getInstance(_532);
      }
   }
}

