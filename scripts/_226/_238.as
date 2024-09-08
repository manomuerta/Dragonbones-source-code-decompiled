package _226
{
   import _1404._1407;
   import _388._390;
   import _40._10598;
   import _40._39;
   import _470._469;
   import _51._50;
   import _51._52;
   import _51._69;
   import _51._70;
   import _51._78;
   import _51._79;
   import _521._532;
   import _555.AnimationPanelController;
   import _555.LibraryPanelController;
   import _555._558;
   import _555._571;
   import _573.TimelinePanelController;
   import _586._598;
   import _676._677;
   import _676._687;
   import _708._715;
   import _93._92;
   
   public class _238 extends _92
   {
      public function _238()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:_39 = null;
         var _loc7_:Object = null;
         var _loc8_:_10598 = null;
         super._1572(param1);
         _2223._1886 = this._1837.parentBoneData.rootArmatureData;
         if(this._1886._10658)
         {
            _2223.originZorder = this._1886._10658.concat();
            if(Boolean(this._1886._1963) && Boolean(this._1886._1963.length))
            {
               _loc7_ = {};
               _loc2_ = 0;
               _loc3_ = int(this._1886._1963.length);
               while(_loc2_ < _loc3_)
               {
                  _loc6_ = this._1886._1963[_loc2_];
                  if((_loc6_) && _loc6_._10657 && Boolean(_loc6_._10657._1816.length))
                  {
                     _loc7_[_loc6_.name] = [];
                     _loc4_ = 0;
                     _loc5_ = int(_loc6_._10657._1816.length);
                     while(_loc4_ < _loc5_)
                     {
                        _loc8_ = _loc6_._10657._1816[_loc4_];
                        if(_loc8_)
                        {
                           _loc7_[_loc6_.name].push({
                              "startPos":_loc8_.startPos,
                              "zOrder":_loc8_.zOrder.concat()
                           });
                        }
                        _loc4_++;
                     }
                  }
                  _loc2_++;
               }
               _2223.animationZOrder = _loc7_;
            }
         }
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2893();
         this._2894();
         this._2226._2484 = null;
      }
      
      private function _2914(param1:Boolean) : void
      {
         var _loc2_:_390 = new _390();
         _loc2_._1572({
            "isRemove":param1,
            "items":this._1837
         });
         _loc2_.execute();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._2857();
         this._2894();
         this._2226._2484 = this._1837;
      }
      
      private function _2918(param1:Array, param2:String) : void
      {
         var _loc3_:Array = null;
         var _loc4_:_232 = null;
         for each(_loc3_ in param1)
         {
            _loc4_ = new _232();
            _loc4_._1572(_469._2895(_loc3_[0],param2,this._1837,_loc3_[1],false));
            _loc4_._2893();
         }
      }
      
      override protected function _2211() : *
      {
         var _loc2_:_78 = null;
         var _loc1_:Object = {};
         _loc1_.parentBone = this._1837.parentBoneData;
         _loc1_.zOrder = this._1837.zOrder;
         _loc1_._1711 = this._1837._1711;
         _loc1_._1995 = this._1837._1995;
         if(_loc1_._1995)
         {
            _loc1_.skinDisplayDic = {};
            for each(_loc2_ in this._1886._1781)
            {
               _loc1_.skinDisplayDic[_loc2_.name] = this._2915(_loc2_);
            }
         }
         else
         {
            _loc1_.skinDisplayDic = this._2915(this._1886._1795);
         }
         return _loc1_;
      }
      
      private function _2915(param1:_78) : Array
      {
         var _loc3_:_70 = null;
         var _loc2_:Array = [];
         for each(_loc3_ in param1._1765[this._1837])
         {
            _loc2_.push([_loc3_,_loc3_._1733]);
         }
         return _loc2_;
      }
      
      public function _2893() : void
      {
         var _loc1_:_70 = null;
         var _loc2_:_237 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:_39 = null;
         var _loc8_:_10598 = null;
         var _loc9_:int = 0;
         this._2914(true);
         for each(_loc1_ in this._1837._1765)
         {
            _loc2_ = new _237();
            _loc2_._1572(_469._2900(_loc1_));
            _loc2_._2893();
         }
         this._1886._1978(this._1837);
         this._2879._2932(this._1837);
         this._2911._2932(this._1837);
         if(this._1886._10658)
         {
            if(Boolean(this._1886._1963) && Boolean(this._1886._1963.length))
            {
               _loc3_ = 0;
               _loc4_ = int(this._1886._1963.length);
               while(_loc3_ < _loc4_)
               {
                  _loc7_ = this._1886._1963[_loc3_];
                  if((_loc7_) && _loc7_._10657 && Boolean(_loc7_._10657._1816.length))
                  {
                     _loc5_ = 0;
                     _loc6_ = int(_loc7_._10657._1816.length);
                     while(_loc5_ < _loc6_)
                     {
                        _loc8_ = _loc7_._10657._1816[_loc5_];
                        if(_loc8_)
                        {
                           _loc9_ = int(_loc8_.zOrder.indexOf(this._1837.name));
                           if(_loc9_ >= 0)
                           {
                              _loc8_.zOrder.splice(_loc9_,1);
                           }
                        }
                        _loc5_++;
                     }
                  }
                  _loc3_++;
               }
            }
         }
      }
      
      public function _2857() : void
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:_39 = null;
         var _loc12_:_10598 = null;
         var _loc13_:Array = null;
         var _loc14_:Object = null;
         this._2914(false);
         var _loc1_:_233 = new _233();
         _loc1_._1572(_469._2897(this._1837,this._2930,this._2933));
         _loc1_._2893();
         if(this._2931)
         {
            for(_loc6_ in this._2929)
            {
               this._2918(this._2929[_loc6_],_loc6_);
            }
         }
         else
         {
            this._2918(this._2929 as Array,"");
         }
         this._1837._1711 = this._2928;
         if(this._1886._10658)
         {
            this._1886._10658.length = 0;
            _loc4_ = 0;
            _loc5_ = int(_2223.originZorder.length);
            while(_loc4_ < _loc5_)
            {
               this._1886._10658.push(_2223.originZorder[_loc4_]);
               _loc4_++;
            }
            if(Boolean(this._1886._1963) && Boolean(this._1886._1963.length))
            {
               _loc4_ = 0;
               _loc5_ = int(this._1886._1963.length);
               while(_loc4_ < _loc5_)
               {
                  _loc11_ = this._1886._1963[_loc4_];
                  if((_loc11_) && _loc11_._10657 && Boolean(_loc11_._10657._1816.length))
                  {
                     _loc13_ = _2223.animationZOrder[_loc11_.name];
                     if(_loc13_)
                     {
                        _loc7_ = 0;
                        _loc8_ = int(_loc11_._10657._1816.length);
                        while(_loc7_ < _loc8_)
                        {
                           _loc14_ = _loc13_[_loc7_];
                           _loc12_ = _loc11_._10657._1816[_loc7_];
                           if((_loc12_) && _loc14_ && _loc12_.startPos == _loc14_.startPos && Boolean(_loc14_.zOrder))
                           {
                              _loc12_.zOrder.length = 0;
                              _loc9_ = 0;
                              _loc10_ = int(_loc14_.zOrder.length);
                              while(_loc9_ < _loc10_)
                              {
                                 _loc12_.zOrder.push(_loc14_.zOrder[_loc9_]);
                                 _loc9_++;
                              }
                           }
                           _loc7_++;
                        }
                     }
                  }
                  _loc4_++;
               }
            }
         }
      }
      
      public function _2894() : void
      {
         this._2909.refresh();
         this._2880._2891();
         this._2908._2891();
         if(_2220._2873 == _715.ANIMATE)
         {
            (_1407.getInstance(AnimationPanelController) as AnimationPanelController)._2886();
            (_1407.getInstance(TimelinePanelController) as TimelinePanelController)._2875();
         }
         LibraryPanelController(_1407.getInstance(LibraryPanelController)).refreshItemNum();
      }
      
      protected function get _1837() : _79
      {
         return _2223._1837;
      }
      
      protected function get _2930() : _52
      {
         return _2208.parentBone;
      }
      
      protected function get _2933() : Number
      {
         return _2208.zOrder;
      }
      
      protected function get _2928() : _69
      {
         return _2208._1711;
      }
      
      protected function get _2931() : Boolean
      {
         return _2208._1995;
      }
      
      protected function get _2929() : Object
      {
         return _2208.skinDisplayDic;
      }
      
      protected function get _1886() : _50
      {
         return _2223._1886 as _50;
      }
      
      protected function get _2909() : _598
      {
         return _1407.getInstance(_598) as _598;
      }
      
      protected function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
      
      protected function get _2879() : _677
      {
         return this._2880._2882._2879;
      }
      
      protected function get _2908() : _558
      {
         return _1407.getInstance(_558) as _558;
      }
      
      protected function get _2911() : _687
      {
         return this._2908._2910._2911;
      }
      
      protected function get _2226() : _532
      {
         return _1407.getInstance(_532);
      }
   }
}

