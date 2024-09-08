package _54
{
   import _40._45;
   import _51._52;
   import _51._79;
   import _73._72;
   import _978.Timeline;
   import flash.geom.Point;
   
   public class _63 extends _67
   {
      public function _63(param1:_57, param2:_52, param3:_79, param4:int, param5:Point, param6:Number, param7:Number)
      {
         super(param1,_72.POSITION,param2,param3,param4,param5,param6,param7,false,false);
         _10274 = true;
      }
      
      public function get position() : Point
      {
         return value as Point;
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
         var _loc3_:uint = this._1992.parent.frameRate;
         if(_loc3_ <= 0)
         {
            _loc3_ = Timeline.DEFAULT_FPS;
         }
         _loc4_ = new Vector.<_45>();
         _loc5_ = _loc3_ * during;
         if(_loc5_ > 0)
         {
            (_loc7_ = new _62(param1,easing != _67.EASING_NONE))._10268 = _62.OPER_OVERRIDE;
            _loc7_.tweenCurve = _2059();
            _loc7_.startPos = 0;
            _loc7_.duration = during * _loc3_;
            _loc4_.push(_loc7_);
         }
         var _loc6_:_62;
         (_loc6_ = new _62(param1,false))._10271 = _62.OPER_OVERRIDE;
         _loc6_._10272 = _62.OPER_OVERRIDE;
         _loc6_.startPos = _loc5_;
         _loc6_.duration = 0;
         _loc6_.transform.x = this.position.x;
         _loc6_.transform.y = this.position.y;
         _loc4_.push(_loc6_);
         return _loc4_;
      }
   }
}

