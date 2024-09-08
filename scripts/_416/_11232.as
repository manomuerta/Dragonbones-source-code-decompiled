package _416
{
   import _1404._1407;
   import _18.IAction;
   import _226._265;
   import _40.BoneFrameVO;
   import _51._52;
   import _573.TimelinePanelController;
   import _708._719;
   import _81._86;
   
   public class _11232 extends _265
   {
      public var _11217:Boolean;
      
      public var _11310:_418;
      
      public var _11311:_11231;
      
      public function _11232()
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
         var _loc2_:Vector.<BoneFrameVO> = this._2852._11308(this._1836);
         if(Boolean(_loc2_) && _loc2_.length > 0)
         {
            this._11311 = new _11231();
            this._11311._1572(_2223);
            this._11311._2213();
         }
         else
         {
            this._11310 = new _418();
            this._11310._1572(_2223);
            this._11310._2213();
         }
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
         if(param1 is _11232)
         {
            if(Boolean(this._11311) && Boolean((param1 as _11232)._11311))
            {
               return this._11311.merge((param1 as _11232)._11311);
            }
            if(Boolean(this._11310) && Boolean((param1 as _11232)._11310))
            {
               return this._11310.merge((param1 as _11232)._11310);
            }
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
         if(this._11217)
         {
            return;
         }
         super.execute();
         if(this._11310)
         {
            this._11310.execute();
         }
         else if(this._11311)
         {
            this._11311.execute();
         }
      }
      
      override public function revert() : void
      {
         if(this._11217)
         {
            return;
         }
         super.revert();
         if(this._11310)
         {
            this._11310.revert();
         }
         else if(this._11311)
         {
            this._11311.revert();
         }
      }
      
      protected function get _1836() : _52
      {
         return _2223._1897 as _52;
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
      
      protected function get _1946() : BoneFrameVO
      {
         return _2223._1946;
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

