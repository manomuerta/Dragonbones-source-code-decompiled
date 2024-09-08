package _13492
{
   import _81._83;
   
   public class _13494 extends _13496
   {
      private var _value:_83;
      
      public function _13494()
      {
         this._value = _83._1920.clone();
         super();
         this._13662 = true;
      }
      
      public function get _13601() : _83
      {
         return this._value;
      }
      
      override public function get value() : *
      {
         return this._value;
      }
      
      override public function set value(param1:*) : void
      {
         if(param1 is _83)
         {
            this._value = param1;
         }
      }
      
      override protected function _13660(param1:Number, param2:_13496, param3:_13496) : _13496
      {
         if(param3 == null)
         {
            param3 = new _13494();
         }
         var _loc4_:_13494 = param3 as _13494;
         if(param2 == null)
         {
            _loc4_._13601.copyFrom(this._13601);
         }
         else
         {
            _loc4_._13601.copyFrom(param2.value as _83);
            _loc4_._13601._1930(this._13601);
            _loc4_._13601._1929(param1);
            _loc4_._13601.add(this._13601);
         }
         return param3;
      }
      
      override public function clone() : _13496
      {
         var _loc1_:_13494 = new _13494();
         _loc1_.copyFrom(this);
         _loc1_.value = this._13601.clone();
         return _loc1_;
      }
      
      override public function _2207(param1:_13496) : Boolean
      {
         var _loc2_:_13494 = null;
         if(param1 is _13494)
         {
            _loc2_ = param1 as _13494;
            return this._13601._2196(_loc2_._13601);
         }
         return false;
      }
   }
}

