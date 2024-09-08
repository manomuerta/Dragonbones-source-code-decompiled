package _13505
{
   import _13492._13501;
   import _51._70;
   
   public class _13507 extends _13510
   {
      public var _1826:_70;
      
      public function _13507()
      {
         super();
         this.flag = FLAG_FFD;
      }
      
      public static function _1869(param1:_70) : _13507
      {
         var _loc2_:_13507 = new _13507();
         _loc2_._1826 = param1;
         return _loc2_;
      }
      
      public function get name() : String
      {
         return this._1826._13228;
      }
      
      public function _1893() : void
      {
         this._1826._1903 = this;
      }
      
      public function _1887() : void
      {
         this._1826._1903 = null;
      }
      
      public function get _1910() : Vector.<Number>
      {
         if(Boolean(_13680) && _13680._13664)
         {
            return (_13680 as _13501)._13636;
         }
         return null;
      }
      
      override public function _1858(param1:Number) : void
      {
         super._1858(param1);
         if(Boolean(this._1826) && this._1826._1903 != null)
         {
            this._1826.mesh.invalid = true;
         }
      }
      
      override public function _1947(param1:Number) : void
      {
         super._1947(param1);
         if(isEmpty)
         {
            _13680 = null;
         }
         if(Boolean(this._1826) && this._1826._1903 != null)
         {
            this._1826.mesh.invalid = true;
         }
      }
      
      public function _13640() : void
      {
         var _loc1_:_13501 = null;
         var _loc2_:_13501 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_1816.length > 0)
         {
            _loc1_ = _1816[0];
            if(_loc1_.startPos > 0)
            {
               _loc2_ = new _13501();
               _loc2_.value = new Vector.<Number>();
               _loc3_ = 0;
               _loc4_ = int(_loc1_._13636.length);
               while(_loc3_ < _loc4_)
               {
                  _loc2_._13636[_loc3_] = 0;
                  _loc3_++;
               }
               _loc2_.duration = _loc1_.startPos;
               _loc2_.startPos = 0;
               _loc2_.isFillFirst = true;
               _1816.unshift(_loc2_);
            }
         }
      }
      
      public function _13635() : void
      {
         var _loc1_:_13501 = null;
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
         var _loc1_:_13507 = new _13507();
         _loc1_._1826 = this._1826;
         _loc1_._13679(this);
         return _loc1_;
      }
   }
}

