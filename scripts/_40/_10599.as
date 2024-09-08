package _40
{
   import _51._50;
   
   public class _10599 extends TimelineVOBase
   {
      public var _1886:_50;
      
      public function _10599(param1:_50, param2:Array = null, param3:int = 0, param4:Object = null)
      {
         super(param2,param3,param4);
         this._1886 = param1;
      }
      
      public static function _1869(param1:_50, param2:Array = null, param3:int = 0, param4:Object = null) : _10599
      {
         return new _10599(param1,param2,param3,param4);
      }
      
      override public function clone() : TimelineVOBase
      {
         var _loc1_:_10599 = null;
         _loc1_ = new _10599(this._1886);
         _loc1_._1870 = this._1870;
         _loc1_._1890 = this._1890;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:int = int(_1885.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_.push(_1885[_loc3_].clone());
            _loc3_++;
         }
         _loc1_._1816 = _loc2_;
         return _loc1_;
      }
      
      public function _1858(param1:Number) : void
      {
         var _loc2_:int = int(param1);
         var _loc3_:_10598 = _1938(_loc2_) as _10598;
         if(_loc3_ == null && _loc2_ >= _1940.length)
         {
            _loc3_ = _1933(_loc2_) as _10598;
         }
         if(this._1886._10662)
         {
            this._1886._10663(this._1886._10662);
         }
         else if(Boolean(_loc3_) && _loc3_.zOrder != null)
         {
            this._1886._10663(_loc3_.zOrder);
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
   }
}

