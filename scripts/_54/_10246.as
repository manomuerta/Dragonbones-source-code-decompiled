package _54
{
   import _40._45;
   import _51._52;
   import _51._79;
   import _73._72;
   import _978.Timeline;
   
   public class _10246 extends _67
   {
      public static const SPEED_0:int = 1;
      
      public static const SPEED_1:int = 2;
      
      public static const SPEED_2:int = 3;
      
      public static const SPEED_3:int = 6;
      
      public static const INTENSITY_0:int = 3;
      
      public static const INTENSITY_1:int = 5;
      
      public static const INTENSITY_2:int = 10;
      
      public static const INTENSITY_3:int = 20;
      
      public function _10246(param1:_57, param2:_52, param3:_79, param4:int = 3, param5:int = 10, param6:Number = 1, param7:Boolean = false, param8:Number = 0)
      {
         var _loc9_:Object = {
            "speed":param4,
            "intensity":param5
         };
         super(param1,_72.SWING,param2,param3,EASING_LINEAR,_loc9_,param6,param8,param7,false);
         _10274 = true;
         _10276 = true;
         _10275 = true;
         _10273 = true;
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
      
      override public function _10450(param1:_52, param2:_79) : Vector.<_45>
      {
         var _loc10_:_62 = null;
         var _loc11_:_62 = null;
         var _loc12_:_62 = null;
         var _loc3_:uint = this._1992.parent.frameRate;
         if(_loc3_ <= 0)
         {
            _loc3_ = Timeline.DEFAULT_FPS;
         }
         var _loc4_:Vector.<_45> = new Vector.<_45>();
         var _loc5_:int = during * _loc3_;
         var _loc6_:Number = _loc3_ / (this.speed * 4);
         var _loc7_:Number = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         while(_loc7_ < _loc5_)
         {
            _loc8_ = Math.round(_loc7_);
            if(Boolean(_loc10_) && _loc10_.startPos == _loc8_)
            {
               _loc11_ = _loc10_;
            }
            else
            {
               _loc11_ = new _62(param1,true);
            }
            _loc11_._10268 = _62.OPER_OVERRIDE;
            _loc11_.tweenCurve = _2059();
            _loc11_._10265 = _62.OPER_OFFSET;
            _loc11_.startPos = _loc8_;
            if(Boolean(_loc10_) && _loc10_ != _loc11_)
            {
               _loc10_.duration = _loc8_ - _loc10_.startPos;
            }
            switch(_loc9_)
            {
               case 0:
                  _loc11_.transform.rotation = 0;
                  _loc7_ += _loc6_;
                  _loc9_++;
                  break;
               case 1:
                  _loc11_.transform.rotation = Math.PI * this.intensity / 180;
                  _loc7_ += _loc6_ * 2;
                  _loc9_++;
                  break;
               case 2:
                  _loc11_.transform.rotation = -Math.PI * this.intensity / 180;
                  _loc7_ += _loc6_;
                  _loc9_ = 0;
            }
            _loc4_.push(_loc11_);
            _loc10_ = _loc11_;
            if(_loc12_ == null)
            {
               _loc12_ = _loc11_;
            }
         }
         if(Boolean(_loc10_) && _loc10_.startPos != _loc5_)
         {
            _loc10_.duration = _loc5_ - _loc10_.startPos;
            (_loc10_ = new _62(param1,true))._10265 = _62.OPER_OFFSET;
            _loc10_.startPos = _loc5_;
            _loc10_.transform.rotation = 0;
            _loc10_.duration = 0;
            _loc4_.push(_loc10_);
         }
         else if(_loc10_)
         {
            _loc10_.transform.rotation = 0;
            _loc10_.duration = 0;
         }
         return _loc4_;
      }
      
      override public function get _10454() : String
      {
         return name + "_" + type.toString() + "_" + this.speed + "_" + this.intensity;
      }
   }
}

