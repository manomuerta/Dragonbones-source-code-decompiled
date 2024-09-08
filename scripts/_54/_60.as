package _54
{
   import _40._45;
   import _51._52;
   import _51._79;
   import _721._763;
   import _73._72;
   import _978.Timeline;
   
   public class _60 extends _67
   {
      public static const DIRECT_LEFT:uint = 0;
      
      public static const DIRECT_RIGHT:uint = 1;
      
      public function _60(param1:_57, param2:_52, param3:_79, param4:int, param5:uint, param6:Number, param7:Number)
      {
         super(param1,_72.APPEAR_POSITION,param2,param3,param4,param5,param6,param7,false,true);
         _10273 = true;
         _10274 = true;
         _10275 = true;
         _10276 = true;
      }
      
      public function get direct() : uint
      {
         return uint(value);
      }
      
      override public function _2065() : Vector.<_45>
      {
         return this._10450(_1836,_1837);
      }
      
      override public function _10450(param1:_52, param2:_79) : Vector.<_45>
      {
         var _loc3_:uint = 0;
         var _loc6_:_62 = null;
         var _loc7_:_62 = null;
         var _loc8_:_763 = null;
         var _loc9_:Number = NaN;
         var _loc10_:_62 = null;
         var _loc11_:_66 = null;
         var _loc12_:_66 = null;
         _loc3_ = this._1992.parent.frameRate;
         if(_loc3_ <= 0)
         {
            _loc3_ = Timeline.DEFAULT_FPS;
         }
         var _loc4_:Vector.<_45> = new Vector.<_45>();
         var _loc5_:int = _loc3_ * during;
         if(_loc5_ > 1)
         {
            (_loc6_ = new _62(param1,false))._10268 = _62.OPER_OVERRIDE;
            _loc6_.startPos = 0;
            _loc6_.duration = 1;
            (_loc7_ = new _62(param1,easing != _67.EASING_NONE))._10268 = _62.OPER_OVERRIDE;
            _loc7_.tweenCurve = _2059();
            _loc7_.startPos = _loc6_.endPos;
            _loc7_.duration = during * _loc3_ - 1;
            if(_loc7_.duration < 0)
            {
               _loc7_.duration = 0;
            }
            _loc7_._10271 = _62.OPER_OVERRIDE;
            _loc8_ = parent.parent.parent.parent._2000;
            _loc9_ = _loc8_.width;
            if(this.direct == DIRECT_LEFT)
            {
               _loc7_.transform.x = -_1836._1724.x - _1837._2049.width * _1836._1724.scaleX / 2;
            }
            else if(this.direct == DIRECT_RIGHT)
            {
               _loc7_.transform.x = _loc9_ - _1836._1724.x + _1837._2049.width * _1836._1724.scaleX / 2;
            }
            (_loc10_ = new _62(param1,false))._10271 = _62.OPER_OVERRIDE;
            _loc10_.startPos = _loc7_.endPos;
            _loc10_.duration = 0;
            (_loc11_ = new _66(param2,false)).startPos = 0;
            _loc11_.duration = 1;
            _loc11_._1732 = null;
            (_loc12_ = new _66(param2,false))._1732 = param2._1923;
            _loc12_.startPos = _loc11_.endPos;
            _loc12_.duration = during * _loc3_ - 1;
            _loc4_.push(_loc11_);
            _loc4_.push(_loc12_);
            _loc4_.push(_loc6_);
            _loc4_.push(_loc7_);
            _loc4_.push(_loc10_);
         }
         return _loc4_;
      }
   }
}

