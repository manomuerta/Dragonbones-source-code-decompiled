package _12927
{
   import _12918._12917;
   import _12920._12919;
   import _12920._12921;
   import _12924._12923;
   import _12936._12937;
   import _12939._12938;
   import _12939._12940;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class _12928
   {
      private var data:Array;
      
      private var level:int;
      
      private var type:int;
      
      private var version:int = 1;
      
      private var width:int;
      
      private var text:String;
      
      public var bitmapData:BitmapData;
      
      public function _12928(param1:int = 0, param2:int = 2)
      {
         this.data = [];
         super();
         this.level = param1;
         this.type = param2;
      }
      
      public function encode(param1:String) : void
      {
         this.version = 1;
         this.text = param1;
         this._13117(true);
         this._13116();
      }
      
      private function _13116() : void
      {
         this.bitmapData = _12929.image(this.data);
      }
      
      private function _13117(param1:Boolean = true) : void
      {
         if(this.type != _12919.QRCODE_ENCODE_BYTES && this.type != _12919.QRCODE_ENCODE_KANJI)
         {
            throw new Error("bad hint");
         }
         var _loc2_:_12923 = new _12923(this.version,this.level);
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_ = _12931._13114(this.text,_loc2_,this.type,param1);
         var _loc3_:Array = this._13119(_loc2_);
         this.data = _12940._13124(_loc3_);
      }
      
      private function _13121(param1:_12923, param2:int) : _12928
      {
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc10_:* = 0;
         var _loc11_:int = 0;
         var _loc12_:Point = null;
         if(param1.version < 0 || param1.version > _12937.QRSPEC_VERSION_MAX)
         {
            throw new Error("wrong version");
         }
         if(param1._13057 > _12921.QRCODE_ERROR_LEVEL_HIGH)
         {
            throw new Error("wrong level");
         }
         var _loc3_:_12917 = new _12917(param1);
         this.version = _loc3_.version;
         this.width = _12937._13123(this.version);
         var _loc4_:Array = _12937._12971(this.version);
         var _loc5_:_12938 = new _12938(this.width,_loc4_);
         if(_loc5_ == null)
         {
            return null;
         }
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_._13072 + _loc3_._13073)
         {
            _loc9_ = _loc3_._13077();
            _loc10_ = 128;
            _loc11_ = 0;
            while(_loc11_ < 8)
            {
               _loc12_ = _loc5_.next();
               _loc5_._13120(_loc12_,2 | int((_loc10_ & _loc9_) != 0));
               _loc10_ >>= 1;
               _loc11_++;
            }
            _loc6_++;
         }
         _loc11_ = _12937._13118(this.version);
         _loc6_ = 0;
         while(_loc6_ < _loc11_)
         {
            _loc12_ = _loc5_.next();
            _loc5_._13120(_loc12_,2);
            _loc6_++;
         }
         _loc4_ = _loc5_.frame;
         var _loc7_:_12930 = new _12930(_loc4_);
         if(param2 < 0)
         {
            _loc8_ = _loc7_.mask(this.width,param1._13057);
         }
         else
         {
            _loc8_ = _loc7_._13122(this.width,param2,param1._13057);
         }
         if(_loc8_ == null)
         {
            return null;
         }
         this.data = _loc8_;
         return this;
      }
      
      private function _13119(param1:_12923) : Array
      {
         return this._13121(param1,-1).data;
      }
      
      private function _13115(param1:String, param2:int, param3:int) : Array
      {
         if(param1 == "")
         {
            throw new Error("empty string!");
         }
         var _loc4_:_12923 = new _12923(param2,param3);
         if(_loc4_ == null)
         {
            return null;
         }
         var _loc5_:int = _loc4_.append(_12919.QRCODE_ENCODE_BYTES,param1.length,param1.split(""));
         if(_loc5_ < 0)
         {
            return null;
         }
         return this.data = _12940._13124(this._13119(_loc4_));
      }
   }
}

