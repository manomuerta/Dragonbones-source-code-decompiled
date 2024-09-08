package _40
{
   import _51._70;
   
   public class _43 extends _49
   {
      public var _1826:_70;
      
      private var _1913:Vector.<Number>;
      
      private var _1907:Vector.<Number>;
      
      public function _43(param1:Array = null, param2:int = 0, param3:Object = null)
      {
         this._1913 = new Vector.<Number>();
         this._1907 = new Vector.<Number>();
         super(param1,param2,param3);
      }
      
      public static function _1869(param1:_70, param2:Array = null, param3:int = 0, param4:Object = null) : _43
      {
         var _loc5_:_43;
         (_loc5_ = new _43(param2,param3,param4))._1826 = param1;
         return _loc5_;
      }
      
      public function _1893() : void
      {
      }
      
      public function _1887() : void
      {
      }
      
      override protected function _1901() : void
      {
         var _loc1_:_42 = null;
         if(_1870 >= 0)
         {
            _loc1_ = _1816[_1870];
            this._1911(this._1913,_loc1_.ffd);
            if(Boolean(this._1826) && this._1826._1903 != null)
            {
               this._1826.mesh.invalid = true;
            }
         }
         else
         {
            this._1913.length = 0;
            this._1826.mesh.invalid = true;
         }
      }
      
      override protected function _1898(param1:Boolean = true) : Boolean
      {
         var _loc2_:_42 = null;
         var _loc3_:_42 = null;
         if(_1870 >= 0 && _1870 < _1816.length - 1)
         {
            _loc2_ = _1816[_1870];
            if(_loc2_.tweenEnabled)
            {
               _loc3_ = _1816[_1870 + 1];
               this._1911(this._1907,_loc3_.ffd);
               this._1908(this._1907,_loc2_.ffd);
               return true;
            }
         }
         return false;
      }
      
      override protected function _1905(param1:Number) : void
      {
         var _loc2_:_42 = _1816[_1870];
         if(_loc2_._11515)
         {
            param1 = _loc2_.tweenCurve._11516(param1);
         }
         this._1909(this._1907,param1);
         this._1911(this._1913,_loc2_.ffd);
         this._1912(this._1913,this._1907);
         if(Boolean(this._1826) && this._1826._1903 != null)
         {
            this._1826.mesh.invalid = true;
         }
      }
      
      private function _1911(param1:Vector.<Number>, param2:Vector.<Number>) : void
      {
         param1.length = param2.length;
         var _loc3_:int = 0;
         var _loc4_:int = int(param2.length);
         while(_loc3_ < _loc4_)
         {
            param1[_loc3_] = param2[_loc3_];
            _loc3_++;
         }
      }
      
      private function _1912(param1:Vector.<Number>, param2:Vector.<Number>) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = int(param2.length);
         if(_loc4_ > param1.length)
         {
            param1.length = _loc4_;
         }
         var _loc5_:int = int(param1.length);
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            if(_loc3_ < _loc4_)
            {
               param1[_loc3_] += param2[_loc3_];
            }
            _loc3_++;
         }
      }
      
      private function _1908(param1:Vector.<Number>, param2:Vector.<Number>) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = int(param2.length);
         if(_loc4_ > param1.length)
         {
            param1.length = _loc4_;
         }
         var _loc5_:int = int(param1.length);
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            if(_loc3_ < _loc4_)
            {
               param1[_loc3_] -= param2[_loc3_];
            }
            _loc3_++;
         }
      }
      
      private function _1909(param1:Vector.<Number>, param2:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = int(param1.length);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            param1[_loc3_] *= param2;
            _loc3_++;
         }
      }
      
      public function get name() : String
      {
         return this._1826.name;
      }
      
      public function get _1910() : Vector.<Number>
      {
         return this._1913;
      }
      
      override public function clone() : TimelineVOBase
      {
         var _loc1_:_43 = new _43();
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
         _loc1_._1826 = this._1826;
         _1858(currentPosition);
         return _loc1_;
      }
   }
}

