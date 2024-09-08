package _13492
{
   import _81._85;
   
   public class _13499 extends _13496
   {
      private var _value:Number = 0;
      
      public var tweenRotate:int;
      
      public function _13499()
      {
         super();
         this._13662 = true;
      }
      
      public function get _13639() : Number
      {
         return this._value;
      }
      
      override public function get value() : *
      {
         return this._value;
      }
      
      override public function set value(param1:*) : void
      {
         if(param1 is Number)
         {
            this._value = param1;
         }
      }
      
      override protected function _13660(param1:Number, param2:_13496, param3:_13496) : _13496
      {
         if(param3 == null)
         {
            param3 = new _13499();
         }
         if(param2 == null)
         {
            param3.value = this._value;
         }
         else
         {
            param3.value = this._value + this._13666(param2.value - this._value) * param1;
         }
         return param3;
      }
      
      private function _13666(param1:Number) : Number
      {
         var _loc2_:int = this.tweenRotate;
         if(_loc2_ != 0)
         {
            if(_loc2_ > 0 ? param1 >= 0 : param1 <= 0)
            {
               _loc2_ = _loc2_ > 0 ? _loc2_ - 1 : _loc2_ + 1;
            }
            param1 += Math.PI * 2 * _loc2_;
         }
         else
         {
            param1 = _85._1738(param1);
         }
         return param1;
      }
      
      override public function clone() : _13496
      {
         var _loc1_:_13499 = new _13499();
         _loc1_.copyFrom(this);
         _loc1_.tweenRotate = this.tweenRotate;
         return _loc1_;
      }
      
      override public function _2207(param1:_13496) : Boolean
      {
         var _loc2_:_13499 = null;
         if(param1 is _13499)
         {
            _loc2_ = param1 as _13499;
            if(_loc2_.tweenRotate != 0 || this.tweenRotate != 0)
            {
               return false;
            }
            return _loc2_.value === this.value;
         }
         return false;
      }
   }
}

