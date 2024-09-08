package _40
{
   public class _49 extends TimelineVOBase
   {
      public var scale:Number = 1;
      
      public var offset:Number = 0;
      
      private var _1948:Boolean = true;
      
      public function _49(param1:Array = null, param2:int = 0, param3:Object = null)
      {
         super(param1,param2,param3);
      }
      
      override public function refresh() : void
      {
         super.refresh();
         this._1948 = _1816.length > 0;
      }
      
      public function _1858(param1:Number) : void
      {
         this._1947(param1);
      }
      
      public function _1947(param1:Number) : void
      {
         var _loc2_:_45 = null;
         if(_1816.length <= 0)
         {
            this._1948 = false;
            currentPosition = 0;
            _1870 = -1;
            this._1901();
            _1890 = true;
         }
         else if(param1 <= 0)
         {
            param1 = 0;
            currentPosition = param1;
            _1870 = _1931(currentPosition);
            this._1901();
         }
         else if(param1 >= duration)
         {
            currentPosition = param1;
            _1870 = _1816.length - 1;
            this._1901();
         }
         else
         {
            currentPosition = param1;
            _1870 = _1931(currentPosition);
            if(this._1898())
            {
               _loc2_ = _1816[_1870];
               this._1905((currentPosition - _loc2_.startPos) / _loc2_.duration);
            }
            else
            {
               this._1901();
            }
         }
      }
      
      public function _1751() : void
      {
         var _loc1_:_45 = null;
         if((_1816.length <= 0 || currentPosition == 0 || currentPosition >= duration || _1870 < 0) && !this._1898(false))
         {
            this._1901();
         }
         else
         {
            _loc1_ = _1816[_1870];
            this._1905((currentPosition - _loc1_.startPos) / _loc1_.duration);
         }
      }
      
      protected function _1898(param1:Boolean = true) : Boolean
      {
         return false;
      }
      
      protected function _1905(param1:Number) : void
      {
      }
      
      protected function _1901() : void
      {
      }
      
      override public function clone() : TimelineVOBase
      {
         var _loc1_:_49 = new _49();
         _loc1_.currentPosition = this.currentPosition;
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
         _loc1_.scale = this.scale;
         _loc1_.offset = this.offset;
         return _loc1_;
      }
   }
}

