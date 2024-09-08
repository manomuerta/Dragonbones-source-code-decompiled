package _13492
{
   public class _13500 extends _13496
   {
      private var _value:String;
      
      public function _13500()
      {
         super();
         this._13662 = false;
      }
      
      public function get _13600() : String
      {
         return this._value;
      }
      
      override public function get value() : *
      {
         return this._value;
      }
      
      override public function set value(param1:*) : void
      {
         this._value = String(param1);
      }
      
      override protected function _13660(param1:Number, param2:_13496, param3:_13496) : _13496
      {
         if(param3 == null)
         {
            param3 = new _13500();
         }
         param3.value = this._13600;
         return param3;
      }
      
      override public function clone() : _13496
      {
         var _loc1_:_13500 = new _13500();
         _loc1_.copyFrom(this);
         return _loc1_;
      }
      
      override public function _2207(param1:_13496) : Boolean
      {
         if(param1 is _13500)
         {
            return this.value == null || this.value == "";
         }
         return false;
      }
   }
}

