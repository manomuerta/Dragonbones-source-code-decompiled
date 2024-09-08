package _108
{
   public class _111
   {
      public var _2331:int = 0;
      
      public var _2330:int = 0;
      
      public var _2321:Boolean = false;
      
      public var _2320:Vector.<_109>;
      
      public var _2319:Vector.<_109>;
      
      public var _2332:_109;
      
      private var _2334:int = 0;
      
      private var _2333:int = 0;
      
      private var _2317:int;
      
      private var _2318:int;
      
      public function _111()
      {
         this._2320 = new Vector.<_109>();
         this._2319 = new Vector.<_109>();
         this._2332 = new _110();
         super();
      }
      
      public function _2327(param1:Boolean) : void
      {
         this._2321 = param1;
      }
      
      public function init(param1:int, param2:int) : void
      {
         if(this.count(param1) % 1 != 0 || this.count(param2) % 1 != 0)
         {
         }
         this._2331 = param1;
         this._2330 = param2;
         var _loc3_:_109 = this._2332._2308();
         _loc3_.x = 0;
         _loc3_.y = 0;
         _loc3_.width = param1;
         _loc3_.height = param2;
         this._2320.length = 0;
         this._2319.length = 0;
         this._2319.push(_loc3_);
      }
      
      private function count(param1:Number) : Number
      {
         if(param1 >= 2)
         {
            return this.count(param1 / 2);
         }
         return param1;
      }
      
      public function insert(param1:int, param2:int, param3:Object, param4:int) : _109
      {
         var _loc5_:_109 = this._2332._2308();
         this._2334 = 0;
         this._2333 = 0;
         switch(param4)
         {
            case _107.BestShortSideFit:
               _loc5_ = this._2310(param1,param2,param3);
               break;
            case _107.BottomLeftRule:
               _loc5_ = this._2314(param1,param2,this._2334,this._2333,param3);
               break;
            case _107.ContactPointRule:
               _loc5_ = this._2312(param1,param2,this._2334,param3);
               break;
            case _107.BestLongSideFit:
               _loc5_ = this._2311(param1,param2,this._2333,this._2334,param3);
               break;
            case _107.BestAreaFit:
               _loc5_ = this._2313(param1,param2,this._2334,this._2333,param3);
         }
         if(_loc5_.height == 0)
         {
            return _loc5_;
         }
         this._2323(_loc5_);
         return _loc5_;
      }
      
      public function _2328(param1:Vector.<_109>, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:_109 = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:_109 = null;
         while(param1.length > 0)
         {
            _loc3_ = int.MAX_VALUE;
            _loc4_ = int.MAX_VALUE;
            _loc5_ = -1;
            _loc7_ = 0;
            while(_loc7_ < param1.length)
            {
               _loc8_ = 0;
               _loc9_ = 0;
               _loc10_ = this._2322(param1[_loc7_].width,param1[_loc7_].height,param2,_loc8_,_loc9_,param1[_loc7_].data);
               if(_loc8_ < _loc3_ || _loc8_ == _loc3_ && _loc9_ < _loc4_)
               {
                  _loc3_ = _loc8_;
                  _loc4_ = _loc9_;
                  _loc6_ = _loc10_;
                  _loc5_ = _loc7_;
               }
               _loc7_++;
            }
            if(_loc5_ == -1)
            {
               return;
            }
            this._2323(_loc6_);
            param1.splice(_loc5_,1);
         }
      }
      
      private function _2323(param1:_109) : void
      {
         var _loc2_:int = int(this._2319.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this._2326(this._2319[_loc3_],param1))
            {
               this._2319.splice(_loc3_,1);
               _loc3_--;
               _loc2_--;
            }
            _loc3_++;
         }
         this._2325();
         this._2320.push(param1);
      }
      
      private function _2322(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Object) : _109
      {
         var _loc7_:_109 = this._2332._2308();
         param4 = int.MAX_VALUE;
         param5 = int.MAX_VALUE;
         switch(param3)
         {
            case _107.BestShortSideFit:
               _loc7_ = this._2310(param1,param2,param6);
               break;
            case _107.BottomLeftRule:
               _loc7_ = this._2314(param1,param2,param4,param5,param6);
               break;
            case _107.ContactPointRule:
               _loc7_ = this._2312(param1,param2,param4,param6);
               param4 = -param4;
               break;
            case _107.BestLongSideFit:
               _loc7_ = this._2311(param1,param2,param5,param4,param6);
               break;
            case _107.BestAreaFit:
               _loc7_ = this._2313(param1,param2,param4,param5,param6);
         }
         if(_loc7_.height == 0)
         {
            param4 = int.MAX_VALUE;
            param5 = int.MAX_VALUE;
         }
         return _loc7_;
      }
      
      private function _2329() : Number
      {
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this._2320.length)
         {
            _loc1_ += this._2320[_loc2_].width * this._2320[_loc2_].height;
            _loc2_++;
         }
         return _loc1_ / (this._2331 * this._2330);
      }
      
      private function _2314(param1:int, param2:int, param3:int, param4:int, param5:Object) : _109
      {
         var _loc7_:_109 = null;
         var _loc8_:int = 0;
         var _loc6_:_109;
         (_loc6_ = this._2332._2308()).data = param5;
         param3 = int.MAX_VALUE;
         var _loc9_:int = 0;
         while(_loc9_ < this._2319.length)
         {
            _loc7_ = this._2319[_loc9_];
            if(_loc7_.width >= param1 && _loc7_.height >= param2)
            {
               _loc8_ = _loc7_.y + param2;
               if(_loc8_ < param3 || _loc8_ == param3 && _loc7_.x < param4)
               {
                  _loc6_.x = _loc7_.x;
                  _loc6_.y = _loc7_.y;
                  _loc6_.width = param1;
                  _loc6_.height = param2;
                  _loc6_.data = param5;
                  param3 = _loc8_;
                  param4 = _loc7_.x;
                  _loc6_._2306 = false;
               }
            }
            else if(this._2321 && _loc7_.width >= param2 && _loc7_.height >= param1)
            {
               _loc8_ = _loc7_.y + param1;
               if(_loc8_ < param3 || _loc8_ == param3 && _loc7_.x < param4)
               {
                  _loc6_.x = _loc7_.x;
                  _loc6_.y = _loc7_.y;
                  _loc6_.width = param2;
                  _loc6_.height = param1;
                  _loc6_.data = param5;
                  param3 = _loc8_;
                  param4 = _loc7_.x;
                  _loc6_._2306 = true;
               }
            }
            _loc9_++;
         }
         return _loc6_;
      }
      
      private function _2310(param1:int, param2:int, param3:Object) : _109
      {
         var _loc5_:_109 = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc4_:_109;
         (_loc4_ = this._2332._2308()).data = param3;
         this._2317 = int.MAX_VALUE;
         this._2318 = this._2333;
         var _loc10_:int = 0;
         while(_loc10_ < this._2319.length)
         {
            _loc5_ = this._2319[_loc10_];
            if(_loc5_.width >= param1 && _loc5_.height >= param2)
            {
               _loc6_ = Math.abs(_loc5_.width - param1);
               _loc7_ = Math.abs(_loc5_.height - param2);
               _loc8_ = Math.min(_loc6_,_loc7_);
               _loc9_ = Math.max(_loc6_,_loc7_);
               if(_loc8_ < this._2317 || _loc8_ == this._2317 && _loc9_ < this._2318)
               {
                  _loc4_.x = _loc5_.x;
                  _loc4_.y = _loc5_.y;
                  _loc4_.width = param1;
                  _loc4_.height = param2;
                  _loc4_.data = param3;
                  _loc4_._2306 = false;
                  this._2317 = _loc8_;
                  this._2318 = _loc9_;
               }
            }
            if(this._2321 && _loc5_.width >= param2 && _loc5_.height >= param1)
            {
               _loc11_ = Math.abs(_loc5_.width - param2);
               _loc12_ = Math.abs(_loc5_.height - param1);
               _loc13_ = Math.min(_loc11_,_loc12_);
               _loc14_ = Math.max(_loc11_,_loc12_);
               if(_loc13_ < this._2317 || _loc13_ == this._2317 && _loc14_ < this._2318)
               {
                  _loc4_.x = _loc5_.x;
                  _loc4_.y = _loc5_.y;
                  _loc4_.width = param2;
                  _loc4_.height = param1;
                  _loc4_.data = param3;
                  _loc4_._2306 = true;
                  this._2317 = _loc13_;
                  this._2318 = _loc14_;
               }
            }
            _loc10_++;
         }
         return _loc4_;
      }
      
      private function _2311(param1:int, param2:int, param3:int, param4:int, param5:Object) : _109
      {
         var _loc7_:_109 = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc6_:_109;
         (_loc6_ = this._2332._2308()).data = param5;
         param4 = int.MAX_VALUE;
         var _loc12_:int = 0;
         while(_loc12_ < this._2319.length)
         {
            _loc7_ = this._2319[_loc12_];
            if(_loc7_.width >= param1 && _loc7_.height >= param2)
            {
               _loc8_ = Math.abs(_loc7_.width - param1);
               _loc9_ = Math.abs(_loc7_.height - param2);
               _loc10_ = Math.min(_loc8_,_loc9_);
               _loc11_ = Math.max(_loc8_,_loc9_);
               if(_loc11_ < param4 || _loc11_ == param4 && _loc10_ < param3)
               {
                  _loc6_.x = _loc7_.x;
                  _loc6_.y = _loc7_.y;
                  _loc6_.width = param1;
                  _loc6_.height = param2;
                  _loc6_.data = param5;
                  _loc6_._2306 = false;
                  param3 = _loc10_;
                  param4 = _loc11_;
               }
            }
            if(this._2321 && _loc7_.width >= param2 && _loc7_.height >= param1)
            {
               _loc8_ = Math.abs(_loc7_.width - param2);
               _loc9_ = Math.abs(_loc7_.height - param1);
               _loc10_ = Math.min(_loc8_,_loc9_);
               _loc11_ = Math.max(_loc8_,_loc9_);
               if(_loc11_ < param4 || _loc11_ == param4 && _loc10_ < param3)
               {
                  _loc6_.x = _loc7_.x;
                  _loc6_.y = _loc7_.y;
                  _loc6_.width = param2;
                  _loc6_.height = param1;
                  _loc6_.data = param5;
                  _loc6_._2306 = true;
                  param3 = _loc10_;
                  param4 = _loc11_;
               }
            }
            _loc12_++;
         }
         return _loc6_;
      }
      
      private function _2313(param1:int, param2:int, param3:int, param4:int, param5:Object) : _109
      {
         var _loc7_:_109 = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc6_:_109;
         (_loc6_ = this._2332._2308()).data = param5;
         param3 = int.MAX_VALUE;
         var _loc12_:int = 0;
         while(_loc12_ < this._2319.length)
         {
            _loc7_ = this._2319[_loc12_];
            _loc11_ = _loc7_.width * _loc7_.height - param1 * param2;
            if(_loc7_.width >= param1 && _loc7_.height >= param2)
            {
               _loc8_ = Math.abs(_loc7_.width - param1);
               _loc9_ = Math.abs(_loc7_.height - param2);
               _loc10_ = Math.min(_loc8_,_loc9_);
               if(_loc11_ < param3 || _loc11_ == param3 && _loc10_ < param4)
               {
                  _loc6_.x = _loc7_.x;
                  _loc6_.y = _loc7_.y;
                  _loc6_.width = param1;
                  _loc6_.height = param2;
                  _loc6_.data = param5;
                  _loc6_._2306 = false;
                  param4 = _loc10_;
                  param3 = _loc11_;
               }
            }
            if(this._2321 && _loc7_.width >= param2 && _loc7_.height >= param1)
            {
               _loc8_ = Math.abs(_loc7_.width - param2);
               _loc9_ = Math.abs(_loc7_.height - param1);
               _loc10_ = Math.min(_loc8_,_loc9_);
               if(_loc11_ < param3 || _loc11_ == param3 && _loc10_ < param4)
               {
                  _loc6_.x = _loc7_.x;
                  _loc6_.y = _loc7_.y;
                  _loc6_.width = param2;
                  _loc6_.height = param1;
                  _loc6_.data = param5;
                  _loc6_._2306 = true;
                  param4 = _loc10_;
                  param3 = _loc11_;
               }
            }
            _loc12_++;
         }
         return _loc6_;
      }
      
      private function _2316(param1:int, param2:int, param3:int, param4:int) : int
      {
         if(param2 < param3 || param4 < param1)
         {
            return 0;
         }
         return Math.min(param2,param4) - Math.max(param1,param3);
      }
      
      private function _2315(param1:int, param2:int, param3:int, param4:int) : int
      {
         var _loc6_:_109 = null;
         var _loc5_:int = 0;
         if(param1 == 0 || param1 + param3 == this._2331)
         {
            _loc5_ += param4;
         }
         if(param2 == 0 || param2 + param4 == this._2330)
         {
            _loc5_ += param3;
         }
         var _loc7_:int = 0;
         while(_loc7_ < this._2320.length)
         {
            _loc6_ = this._2320[_loc7_];
            if(_loc6_.x == param1 + param3 || _loc6_.x + _loc6_.width == param1)
            {
               _loc5_ += this._2316(_loc6_.y,_loc6_.y + _loc6_.height,param2,param2 + param4);
            }
            if(_loc6_.y == param2 + param4 || _loc6_.y + _loc6_.height == param2)
            {
               _loc5_ += this._2316(_loc6_.x,_loc6_.x + _loc6_.width,param1,param1 + param3);
            }
            _loc7_++;
         }
         return _loc5_;
      }
      
      private function _2312(param1:int, param2:int, param3:int, param4:Object) : _109
      {
         var _loc6_:_109 = null;
         var _loc7_:int = 0;
         var _loc5_:_109;
         (_loc5_ = this._2332._2308()).data = param4;
         param3 = -1;
         var _loc8_:int = 0;
         while(_loc8_ < this._2319.length)
         {
            _loc6_ = this._2319[_loc8_];
            if(_loc6_.width >= param1 && _loc6_.height >= param2)
            {
               _loc7_ = this._2315(_loc6_.x,_loc6_.y,param1,param2);
               if(_loc7_ > param3)
               {
                  _loc5_.x = _loc6_.x;
                  _loc5_.y = _loc6_.y;
                  _loc5_.width = param1;
                  _loc5_.height = param2;
                  _loc5_.data = param4;
                  _loc5_._2306 = false;
                  param3 = _loc7_;
               }
            }
            if(this._2321 && _loc6_.width >= param2 && _loc6_.height >= param1)
            {
               _loc7_ = this._2315(_loc6_.x,_loc6_.y,param2,param1);
               if(_loc7_ > param3)
               {
                  _loc5_.x = _loc6_.x;
                  _loc5_.y = _loc6_.y;
                  _loc5_.width = param2;
                  _loc5_.height = param1;
                  _loc5_.data = param4;
                  _loc5_._2306 = true;
                  param3 = _loc7_;
               }
            }
            _loc8_++;
         }
         return _loc5_;
      }
      
      private function _2326(param1:_109, param2:_109) : Boolean
      {
         var _loc3_:_109 = null;
         if(param2.x >= param1.x + param1.width || param2.x + param2.width <= param1.x || param2.y >= param1.y + param1.height || param2.y + param2.height <= param1.y)
         {
            return false;
         }
         if(param2.x < param1.x + param1.width && param2.x + param2.width > param1.x)
         {
            if(param2.y > param1.y && param2.y < param1.y + param1.height)
            {
               _loc3_ = param1._2307() as _109;
               _loc3_.height = param2.y - _loc3_.y;
               this._2319.push(_loc3_);
            }
            if(param2.y + param2.height < param1.y + param1.height)
            {
               _loc3_ = param1._2307() as _109;
               _loc3_.y = param2.y + param2.height;
               _loc3_.height = param1.y + param1.height - (param2.y + param2.height);
               this._2319.push(_loc3_);
            }
         }
         if(param2.y < param1.y + param1.height && param2.y + param2.height > param1.y)
         {
            if(param2.x > param1.x && param2.x < param1.x + param1.width)
            {
               _loc3_ = param1._2307() as _109;
               _loc3_.width = param2.x - _loc3_.x;
               this._2319.push(_loc3_);
            }
            if(param2.x + param2.width < param1.x + param1.width)
            {
               _loc3_ = param1._2307() as _109;
               _loc3_.x = param2.x + param2.width;
               _loc3_.width = param1.x + param1.width - (param2.x + param2.width);
               this._2319.push(_loc3_);
            }
         }
         return true;
      }
      
      private function _2325() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         while(_loc1_ < this._2319.length)
         {
            _loc2_ = _loc1_ + 1;
            while(_loc2_ < this._2319.length)
            {
               if(this._2324(this._2319[_loc1_],this._2319[_loc2_]))
               {
                  this._2319.splice(_loc1_,1);
                  break;
               }
               if(this._2324(this._2319[_loc2_],this._2319[_loc1_]))
               {
                  this._2319.splice(_loc2_,1);
               }
               _loc2_++;
            }
            _loc1_++;
         }
      }
      
      private function _2324(param1:_109, param2:_109) : Boolean
      {
         return param1.x >= param2.x && param1.y >= param2.y && param1.x + param1.width <= param2.x + param2.width && param1.y + param1.height <= param2.y + param2.height;
      }
   }
}

