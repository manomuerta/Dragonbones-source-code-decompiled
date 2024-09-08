package _54
{
   import _40._45;
   import _51._52;
   import _51._79;
   import _73._72;
   import _978.Timeline;
   
   public class _10430 extends _67
   {
      public static const SPEED_0:int = 2;
      
      public static const SPEED_1:int = 4;
      
      public static const SPEED_2:int = 6;
      
      public static const SPEED_3:int = 12;
      
      public static const SPEED_4:int = 24;
      
      public function _10430(param1:_57, param2:_52, param3:_79, param4:int = 6, param5:Number = 1, param6:Boolean = false, param7:Number = 0)
      {
         super(param1,_72.TWINKLE,param2,param3,EASING_NONE,param4,param5,param7,param6,false,false);
         _10274 = true;
         _10276 = true;
         _10275 = true;
         _10273 = true;
      }
      
      public function get speed() : int
      {
         return int(value);
      }
      
      override public function _2065() : Vector.<_45>
      {
         return this._10450(_1836,_1837);
      }
      
      override public function _10450(param1:_52, param2:_79) : Vector.<_45>
      {
         var _loc9_:_62 = null;
         var _loc10_:_66 = null;
         var _loc12_:Boolean = false;
         var _loc14_:int = 0;
         var _loc15_:_62 = null;
         var _loc16_:_66 = null;
         var _loc17_:_45 = null;
         var _loc3_:uint = this._1992.parent.frameRate;
         if(_loc3_ <= 0)
         {
            _loc3_ = Timeline.DEFAULT_FPS;
         }
         var _loc4_:Vector.<_45> = new Vector.<_45>();
         var _loc5_:int = during * _loc3_;
         var _loc6_:int = during * this.speed;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         _loc8_ = 0;
         while(_loc8_ < _loc6_)
         {
            _loc14_ = _loc3_ / this.speed;
            if(_loc14_ > 0)
            {
               (_loc15_ = new _62(param1,easing != _67.EASING_LINEAR))._10268 = _62.OPER_OVERRIDE;
               _loc15_.tweenCurve = _2059();
               _loc15_.duration = _loc14_;
               _loc15_.startPos = _loc7_;
               _loc4_.push(_loc15_);
               (_loc16_ = new _66(param2,easing != _67.EASING_LINEAR)).tweenCurve = _2059();
               _loc16_.duration = _loc14_;
               _loc16_._1732 = param2._1923;
               _loc16_.startPos = _loc7_;
               _loc4_.push(_loc16_);
               _loc7_ += _loc15_.duration;
            }
            _loc8_++;
         }
         (_loc9_ = new _62(param1,easing != _67.EASING_NONE))._10268 = _62.OPER_OVERRIDE;
         _loc9_.tweenCurve = _2059();
         _loc9_.startPos = _loc5_;
         _loc9_.duration = 0;
         _loc4_.push(_loc9_);
         (_loc10_ = new _66(param2,easing != _67.EASING_NONE)).tweenCurve = _2059();
         _loc10_.startPos = _loc5_;
         _loc10_.duration = 0;
         _loc10_._1732 = param2._1923;
         _loc4_.push(_loc10_);
         var _loc11_:int = 1;
         var _loc13_:int = 0;
         while(_loc13_ < _loc4_.length)
         {
            _loc17_ = _loc4_[_loc13_];
            if(_loc17_ is _66)
            {
               _loc11_++;
               if(_loc11_ % 2)
               {
                  _66(_loc17_)._10269 = _66.OPER_OVERRIDE;
                  _66(_loc17_).colorTransform.alphaMultiplier = _66(_loc17_).colorTransform.alphaMultiplier * 0;
               }
               else
               {
                  _66(_loc17_)._10269 = _66.OPER_OVERRIDE;
                  _66(_loc17_).colorTransform.alphaMultiplier = _66(_loc17_).colorTransform.alphaMultiplier * param2._1926.alphaMultiplier;
               }
               if(!_loc12_)
               {
                  _loc12_ = true;
               }
               else
               {
                  _66(_loc17_)._10453 = _66.OPER_OVERRIDE;
               }
            }
            _loc13_++;
         }
         return _loc4_;
      }
      
      override public function get _10454() : String
      {
         return name + "_" + type.toString() + "_" + this.speed;
      }
   }
}

