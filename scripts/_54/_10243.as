package _54
{
   import _40._45;
   import _51._52;
   import _51._79;
   import _721._763;
   import _73._72;
   import _978.Timeline;
   
   public class _10243 extends _67
   {
      public static const DIRECT_LEFT:uint = 0;
      
      public static const DIRECT_RIGHT:uint = 1;
      
      public function _10243(param1:_57, param2:_52, param3:_79, param4:int = 1, param5:uint = 0, param6:Number = 1, param7:Number = 0)
      {
         super(param1,_72.DISAPPEAR_POSITION,param2,param3,param4,param5,param6,param7,false,false,true);
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
         var _loc5_:int = 0;
         var _loc7_:_62 = null;
         var _loc8_:_62 = null;
         var _loc9_:_763 = null;
         var _loc10_:Number = NaN;
         var _loc11_:_66 = null;
         var _loc3_:uint = this._1992.parent.frameRate;
         if(_loc3_ <= 0)
         {
            _loc3_ = Timeline.DEFAULT_FPS;
         }
         var _loc4_:Vector.<_45> = new Vector.<_45>();
         _loc5_ = during * _loc3_;
         if(_loc5_ > 0)
         {
            (_loc7_ = new _62(param1,false))._10268 = _62.OPER_OVERRIDE;
            _loc7_.tweenCurve = _2059();
            _loc7_.startPos = 0;
            _loc7_.duration = _loc5_;
            (_loc8_ = new _62(param1,easing != _67.EASING_NONE)).startPos = _loc7_.endPos;
            _loc8_.duration = 0;
            _loc8_._10271 = _62.OPER_OVERRIDE;
            _loc9_ = this._1886._2000;
            _loc10_ = _loc9_.width;
            if(this.direct == DIRECT_LEFT)
            {
               _loc8_.transform.x = _loc10_ - _1836._1724.x + _1837._2049.width * _1836._1724.scaleX / 2;
            }
            else if(this.direct == DIRECT_RIGHT)
            {
               _loc8_.transform.x = -_1836._1724.x - _1837._2049.width * _1836._1724.scaleX / 2;
            }
            (_loc11_ = new _66(param2,false)).startPos = 0;
            _loc11_.duration = _loc5_;
            _loc11_._1732 = param2._1923;
            _loc4_.push(_loc7_);
            _loc4_.push(_loc8_);
            _loc4_.push(_loc11_);
         }
         var _loc6_:_66;
         (_loc6_ = new _66(param2,false)).startPos = _loc5_;
         _loc6_.duration = 0;
         _loc6_._1732 = null;
         _loc4_.push(_loc6_);
         return _loc4_;
      }
   }
}

