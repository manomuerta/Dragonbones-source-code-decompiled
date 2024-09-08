package _13492
{
   public class _13497 extends _13496
   {
      private var _value:Number = 0;
      
      public function _13497()
      {
         super();
         this._13662 = true;
      }
      
      public function get _13665() : Number
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
            param3 = new _13497();
         }
         if(param2 == null)
         {
            param3.value = this._value;
         }
         else
         {
            param3.value = this._value + (param2.value - this._value) * param1;
         }
         return param3;
      }
      
      override public function clone() : _13496
      {
         var _loc1_:_13497 = new _13497();
         _loc1_.copyFrom(this);
         return _loc1_;
      }
      
      override public function _2207(param1:_13496) : Boolean
      {
         if(param1 is _13497)
         {
            return this.value === param1.value;
         }
         return false;
      }
   }
}

