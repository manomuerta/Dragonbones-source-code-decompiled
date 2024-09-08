package _40
{
   import _51._69;
   import _51._79;
   import _81._83;
   
   public class _48 extends _49
   {
      public var _1824:_79;
      
      protected var _1924:_83;
      
      private var _1922:_69;
      
      private var _1927:String;
      
      private var _1925:_83;
      
      public function _48(param1:Array = null, param2:int = 0, param3:Object = null)
      {
         this._1924 = new _83();
         this._1925 = new _83();
         super(param1,param2,param3);
      }
      
      public static function _1869(param1:_79, param2:Array = null, param3:int = 0, param4:Object = null) : _48
      {
         var _loc5_:_48;
         (_loc5_ = new _48(param2,param3,param4))._1824 = param1;
         return _loc5_;
      }
      
      public function _1895() : void
      {
         this._1824._13650 = this;
      }
      
      public function _1889() : void
      {
         this._1824._13650 = null;
      }
      
      override protected function _1901() : void
      {
         var _loc1_:_47 = null;
         if(_1870 >= 0)
         {
            _loc1_ = _1816[_1870];
            this._1923 = _loc1_._1732;
            if(Boolean(this._1923) && _loc1_._1919)
            {
               this._1924.copyFrom(_loc1_.colorTransform);
            }
            else
            {
               this._1924.copyFrom(_83._1920);
            }
            this._1927 = _loc1_.gotoAndPlay;
         }
         else
         {
            this._1924.copyFrom(this._1824._2152);
            this._1923 = this._1824._1711;
            this._1927 = null;
         }
      }
      
      override protected function _1898(param1:Boolean = true) : Boolean
      {
         var _loc2_:_47 = null;
         var _loc3_:_47 = null;
         if(_1870 >= 0 && _1870 < _1816.length - 1)
         {
            _loc2_ = _1816[_1870];
            if(_loc2_.tweenEnabled)
            {
               _loc3_ = _1816[_1870 + 1];
               if(_loc2_._1919 || _loc3_._1919)
               {
                  if(param1)
                  {
                     this._1925 = !!this._1925 ? this._1925.copyFrom(_loc3_.colorTransform) : _loc3_.colorTransform.clone();
                     this._1925._1930(_loc2_.colorTransform);
                  }
                  if(!this._1925._1928())
                  {
                     return true;
                  }
               }
            }
         }
         return false;
      }
      
      override protected function _1905(param1:Number) : void
      {
         var _loc2_:_47 = _1816[_1870];
         if(_loc2_._11515)
         {
            param1 = _loc2_.tweenCurve._11516(param1);
         }
         this._1923 = _loc2_._1732;
         var _loc3_:_83 = _loc2_.colorTransform;
         this._1924 = !!this._1924 ? this._1924.copyFrom(_loc3_) : _loc3_.clone();
         this._1925._1929(param1);
         this._1924.add(this._1925);
         this._1927 = _loc2_.gotoAndPlay;
      }
      
      public function get name() : String
      {
         return this._1824.name;
      }
      
      public function get _1926() : _83
      {
         return this._1924;
      }
      
      public function get _1923() : _69
      {
         if(this._1816.length <= 0)
         {
            return this._1824._1711;
         }
         return this._1922;
      }
      
      public function set _1923(param1:_69) : void
      {
         this._1922 = param1;
      }
      
      public function get currentAnimation() : String
      {
         return this._1927;
      }
      
      override public function clone() : TimelineVOBase
      {
         var _loc1_:_48 = new _48();
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
         _loc1_._1824 = this._1824;
         _loc1_._1923 = this._1923;
         _1858(currentPosition);
         return _loc1_;
      }
   }
}

