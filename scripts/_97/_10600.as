package _97
{
   public class _10600
   {
      public function _10600()
      {
         super();
      }
      
      public static function _10670(param1:Array, param2:Array) : int
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Array = [];
         var _loc8_:Array = [];
         var _loc9_:int = int(param1.length);
         _loc3_ = 0;
         while(_loc3_ < _loc9_)
         {
            _loc7_[_loc3_] = 1;
            _loc8_[_loc3_] = _loc3_;
            _loc3_++;
         }
         _loc3_ = 1;
         _loc6_ = 1;
         _loc5_ = 0;
         while(_loc3_ < _loc9_)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               if(param1[_loc4_] < param1[_loc3_] && _loc7_[_loc4_] + 1 > _loc7_[_loc3_])
               {
                  _loc7_[_loc3_] = _loc7_[_loc4_] + 1;
                  _loc8_[_loc3_] = _loc4_;
                  if(_loc6_ < _loc7_[_loc3_])
                  {
                     _loc6_ = int(_loc7_[_loc3_]);
                     _loc5_ = _loc3_;
                  }
               }
               _loc4_++;
            }
            _loc3_++;
         }
         _loc3_ = _loc6_ - 1;
         while(_loc8_[_loc5_] != _loc5_)
         {
            var _loc10_:*;
            param2[_loc10_ = _loc3_--] = param1[_loc5_];
            _loc5_ = int(_loc8_[_loc5_]);
         }
         param2[_loc3_] = param1[_loc5_];
         return _loc6_;
      }
      
      public static function _10669(param1:Array) : Array
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:Array = [];
         var _loc3_:int = _10670(param1,_loc2_);
         var _loc6_:Array = [];
         var _loc9_:int = (param1.length - _loc3_) * 2;
         var _loc10_:Array = [];
         _loc4_ = 0;
         _loc5_ = int(param1.length);
         while(_loc4_ < _loc5_)
         {
            if(_loc2_.indexOf(_loc4_) == -1)
            {
               _loc7_ = int(param1.indexOf(_loc4_));
               _loc8_ = _loc4_;
               _loc6_.push(_loc8_,_loc7_ - _loc8_);
            }
            if(_loc6_.length == _loc9_)
            {
               break;
            }
            _loc4_++;
         }
         return _loc6_;
      }
      
      public static function _10660(param1:int, param2:Array) : Array
      {
         var _loc3_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc10_:int = param1;
         var _loc11_:Array = [];
         _loc3_ = _loc10_ - 1;
         while(_loc3_ >= 0)
         {
            _loc11_[_loc3_] = -1;
            _loc3_--;
         }
         _loc8_ = 0;
         _loc9_ = int(param2.length);
         while(_loc8_ < _loc9_)
         {
            _loc7_ = int(param2[_loc8_]);
            while(_loc5_ != _loc7_)
            {
               var _loc12_:*;
               _loc4_[_loc12_ = _loc6_++] = _loc5_++;
            }
            _loc11_[_loc5_ + param2[_loc8_ + 1]] = _loc5_++;
            _loc8_ += 2;
         }
         while(_loc5_ < _loc10_)
         {
            _loc4_[_loc12_ = _loc6_++] = _loc5_++;
         }
         _loc3_ = _loc10_ - 1;
         while(_loc3_ >= 0)
         {
            if(_loc11_[_loc3_] == -1)
            {
               _loc11_[_loc3_] = _loc4_[--_loc6_];
            }
            _loc3_--;
         }
         return _loc11_;
      }
   }
}

