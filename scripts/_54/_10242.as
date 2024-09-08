package _54
{
   import _40._45;
   import _51._52;
   import _51._79;
   import _73._72;
   import _978.Timeline;
   
   public class _10242 extends _67
   {
      public function _10242(param1:_57, param2:_52, param3:_79, param4:int = 1, param5:Number = 0, param6:Number = 1, param7:Number = 0)
      {
         super(param1,_72.DISAPPEAR_ALPHA,param2,param3,param4,param5,param6,param7,false,false,true);
         _10273 = true;
         _10274 = true;
         _10275 = true;
         _10276 = true;
      }
      
      public function get alpha() : Number
      {
         return Number(value);
      }
      
      override public function _2065() : Vector.<_45>
      {
         return this._10450(_1836,_1837);
      }
      
      override public function _10450(param1:_52, param2:_79) : Vector.<_45>
      {
         var _loc4_:Vector.<_45> = null;
         var _loc5_:int = 0;
         var _loc7_:_62 = null;
         var _loc8_:_62 = null;
         var _loc9_:_66 = null;
         var _loc10_:_66 = null;
         var _loc3_:uint = this._1992.parent.frameRate;
         if(_loc3_ <= 0)
         {
            _loc3_ = Timeline.DEFAULT_FPS;
         }
         _loc4_ = new Vector.<_45>();
         _loc5_ = during * _loc3_;
         if(_loc5_ > 0)
         {
            (_loc7_ = new _62(param1,easing != _67.EASING_NONE))._10268 = _62.OPER_OVERRIDE;
            _loc7_.tweenCurve = _2059();
            _loc7_.startPos = 0;
            _loc7_.duration = _loc5_;
            (_loc8_ = new _62(param1,false)).startPos = _loc5_;
            _loc8_.duration = 0;
            _loc4_.push(_loc7_);
            _loc4_.push(_loc8_);
            (_loc9_ = new _66(param2,easing != _67.EASING_NONE))._10268 = _66.OPER_OVERRIDE;
            _loc9_.tweenCurve = _2059();
            _loc9_.startPos = 0;
            _loc9_.duration = _loc5_ - 1;
            _loc9_._1732 = param2._1923;
            if(_loc9_.duration > 0)
            {
               _loc10_ = new _66(param2,false);
            }
            else
            {
               _loc10_ = _loc9_;
            }
            _loc10_.startPos = _loc5_ - 1;
            _loc10_.duration = 1;
            _loc10_._10269 = _66.OPER_OVERRIDE;
            _loc10_.colorTransform.alphaMultiplier = this.alpha;
            _loc10_._1732 = param2._1923;
            _loc4_.push(_loc9_);
            if(_loc10_ != _loc9_)
            {
               _loc4_.push(_loc10_);
            }
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

