package _13492
{
   import flash.geom.Point;
   
   public class _13498 extends _13496
   {
      private var _value:Point;
      
      public function _13498()
      {
         this._value = new Point();
         super();
         this._13662 = true;
      }
      
      public function get _13638() : Point
      {
         return this._value;
      }
      
      public function _13641(param1:Number, param2:Number) : void
      {
         this._value.x = param1;
         this._value.y = param2;
      }
      
      override public function get value() : *
      {
         return this._value;
      }
      
      override public function set value(param1:*) : void
      {
         if(param1 is Point)
         {
            this._value = param1;
         }
      }
      
      override protected function _13660(param1:Number, param2:_13496, param3:_13496) : _13496
      {
         if(param3 == null)
         {
            param3 = new _13498();
         }
         if(param2 == null)
         {
            _13498(param3)._13641(this._13638.x,this._13638.y);
         }
         else
         {
            _13498(param3)._13641(this._13638.x + (_13498(param2)._13638.x - this._13638.x) * param1,this._13638.y + (_13498(param2)._13638.y - this._13638.y) * param1);
         }
         return param3;
      }
      
      override public function clone() : _13496
      {
         var _loc1_:_13498 = new _13498();
         _loc1_.copyFrom(this);
         _loc1_.value = this._13638.clone();
         return _loc1_;
      }
      
      override public function _2207(param1:_13496) : Boolean
      {
         var _loc2_:_13498 = null;
         if(param1 is _13498)
         {
            _loc2_ = param1 as _13498;
            return this._13638.x == _loc2_._13638.x && this._13638.y == _loc2_._13638.y;
         }
         return false;
      }
   }
}

