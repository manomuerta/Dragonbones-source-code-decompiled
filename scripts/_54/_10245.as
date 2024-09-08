package _54
{
   import _40._45;
   import _51._52;
   import _51._79;
   import _73._72;
   import _978.Timeline;
   
   public class _10245 extends _67
   {
      public static const DIRECTION_HORIZONTAL:int = 0;
      
      public static const DIRECTION_VERTIAL:int = 1;
      
      public static const DIRECTION_AREA:int = 2;
      
      public static const SPEED_0:int = 1;
      
      public static const SPEED_1:int = 3;
      
      public static const SPEED_2:int = 6;
      
      public static const SPEED_3:int = 12;
      
      public static const SPEED_4:int = 24;
      
      public static const INTENSITY_0:int = 2;
      
      public static const INTENSITY_1:int = 4;
      
      public static const INTENSITY_2:int = 6;
      
      public static const INTENSITY_3:int = 8;
      
      public function _10245(param1:_57, param2:_52, param3:_79, param4:int = 2, param5:int = 24, param6:int = 8, param7:Number = 1, param8:Boolean = false, param9:Number = 0)
      {
         var _loc10_:Object = {
            "direction":param4,
            "speed":param5,
            "intensity":param6
         };
         super(param1,_72.SHAKE,param2,param3,EASING_NONE,_loc10_,param7,param9,param8,false);
         _10274 = true;
         _10276 = true;
         _10275 = true;
         _10273 = true;
      }
      
      public function get direction() : int
      {
         return value.direction;
      }
      
      public function get speed() : int
      {
         return value.speed;
      }
      
      public function get intensity() : int
      {
         return value.intensity;
      }
      
      override public function _2065() : Vector.<_45>
      {
         return this._10450(_1836,_1837);
      }
      
      private function _10277(param1:_62, param2:Boolean = true) : void
      {
         if(this.direction == DIRECTION_HORIZONTAL)
         {
            param1._10271 = _62.OPER_OFFSET;
            param1.transform.x = param2 ? int(Math.random() * this.intensity) * 2 - this.intensity : 0;
         }
         else if(this.direction == DIRECTION_VERTIAL)
         {
            param1._10272 = _62.OPER_OFFSET;
            param1.transform.y = param2 ? int(Math.random() * this.intensity) * 2 - this.intensity : 0;
         }
         else
         {
            param1._10271 = _62.OPER_OFFSET;
            param1.transform.x = param2 ? int(Math.random() * this.intensity) * 2 - this.intensity : 0;
            param1._10272 = _62.OPER_OFFSET;
            param1.transform.y = param2 ? int(Math.random() * this.intensity) * 2 - this.intensity : 0;
         }
      }
      
      override public function _10450(param1:_52, param2:_79) : Vector.<_45>
      {
         var _loc7_:_62 = null;
         var _loc10_:_62 = null;
         var _loc11_:_62 = null;
         var _loc12_:int = 0;
         var _loc3_:uint = this._1992.parent.frameRate;
         if(_loc3_ <= 0)
         {
            _loc3_ = Timeline.DEFAULT_FPS;
         }
         var _loc4_:Vector.<_45> = new Vector.<_45>();
         var _loc5_:int = during * _loc3_;
         var _loc6_:int = during * this.speed;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         _loc9_ = 0;
         while(_loc9_ < _loc6_)
         {
            _loc12_ = _loc3_ / this.speed;
            if(_loc12_ > 0)
            {
               (_loc7_ = new _62(param1,false))._10268 = _62.OPER_OVERRIDE;
               _loc7_.duration = _loc12_;
               _loc7_.startPos = _loc8_;
               _loc8_ += _loc7_.duration;
               this._10277(_loc7_);
               _loc4_.push(_loc7_);
            }
            _loc9_++;
         }
         if(_loc4_.length > 0)
         {
            if(_loc4_[0].duration <= 1)
            {
               _loc10_ = _loc4_[0] as _62;
            }
            else
            {
               _loc4_[0].startPos = 1;
               --_loc4_[0].duration;
               _loc10_ = new _62(param1,false);
               _loc4_.unshift(_loc10_);
            }
         }
         if(_loc10_)
         {
            _loc10_.startPos = 0;
            _loc10_.duration = 1;
            this._10277(_loc10_,false);
         }
         if(_loc4_.length > 0)
         {
            if(_loc7_.startPos >= _loc5_)
            {
               _loc11_ = _loc7_;
            }
            else
            {
               _loc11_ = new _62(param1,false);
               _loc7_.duration = _loc5_ - _loc7_.startPos;
               _loc4_.push(_loc11_);
            }
         }
         if(_loc11_)
         {
            this._10277(_loc11_,false);
            _loc11_.startPos = _loc5_;
            _loc11_.duration = 0;
         }
         return _loc4_;
      }
      
      override public function get _10454() : String
      {
         return name + "_" + type.toString() + "_" + this.direction + "_" + this.speed + "_" + this.intensity;
      }
   }
}

