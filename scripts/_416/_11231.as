package _416
{
   import _1404._1407;
   import _18.IAction;
   import _226._265;
   import _40.BoneFrameVO;
   import _40._39;
   import _40._41;
   import _413._412;
   import _413._436;
   import _413._452;
   import _439._443;
   import _439._445;
   import _51._52;
   import _555._576;
   import _573.TimelinePanelController;
   import _708._719;
   import _81._86;
   
   public class _11231 extends _265
   {
      public var _11217:Boolean;
      
      public function _11231()
      {
         super();
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         if(this._2852 == null || this._2852._3001 == null || this._2852.timeline == null || this._1836 == null || this._2852._3001._1873(this._1836) == null)
         {
            this._11217 = true;
            return;
         }
         _2223._1992 = this._2852._3001;
         _2223.frameIndex = this._2852.timeline.curFrame;
         _2223._1946 = this._1992._1873(this._1836)._11281(_2223.frameIndex);
         _2223._11309 = this._1992._1873(this._1836).getFrameByIndex(_2223.frameIndex);
         _2223._3005 = false;
         _2223._3898 = this._2852._11308(this._1836);
         if(this._3898.indexOf(this._1946) == -1)
         {
            _2223.needModifyLastFrame = true;
            if(!_2223._11309)
            {
               _2223._3005 = true;
               _2223._11309 = BoneFrameVO._1572(this._1836,true);
            }
         }
         _2223.autoKey = this._2852.autoKey;
         var _loc2_:_86 = this._3400(_2977);
         _2223._11307 = _loc2_.clone();
         _loc2_._1930(this._1836.currentLocalTransform);
         _2223._11297 = _loc2_;
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:_265 = param1 as _265;
         if(!_loc2_ || _loc2_._1897 != _1897 || _loc2_._2971 != this._2971)
         {
            return false;
         }
         var _loc4_:int = int(_2993.length);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(_loc2_._2993[_loc3_] != _2993[_loc3_])
            {
               return false;
            }
            _loc3_ += 2;
         }
         if(param1 is _11231)
         {
            _loc3_ = 1;
            while(_loc3_ < _loc4_)
            {
               _2993[_loc3_] = _loc2_._2993[_loc3_];
               _loc3_ += 2;
            }
            this._11307.copyFrom((param1 as _11231)._11307);
            _2223._11297.add((param1 as _11231)._11297);
            return true;
         }
         return false;
      }
      
      override public function _1574() : void
      {
         if(!this._11217)
         {
            super._1574();
         }
      }
      
      override public function execute() : void
      {
         var _loc3_:_86 = null;
         var _loc4_:_86 = null;
         var _loc5_:_412 = null;
         if(this._11217)
         {
            return;
         }
         super.execute();
         var _loc1_:int = 0;
         var _loc2_:int = int(this._3898.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._3898[_loc1_].transform.clone();
            _loc3_.add(this._11297);
            this._3403(this._3898[_loc1_],_loc3_);
            _loc1_++;
         }
         if(_2223.needModifyLastFrame)
         {
            _loc4_ = this._11307.clone();
            if(!this.autoKey)
            {
               this._3402(_loc4_);
            }
            else
            {
               _loc4_._1930(this._1836._1724);
               if(this._3005)
               {
                  _loc5_ = new _412();
                  _loc5_._1572(this._3399(_loc4_));
                  _loc5_.execute();
               }
               else
               {
                  this._3403(this._11309,_loc4_);
               }
            }
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         var _loc3_:_86 = null;
         var _loc4_:_86 = null;
         var _loc5_:_436 = null;
         if(this._11217)
         {
            return;
         }
         super.revert();
         var _loc1_:int = 0;
         var _loc2_:int = int(this._3898.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._3898[_loc1_].transform.clone();
            _loc3_._1930(this._11297);
            this._3403(this._3898[_loc1_],_loc3_);
            _loc1_++;
         }
         if(_2223.needModifyLastFrame)
         {
            _loc4_ = this._3400(_2976);
            if(!this.autoKey)
            {
               this._3402(_loc4_);
            }
            else
            {
               _loc4_._1930(this._1836._1724);
               if(this._3005)
               {
                  _loc5_ = new _436();
                  _loc5_._1572(this._3399(null));
                  _loc5_.execute();
               }
               else
               {
                  this._3403(this._11309,_loc4_);
               }
            }
         }
         this._2894();
      }
      
      public function _2894() : void
      {
         if(this._1836.parentBoneData)
         {
            this._1836.parentBoneData._2027 = true;
            _2212._2881(this._1836.parentBoneData);
         }
         else
         {
            _2212._2881(this._1836);
         }
         if(Boolean(_2223.needModifyLastFrame) && this.autoKey)
         {
            this._2852.refresh();
         }
         this._2852._3140();
         this._2852._3002();
         _576(_1407.getInstance(_576)).refresh();
      }
      
      protected function _3400(param1:_86) : _86
      {
         if(_2974 == _719.LOCAL || !this._1836.parentBoneData)
         {
            return param1.clone();
         }
         return param1._2195(this._1836.parentBoneData._2009,this._1836.parentBoneData.globalTransform,this._1836._2036,true);
      }
      
      protected function _3402(param1:_86) : void
      {
         if(this._1836._2002)
         {
            this._1836._2002.copyFrom(param1);
         }
         else
         {
            this._1836._2002 = param1;
         }
         this._1836._2002._1738();
         _2209._3401(this._1836);
      }
      
      protected function _3403(param1:BoneFrameVO, param2:_86) : void
      {
         var _loc3_:_445 = _445._1572(param1,_445.TRANSFORM,param2);
         var _loc4_:_443 = new _443();
         _loc4_._1572(_loc3_);
         _loc4_.execute();
      }
      
      protected function _3399(param1:_86) : _452
      {
         if(param1)
         {
            this._11309.startPos = this.frameIndex;
            this._11309.transform.copyFrom(param1);
         }
         var _loc2_:_452 = new _452();
         _loc2_._1946 = this._11309;
         _loc2_._1945 = this._1880;
         return _loc2_;
      }
      
      protected function get _1836() : _52
      {
         return _2223._1897 as _52;
      }
      
      public function get _11307() : _86
      {
         return _2223._11307;
      }
      
      override public function get _2971() : _86
      {
         if(_2974 == _719.LOCAL)
         {
            return this._1836.currentLocalTransform;
         }
         if(_2974 == _719.GLOBAL)
         {
            return this._1836.globalTransform;
         }
         return null;
      }
      
      protected function get _1992() : _39
      {
         return _2223._1992;
      }
      
      protected function get frameIndex() : int
      {
         return _2223.frameIndex;
      }
      
      protected function get _1880() : _41
      {
         return this._1992._1873(this._1836);
      }
      
      protected function get _11309() : BoneFrameVO
      {
         return _2223._11309;
      }
      
      protected function get _1946() : BoneFrameVO
      {
         return _2223._1946;
      }
      
      protected function get _3005() : Boolean
      {
         return _2223._3005;
      }
      
      protected function get autoKey() : Boolean
      {
         return _2223.autoKey;
      }
      
      protected function get _3898() : Vector.<BoneFrameVO>
      {
         return _2223._3898 as Vector.<BoneFrameVO>;
      }
      
      protected function get _11297() : _86
      {
         return _2223._11297 as _86;
      }
      
      protected function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
   }
}

