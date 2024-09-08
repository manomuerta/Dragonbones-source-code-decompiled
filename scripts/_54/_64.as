package _54
{
   import _40._45;
   import _51._52;
   import _51._79;
   import _73._72;
   import _978.Timeline;
   
   public class _64 extends _67
   {
      public function _64(param1:_57, param2:_52, param3:_79, param4:int, param5:Number, param6:Number, param7:Boolean = false, param8:Number = 0)
      {
         super(param1,_72.ROTATION,param2,param3,param4,param5,param6,param8,param7,false);
         _10275 = true;
      }
      
      public function get rotation() : Number
      {
         return Number(value);
      }
      
      override public function _2065() : Vector.<_45>
      {
         var _loc4_:_62 = null;
         var _loc1_:uint = this._1992.parent.frameRate;
         if(_loc1_ <= 0)
         {
            _loc1_ = Timeline.DEFAULT_FPS;
         }
         var _loc2_:int = _loc1_ * during;
         var _loc3_:Vector.<_45> = new Vector.<_45>();
         if(_loc2_ > 0)
         {
            (_loc4_ = new _62(_1836,easing != _67.EASING_NONE))._10268 = _62.OPER_OVERRIDE;
            _loc4_.tweenCurve = _2059();
            _loc4_.startPos = 0;
            _loc4_.duration = during * _loc1_;
            _loc3_.push(_loc4_);
         }
         var _loc5_:_62;
         (_loc5_ = new _62(_1836,false))._10265 = _62.OPER_OVERRIDE;
         _loc5_.startPos = _loc2_;
         _loc5_.duration = 0;
         _loc5_.transform.rotation = this.rotation;
         _loc3_.push(_loc5_);
         var _loc6_:_62 = _loc4_;
         var _loc7_:_62 = _loc5_;
         return _loc3_;
      }
      
      override public function _10450(param1:_52, param2:_79) : Vector.<_45>
      {
         var _loc5_:Vector.<_45> = null;
         var _loc6_:_62 = null;
         var _loc11_:_64 = null;
         var _loc3_:uint = this._1992.parent.frameRate;
         if(_loc3_ <= 0)
         {
            _loc3_ = Timeline.DEFAULT_FPS;
         }
         var _loc4_:int = _loc3_ * during;
         _loc5_ = new Vector.<_45>();
         if(_loc4_ > 0)
         {
            (_loc6_ = new _62(param1,easing != _67.EASING_NONE))._10268 = _62.OPER_OVERRIDE;
            _loc6_.tweenCurve = _2059();
            _loc6_.startPos = 0;
            _loc6_.duration = during * _loc3_;
            _loc5_.push(_loc6_);
         }
         var _loc7_:Number = 0;
         if(loop)
         {
            _loc11_ = this._10456();
            _loc7_ = !!_loc11_ ? _loc11_.rotation : _1836._1724.rotation;
         }
         var _loc8_:_62;
         (_loc8_ = new _62(param1,false))._10265 = _62.OPER_OVERRIDE;
         _loc8_.startPos = _loc4_;
         _loc8_.duration = 0;
         _loc8_.transform.rotation = this.rotation - _loc7_;
         _loc5_.push(_loc8_);
         var _loc9_:_62 = _loc6_;
         var _loc10_:_62 = _loc8_;
         return _loc5_;
      }
      
      override public function get _10454() : String
      {
         return name + "_" + type.toString + "_" + this.rotation;
      }
      
      private function _10456() : _64
      {
         var _loc2_:_57 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:_67 = null;
         var _loc8_:_64 = null;
         var _loc1_:_56 = this._2070;
         _loc3_ = 0;
         _loc4_ = int(_loc1_.tracks.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_ = _loc1_.tracks[_loc3_];
            _loc5_ = 0;
            _loc6_ = int(_loc2_.tweens.length);
            while(_loc5_ < _loc6_)
            {
               _loc7_ = _loc2_.tweens[_loc5_];
               if(_loc7_._1836 == this._1836 && !_loc7_.loop && _loc7_ is _64 && _loc7_ != this)
               {
                  _loc8_ = _loc7_ as _64;
               }
               else if(_loc7_ == this)
               {
                  return _loc8_;
               }
               _loc5_++;
            }
            _loc3_++;
         }
         return _loc8_;
      }
   }
}

