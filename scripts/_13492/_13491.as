package _13492
{
   import _40._44;
   
   public class _13491 extends _13496
   {
      private var _value:Array;
      
      public function _13491()
      {
         super();
         this._13662 = false;
      }
      
      public function get _13637() : Array
      {
         return this._value;
      }
      
      override public function get value() : *
      {
         return this._value;
      }
      
      override public function set value(param1:*) : void
      {
         if(param1 is Array)
         {
            this._value = param1;
         }
      }
      
      override protected function _13660(param1:Number, param2:_13496, param3:_13496) : _13496
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param3 == null)
         {
            param3 = new _13491();
            param3.value = [];
         }
         _loc4_ = 0;
         _loc5_ = int(this._value.length);
         while(_loc4_ < _loc5_)
         {
            _13491(param3)._13637[_loc4_] = this._value[_loc4_];
            _loc4_++;
         }
         return param3;
      }
      
      private function _13661() : Array
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:Array = [];
         _loc2_ = 0;
         _loc3_ = int(this._13637.length);
         while(_loc2_ < _loc3_)
         {
            if(this._13637[_loc2_] is _44)
            {
               _loc1_.push((this._13637[_loc2_] as _44).clone());
            }
            else
            {
               _loc1_.push(this._13637[_loc2_]);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      override public function clone() : _13496
      {
         var _loc1_:_13491 = new _13491();
         _loc1_.copyFrom(this);
         _loc1_.value = this._13661();
         return _loc1_;
      }
      
      override public function _2207(param1:_13496) : Boolean
      {
         var _loc2_:_13491 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1 is _13491)
         {
            _loc2_ = param1 as _13491;
            if(_loc2_._13637.length == this._13637.length)
            {
               if(this._13637.length == 0)
               {
                  return true;
               }
               if(this._13637[0] is _13491)
               {
                  return false;
               }
               _loc3_ = 0;
               _loc4_ = int(this._13637.length);
               while(_loc3_ < _loc4_)
               {
                  if(this._13637[_loc3_] !== _loc2_._13637[_loc3_])
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

