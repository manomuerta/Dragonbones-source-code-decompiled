package _81
{
   import _51._52;
   import _51._70;
   import _51._79;
   import flash.utils.Dictionary;
   
   public class _87
   {
      private static var _2201:Array = ["filterBone",1,"filterSlot",1,"convertDisplayToSlot",true,"convertSlotToBone",false,"filterBlankSlot",true,"filterRootBone",false];
      
      public function _87()
      {
         super();
      }
      
      private static function _2198(param1:Object) : Object
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(_2201.length);
         while(_loc2_ < _loc3_)
         {
            if(!param1.hasOwnProperty(_2201[_loc2_]))
            {
               param1[_2201[_loc2_]] = _2201[_loc2_ + 1];
            }
            _loc2_ += 2;
         }
         return param1;
      }
      
      public static function _2199(param1:Array, param2:Object) : int
      {
         var _loc10_:int = 0;
         var _loc11_:_52 = null;
         var _loc12_:Object = null;
         var _loc13_:* = false;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:_79 = null;
         param2 = _2198(param2);
         var _loc3_:int = int(param2.filterBone);
         var _loc4_:int = int(param2.filterSlot);
         var _loc5_:Boolean = Boolean(param2.convertDisplayToSlot);
         var _loc6_:Boolean = Boolean(param2.convertSlotToBone);
         var _loc7_:Boolean = Boolean(param2.filterBlankSlot);
         var _loc8_:Boolean = Boolean(param2.filterRootBone);
         var _loc9_:int = 0;
         _loc14_ = 0;
         while(_loc14_ < param1.length)
         {
            _loc12_ = param1[_loc14_];
            _loc13_ = false;
            if(_loc5_)
            {
               if(_loc12_ is _70)
               {
                  _loc12_ = (_loc12_ as _70)._1760;
                  param1[_loc14_] = _loc12_;
               }
               if(_loc12_ is _79)
               {
                  _loc15_ = 0;
                  while(_loc15_ < _loc14_)
                  {
                     if(param1[_loc15_] == _loc12_)
                     {
                        _loc13_ = true;
                        break;
                     }
                     _loc15_++;
                  }
               }
            }
            if(!_loc13_ && _loc6_)
            {
               if(_loc12_ is _79)
               {
                  _loc12_ = (_loc12_ as _79).parentBoneData;
                  param1[_loc14_] = _loc12_;
               }
               if(_loc12_ is _52)
               {
                  _loc15_ = 0;
                  while(_loc15_ < _loc14_)
                  {
                     if(param1[_loc15_] == _loc12_)
                     {
                        _loc13_ = true;
                        break;
                     }
                     _loc15_++;
                  }
               }
            }
            if(!_loc13_ && (_loc12_ is _52 || _loc12_ is _79 && (!_loc7_ || (_loc12_ as _79)._2049) || _loc12_ is _70))
            {
               if(_loc8_ && _loc12_ is _52 && (_loc12_ as _52).parentBoneData == null)
               {
                  _loc13_ = true;
               }
               else if(_loc12_ is _52 && _loc3_ == 2 || _loc12_ is _79 && _loc4_ == 2)
               {
                  _loc13_ = true;
               }
               else if(_loc12_ is _52 && _loc3_ == 1 || _loc12_ is _79 && _loc4_ == 1)
               {
                  if(_loc8_)
                  {
                     _loc11_ = _2197(_loc12_);
                  }
                  else
                  {
                     _loc11_ = _loc12_["parentBoneData"];
                  }
                  while(_loc11_)
                  {
                     _loc10_ = int(param1.indexOf(_loc11_));
                     if(_loc10_ != -1)
                     {
                        _loc13_ = true;
                        break;
                     }
                     if(_loc8_)
                     {
                        _loc11_ = _2197(_loc11_);
                     }
                     else
                     {
                        _loc11_ = _loc11_.parentBoneData;
                     }
                  }
               }
               else if(_loc12_ is _70)
               {
                  _loc16_ = (_loc12_ as _70)._1760;
                  _loc13_ = param1.indexOf(_loc16_) != -1;
                  if(!_loc13_)
                  {
                     if(_loc8_)
                     {
                        _loc11_ = _2197(_loc12_);
                     }
                     else
                     {
                        _loc11_ = _loc16_.parentBoneData;
                     }
                     while(_loc11_)
                     {
                        _loc10_ = int(param1.indexOf(_loc11_));
                        if(_loc10_ != -1)
                        {
                           _loc13_ = true;
                           break;
                        }
                        if(_loc8_)
                        {
                           _loc11_ = _2197(_loc11_);
                        }
                        else
                        {
                           _loc11_ = _loc11_.parentBoneData;
                        }
                     }
                  }
               }
               if(_loc13_)
               {
                  param1.splice(_loc14_,1);
                  _loc14_--;
               }
               else if(_loc12_ is _52)
               {
                  param1.splice(_loc14_,1);
                  param1.unshift(_loc12_);
                  _loc9_++;
               }
            }
            else
            {
               param1.splice(_loc14_,1);
               _loc14_--;
            }
            _loc14_++;
         }
         return _loc9_;
      }
      
      private static function _2197(param1:Object) : _52
      {
         if(param1.hasOwnProperty("parentBoneData"))
         {
            if(param1["parentBoneData"])
            {
               if(param1["parentBoneData"]["parentBoneData"])
               {
                  return param1["parentBoneData"];
               }
            }
         }
         return null;
      }
      
      public static function _2202(param1:Array) : _91
      {
         var _loc2_:Object = null;
         var _loc5_:_52 = null;
         var _loc6_:Boolean = false;
         var _loc7_:_52 = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Object = null;
         var _loc3_:Array = [];
         var _loc4_:Dictionary = new Dictionary();
         for each(_loc2_ in param1)
         {
            if(_loc2_ is _52)
            {
               _loc3_.push(_loc2_);
               _loc4_[_loc2_] = [_loc2_,1];
            }
         }
         if(_loc3_.length > 0)
         {
            _loc6_ = false;
            _loc8_ = 0;
            _loc9_ = int(_loc3_.length);
            while(_loc8_ < _loc9_)
            {
               _loc7_ = _loc3_[_loc8_];
               if(!(_loc5_ = _loc7_.parentBoneData))
               {
                  return _loc7_;
               }
               while(_loc5_)
               {
                  if(_loc4_[_loc5_])
                  {
                     _loc4_[_loc5_][1] += _loc4_[_loc7_][1];
                     _loc4_[_loc7_] = _loc4_[_loc5_];
                     _loc3_.splice(_loc8_,1);
                     _loc8_--;
                     _loc9_--;
                     break;
                  }
                  _loc5_ = _loc5_.parentBoneData;
               }
               _loc8_++;
            }
            _loc10_ = _loc4_[_loc3_[0]];
            _loc8_ = 1;
            _loc9_ = int(_loc3_.length);
            while(_loc8_ < _loc9_)
            {
               _loc7_ = _loc3_[_loc8_];
               if(_loc10_[1] < _loc4_[_loc7_][1])
               {
                  _loc10_ = _loc4_[_loc7_];
               }
               _loc8_++;
            }
            return _loc10_[0];
         }
         for each(_loc2_ in param1)
         {
            if(_loc2_ is _79 && Boolean((_loc2_ as _79)._2049))
            {
               return _loc2_ as _91;
            }
            if(_loc2_ is _70 && (_loc2_ as _70)._1760 && Boolean((_loc2_ as _70)._1760._2049))
            {
               return (_loc2_ as _70)._1760;
            }
         }
         return null;
      }
   }
}

