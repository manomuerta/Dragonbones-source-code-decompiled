package _648
{
   import _51._50;
   import _51._70;
   import _51._79;
   import _73.SymbolType;
   import _93._95;
   
   public class _13209 extends _95
   {
      public const SHEET_SLOT_NAME:String = "sheetSlot";
      
      private var _3251:_50;
      
      private var _13389:Array;
      
      private var _13392:_79;
      
      public var _13253:int = 0;
      
      public var loop:Boolean = true;
      
      public var _13311:Boolean;
      
      public var _13327:Boolean;
      
      public var _13319:Boolean;
      
      public function _13209(param1:_50)
      {
         super();
         if(param1._1811 == SymbolType.SHEET)
         {
            this._3251 = param1;
            this._13253 = this._3251.playTimes;
            this.loop = this._13253 <= 0;
            this._13388();
         }
         this._13389 = [];
         if(this._3251)
         {
            this._13392 = this._3251._1780[0];
         }
         if(this._13392)
         {
            this._5823();
         }
      }
      
      private function _13388() : void
      {
         var _loc1_:_79 = null;
         if(this._3251._1780.length == 0)
         {
            _loc1_ = _79._1729(this.SHEET_SLOT_NAME,this._3251._1990);
            this._3251._1792(_loc1_);
         }
      }
      
      public function _5823() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_70 = null;
         this._13389.length = 0;
         _loc1_ = 0;
         _loc2_ = int(this._13392._1715.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._13392._1765[this._13392._1715[_loc1_]];
            if(_loc3_)
            {
               this._13389.push(_loc3_);
            }
            _loc1_++;
         }
      }
      
      public function _13282(param1:int) : _70
      {
         if(this._13389 == null || this._13389.length == 0)
         {
            return null;
         }
         var _loc2_:int = param1 % this._13389.length;
         return this._13389[_loc2_];
      }
      
      public function _13290() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_70 = null;
         _loc1_ = 0;
         _loc2_ = int(this._13389.length);
         while(_loc1_ < _loc2_)
         {
            if(this._13389[_loc1_] == this._13301)
            {
               return _loc1_;
            }
            _loc1_++;
         }
         return 0;
      }
      
      public function get _13225() : Array
      {
         return this._13389;
      }
      
      public function get _13301() : _70
      {
         return this._13392._2049;
      }
      
      public function get _13331() : _79
      {
         return this._13392;
      }
      
      public function get _1886() : _50
      {
         return this._3251;
      }
      
      public function get frameRate() : int
      {
         if(this._3251)
         {
            return this._3251.frameRate;
         }
         return 24;
      }
      
      public function _13292(param1:_70) : void
      {
         this._13392._2156 = param1;
      }
      
      public function _13332() : Array
      {
         var slotArr:Array = this._13389.concat();
         slotArr.sort(function(param1:_70, param2:_70):int
         {
            return _13390(param1._13230,param2._13230);
         });
         return this._13387(slotArr);
      }
      
      public function _13326() : Array
      {
         var slotArr:Array = this._13389.concat();
         slotArr.sort(function(param1:_70, param2:_70):int
         {
            return -_13390(param1._13230,param2._13230);
         });
         return this._13387(slotArr);
      }
      
      private function _13387(param1:Array) : Array
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = [];
         _loc2_ = 0;
         _loc3_ = int(param1.length);
         while(_loc2_ < _loc3_)
         {
            if(param1[_loc2_] is _70)
            {
               _loc4_.push((param1[_loc2_] as _70)._1733);
            }
            _loc2_++;
         }
         return _loc4_;
      }
      
      public function _13390(param1:String, param2:String) : int
      {
         var _loc5_:int = 0;
         var _loc3_:Array = this._13391(param1);
         var _loc4_:Array = this._13391(param2);
         var _loc6_:int = _loc3_.length > _loc4_.length ? int(_loc3_.length) : int(_loc4_.length);
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            if(_loc3_.length <= _loc5_)
            {
               return -1;
            }
            if(_loc4_.length <= _loc5_)
            {
               return 1;
            }
            if(_loc3_[_loc5_] is int && _loc4_[_loc5_] is String)
            {
               return -1;
            }
            if(_loc3_[_loc5_] is String && _loc4_[_loc5_] is int)
            {
               return 1;
            }
            if(_loc3_[_loc5_] < _loc4_[_loc5_])
            {
               return -1;
            }
            if(_loc3_[_loc5_] > _loc4_[_loc5_])
            {
               return 1;
            }
            _loc5_++;
         }
         return 0;
      }
      
      private function _13391(param1:String) : Array
      {
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc8_:String = null;
         var _loc2_:int = 0;
         var _loc4_:String = "";
         var _loc6_:String = "0123456789";
         var _loc7_:Array = [];
         if(_loc6_.indexOf(param1.charAt(0)) != -1)
         {
            _loc5_ = 1;
         }
         else
         {
            _loc5_ = 0;
         }
         _loc2_ = 0;
         _loc3_ = param1.length;
         while(_loc2_ < _loc3_)
         {
            _loc8_ = param1.charAt(_loc2_);
            if(_loc6_.indexOf(_loc8_) == -1)
            {
               if(_loc5_ == 0)
               {
                  _loc4_ += _loc8_;
               }
               else
               {
                  _loc7_.push(int(_loc4_));
                  _loc4_ = "";
                  _loc4_ = _loc4_ + _loc8_;
               }
               _loc5_ = 0;
            }
            else
            {
               if(_loc5_ == 1)
               {
                  _loc4_ += _loc8_;
               }
               else
               {
                  _loc7_.push(_loc4_);
                  _loc4_ = "";
                  _loc4_ = _loc4_ + _loc8_;
               }
               _loc5_ = 1;
            }
            _loc2_++;
         }
         if(_loc4_ != "")
         {
            if(_loc5_ == 0)
            {
               _loc7_.push(_loc4_);
            }
            else
            {
               _loc7_.push(int(_loc4_));
            }
         }
         return _loc7_;
      }
   }
}

