package _13505
{
   import _13492._14034;
   import _51._77;
   
   public class _14035 extends _13510
   {
      public var _2942:_77;
      
      public function _14035()
      {
         super();
         this.flag = FLAG_IK;
      }
      
      public static function _1869(param1:_77) : _14035
      {
         var _loc2_:_14035 = new _14035();
         _loc2_._2942 = param1;
         return _loc2_;
      }
      
      public function get name() : String
      {
         return this._2942.name;
      }
      
      public function _14307() : void
      {
         this._2942._1903 = this;
      }
      
      public function _14306() : void
      {
         this._2942._1903 = null;
      }
      
      public function _13640() : void
      {
         var _loc1_:_14034 = null;
         var _loc2_:_14034 = null;
         if(_1816.length > 0)
         {
            _loc1_ = _1816[0];
            if(_loc1_.startPos > 0)
            {
               _loc2_ = new _14034();
               _loc2_.value = this._2942.weight;
               _loc2_.duration = _loc1_.startPos;
               _loc2_.startPos = 0;
               _loc2_.isFillFirst = true;
               _1816.unshift(_loc2_);
            }
         }
      }
      
      public function _13635() : void
      {
         var _loc1_:_14034 = null;
         if(_1816.length > 0)
         {
            _loc1_ = _1816[0];
            if(_loc1_.isFillFirst)
            {
               _1816.shift();
            }
         }
      }
      
      override public function clone() : _13510
      {
         var _loc1_:_14035 = new _14035();
         _loc1_._2942 = this._2942;
         _loc1_._13679(this);
         return _loc1_;
      }
   }
}

