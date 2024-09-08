package _12918
{
   import _12924._12923;
   import _12933._12932;
   import _12933._12934;
   import _12936._12937;
   import _12939._12941;
   
   public class _12917
   {
      public var version:int;
      
      public var _13074:Array;
      
      public var _13076:Array;
      
      public var blocks:int;
      
      public var _13075:Array;
      
      public var count:int;
      
      public var _13072:int;
      
      public var _13073:int;
      
      public var b1:int;
      
      public function _12917(param1:_12923)
      {
         this._13076 = [];
         super();
         this._13075 = [];
         var _loc2_:Array = [0,0,0,0,0];
         this._13074 = param1._13059();
         if(this._13074 == null)
         {
            throw new Error("null imput string");
         }
         _loc2_ = _12937._13071(param1.version,param1._13057,_loc2_);
         this.version = param1.version;
         this.b1 = _12937._13063(_loc2_);
         this._13072 = _12937._13062(_loc2_);
         this._13073 = _12937._13067(_loc2_);
         this._13076 = _12941._13069(0,this._13073,0);
         this.blocks = _12937._13070(_loc2_);
         var _loc3_:int = this.init(_loc2_);
         if(_loc3_ < 0)
         {
            throw new Error("block alloc error");
         }
         this.count = 0;
      }
      
      public function init(param1:Array) : int
      {
         var _loc9_:Array = null;
         var _loc2_:int = _12937._13060(param1);
         var _loc3_:int = _12937._13064(param1);
         var _loc4_:_12934 = _12941._13078(8,285,0,1,_loc3_,255 - _loc2_ - _loc3_);
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         while(_loc8_ < _12937._13063(param1))
         {
            _loc9_ = this._13076.slice(_loc6_);
            this._13075[_loc8_] = new _12932(_loc2_,this._13074.slice(_loc5_),_loc3_,_loc9_,_loc4_);
            _loc9_ = _loc4_._13058((this._13075[_loc8_] as _12932).data);
            (this._13075[_loc8_] as _12932)._13079 = _loc9_;
            this._13076 = _12941._13068(this._13076.slice(0,_loc6_),_loc9_);
            _loc5_ += _loc2_;
            _loc6_ += _loc3_;
            _loc7_++;
            _loc8_++;
         }
         if(_12937._13065(param1) == 0)
         {
            return 0;
         }
         _loc2_ = _12937._13061(param1);
         _loc3_ = _12937._13066(param1);
         _loc4_ = _12941._13078(8,285,0,1,_loc3_,255 - _loc2_ - _loc3_);
         if(_loc4_ == null)
         {
            return -1;
         }
         _loc8_ = 0;
         while(_loc8_ < _12937._13065(param1))
         {
            _loc9_ = this._13076.slice(_loc6_);
            this._13075.push(new _12932(_loc2_,this._13074.slice(_loc5_),_loc3_,_loc9_,_loc4_),_loc7_);
            this._13076 = _12941._13068(this._13076.slice(0,_loc6_),_loc9_);
            _loc5_ += _loc2_;
            _loc6_ += _loc3_;
            _loc7_++;
            _loc8_++;
         }
         return 0;
      }
      
      public function _13077() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.count < this._13072)
         {
            _loc2_ = this.count % this.blocks;
            _loc3_ = this.count / this.blocks;
            if(_loc3_ >= this._13075[0]._13072)
            {
               _loc2_ += this.b1;
            }
            _loc1_ = int(this._13075[_loc2_].data[_loc3_]);
         }
         else
         {
            if(this.count >= this._13072 + this._13073)
            {
               return 0;
            }
            _loc2_ = (this.count - this._13072) % this.blocks;
            _loc3_ = (this.count - this._13072) / this.blocks;
            _loc1_ = int(this._13075[_loc2_]._13079[_loc3_]);
         }
         ++this.count;
         return _loc1_;
      }
   }
}

