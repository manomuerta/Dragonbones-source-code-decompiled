package _204
{
   import _108._109;
   import _108._110;
   import _108._112;
   import _108._113;
   import _108._114;
   import flash.geom.Rectangle;
   
   public final class _212
   {
      public static var _11128:Number;
      
      private static const HIGHEST:uint = 4294967295;
      
      public function _212()
      {
         super();
      }
      
      public static function _2830(param1:uint, param2:uint, param3:uint, param4:Object, param5:Boolean = false, param6:Boolean = true) : Rectangle
      {
         var _loc7_:Rectangle = null;
         var _loc13_:Boolean = false;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:Rectangle = null;
         var _loc17_:Rectangle = null;
         var _loc18_:Rectangle = null;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:* = param4;
         for each(_loc7_ in _loc23_)
         {
         }
         if(!_loc7_)
         {
            return null;
         }
         var _loc8_:uint = 0;
         var _loc9_:Number = 0;
         var _loc10_:Vector.<Rectangle> = new Vector.<Rectangle>();
         for each(_loc7_ in param4)
         {
            _loc8_ += _loc7_.width * _loc7_.height;
            _loc10_.push(_loc7_);
            _loc9_ = Math.max(_loc7_.width,_loc9_);
         }
         _loc10_.sort(_2831);
         if(param1 == 0)
         {
            param1 = Math.sqrt(_loc8_);
         }
         param1 = Math.max(_loc9_ + param2 * 2,param1);
         var _loc11_:uint = HIGHEST;
         var _loc12_:Vector.<Rectangle> = new Vector.<Rectangle>();
         _loc12_.push(new Rectangle(0,0,param1,_loc11_));
         do
         {
            _loc16_ = _2828(_loc12_);
            _loc19_ = int(_loc12_.indexOf(_loc16_));
            _loc13_ = false;
            _loc20_ = 0;
            for each(_loc7_ in _loc10_)
            {
               _loc14_ = int(_loc7_.width) + param2;
               _loc15_ = int(_loc7_.height) + param3;
               if(_loc16_.width >= _loc14_ && _loc16_.height >= _loc15_)
               {
                  if(param5 ? (_loc15_ > _loc14_ * 4 ? (_loc19_ > 0 ? _loc16_.height - _loc15_ >= _loc12_[_loc19_ - 1].height : true) : true) : true)
                  {
                     _loc13_ = true;
                     break;
                  }
               }
               _loc20_++;
            }
            if(_loc13_)
            {
               _loc7_.x = _loc16_.x + param2;
               _loc7_.y = _loc16_.y + param3;
               _loc10_.splice(_loc20_,1);
               _loc12_.splice(_loc19_ + 1,0,new Rectangle(_loc16_.x + _loc14_,_loc16_.y,_loc16_.width - _loc14_,_loc16_.height));
               _loc16_.y += _loc15_;
               _loc16_.width = _loc14_;
               _loc16_.height -= _loc15_;
            }
            else
            {
               if(_loc19_ == 0)
               {
                  _loc18_ = _loc12_[_loc19_ + 1];
               }
               else if(_loc19_ == _loc12_.length - 1)
               {
                  _loc18_ = _loc12_[_loc19_ - 1];
               }
               else
               {
                  _loc17_ = _loc12_[_loc19_ - 1];
                  _loc18_ = _loc12_[_loc19_ + 1];
                  _loc18_ = _loc17_.height <= _loc18_.height ? _loc18_ : _loc17_;
               }
               if(_loc16_.x < _loc18_.x)
               {
                  _loc18_.x = _loc16_.x;
               }
               _loc18_.width = _loc16_.width + _loc18_.width;
               _loc12_.splice(_loc19_,1);
            }
         }
         while(_loc10_.length > 0);
         
         var _loc21_:Array = _2827(param4);
         _loc11_ = _loc21_[1].y + _loc21_[1].height + param3;
         param1 = _loc21_[0].x + _loc21_[0].width + param2;
         if(param6)
         {
            _loc11_ = _1853(_loc11_);
            param1 = _1853(param1);
         }
         return new Rectangle(0,0,param1,_loc11_);
      }
      
      private static function _2831(param1:Rectangle, param2:Rectangle) : int
      {
         var _loc3_:uint = param1.width + param1.height;
         var _loc4_:uint = param2.width + param2.height;
         if(_loc3_ == _loc4_)
         {
            return param1.width > param2.width ? -1 : 1;
         }
         return _loc3_ > _loc4_ ? -1 : 1;
      }
      
      public static function _1853(param1:uint) : uint
      {
         return !!(param1 & param1 - 1) ? uint(1 << param1.toString(2).length) : param1;
      }
      
      private static function _2828(param1:Vector.<Rectangle>) : Rectangle
      {
         var _loc3_:Rectangle = null;
         var _loc4_:Rectangle = null;
         var _loc2_:uint = 0;
         for each(_loc4_ in param1)
         {
            if(_loc4_.height > _loc2_)
            {
               _loc2_ = _loc4_.height;
               _loc3_ = _loc4_;
            }
         }
         return _loc3_;
      }
      
      private static function _2829(param1:Vector.<Rectangle>) : Rectangle
      {
         var _loc3_:Rectangle = null;
         var _loc4_:Rectangle = null;
         var _loc2_:uint = HIGHEST;
         for each(_loc4_ in param1)
         {
            if(_loc4_.height < _loc2_)
            {
               _loc2_ = _loc4_.height;
               _loc3_ = _loc4_;
            }
         }
         return _loc3_;
      }
      
      private static function _2827(param1:Object) : Array
      {
         var _loc2_:Rectangle = null;
         var _loc3_:Rectangle = null;
         var _loc6_:Rectangle = null;
         var _loc4_:int = -1;
         var _loc5_:int = -1;
         for each(_loc6_ in param1)
         {
            if(_loc6_.x + _loc6_.width > _loc4_)
            {
               _loc2_ = _loc6_;
               _loc4_ = _loc2_.x + _loc6_.width;
            }
            if(_loc6_.y + _loc6_.height > _loc5_)
            {
               _loc3_ = _loc6_;
               _loc5_ = _loc3_.y + _loc6_.height;
            }
         }
         return [_loc2_,_loc3_];
      }
      
      public static function _2833(param1:uint, param2:uint, param3:uint, param4:uint, param5:Object, param6:Boolean = true, param7:int = 2) : Rectangle
      {
         var _loc9_:Boolean = false;
         var _loc10_:Object = null;
         var _loc11_:Array = null;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:int = 0;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:Object = null;
         var _loc8_:Vector.<_109> = new Vector.<_109>();
         for each(_loc10_ in param5)
         {
            _loc8_.push(new _110(0,0,_loc10_.width,_loc10_.height,_loc10_.name));
         }
         _114._2327(false);
         _114._2353(param3,param4);
         _114._2338(param7);
         _114._2349(_113.AREA);
         if(param1 > 0 && param2 > 0)
         {
            _114._2347(param1 - param3,param2 - param4);
            _114._2335(_loc8_);
         }
         else
         {
            _loc9_ = true;
            _114._2347();
            _114._2337(_loc8_);
         }
         switch(_114._2345)
         {
            case _112.SHEET_TO_BIG:
               return null;
            case _112.SUCCESS:
               if(_114._2346.x > 2048 || _114._2346.y > 2048)
               {
               }
               _loc11_ = _114.results;
               _loc12_ = 0;
               _loc13_ = 0;
               _loc14_ = 0;
               _loc15_ = 0;
               while(_loc15_ < _loc11_.length)
               {
                  _loc16_ = 0;
                  _loc17_ = 0;
                  _loc18_ = 0;
                  _loc19_ = int(_loc11_[_loc15_].length);
                  while(_loc18_ < _loc19_)
                  {
                     _loc16_ = _loc16_ > _loc11_[_loc15_][_loc18_].x + _loc11_[_loc15_][_loc18_].width ? _loc16_ : _loc11_[_loc15_][_loc18_].x + _loc11_[_loc15_][_loc18_].width;
                     _loc17_ = _loc17_ > _loc11_[_loc15_][_loc18_].y + _loc11_[_loc15_][_loc18_].height ? _loc17_ : _loc11_[_loc15_][_loc18_].y + _loc11_[_loc15_][_loc18_].height;
                     _loc20_ = param5[_loc11_[_loc15_][_loc18_].data];
                     if(_loc20_)
                     {
                        _loc20_.x = _loc11_[_loc15_][_loc18_].x;
                        _loc20_.y = _loc11_[_loc15_][_loc18_].y;
                        _loc20_.page = _loc15_;
                     }
                     _loc18_++;
                  }
                  _loc12_ = _loc12_ > _loc16_ ? _loc12_ : _loc16_;
                  _loc13_ = _loc13_ > _loc17_ ? _loc13_ : _loc17_;
                  _loc14_ += _loc16_ * _loc17_;
                  _loc15_++;
               }
               _11128 = _114.area / _loc14_;
               if(_loc9_)
               {
                  if(param6)
                  {
                     return new Rectangle(0,0,_114._2346.x,_114._2346.y);
                  }
                  return new Rectangle(0,0,_loc12_ + param3,_loc13_ + param4);
               }
               return new Rectangle(0,0,param1,param2);
               break;
            default:
               return null;
         }
      }
   }
}

