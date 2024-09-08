package _54
{
   import _40._45;
   import _51._52;
   import _51._79;
   import _721._763;
   import _73._72;
   import _978.Timeline;
   
   public class _10428 extends _67
   {
      public function _10428(param1:_57, param2:_52, param3:_79, param4:Number = 1)
      {
         this.CONFIG_DURATION = [0,4,8,22,30,60,120,240,360,480,960,100000000000];
         this.CONFIG = [[],[1,0],[2,0.2],[4,0.5],[8,0.5],[12,0.6],[16,0.6],[24,0.7],[32,0.7],[40,0.7],[60,0.8],[120,0.8]];
         super(param1,_72.APPEAR_DROP,param2,param3,EASING_LINEAR,1,param4,delay,false,true);
         _10273 = true;
         _10274 = true;
         _10275 = true;
         _10276 = true;
      }
      
      override public function _2065() : Vector.<_45>
      {
         return this._10450(_1836,_1837);
      }
      
      override public function _10450(param1:_52, param2:_79) : Vector.<_45>
      {
         var _loc4_:Vector.<_45> = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Number = NaN;
         var _loc10_:int = 0;
         var _loc11_:_62 = null;
         var _loc15_:int = 0;
         var _loc16_:_62 = null;
         var _loc17_:_66 = null;
         var _loc18_:_66 = null;
         var _loc3_:uint = this._1992.parent.frameRate;
         if(_loc3_ <= 0)
         {
            _loc3_ = Timeline.DEFAULT_FPS;
         }
         _loc4_ = new Vector.<_45>();
         var _loc5_:int = _loc3_ * during;
         var _loc6_:Array = [];
         var _loc12_:_763 = _1992.parent._2000;
         var _loc13_:Number = -_loc12_.height * 0.6 - _1837._2049.height * _1836._1724.scaleY / 2;
         var _loc14_:Number = _1836._1724.y + _1837._2049.height * _1836._1724.scaleY / 2;
         if(_loc13_ < -_loc14_ && _loc14_ > 0)
         {
            _loc13_ = -_loc14_ - 10;
         }
         if(_loc5_ > 1)
         {
            _loc10_ = _loc5_;
            _loc7_ = this._10455(_loc10_);
            _loc6_ = this.CONFIG[_loc7_];
            _loc15_ = 0;
            if(_loc6_)
            {
               _loc8_ = int(_loc6_[0]);
               _loc9_ = Number(_loc6_[1]);
               _loc11_ = this._2843(param1,_loc15_,_loc8_,_loc13_,true);
               _loc4_.push(_loc11_);
               _loc10_ -= _loc8_;
               _loc15_ += _loc8_;
               _loc8_ *= _loc9_;
               _loc13_ *= _loc9_;
               while(_loc10_ >= _loc8_ * 2 && _loc8_ > 0)
               {
                  _loc11_ = this._2843(param1,_loc15_,_loc8_,_loc13_,false);
                  _loc4_.push(_loc11_);
                  _loc15_ += _loc8_;
                  _loc11_ = this._2843(param1,_loc15_,_loc8_,_loc13_,true);
                  _loc4_.push(_loc11_);
                  _loc15_ += _loc8_;
                  _loc10_ -= _loc8_ * 2;
                  if(_loc8_ == 1)
                  {
                     _loc6_ = this.CONFIG[1];
                  }
                  else
                  {
                     _loc7_ = this._10455(_loc10_);
                     _loc6_ = this.CONFIG[_loc7_];
                  }
                  _loc9_ = Number(_loc6_[1]);
                  _loc8_ = Math.ceil(_loc8_ * _loc9_);
                  _loc13_ *= _loc9_;
                  while(_loc10_ < _loc8_ * 2 && _loc7_ > 1)
                  {
                     _loc7_--;
                     _loc6_ = this.CONFIG[_loc7_];
                     _loc8_ = int(_loc6_[0]);
                  }
               }
               if(_loc15_ == _loc5_)
               {
                  _loc11_.transform.y = 0;
               }
               else
               {
                  _loc15_ += _loc8_;
                  if(_loc15_ += _loc8_ > _loc5_)
                  {
                     _loc15_ = _loc5_;
                  }
                  _loc8_ = _loc5_ - _loc11_.endPos;
                  _loc11_ = this._2843(param1,_loc15_,_loc8_,0,false);
                  _loc4_.push(_loc11_);
               }
            }
            if(_loc4_.length > 0)
            {
               _loc16_ = _loc4_[_loc4_.length - 1] as _62;
            }
            if(_loc16_ == null || _loc16_.duration != 0)
            {
               (_loc16_ = this._2843(param1,_loc5_,0,0,false))._10268 = _62.OPER_NONE;
               _loc4_.push(_loc16_);
            }
            (_loc17_ = new _66(param2,false)).startPos = 0;
            _loc17_.duration = 1;
            _loc17_._1732 = null;
            (_loc18_ = new _66(param2,false))._1732 = param2._1923;
            _loc18_.startPos = _loc17_.endPos;
            _loc18_.duration = _loc5_ - 1;
            _loc4_.push(_loc17_,_loc18_);
         }
         return _loc4_;
      }
      
      private function _2843(param1:_52, param2:int, param3:int, param4:Number, param5:Boolean) : _62
      {
         var _loc6_:_62;
         (_loc6_ = new _62(param1,true))._10268 = _62.OPER_OVERRIDE;
         this.easing = param5 ? EASING_IN : EASING_OUT;
         _loc6_.tweenCurve = _2059();
         _loc6_.startPos = param2;
         _loc6_.duration = param3;
         if(_loc6_.duration < 0)
         {
            _loc6_.duration = 0;
         }
         _loc6_._10272 = _62.OPER_OFFSET;
         _loc6_.transform.y = param5 ? param4 : 0;
         return _loc6_;
      }
      
      private function _10455(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc2_ = 0;
         _loc3_ = int(this.CONFIG_DURATION.length);
         while(_loc2_ < _loc3_)
         {
            if(param1 < this.CONFIG_DURATION[_loc2_])
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
   }
}

