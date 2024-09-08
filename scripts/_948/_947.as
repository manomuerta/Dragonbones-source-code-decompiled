package _948
{
   import _1404._1407;
   import _51._52;
   import _521._532;
   import _521._535;
   import _639._642;
   import _81._85;
   import _81._86;
   import _81._88;
   import _822._821;
   import _822._831;
   import _953._954;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class _947 extends _949
   {
      public static const maxScale:Number = 3;
      
      public static const maxLength:Number = 500;
      
      public var _6742:_821;
      
      private var _6733:Vector.<_831>;
      
      private var _6737:Number = 1;
      
      private var _6736:Boolean;
      
      public function _947()
      {
         this._6733 = new Vector.<_831>();
         super();
      }
      
      override protected function _2539() : void
      {
         this._1823._2027 = true;
         super._2539();
         this.enabled = this._2226._3367(this._1823);
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._6742 = new _821();
         _6203 = this._6742._2080;
         addElement(this._6742);
      }
      
      override protected function _6731() : Matrix
      {
         if(this._1823)
         {
            return this._1823._2009;
         }
         return _6740;
      }
      
      override public function _1751() : void
      {
         var _loc6_:Number = NaN;
         var _loc1_:Matrix = this._6731();
         var _loc2_:Number = this._1823.globalTransform.scaleX;
         var _loc3_:Number = this._1823.globalTransform.scaleY;
         var _loc4_:Number = Math.abs(_loc2_);
         var _loc5_:Number = Math.abs(_loc3_);
         if(_loc4_ < maxScale && _loc5_ < maxScale)
         {
            _loc6_ = 1;
         }
         else
         {
            _loc6_ = _loc4_ > _loc5_ ? maxScale / _loc4_ : maxScale / _loc5_;
         }
         this._5283 = _loc6_ * _642.getInstance().boneSize / 8;
         if(this._6737 != 1)
         {
            _loc1_ = _loc1_.clone();
            _loc1_.a *= this._6737;
            _loc1_.b *= this._6737;
            _loc1_.c *= this._6737;
            _loc1_.d *= this._6737;
         }
         this.transform.matrix = _loc1_;
      }
      
      public function _6734() : void
      {
         this._6742._6207 = this._1823._2022;
      }
      
      public function _6732() : void
      {
         this._6733.length = 0;
         this._1823._2027 = true;
      }
      
      override public function _1988() : void
      {
         var _loc1_:_954 = owner is _954 ? owner as _954 : (owner.parent is _954 ? owner.parent as _954 : null);
         if(this._1823 && !_535.instance._11294 && _535.instance._3371(this._1823) && (_535.instance._3881 || _loc1_ && _loc1_._2889.indexOf(this._1823) != -1 || _6741))
         {
            this._6083();
            this._6742.enabled = true;
            this._6742.visible = true;
            this._6742._1980 = this._1823._1980;
            this._6742._1957 = this._1823._1957;
            if(this._1823._1980)
            {
               this._6742._14292 = this._1823._14292;
               this._6742._14291 = this._1823._14291;
               this._6742._14295 = this._1823._14295;
            }
            this._6739();
            this._14840();
            if(this._1823._2033 && _535.instance._3881 && _535.instance._3371(this._1823))
            {
               this._6735();
            }
            else
            {
               this._6738();
            }
         }
         else
         {
            this._6742.enabled = false;
            this._6742.visible = false;
            this._6738();
         }
      }
      
      public function _6738() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = int(this._6733.length);
         while(_loc1_ < _loc2_)
         {
            this._6733[_loc1_].visible = false;
            _loc1_++;
         }
      }
      
      public function _6735() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:_831 = null;
         var _loc7_:Vector.<_831> = null;
         var _loc8_:_52 = null;
         var _loc9_:Point = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:Matrix = null;
         var _loc14_:Point = null;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:_86 = null;
         if(!this._1823)
         {
            return;
         }
         if(this._1823._2027)
         {
            _loc3_ = int(this._6733.length);
            _loc4_ = int(this._1823._2024.length);
            _loc5_ = _loc3_ > _loc4_ ? _loc3_ : _loc4_;
            if(_loc3_ != _loc4_)
            {
               _loc10_ = 0;
               while(_loc10_ < _loc5_)
               {
                  if(_loc10_ >= _loc3_)
                  {
                     _loc6_ = _831.create();
                     addElement(_loc6_);
                     this._6733.push(_loc6_);
                  }
                  if(_loc10_ >= _loc4_)
                  {
                     _loc7_ = this._6733.splice(_loc10_,_loc3_ - _loc4_);
                     _loc11_ = 0;
                     _loc12_ = int(_loc7_.length);
                     while(_loc11_ < _loc12_)
                     {
                        removeElement(_loc7_[_loc11_]);
                        _loc7_[_loc11_].destroy();
                        _loc11_++;
                     }
                     break;
                  }
                  _loc10_++;
               }
            }
            _loc9_ = new Point(this._6742.length,0);
            _loc10_ = 0;
            _loc5_ = _loc4_;
            while(_loc10_ < _loc5_)
            {
               _loc8_ = this._1823._2024[_loc10_];
               if((Boolean(_loc8_)) && Boolean(_loc8_._2005))
               {
                  _loc13_ = new Matrix();
                  _loc14_ = new Point(_loc8_._2005.x / this._6737,_loc8_._2005.y / this._6737);
                  _loc15_ = _85._2185(_loc9_,_loc14_);
                  _loc16_ = _85._2186(_loc9_,_loc14_);
                  if(_loc16_ == 0 && _loc9_.x > _loc14_.x)
                  {
                     _loc16_ = Math.PI;
                  }
                  (_loc17_ = new _86(this._6742.length,0)).rotation = _loc16_;
                  _88._2013(_loc17_,_loc13_);
                  this._6733[_loc10_].length = _loc15_;
                  this._6733[_loc10_].transform.matrix = _loc13_;
               }
               _loc10_++;
            }
            this._1823._2027 = false;
         }
         if(this._1823._2025 > 0)
         {
            _loc10_ = 0;
            _loc5_ = int(this._1823._2024.length);
            while(_loc10_ < _loc5_)
            {
               if(this._1823._2024[_loc10_].id == this._1823._2025)
               {
                  _loc1_ = true;
                  _loc2_ = _loc10_;
                  break;
               }
               _loc10_++;
            }
         }
         _loc10_ = 0;
         _loc5_ = int(this._6733.length);
         while(_loc10_ < _loc5_)
         {
            this._6733[_loc10_].visible = _loc1_ ? _loc10_ == _loc2_ : true;
            _loc10_++;
         }
      }
      
      public function _6200() : void
      {
         this._6742._6200();
      }
      
      protected function _6083() : void
      {
         if(this._1823._2028)
         {
            this._6742.color = this._1823.color;
         }
         else
         {
            this._6742._2035();
         }
      }
      
      protected function _14840() : void
      {
         this._6742._6197(this._1823._14270);
      }
      
      protected function _6739() : void
      {
         var _loc1_:Number = _52.MAX_LENGTH * 8 / _642.getInstance().boneSize;
         var _loc2_:Number = this._1823.length / this._6737;
         this._6742.length = _loc2_ < _loc1_ ? _loc2_ : _loc1_;
      }
      
      override public function set _2080(param1:String) : void
      {
         if(_6203 == param1)
         {
            return;
         }
         super._2080 = param1;
         this._6742._2080 = param1;
         this._1988();
      }
      
      public function get _1823() : _52
      {
         return _data as _52;
      }
      
      private function set _5283(param1:Number) : void
      {
         if(this._6737 == param1)
         {
            return;
         }
         this._6737 = param1;
         this._6739();
      }
      
      public function get _2033() : Boolean
      {
         return this._6736;
      }
      
      public function set _2033(param1:Boolean) : void
      {
         this._6736 = param1;
         if(!this._1823)
         {
            return;
         }
         if(this._6736)
         {
            if(this._1823.parentBoneData)
            {
               this._1823.parentBoneData._2025 = this._1823.id;
            }
            this._1823._2016(true);
         }
         else
         {
            this._1823.rootArmatureData._1990._2016(false);
         }
      }
      
      private function get _2226() : _532
      {
         return _1407.getInstance(_532) as _532;
      }
   }
}

