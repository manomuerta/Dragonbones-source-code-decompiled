package _12927
{
   import _12920._12919;
   import _12924._12923;
   import _12936._12937;
   
   public class _12931
   {
      public var _12968:Array;
      
      public var input:_12923;
      
      public var _13137:int;
      
      public function _12931(param1:String, param2:_12923, param3:int)
      {
         this._12968 = [];
         super();
         this._12968 = param1.split("");
         this.input = param2;
         this._13137 = param3;
      }
      
      public static function _13136(param1:Array, param2:int) : Boolean
      {
         if(param2 >= param1.length)
         {
            return false;
         }
         return param1[param2].toString().charCodeAt() >= "0".charCodeAt() && param1[param2].toString().charCodeAt() <= "9".charCodeAt();
      }
      
      public static function _13135(param1:Array, param2:int) : Boolean
      {
         if(param2 >= param1.length)
         {
            return false;
         }
         return _12923._13100(param1[param2].toString().charCodeAt()) >= 0;
      }
      
      public static function _13114(param1:String, param2:_12923, param3:int, param4:Boolean = true) : _12923
      {
         if(param1 == null || param1 == "0" || param1 == "")
         {
            throw new Error("empty string!!!");
         }
         var _loc5_:_12931 = new _12931(param1,param2,param3);
         if(!param4)
         {
            _loc5_._13139();
         }
         _loc5_._13134();
         return _loc5_.input;
      }
      
      public function _13133(param1:int) : int
      {
         var _loc3_:String = null;
         var _loc4_:* = 0;
         if(param1 >= this._12968.length)
         {
            return -1;
         }
         var _loc2_:String = this._12968[param1];
         if(_13136(this._12968,param1))
         {
            return _12919.QRCODE_ENCODE_NUMERIC;
         }
         if(_13135(this._12968,param1))
         {
            return _12919.QRCODE_ENCODE_ALPHA_NUMERIC;
         }
         if(this._13137 == _12919.QRCODE_ENCODE_KANJI)
         {
            if(param1 + 1 < this._12968.length)
            {
               _loc3_ = this._12968[param1 + 1];
               _loc4_ = _loc2_.charCodeAt() << 8 | _loc3_.charCodeAt();
               if(_loc4_ >= 33088 && _loc4_ <= 40956 || _loc4_ >= 57408 && _loc4_ <= 60351)
               {
                  return _12919.QRCODE_ENCODE_KANJI;
               }
            }
         }
         return _12919.QRCODE_ENCODE_BYTES;
      }
      
      public function _13140() : int
      {
         var _loc6_:int = 0;
         var _loc1_:int = _12937._13088(_12919.QRCODE_ENCODE_NUMERIC,this.input.version);
         var _loc2_:int = 0;
         while(_13136(this._12968,_loc2_))
         {
            _loc2_++;
         }
         var _loc3_:int = _loc2_;
         var _loc4_:int = this._13133(_loc2_);
         if(_loc4_ == _12919.QRCODE_ENCODE_BYTES)
         {
            _loc6_ = _12923._13083(_loc3_) + 4 + _loc1_ + _12923._13085(1) - _12923._13085(_loc3_ + 1);
            if(_loc6_ > 0)
            {
               return this._13142();
            }
         }
         if(_loc4_ == _12919.QRCODE_ENCODE_ALPHA_NUMERIC)
         {
            _loc6_ = _12923._13083(_loc3_) + 4 + _loc1_ + _12923._13084(1) - _12923._13084(_loc3_ + 1);
            if(_loc6_ > 0)
            {
               return this._13141();
            }
         }
         var _loc5_:int = this.input.append(_12919.QRCODE_ENCODE_NUMERIC,_loc3_,this._12968);
         if(_loc5_ < 0)
         {
            return -1;
         }
         return _loc3_;
      }
      
      public function _13141() : int
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc1_:int = _12937._13088(_12919.QRCODE_ENCODE_ALPHA_NUMERIC,this.input.version);
         var _loc2_:int = _12937._13088(_12919.QRCODE_ENCODE_NUMERIC,this.input.version);
         var _loc3_:int = 0;
         while(_13135(this._12968,_loc3_))
         {
            if(_13136(this._12968,_loc3_))
            {
               _loc6_ = _loc3_;
               while(_13136(this._12968,_loc6_))
               {
                  _loc6_++;
               }
               _loc7_ = _12923._13084(_loc3_) + _12923._13083(_loc6_ - _loc3_) + 4 + _loc2_ - _12923._13084(_loc6_);
               if(_loc7_ < 0)
               {
                  break;
               }
               _loc3_ = _loc6_;
            }
            else
            {
               _loc3_++;
            }
         }
         var _loc4_:int = _loc3_;
         if(!_13135(this._12968,_loc3_))
         {
            _loc7_ = _12923._13084(_loc4_) + 4 + _loc1_ + _12923._13085(1) - _12923._13085(_loc4_ + 1);
            if(_loc7_ > 0)
            {
               return this._13142();
            }
         }
         var _loc5_:int = this.input.append(_12919.QRCODE_ENCODE_ALPHA_NUMERIC,_loc4_,this._12968);
         if(_loc5_ < 0)
         {
            return -1;
         }
         return _loc4_;
      }
      
      public function _13138() : int
      {
         var _loc1_:int = 0;
         while(this._13133(_loc1_) == _12919.QRCODE_ENCODE_KANJI)
         {
            _loc1_ += 2;
         }
         var _loc2_:int = _loc1_;
         var _loc3_:int = this.input.append(_12919.QRCODE_ENCODE_KANJI,_loc1_,this._12968);
         if(_loc3_ < 0)
         {
            return -1;
         }
         return _loc2_;
      }
      
      public function _13142() : int
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc1_:int = _12937._13088(_12919.QRCODE_ENCODE_ALPHA_NUMERIC,this.input.version);
         var _loc2_:int = _12937._13088(_12919.QRCODE_ENCODE_NUMERIC,this.input.version);
         var _loc3_:int = 1;
         var _loc4_:int = int(this._12968.length);
         while(_loc3_ < _loc4_)
         {
            _loc7_ = this._13133(_loc3_);
            if(_loc7_ == _12919.QRCODE_ENCODE_KANJI)
            {
               break;
            }
            if(_loc7_ == _12919.QRCODE_ENCODE_NUMERIC)
            {
               _loc8_ = _loc3_;
               while(_13136(this._12968,_loc8_))
               {
                  _loc8_++;
               }
               _loc9_ = _12923._13085(_loc3_) + _12923._13083(_loc8_ - _loc3_) + 4 + _loc2_ - _12923._13085(_loc8_);
               if(_loc9_ < 0)
               {
                  break;
               }
               _loc3_ = _loc8_;
            }
            else if(_loc7_ == _12919.QRCODE_ENCODE_ALPHA_NUMERIC)
            {
               _loc8_ = _loc3_;
               while(_13135(this._12968,_loc8_))
               {
                  _loc8_++;
               }
               _loc9_ = _12923._13085(_loc3_) + _12923._13084(_loc8_ - _loc3_) + 4 + _loc1_ - _12923._13085(_loc8_);
               if(_loc9_ < 0)
               {
                  break;
               }
               _loc3_ = _loc8_;
            }
            else
            {
               _loc3_++;
            }
         }
         var _loc5_:int = _loc3_;
         var _loc6_:int = this.input.append(_12919.QRCODE_ENCODE_BYTES,_loc5_,this._12968);
         if(_loc6_ < 0)
         {
            return -1;
         }
         return _loc5_;
      }
      
      public function _13134() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(this._12968.length > 0)
         {
            _loc1_ = this._13133(0);
            switch(_loc1_)
            {
               case _12919.QRCODE_ENCODE_NUMERIC:
                  _loc2_ = this._13140();
                  break;
               case _12919.QRCODE_ENCODE_ALPHA_NUMERIC:
                  _loc2_ = this._13141();
                  break;
               case _12919.QRCODE_ENCODE_KANJI:
                  if(this._13137 == _12919.QRCODE_ENCODE_KANJI)
                  {
                     _loc2_ = this._13138();
                  }
                  else
                  {
                     _loc2_ = this._13142();
                  }
                  break;
               default:
                  _loc2_ = this._13142();
            }
            if(_loc2_ == 0)
            {
               return 0;
            }
            if(_loc2_ < 0)
            {
               return -1;
            }
            this._12968 = this._12968.slice(_loc2_);
         }
         return _loc2_;
      }
      
      public function _13139() : Array
      {
         var _loc3_:int = 0;
         var _loc1_:int = int(this._12968.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = this._13133(this._13137);
            if(_loc3_ == _12919.QRCODE_ENCODE_KANJI)
            {
               _loc2_ += 2;
            }
            else
            {
               if(this._12968[_loc2_].charCodeAt() >= "a".charCodeAt() && this._12968[_loc2_].charCodeAt() <= "z".charCodeAt())
               {
                  this._12968[_loc2_] = String.fromCharCode(this._12968[_loc2_].charCodeAt() - 32);
               }
               _loc2_++;
            }
         }
         return this._12968;
      }
   }
}

