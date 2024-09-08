package _1049
{
   import _1038._1037;
   
   public class _1060
   {
      private var _6996:_1061;
      
      private var _8003:_1061;
      
      private var _length:Number = 0;
      
      private var _7894:_1061;
      
      private var _7999:uint = 0;
      
      public function _1060()
      {
         super();
      }
      
      public function get first() : _1061
      {
         return this._6996;
      }
      
      public function get last() : _1061
      {
         return this._8003;
      }
      
      public function get tail() : _1061
      {
         return this._8003;
      }
      
      public function get head() : _1061
      {
         return this._6996;
      }
      
      public function get length() : Number
      {
         return this._length;
      }
      
      public function get _7899() : uint
      {
         return this._7999;
      }
      
      public function set _7899(param1:uint) : void
      {
         if(this._7999 == param1)
         {
            return;
         }
         this._7999 = param1;
         var _loc2_:_1061 = this._6996;
         while(_loc2_)
         {
            _loc2_._7899 = param1;
            _loc2_ = _loc2_.next;
         }
      }
      
      public function insert(param1:int) : _1061
      {
         if(this._6996 == null)
         {
            this._6996 = new _1061(this._7899,param1);
            this._8003 = this._6996;
            ++this._length;
            return this._6996;
         }
         var _loc2_:_1061 = this._7874(param1);
         if(Boolean(_loc2_) && _loc2_._6589 == param1)
         {
            return _loc2_;
         }
         var _loc3_:_1061 = new _1061(this._7899,param1);
         if(!_loc2_)
         {
            this.insertBefore(this._6996,_loc3_);
         }
         else
         {
            this._8000(_loc2_,_loc3_);
         }
         this._7894 = _loc3_;
         return _loc3_;
      }
      
      public function _8000(param1:_1061, param2:_1061) : void
      {
         param2.prev = param1;
         param2.next = param1.next;
         if(param1.next == null)
         {
            this._8003 = param2;
         }
         else
         {
            param1.next.prev = param2;
         }
         param1.next = param2;
         ++this._length;
      }
      
      public function insertBefore(param1:_1061, param2:_1061) : void
      {
         param2.prev = param1.prev;
         param2.next = param1;
         if(param1.prev == null)
         {
            this._6996 = param2;
         }
         else
         {
            param1.prev.next = param2;
         }
         param1.prev = param2;
         ++this._length;
      }
      
      public function find(param1:int) : _1061
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(!this._6996)
         {
            return null;
         }
         var _loc4_:int = this._8003._6589 - param1;
         var _loc5_:_1061 = null;
         if(this._7894)
         {
            if(this._7894._6589 == param1)
            {
               return this._7894;
            }
            _loc2_ = this._7894._6589 - param1;
            _loc3_ = Math.abs(_loc2_);
         }
         if(_loc4_ < 0)
         {
            return null;
         }
         if(this._7894 && _loc3_ < _loc4_ && _loc3_ < param1)
         {
            if(_loc2_ > 0)
            {
               _loc5_ = this._8001(param1,this._7894);
            }
            else
            {
               _loc5_ = this._8002(param1,this._7894);
            }
         }
         else if(_loc4_ < param1)
         {
            _loc5_ = this._8001(param1,this._8003);
         }
         else
         {
            _loc5_ = this._8002(param1,this._6996);
         }
         if(_loc5_)
         {
            this._7894 = _loc5_;
         }
         return _loc5_;
      }
      
      private function _8002(param1:int, param2:_1061) : _1061
      {
         var _loc3_:_1061 = param2;
         var _loc4_:_1061 = null;
         while(Boolean(_loc3_) && _loc3_._6589 <= param1)
         {
            if(_loc3_._6589 == param1)
            {
               _loc4_ = _loc3_;
               break;
            }
            _loc3_ = _loc3_.next;
         }
         return _loc4_;
      }
      
      private function _8001(param1:int, param2:_1061) : _1061
      {
         var _loc3_:_1061 = param2;
         var _loc4_:_1061 = null;
         while(Boolean(_loc3_) && _loc3_._6589 >= param1)
         {
            if(_loc3_._6589 == param1)
            {
               _loc4_ = _loc3_;
               break;
            }
            _loc3_ = _loc3_.prev;
         }
         return _loc4_;
      }
      
      public function _7874(param1:int) : _1061
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(!this._6996 || param1 < 0)
         {
            return null;
         }
         var _loc5_:_1061 = null;
         if(this._7894)
         {
            if(this._7894._6589 == param1)
            {
               return this._7894;
            }
            _loc2_ = this._7894._6589 - param1;
            _loc3_ = Math.abs(_loc2_);
         }
         _loc4_ = this._8003._6589 - param1;
         if(param1 < this._6996._6589)
         {
            _loc5_ = null;
         }
         else if(_loc4_ < 0)
         {
            _loc5_ = this._8003;
         }
         else if(this._7894 && _loc3_ < _loc4_ && _loc3_ < param1)
         {
            if(_loc2_ > 0)
            {
               _loc5_ = this._7997(param1,this._7894);
            }
            else
            {
               _loc5_ = this._7998(param1,this._7894);
            }
         }
         else if(_loc4_ < param1)
         {
            _loc5_ = this._7997(param1,this._8003);
         }
         else
         {
            _loc5_ = this._7998(param1,this._6996);
         }
         this._7894 = _loc5_;
         return _loc5_;
      }
      
      private function _7998(param1:int, param2:_1061) : _1061
      {
         var _loc3_:_1061 = param2;
         while(Boolean(_loc3_) && _loc3_._6589 < param1)
         {
            if(_loc3_.next == null)
            {
               break;
            }
            if(_loc3_.next._6589 > param1)
            {
               break;
            }
            _loc3_ = _loc3_.next;
         }
         return _loc3_;
      }
      
      private function _7997(param1:int, param2:_1061) : _1061
      {
         var _loc3_:_1061 = param2;
         while(Boolean(_loc3_) && _loc3_._6589 > param1)
         {
            _loc3_ = _loc3_.prev;
         }
         return _loc3_;
      }
      
      public function push(param1:_1061) : void
      {
         if(this._8003)
         {
            param1.prev = this._8003;
            param1.next = null;
            this._8003.next = param1;
            this._8003 = param1;
            ++this._length;
         }
         else
         {
            param1.prev = null;
            param1.next = null;
            this._6996 = param1;
            this._8003 = param1;
            this._length = 1;
         }
      }
      
      public function remove(param1:int) : _1061
      {
         var _loc2_:_1061 = this.find(param1);
         if(_loc2_)
         {
            this.removeNode(_loc2_);
         }
         return _loc2_;
      }
      
      public function removeNode(param1:_1061) : void
      {
         if(param1.prev == null)
         {
            this._6996 = param1.next;
         }
         else
         {
            param1.prev.next = param1.next;
         }
         if(param1.next == null)
         {
            this._8003 = param1.prev;
         }
         else
         {
            param1.next.prev = param1.prev;
         }
         param1.next = null;
         param1.prev = null;
         if(param1 == this._7894)
         {
            this._7894 = null;
         }
         --this._length;
      }
      
      public function _6162() : void
      {
         this._6996 = null;
         this._8003 = null;
         this._length = 0;
         this._7894 = null;
      }
      
      public function _7878(param1:int, param2:int) : void
      {
         this._7999 += param2;
         var _loc3_:_1061 = this.first;
         while(_loc3_)
         {
            _loc3_._7878(param1,param2);
            _loc3_ = _loc3_.next;
         }
      }
      
      public function _7877(param1:int, param2:int) : void
      {
         this._7999 -= param2;
         var _loc3_:_1061 = this.first;
         while(_loc3_)
         {
            _loc3_._7877(param1,param2);
            _loc3_ = _loc3_.next;
         }
      }
      
      public function _7892(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:_1061 = this.first;
         while(_loc4_)
         {
            _loc4_._7892(param1,param2,param3);
            _loc4_ = _loc4_.next;
         }
      }
      
      public function _7884(param1:int, param2:int) : void
      {
         var _loc3_:_1061 = this.first;
         while(_loc3_)
         {
            _loc3_._7884(param1,param2);
            _loc3_ = _loc3_.next;
         }
      }
      
      public function toString() : String
      {
         var _loc1_:String = "[ ";
         var _loc2_:_1061 = this.first;
         while(_loc2_)
         {
            _loc1_ += "(" + _loc2_._6589 + "," + _loc2_._7876 + ") -> ";
            _loc2_ = _loc2_.next;
         }
         return _loc1_ + "]";
      }
      
      public function toArray() : _1037
      {
         var _loc1_:_1037 = new _1037();
         var _loc2_:_1061 = this.first;
         var _loc3_:int = 0;
         while(_loc2_)
         {
            _loc1_.addItem(_loc2_);
            _loc2_ = _loc2_.next;
         }
         return _loc1_;
      }
   }
}

