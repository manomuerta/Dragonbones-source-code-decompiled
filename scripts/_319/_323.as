package _319
{
   import _1404._1407;
   import _226._261;
   import _51._50;
   import _51._52;
   import _51._70;
   import _51._79;
   import _521._532;
   import _555._558;
   import _555._570;
   import _555._571;
   import _579._580;
   import _658.Mesh;
   import _658._660;
   import _676._685;
   import _703._705;
   import _73._74;
   import _93._92;
   
   public class _323 extends _92
   {
      private var _13752:_261;
      
      public function _323()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         if(this._13753)
         {
            this._13752 = new _261();
            this._13752._1572(this._13753);
            this._13752._2213();
         }
      }
      
      override protected function _2211() : *
      {
         if(this._1838._1985)
         {
            this._1838._1985._1766(this._1838);
         }
         return null;
      }
      
      private function _12543() : void
      {
         var _loc2_:_50 = null;
         var _loc3_:Boolean = false;
         var _loc4_:Vector.<_52> = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:Mesh = this._1838.mesh;
         if(this._1837 && this._1837.parentBoneData && Boolean(this._1837.parentBoneData.rootArmatureData))
         {
            _loc2_ = this._1837.parentBoneData.rootArmatureData;
         }
         if(Boolean(_loc1_) && Boolean(_loc1_.meshRig))
         {
            if(_loc2_)
            {
               _loc4_ = _loc1_.meshRig._2922;
               if(_loc4_)
               {
                  _loc5_ = 0;
                  _loc6_ = int(_loc4_.length);
                  while(_loc5_ < _loc6_)
                  {
                     if(!_loc2_._1793(_loc4_[_loc5_].name))
                     {
                        _loc3_ = true;
                        break;
                     }
                     _loc5_++;
                  }
               }
               if(_loc3_)
               {
                  _2223.broken = _loc1_.meshRig;
                  _loc1_.meshRig = null;
               }
            }
            else
            {
               _2223.broken = _loc1_.meshRig;
               _loc1_.meshRig = null;
            }
         }
      }
      
      override public function execute() : void
      {
         super.execute();
         if(this._13752)
         {
            this._13752.execute();
         }
         this._1838.type = _74.MESH;
         this._12543();
         this._1837.rootArmatureData._1871();
         var _loc1_:_685 = _705._3014[this._1838];
         if(_loc1_)
         {
            this._2880._2943(_loc1_);
            this._2880._2943(_loc1_.parent);
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         if(this._1838 == null || this._1837 == null || this._1837.rootArmatureData == null)
         {
            return;
         }
         if(_2223.broken is _660 && this._1838.mesh && this._1838.mesh.meshRig == null)
         {
            this._1838.mesh.meshRig = _2223.broken as _660;
         }
         this._1838.type = _74.IMAGE;
         this._1837.rootArmatureData._1871();
         var _loc1_:_685 = _705._3014[this._1838];
         if(_loc1_)
         {
            this._2880._2943(_loc1_);
            if(this._2880._3175)
            {
               this._2880._2943(_loc1_.parent);
            }
         }
         this._2894();
         if(Boolean(this._2226) && this._2226._2484 == this._1838)
         {
            this._2226._2484 = null;
            this._2226._2484 = this._1838;
         }
         if(this._13752)
         {
            this._13752.revert();
         }
      }
      
      private function _2894() : void
      {
         var _loc1_:Object = null;
         this._3176._2212._2907(this._1837);
         if(this._2226._2484)
         {
            _loc1_ = this._2226._2484;
            this._2226._2484 = null;
            this._2226._2484 = _loc1_;
         }
         this._14372._2891();
      }
      
      protected function get _1837() : _79
      {
         return _2223._1837 as _79;
      }
      
      protected function get displayVO() : _70
      {
         return _2223.displayVO as _70;
      }
      
      protected function get _1838() : _70
      {
         return _2223._1838 as _70;
      }
      
      protected function get _13753() : Object
      {
         return _2223._13753;
      }
      
      private function get _3176() : _580
      {
         return _1407.getInstance(_580) as _580;
      }
      
      private function get _2226() : _532
      {
         return _1407.getInstance(_532) as _532;
      }
      
      protected function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
      
      protected function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
      
      protected function get _14372() : _558
      {
         return _1407.getInstance(_558) as _558;
      }
   }
}

