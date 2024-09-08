package _40
{
   import _51._52;
   import _81._86;
   
   public class BoneFrameVO extends _45
   {
      public var tweenRotate:int = 0;
      
      public var transform:_86;
      
      public var _1823:_52;
      
      public function BoneFrameVO(param1:_52, param2:Boolean, param3:int = 0, param4:Object = null)
      {
         this.transform = new _86();
         super(param2,param3,param4);
         if(param1)
         {
         }
         this._1823 = param1;
      }
      
      public static function _1572(param1:_52, param2:Boolean, param3:_86 = null, param4:uint = 0, param5:Object = null) : BoneFrameVO
      {
         var _loc6_:BoneFrameVO = new BoneFrameVO(param1,param2,param4,param5);
         if(param3)
         {
            _loc6_.transform.copyFrom(param3);
         }
         return _loc6_;
      }
      
      override public function copyFrom(param1:_45) : void
      {
         super.copyFrom(param1);
         var _loc2_:BoneFrameVO = param1 as BoneFrameVO;
         this.tweenRotate = _loc2_.tweenRotate;
         this.transform.copyFrom(_loc2_.transform);
         this._1823 = _loc2_._1823;
      }
      
      override public function clone() : _45
      {
         var _loc1_:BoneFrameVO = new BoneFrameVO(this._1823,tweenEnabled);
         _loc1_.copyFrom(this);
         return _loc1_;
      }
   }
}

