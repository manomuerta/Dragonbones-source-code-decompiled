package _13492
{
   public class _13501 extends _13496
   {
      private var _value:Vector.<Number>;
      
      public function _13501()
      {
         super();
         this._13662 = true;
      }
      
      public function get _13636() : Vector.<Number>
      {
         return this._value;
      }
      
      override public function get value() : *
      {
         return this._value;
      }
      
      override public function set value(param1:*) : void
      {
         if(param1 is Vector.<Number>)
         {
            this._value = param1;
         }
      }
      
      override protected function _13660(param1:Number, param2:_13496, param3:_13496) : _13496
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Vector.<Number> = null;
         if(param3 == null)
         {
            param3 = new _13501();
            param3.value = new Vector.<Number>();
         }
         if(param2 == null)
         {
            if(this._value.length < _13501(param3)._13636.length)
            {
               _loc4_ = int(this._value.length);
               _loc5_ = int(_13501(param3)._13636.length);
               while(_loc4_ < _loc5_)
               {
                  this._value[_loc4_] = 0;
                  _loc4_++;
               }
            }
            _loc4_ = 0;
            _loc5_ = int(this._value.length);
            while(_loc4_ < _loc5_)
            {
               _13501(param3)._13636[_loc4_] = this._value[_loc4_];
               _loc4_++;
            }
         }
         else
         {
            if(this._value.length < _13501(param2)._13636.length)
            {
               _loc4_ = int(this._value.length);
               _loc5_ = int(_13501(param2)._13636.length);
               while(_loc4_ < _loc5_)
               {
                  this._value[_loc4_] = 0;
                  _loc4_++;
               }
            }
            else
            {
               _loc4_ = int(_13501(param2)._13636.length);
               _loc5_ = int(this._value.length);
               while(_loc4_ < _loc5_)
               {
                  _13501(param2)._13636[_loc4_] = 0;
                  _loc4_++;
               }
            }
            if(this._value.length < _13501(param3)._13636.length)
            {
               _loc4_ = int(this._value.length);
               _loc5_ = int(_13501(param3)._13636.length);
               while(_loc4_ < _loc5_)
               {
                  this._value[_loc4_] = 0;
                  _loc4_++;
               }
            }
            _loc6_ = _13501(param2)._13636;
            if(_loc6_.length < _13501(param3)._13636.length)
            {
               _loc4_ = int(_loc6_.length);
               _loc5_ = int(_13501(param3)._13636.length);
               while(_loc4_ < _loc5_)
               {
                  _loc6_[_loc4_] = 0;
                  _loc4_++;
               }
            }
            _loc4_ = 0;
            _loc5_ = int(this._value.length);
            while(_loc4_ < _loc5_)
            {
               _13501(param3)._13636[_loc4_] = this._value[_loc4_] + (_13501(param2)._13636[_loc4_] - this._value[_loc4_]) * param1;
               _loc4_++;
            }
         }
         return param3;
      }
      
      override public function clone() : _13496
      {
         var _loc1_:_13501 = new _13501();
         _loc1_.copyFrom(this);
         _loc1_.value = this._13636.concat();
         return _loc1_;
      }
      
      override public function _2207(param1:_13496) : Boolean
      {
         var _loc2_:_13501 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1 is _13501)
         {
            _loc2_ = param1 as _13501;
            if(this._13636.length == _loc2_._13636.length)
            {
               _loc3_ = 0;
               _loc4_ = int(this._13636.length);
               while(_loc3_ < _loc4_)
               {
                  if(this._13636[_loc3_] !== _loc2_._13636[_loc3_])
                  {
                     return false;
                  }
                  _loc3_++;
               }
               return true;
            }
         }
         return false;
      }
   }
}

