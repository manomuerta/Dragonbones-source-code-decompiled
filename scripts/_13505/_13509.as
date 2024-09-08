package _13505
{
   import _13492._13491;
   import _13492._13496;
   import _51._50;
   
   public class _13509 extends _13510
   {
      public var _1886:_50;
      
      public function _13509(param1:_50, param2:Array = null)
      {
         super(param2);
         this._1886 = param1;
         this.flag = _13510.FLAG_ZORDER;
      }
      
      public static function _1869(param1:_50, param2:Array, param3:_13510) : _13509
      {
         var _loc4_:_13509;
         (_loc4_ = new _13509(param1,param2)).parent = param3;
         return _loc4_;
      }
      
      override public function _1858(param1:Number) : void
      {
         super._1858(param1);
         if(this._1886._10662)
         {
            this._1886._10663(this._1886._10662);
         }
         else if(Boolean(_13491(_13680)) && _13680._13664)
         {
            this._1886._10663(_13491(_13680)._13637);
         }
         else
         {
            this._1886._10663(this._1886._10658);
         }
      }
      
      public function _10661() : void
      {
         this._1886._10663(this._1886._10658);
      }
      
      public function _13640() : void
      {
         var _loc1_:_13491 = null;
         var _loc2_:_13491 = null;
         if(_1816.length > 0)
         {
            _loc1_ = _1816[0];
            if(_loc1_.startPos > 0)
            {
               _loc2_ = new _13491();
               _loc2_.duration = _loc1_.startPos;
               _loc2_.startPos = 0;
               _loc2_.isFillFirst = true;
               _1816.unshift(_loc2_);
            }
         }
      }
      
      public function _13635() : void
      {
         var _loc1_:_13491 = null;
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
         var _loc1_:_13509 = new _13509(this._1886);
         _loc1_._13679(this);
         return _loc1_;
      }
      
      override protected function _13684() : void
      {
         var _loc1_:_13496 = null;
         var _loc2_:_13496 = null;
         _1948 = false;
         if(_1870 >= 0)
         {
            _loc1_ = _1885[_1870];
            _13680 = _loc1_;
            _13680._13664 = true;
         }
         else if(_13680)
         {
            _13680._13664 = false;
         }
      }
   }
}

