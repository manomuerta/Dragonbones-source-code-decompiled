package _425
{
   import _18.IAction;
   import _40.BoneFrameVO;
   import _40._41;
   import _40._47;
   import _413._412;
   import _413._436;
   import _413._452;
   import _416._420;
   import _51._52;
   import _81._83;
   
   public class _431 extends _420
   {
      public function _431()
      {
         super();
         _2224 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc3_:_52 = null;
         super._1572(param1);
         if(!_2852._3001)
         {
            return;
         }
         var _loc2_:Boolean = _2852.autoTween;
         _2223.frameIndex = _2852.timeline.curFrame;
         _2223._1992 = _2852._3001;
         _2223._1946 = _1992._1875(_1837).getFrameByIndex(_2223.frameIndex);
         _2223._3005 = false;
         if(!_2223._1946)
         {
            _2223._3005 = true;
            _2223._1946 = _47._1572(_1837,_loc2_,_1837._1923,_1837._1926.clone());
         }
         _2223.autoKey = _2852.autoKey;
         if(_2223._3005)
         {
            _loc3_ = _1837.parentBoneData;
            _2223._1884 = BoneFrameVO._1572(_loc3_,_loc2_,_loc3_.currentLocalTransform);
         }
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         var _loc2_:_431 = param1 as _431;
         if(_loc2_)
         {
            if(_loc2_._2223._1992 == _2223._1992 && _loc2_._2223._1946 == _2223._1946 && _loc2_._2223.autoKey == _2223.autoKey)
            {
               _2223.newColor = _loc2_._2223.newColor;
               return true;
            }
         }
         return false;
      }
      
      override public function execute() : void
      {
         super.execute();
         if(!autoKey)
         {
            this._3398(this.newColor);
         }
         else
         {
            _1946.colorTransform = this.newColor;
            if(_3005)
            {
               addFrame();
               this._3417();
            }
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         if(!autoKey)
         {
            this._3398(this._3007);
         }
         else if(_3005)
         {
            delFrame();
            this._3416();
         }
         else
         {
            _1946.colorTransform = this._3007;
         }
         _2209._3151();
         this._2894();
      }
      
      protected function _3417() : void
      {
         this._1884.startPos = frameIndex;
         var _loc1_:_412 = new _412();
         _loc1_._1572(this._3415());
         _loc1_.execute();
      }
      
      protected function _3416() : void
      {
         var _loc1_:_436 = new _436();
         _loc1_._1572(this._3415());
         _loc1_.execute();
      }
      
      protected function _3415() : _452
      {
         var _loc1_:_452 = new _452();
         _loc1_._1946 = this._1884;
         _loc1_._1945 = this._1880;
         return _loc1_;
      }
      
      override protected function _2211() : *
      {
         return _1837._2147;
      }
      
      protected function _2894() : void
      {
         _2212._3006(_1837);
         _2852._3133();
         _2852.refresh();
         _2852._3002();
         _2852._3140();
         _2853.refresh();
      }
      
      protected function _3398(param1:_83) : void
      {
         _1837._2147 = param1;
         _2209._3397(_1837);
      }
      
      protected function get _1880() : _41
      {
         return _1992._1873(_1837.parentBoneData);
      }
      
      protected function get _1884() : BoneFrameVO
      {
         return _2223._1884;
      }
      
      protected function get newColor() : _83
      {
         return _2223.newColor;
      }
      
      protected function get _3007() : _83
      {
         return _2223._3007;
      }
   }
}

