package _81
{
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class _82
   {
      public static var _2015:Dictionary = new Dictionary();
      
      private static var _2176:Array = [];
      
      private static var _2177:Array = [];
      
      private static var _2181:Dictionary = new Dictionary();
      
      public function _82()
      {
         super();
      }
      
      public static function clearCache() : void
      {
         var _loc1_:Object = null;
         for(_loc1_ in _2015)
         {
            _2176.push(_2015[_loc1_]);
            delete _2015[_loc1_];
         }
      }
      
      public static function _2182(param1:Array, ... rest) : Rectangle
      {
         var _loc7_:_89 = null;
         var _loc8_:BoundingBox = null;
         var _loc9_:Point = null;
         var _loc3_:Number = Number.MAX_VALUE;
         var _loc4_:Number = Number.MAX_VALUE;
         var _loc5_:Number = -Number.MAX_VALUE;
         var _loc6_:Number = -Number.MAX_VALUE;
         rest.unshift(param1);
         for each(param1 in rest)
         {
            if(param1 is Array)
            {
               for each(_loc7_ in param1)
               {
                  if(_loc7_)
                  {
                     _loc8_ = _2168(_loc7_);
                     for each(_loc9_ in _loc8_._1821)
                     {
                        _loc3_ = _loc3_ < _loc9_.y ? _loc3_ : _loc9_.y;
                        _loc4_ = _loc4_ < _loc9_.x ? _loc4_ : _loc9_.x;
                        _loc5_ = _loc5_ > _loc9_.y ? _loc5_ : _loc9_.y;
                        _loc6_ = _loc6_ > _loc9_.x ? _loc6_ : _loc9_.x;
                     }
                  }
               }
            }
         }
         return new Rectangle(_loc4_,_loc3_,_loc6_ - _loc4_,_loc5_ - _loc3_);
      }
      
      public static function _2174(param1:Rectangle, param2:Array) : Array
      {
         var _loc4_:_89 = null;
         var _loc3_:Array = [];
         for each(_loc4_ in param2)
         {
            if(_2179(param1,_loc4_))
            {
               _loc3_.push(_loc4_);
            }
         }
         return _loc3_;
      }
      
      private static function _2179(param1:Rectangle, param2:_89) : Boolean
      {
         if(param2._2038 == 0 && param2._2037 == 0)
         {
            return false;
         }
         var _loc3_:Array = [new Point(param1.left,param1.top),new Point(param1.right,param1.top),new Point(param1.right,param1.bottom),new Point(param1.left,param1.bottom)];
         var _loc4_:int = 0;
         while(_loc4_ < 4)
         {
            if(_2169(_loc3_[_loc4_],param2))
            {
               return true;
            }
            _loc4_++;
         }
         var _loc5_:BoundingBox = param2.boundingBox;
         if(!_loc5_)
         {
            _loc5_ = _2168(param2);
         }
         if(_2175(_loc5_,_loc3_))
         {
            return true;
         }
         _2172();
         var _loc6_:int = 0;
         var _loc7_:int = 1;
         var _loc8_:int = 1;
         while(_loc8_ < 5)
         {
            _loc7_ = _loc8_ + 1;
            if(_loc7_ == 5)
            {
               _loc7_ = 1;
            }
            if(_2181.hasOwnProperty(_2170(_2177[_loc8_],_2177[_loc7_])))
            {
               _loc6_ = int(_2181[_2170(_2177[_loc8_],_2177[_loc7_])]);
               if(_loc6_ == 0)
               {
                  return true;
               }
               if(_85._2171(_loc3_[_loc6_ - 1],_loc3_[(_loc6_ + 1) % 4],_loc5_["point" + _loc8_],_loc5_["point" + _loc7_]))
               {
                  return true;
               }
            }
            _loc8_++;
         }
         return false;
      }
      
      private static function _2168(param1:_89) : BoundingBox
      {
         var _loc3_:int = 0;
         if(_2176.length == 0)
         {
            while(_loc3_ < 100)
            {
               _2176.push(new BoundingBox());
               _loc3_++;
            }
         }
         var _loc2_:BoundingBox = _2176.pop();
         _loc2_.point1.copyFrom(_88._2135(new Point(param1._2041,param1._2040),param1._2009));
         _loc2_.point2.copyFrom(_88._2135(new Point(param1._2041 + param1._2038,param1._2040),param1._2009));
         _loc2_.point3.copyFrom(_88._2135(new Point(param1._2041 + param1._2038,param1._2040 + param1._2037),param1._2009));
         _loc2_.point4.copyFrom(_88._2135(new Point(param1._2041,param1._2040 + param1._2037),param1._2009));
         param1.boundingBox = _loc2_;
         return _loc2_;
      }
      
      public static function _2169(param1:Point, param2:_89) : Boolean
      {
         var _loc3_:Matrix = param2._2009.clone();
         _loc3_.invert();
         var _loc4_:Point = _88._2135(param1,_loc3_,true);
         if(_loc4_.x > param2._2041 && _loc4_.x < param2._2041 + param2._2038 && _loc4_.y > param2._2040 && _loc4_.y < param2._2040 + param2._2037)
         {
            return true;
         }
         return false;
      }
      
      private static function _2175(param1:BoundingBox, param2:Array) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 1;
         while(_loc4_ < 5)
         {
            _loc3_ = _2173(param1["point" + _loc4_],param2);
            if(_loc3_ == 0)
            {
               return true;
            }
            _2177[_loc4_] = _loc3_;
            _loc4_++;
         }
         return false;
      }
      
      private static function _2173(param1:Point, param2:Array) : int
      {
         var _loc3_:Number = Number(param2[0].x);
         var _loc4_:Number = Number(param2[2].x);
         var _loc5_:Number = Number(param2[0].y);
         var _loc6_:Number = Number(param2[2].y);
         var _loc7_:int = 0;
         if(param1.y < _loc5_)
         {
            if(param1.x < _loc3_)
            {
               _loc7_ = 1;
            }
            else if(param1.x > _loc3_ && param1.x < _loc4_)
            {
               _loc7_ = 2;
            }
            else if(param1.x > _loc4_)
            {
               _loc7_ = 3;
            }
         }
         else if(param1.y > _loc5_ && param1.y < _loc6_)
         {
            if(param1.x < _loc3_)
            {
               _loc7_ = 4;
            }
            else if(param1.x > _loc3_ && param1.x < _loc4_)
            {
               _loc7_ = 0;
            }
            else if(param1.x > _loc4_)
            {
               _loc7_ = 5;
            }
         }
         else if(param1.y > _loc6_)
         {
            if(param1.x < _loc3_)
            {
               _loc7_ = 6;
            }
            else if(param1.x > _loc3_ && param1.x < _loc4_)
            {
               _loc7_ = 7;
            }
            else if(param1.x > _loc4_)
            {
               _loc7_ = 8;
            }
         }
         return _loc7_;
      }
      
      private static function _2172() : void
      {
         _2181 = new Dictionary();
         _2181[_2170(1,8)] = 0;
         _2181[_2170(2,7)] = 0;
         _2181[_2170(3,6)] = 0;
         _2181[_2170(4,5)] = 0;
         _2181[_2170(1,5)] = 2;
         _2181[_2170(1,7)] = 4;
         _2181[_2170(2,4)] = 1;
         _2181[_2170(2,5)] = 2;
         _2181[_2170(2,6)] = 1;
         _2181[_2170(2,8)] = 2;
         _2181[_2170(3,4)] = 1;
         _2181[_2170(3,7)] = 3;
         _2181[_2170(4,7)] = 4;
         _2181[_2170(4,8)] = 4;
         _2181[_2170(5,6)] = 3;
         _2181[_2170(5,7)] = 3;
      }
      
      private static function _2170(param1:int, param2:int) : int
      {
         return int(_2178(param1) | _2178(param2));
      }
      
      private static function _2178(param1:int) : int
      {
         switch(param1)
         {
            case 1:
               return 1;
            case 2:
               return 2;
            default:
               return 2 << param1 - 2;
         }
      }
   }
}

