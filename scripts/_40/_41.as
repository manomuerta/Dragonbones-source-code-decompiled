package _40
{
   import _51._52;
   import _81._86;
   import flash.geom.Point;
   
   public class _41 extends _49
   {
      public var _1823:_52;
      
      public var _1797:Point;
      
      public var _1902:_86;
      
      public var _1904:_86;
      
      private var _1900:_86;
      
      public function _41(param1:Array = null, param2:int = 0, param3:Object = null)
      {
         this._1797 = new Point();
         this._1902 = new _86();
         this._1904 = new _86();
         this._1900 = new _86();
         super(param1,param2,param3);
      }
      
      public static function _1869(param1:_52, param2:Array = null, param3:uint = 0, param4:Object = null) : _41
      {
         var _loc5_:_41;
         (_loc5_ = new _41(param2,param3,param4))._1823 = param1;
         return _loc5_;
      }
      
      public function _1894() : void
      {
         this._1823._13650 = this;
      }
      
      public function _1888() : void
      {
         this._1823._13650 = null;
      }
      
      override protected function _1901() : void
      {
         var _loc1_:BoneFrameVO = null;
         if(_1870 < 0)
         {
            this._1902.x = this._1904.x;
            this._1902.y = this._1904.y;
            this._1902.skewX = this._1904.skewX;
            this._1902.skewY = this._1904.skewY;
            this._1902.scaleX = this._1904.scaleX;
            this._1902.scaleY = this._1904.scaleY;
         }
         else
         {
            _loc1_ = _1816[_1870];
            this._1902.x = this._1904.x + _loc1_.transform.x;
            this._1902.y = this._1904.y + _loc1_.transform.y;
            this._1902.skewX = this._1904.skewX + _loc1_.transform.skewX;
            this._1902.skewY = this._1904.skewY + _loc1_.transform.skewY;
            this._1902.scaleX = this._1904.scaleX * _loc1_.transform.scaleX;
            this._1902.scaleY = this._1904.scaleY * _loc1_.transform.scaleY;
         }
      }
      
      override protected function _1898(param1:Boolean = true) : Boolean
      {
         var _loc2_:BoneFrameVO = null;
         var _loc3_:BoneFrameVO = null;
         if(_1870 >= 0 && _1870 < _1816.length - 1)
         {
            _loc2_ = _1816[_1870];
            if(_loc2_.tweenEnabled)
            {
               if(param1)
               {
                  _loc3_ = _1816[_1870 + 1];
                  this._1900.x = _loc3_.transform.x - _loc2_.transform.x;
                  this._1900.y = _loc3_.transform.y - _loc2_.transform.y;
                  this._1900.skewX = _loc3_.transform.skewX - _loc2_.transform.skewX;
                  this._1900.skewY = _loc3_.transform.skewY - _loc2_.transform.skewY;
                  this._1900.scaleX = _loc3_.transform.scaleX - _loc2_.transform.scaleX;
                  this._1900.scaleY = _loc3_.transform.scaleY - _loc2_.transform.scaleY;
                  this._1900._1738(_loc2_.tweenRotate);
               }
               if(Boolean(this._1900.x) || Boolean(this._1900.y) || Boolean(this._1900.skewX) || Boolean(this._1900.skewY) || Boolean(this._1900.scaleX) || Boolean(this._1900.scaleY))
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      override protected function _1905(param1:Number) : void
      {
         var _loc2_:BoneFrameVO = _1816[_1870];
         if(_loc2_._11515)
         {
            param1 = _loc2_.tweenCurve._11516(param1);
         }
         var _loc3_:_86 = _loc2_.transform;
         this._1902.x = this._1904.x + _loc3_.x + this._1900.x * param1;
         this._1902.y = this._1904.y + _loc3_.y + this._1900.y * param1;
         this._1902.skewX = this._1904.skewX + _loc3_.skewX + this._1900.skewX * param1;
         this._1902.skewY = this._1904.skewY + _loc3_.skewY + this._1900.skewY * param1;
         this._1902.scaleX = this._1904.scaleX * _loc3_.scaleX + this._1900.scaleX * param1;
         this._1902.scaleY = this._1904.scaleY * _loc3_.scaleY + this._1900.scaleY * param1;
      }
      
      public function get name() : String
      {
         return this._1823.name;
      }
      
      override public function clone() : TimelineVOBase
      {
         var _loc1_:_41 = new _41();
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
         _loc1_.scale = scale;
         _loc1_.offset = offset;
         _loc1_._1823 = this._1823;
         _loc1_._1797 = new Point(this._1797.x,this._1797.y);
         _loc1_._1902 = this._1902.clone();
         _loc1_._1904 = this._1904.clone();
         return _loc1_;
      }
   }
}

