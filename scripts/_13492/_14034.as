package _13492
{
   public class _14034 extends _13496
   {
      private var _value:Number = 0;
      
      public var bend:int;
      
      public function _14034()
      {
         super();
         this._13662 = true;
      }
      
      public function get _14279() : Number
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
            param3 = new _14034();
         }
         if(param2 == null)
         {
            param3.value = this._value;
            (param3 as _14034).bend = this.bend;
         }
         else
         {
            param3.value = this._value + (param2.value - this._value) * param1;
            (param3 as _14034).bend = this.bend;
         }
         return param3;
      }
      
      override public function clone() : _13496
      {
         var _loc1_:_14034 = new _14034();
         _loc1_.copyFrom(this);
         _loc1_.bend = this.bend;
         return _loc1_;
      }
      
      override public function _2207(param1:_13496) : Boolean
      {
         var _loc2_:_14034 = null;
         if(param1 is _14034)
         {
            _loc2_ = param1 as _14034;
            if(_loc2_.bend != this.bend)
            {
               return false;
            }
            return _loc2_.value === this.value;
         }
         return false;
      }
   }
}

