package _12924
{
   import _12920._12919;
   import _12927._12926;
   import _12936._12937;
   import _12939._12941;
   
   public class _12925
   {
      public static const STRUCTURE_HEADER_BITS:int = 20;
      
      public static const MAX_STRUCTURED_SYMBOLS:int = 16;
      
      public var mode:int;
      
      public var size:int;
      
      public var data:Array;
      
      public var _13105:_12926;
      
      public function _12925(param1:int, param2:int, param3:Array, param4:_12926 = null)
      {
         super();
         var _loc5_:Array = param3.slice(0,param2);
         if(_loc5_.length < param2)
         {
            _loc5_ = _12941._13068(_loc5_,_12941._13069(0,param2 - _loc5_.length,0));
         }
         if(!_12923.check(param1,param2,_loc5_))
         {
            throw new Error("Error m:" + param1 + ",s:" + param2 + ",d:" + _loc5_.join(","));
         }
         this.mode = param1;
         this.size = param2;
         this.data = _loc5_;
         this._13105 = param4;
      }
      
      public function _13109(param1:int) : int
      {
         var words:int = 0;
         var bs:_12926 = null;
         var val:int = 0;
         var i:int = 0;
         var version:int = param1;
         try
         {
            words = this.size / 3;
            bs = new _12926();
            val = 1;
            bs._13104(4,val);
            bs._13104(_12937._13088(_12919.QRCODE_ENCODE_NUMERIC,version),this.size);
            i = 0;
            while(i < words)
            {
               val = (this.data[i * 3].toString().charCodeAt() - "0".charCodeAt()) * 100;
               val += (this.data[i * 3 + 1].toString().charCodeAt() - "0".charCodeAt()) * 10;
               val += this.data[i * 3 + 2].toString().charCodeAt() - "0".charCodeAt();
               bs._13104(10,val);
               i++;
            }
            if(this.size - words * 3 == 1)
            {
               val = this.data[words * 3].toString().charCodeAt() - "0".charCodeAt();
               bs._13104(4,val);
            }
            else if(this.size - words * 3 == 2)
            {
               val = (this.data[words * 3].toString().charCodeAt() - "0".charCodeAt()) * 10;
               val += this.data[words * 3 + 1].toString().charCodeAt() - "0".charCodeAt();
               bs._13104(7,val);
            }
            this._13105 = bs;
            return 0;
         }
         catch(e:Error)
         {
            return -1;
         }
      }
      
      public function _13110(param1:int) : int
      {
         var words:int = 0;
         var bs:_12926 = null;
         var i:int = 0;
         var val:int = 0;
         var version:int = param1;
         try
         {
            words = this.size / 2;
            bs = new _12926();
            bs._13104(4,2);
            bs._13104(_12937._13088(_12919.QRCODE_ENCODE_ALPHA_NUMERIC,version),this.size);
            i = 0;
            while(i < words)
            {
               val = _12923._13100(this.data[i * 2].toString().charCodeAt()) * 45;
               val += _12923._13100(this.data[i * 2 + 1].toString().charCodeAt());
               bs._13104(11,val);
               i++;
            }
            if(this.size & 1)
            {
               val = _12923._13100(this.data[words * 2].toString().charCodeAt());
               bs._13104(6,val);
            }
            this._13105 = bs;
            return 0;
         }
         catch(e:Error)
         {
            return -1;
         }
      }
      
      public function _13111(param1:int) : int
      {
         var bs:_12926 = null;
         var i:int = 0;
         var version:int = param1;
         try
         {
            bs = new _12926();
            bs._13104(4,4);
            bs._13104(_12937._13088(_12919.QRCODE_ENCODE_BYTES,version),this.size);
            i = 0;
            while(i < this.size)
            {
               bs._13104(8,this.data[i].toString().charCodeAt());
               i++;
            }
            this._13105 = bs;
            return 0;
         }
         catch(e:Error)
         {
            return -1;
         }
      }
      
      public function _13108(param1:int) : int
      {
         var bs:_12926 = null;
         var i:int = 0;
         var val:int = 0;
         var h:int = 0;
         var version:int = param1;
         try
         {
            bs = new _12926();
            bs._13104(4,8);
            bs._13104(_12937._13088(_12919.QRCODE_ENCODE_KANJI,version),this.size / 2);
            i = 0;
            while(i < this.size)
            {
               val = this.data[i].toString().charCodeAt() << 8 | this.data[i + 1].toString().charCodeAt();
               if(val <= 40956)
               {
                  val -= 33088;
               }
               else
               {
                  val -= 49472;
               }
               h = (val >> 8) * 192;
               val = (val & 0xFF) + h;
               bs._13104(13,val);
               i += 2;
            }
            this._13105 = bs;
            return 0;
         }
         catch(e:Error)
         {
            return -1;
         }
      }
      
      public function _13107() : int
      {
         var bs:_12926 = null;
         try
         {
            bs = new _12926();
            bs._13104(4,3);
            bs._13104(4,this.data[1].toString().charCodeAt() - 1);
            bs._13104(4,this.data[0].toString().charCodeAt() - 1);
            bs._13104(8,this.data[2].toString().charCodeAt());
            this._13105 = bs;
            return 0;
         }
         catch(e:Error)
         {
            return -1;
         }
      }
      
      public function _13080(param1:int) : int
      {
         var _loc2_:int = 0;
         if(param1 == 0)
         {
            param1 = 1;
         }
         switch(this.mode)
         {
            case _12919.QRCODE_ENCODE_NUMERIC:
               _loc2_ = _12923._13083(this.size);
               break;
            case _12919.QRCODE_ENCODE_ALPHA_NUMERIC:
               _loc2_ = _12923._13084(this.size);
               break;
            case _12919.QRCODE_ENCODE_BYTES:
               _loc2_ = _12923._13085(this.size);
               break;
            case _12919.QRCODE_ENCODE_KANJI:
               _loc2_ = _12923._13082(this.size);
               break;
            case _12919.QRCODE_ENCODE_STRUCTURE:
               return STRUCTURE_HEADER_BITS;
            default:
               return 0;
         }
         var _loc3_:int = _12937._13088(this.mode,param1);
         var _loc4_:* = 1 << _loc3_;
         var _loc5_:int = (this.size + _loc4_ - 1) / _loc4_;
         return _loc2_ + _loc5_ * (4 + _loc3_);
      }
      
      public function _13089(param1:int) : int
      {
         var words:int = 0;
         var st1:_12925 = null;
         var st2:_12925 = null;
         var ret:int = 0;
         var version:int = param1;
         try
         {
            this._13105 = null;
            words = _12937._13098(this.mode,version);
            if(this.size <= words)
            {
               ret = 0;
               switch(this.mode)
               {
                  case _12919.QRCODE_ENCODE_NUMERIC:
                     ret = this._13109(version);
                     addr183:
                     if(ret < 0)
                     {
                        return -1;
                     }
                     break;
                  case _12919.QRCODE_ENCODE_ALPHA_NUMERIC:
                     ret = this._13110(version);
                     §§goto(addr183);
                  case _12919.QRCODE_ENCODE_BYTES:
                     ret = this._13111(version);
                     §§goto(addr183);
                  case _12919.QRCODE_ENCODE_KANJI:
                     ret = this._13108(version);
                  case _12919.QRCODE_ENCODE_STRUCTURE:
                     ret = this._13107();
               }
               return 0;
            }
            st1 = new _12925(this.mode,words,this.data);
            st2 = new _12925(this.mode,this.size - words,this.data.slice(words));
            st1._13089(version);
            st2._13089(version);
            this._13105 = new _12926();
            this._13105.append(st1._13105);
            this._13105.append(st2._13105);
            return this._13105.size;
         }
         catch(e:Error)
         {
            return -1;
         }
      }
   }
}

