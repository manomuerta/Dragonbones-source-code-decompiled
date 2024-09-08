package _13492
{
   import _51._69;
   
   public class _13495 extends _13496
   {
      private var _value:_69;
      
      public var _13603:String;
      
      public function _13495()
      {
         super();
         this._13662 = false;
      }
      
      public function get _13613() : _69
      {
         return this._value;
      }
      
      override public function get value() : *
      {
         return this._value;
      }
      
      override public function set value(param1:*) : void
      {
         this._value = param1;
      }
      
      override protected function _13660(param1:Number, param2:_13496, param3:_13496) : _13496
      {
         if(param3 == null)
         {
            param3 = new _13495();
         }
         param3.value = this._13613;
         (param3 as _13495)._13603 = this._13603;
         return param3;
      }
      
      override public function clone() : _13496
      {
         var _loc1_:_13495 = new _13495();
         _loc1_.copyFrom(this);
         return _loc1_;
      }
      
      override public function _2207(param1:_13496) : Boolean
      {
         if(param1 is _13495)
         {
            return this.value === param1.value;
         }
         return false;
      }
   }
}

