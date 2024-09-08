package _12924
{
   import _12920._12919;
   import _12920._12921;
   import _12927._12926;
   import _12936._12937;
   
   public class _12923
   {
      public static const anTable:Array = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,36,-1,-1,-1,37,38,-1,-1,-1,-1,39,40,-1,41,42,43,0,1,2,3,4,5,6,7,8,9,44,-1,-1,-1,-1,-1,-1,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
      
      public var items:Array;
      
      private var _version:int;
      
      private var _level:int;
      
      public function _12923(param1:int = 0, param2:int = 0)
      {
         super();
         if(param1 < 0 || param1 > _12937.QRSPEC_VERSION_MAX || param2 > _12921.QRCODE_ERROR_LEVEL_HIGH)
         {
            throw new Error("Invalid version no");
         }
         this.items = [];
         this._version = param1;
         this._level = param2;
      }
      
      public static function _13095(param1:int, param2:Array) : Boolean
      {
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            if(param2[_loc3_].toString().charCodeAt() < "0".charCodeAt() || param2[_loc3_].toString().charCodeAt() > "9".charCodeAt())
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      public static function _13083(param1:int) : int
      {
         var _loc2_:int = param1 / 3;
         var _loc3_:int = _loc2_ * 10;
         switch(param1 - _loc2_ * 3)
         {
            case 1:
               _loc3_ += 4;
               break;
            case 2:
               _loc3_ += 7;
         }
         return _loc3_;
      }
      
      public static function _13100(param1:int) : int
      {
         return param1 > 127 ? -1 : int(anTable[param1]);
      }
      
      public static function _13101(param1:int, param2:Array) : Boolean
      {
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            if(_13100(param2[_loc3_].toString().charCodeAt()) == -1)
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      public static function _13084(param1:int) : int
      {
         var _loc2_:int = param1 / 2;
         var _loc3_:int = _loc2_ * 11;
         if(param1 & 1)
         {
            _loc3_ += 6;
         }
         return _loc3_;
      }
      
      public static function _13085(param1:int) : int
      {
         return param1 * 8;
      }
      
      public static function _13082(param1:int) : int
      {
         return param1 / 2 * 13;
      }
      
      public static function _13092(param1:int, param2:Array) : Boolean
      {
         var _loc4_:* = 0;
         if(param1 & 1)
         {
            return false;
         }
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            _loc4_ = param2[_loc3_] << 8 | param2[_loc3_ + 1];
            if(_loc4_ < 33088 || _loc4_ > 40956 && _loc4_ < 57408 || _loc4_ > 60351)
            {
               return false;
            }
            _loc3_ += 2;
         }
         return true;
      }
      
      public static function check(param1:int, param2:int, param3:Array) : Boolean
      {
         if(param2 <= 0)
         {
            return false;
         }
         switch(param1)
         {
            case _12919.QRCODE_ENCODE_NUMERIC:
               return _13095(param2,param3);
            case _12919.QRCODE_ENCODE_ALPHA_NUMERIC:
               return _13101(param2,param3);
            case _12919.QRCODE_ENCODE_KANJI:
               return _13092(param2,param3);
            case _12919.QRCODE_ENCODE_BYTES:
               return true;
            case _12919.QRCODE_ENCODE_STRUCTURE:
               return true;
            default:
               return false;
         }
      }
      
      public static function _13097(param1:int, param2:int, param3:int) : int
      {
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc4_:int = param3 - 4 - _12937._13088(param1,param2);
         switch(param1)
         {
            case _12919.QRCODE_ENCODE_NUMERIC:
               _loc5_ = _loc4_ / 10;
               _loc6_ = _loc4_ - _loc5_ * 10;
               _loc7_ = _loc5_ * 3;
               if(_loc6_ >= 7)
               {
                  _loc7_ += 2;
               }
               else if(_loc6_ >= 4)
               {
                  _loc7_ += 1;
               }
               break;
            case _12919.QRCODE_ENCODE_ALPHA_NUMERIC:
               _loc5_ = _loc4_ / 11;
               _loc6_ = _loc4_ - _loc5_ * 11;
               _loc7_ = _loc5_ * 2;
               if(_loc6_ >= 6)
               {
                  _loc7_++;
               }
               break;
            case _12919.QRCODE_ENCODE_BYTES:
               _loc7_ = _loc4_ / 8;
               break;
            case _12919.QRCODE_ENCODE_KANJI:
               _loc7_ = _loc4_ / 13 * 2;
               break;
            case _12919.QRCODE_ENCODE_STRUCTURE:
               _loc7_ = _loc4_ / 8;
               break;
            default:
               _loc7_ = 0;
         }
         var _loc8_:int = _12937._13098(param1,param2);
         if(_loc7_ < 0)
         {
            _loc7_ = 0;
         }
         if(_loc7_ > _loc8_)
         {
            _loc7_ = _loc8_;
         }
         return _loc7_;
      }
      
      public function get version() : int
      {
         return this._version;
      }
      
      public function set version(param1:int) : void
      {
         if(param1 < 0 || param1 > _12937.QRSPEC_VERSION_MAX)
         {
            throw new Error("Invalid version no");
         }
         this._version = param1;
      }
      
      public function get _13057() : int
      {
         return this._level;
      }
      
      public function set _13057(param1:int) : void
      {
         if(param1 > _12921.QRCODE_ERROR_LEVEL_HIGH)
         {
            throw new Error("Invalid ECLEVEL");
         }
         this._level = param1;
      }
      
      public function _13099(param1:_12925) : void
      {
         this.items.addItem(param1);
      }
      
      public function append(param1:int, param2:int, param3:Array) : int
      {
         var entry:_12925 = null;
         var mode:int = param1;
         var size:int = param2;
         var data:Array = param3;
         try
         {
            entry = new _12925(mode,size,data);
            this.items.push(entry);
            return 0;
         }
         catch(e:Error)
         {
            return -1;
         }
      }
      
      public function insertStructuredAppendHeader(param1:int, param2:int, param3:int) : int
      {
         var buf:Array;
         var entry:_12925 = null;
         var size:int = param1;
         var index:int = param2;
         var parity:int = param3;
         if(size > _12925.MAX_STRUCTURED_SYMBOLS)
         {
            throw new Error("insertStructuredAppendHeader wrong size");
         }
         if(index <= 0 || index > _12925.MAX_STRUCTURED_SYMBOLS)
         {
            throw new Error("insertStructuredAppendHeader wrong index");
         }
         buf = [size,index,parity];
         try
         {
            entry = new _12925(_12919.QRCODE_ENCODE_STRUCTURE,3,buf);
            this.items.unshift(entry);
            return 0;
         }
         catch(e:Error)
         {
            return -1;
         }
      }
      
      public function _13103() : Number
      {
         var _loc2_:_12925 = null;
         var _loc3_:int = 0;
         var _loc1_:Number = 0;
         for each(_loc2_ in this.items)
         {
            if(_loc2_.mode != _12919.QRCODE_ENCODE_STRUCTURE)
            {
               _loc3_ = _loc2_.size - 1;
               while(_loc3_ >= 0)
               {
                  _loc1_ ^= _loc2_.data[_loc3_];
                  _loc3_--;
               }
            }
         }
         return _loc1_;
      }
      
      public function _13081(param1:int) : int
      {
         var _loc3_:_12925 = null;
         var _loc2_:int = 0;
         for each(_loc3_ in this.items)
         {
            _loc2_ += _loc3_._13080(param1);
         }
         return _loc2_;
      }
      
      public function _13091() : int
      {
         var _loc3_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(true)
         {
            _loc2_ = _loc1_;
            _loc3_ = this._13081(_loc2_);
            _loc1_ = _12937._13086((_loc3_ + 7) / 8,this._level);
            if(_loc1_ < 0)
            {
               break;
            }
            if(_loc1_ <= _loc2_)
            {
               return _loc1_;
            }
         }
         return -1;
      }
      
      public function _13090() : int
      {
         var _loc2_:_12925 = null;
         var _loc3_:int = 0;
         var _loc1_:int = 0;
         for each(_loc2_ in this.items)
         {
            _loc3_ = _loc2_._13089(this.version);
            if(_loc3_ < 0)
            {
               return -1;
            }
            _loc1_ += _loc3_;
         }
         return _loc1_;
      }
      
      public function _13102() : int
      {
         var _loc2_:int = 0;
         var _loc1_:int = this._13091();
         if(_loc1_ > this.version)
         {
            this.version = _loc1_;
         }
         while(true)
         {
            _loc2_ = this._13090();
            if(_loc2_ < 0)
            {
               break;
            }
            _loc1_ = _12937._13086((_loc2_ + 7) / 8,this._level);
            if(_loc1_ < 0)
            {
               throw new Error("WRONG VERSION");
            }
            if(_loc1_ <= this.version)
            {
               return 0;
            }
            this.version = _loc1_;
         }
         return -1;
      }
      
      public function _13087(param1:_12926) : _12926
      {
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc2_:int = param1.size;
         var _loc3_:int = _12937._13094(this._version,this._level);
         var _loc4_:int = _loc3_ * 8;
         if(_loc4_ == _loc2_)
         {
            return param1;
         }
         if(_loc4_ - _loc2_ < 5)
         {
            param1._13104(_loc4_ - _loc2_,0);
            return param1;
         }
         _loc2_ += 4;
         var _loc5_:int = (_loc2_ + 7) / 8;
         var _loc6_:_12926 = new _12926();
         _loc6_._13104(_loc5_ * 8 - _loc2_ + 4,0);
         var _loc7_:int = _loc3_ - _loc5_;
         if(_loc7_ > 0)
         {
            _loc8_ = [];
            _loc9_ = 0;
            while(_loc9_ < _loc7_)
            {
               _loc8_[_loc9_] = !!(_loc9_ & 1) ? 17 : 236;
               _loc9_++;
            }
            _loc6_.appendBytes(_loc7_,_loc8_);
         }
         param1.append(_loc6_);
         return param1;
      }
      
      public function _13093() : _12926
      {
         var _loc2_:_12925 = null;
         if(this._13102() < 0)
         {
            return null;
         }
         var _loc1_:_12926 = new _12926();
         for each(_loc2_ in this.items)
         {
            _loc1_.append(_loc2_._13105);
         }
         return _loc1_;
      }
      
      public function _13096() : _12926
      {
         var _loc1_:_12926 = this._13093();
         if(_loc1_ == null)
         {
            return null;
         }
         this._13087(_loc1_);
         return _loc1_;
      }
      
      public function _13059() : Array
      {
         var _loc1_:_12926 = this._13096();
         if(_loc1_ == null)
         {
            return null;
         }
         return _loc1_._13106();
      }
   }
}

