package _652
{
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   
   public class _654
   {
      public static var _13910:Array = [new _13543(0,-1),new _13543(0,1),new _13543(1,0),new _13543(-1,0),new _13543(-1,-1),new _13543(1,-1),new _13543(-1,1),new _13543(1,1)];
      
      public static const HELP_BINARIZATION:Array = [];
      
      public function _654()
      {
         super();
      }
      
      public static function length2(param1:Point, param2:Point) : Number
      {
         return (param1.x - param2.x) * (param1.x - param2.x) + (param1.y - param2.y) * (param1.y - param2.y);
      }
      
      public static function crossProduct(param1:Point, param2:Point, param3:Point) : Number
      {
         return (param1.x - param3.x) * (param2.y - param3.y) - (param2.x - param3.x) * (param1.y - param3.y);
      }
      
      public static function cross2(param1:Point, param2:Point, param3:Point, param4:Point) : Boolean
      {
         if(param1.equals(param3))
         {
            return false;
         }
         if(param2.equals(param3))
         {
            return false;
         }
         if(param1.equals(param4))
         {
            return false;
         }
         if(param2.equals(param4))
         {
            return false;
         }
         if(Math.max(param1.x,param2.x) < Math.min(param3.x,param4.x))
         {
            return false;
         }
         if(Math.max(param1.y,param2.y) < Math.min(param3.y,param4.y))
         {
            return false;
         }
         if(Math.max(param3.x,param4.x) < Math.min(param1.x,param2.x))
         {
            return false;
         }
         if(Math.max(param3.y,param4.y) < Math.min(param1.y,param2.y))
         {
            return false;
         }
         if(crossProduct(param3,param2,param1) * crossProduct(param2,param4,param1) < 0)
         {
            return false;
         }
         if(crossProduct(param1,param4,param3) * crossProduct(param4,param2,param3) < 0)
         {
            return false;
         }
         return true;
      }
      
      public static function _5684(param1:Point, param2:Point, param3:Point) : Boolean
      {
         var _loc4_:Point = new Point(0,int.MAX_VALUE);
         return cross2(param1,_loc4_,param2,param3);
      }
      
      public static function _4249(param1:Point, param2:_655) : Boolean
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Boolean = false;
         var _loc3_:Vector.<_656> = new Vector.<_656>();
         _loc3_.push(param2._4260,param2.bp);
         _loc3_.push(param2.bp,param2.cp);
         _loc3_.push(param2.cp,param2._4260);
         var _loc4_:Number = param1.x;
         var _loc5_:Number = param1.y;
         var _loc9_:* = false;
         if(_loc3_ == null)
         {
            return false;
         }
         _loc6_ = 0;
         _loc8_ = int(_loc3_.length);
         while(_loc6_ < _loc8_)
         {
            _loc10_ = _loc3_[_loc6_].x;
            _loc11_ = _loc3_[_loc6_].y;
            _loc12_ = _loc3_[_loc6_ + 1].x;
            _loc13_ = _loc3_[_loc6_ + 1].y;
            _loc14_ = _loc11_ > _loc5_ != _loc13_ > _loc5_ && _loc4_ < (_loc12_ - _loc10_) * (_loc5_ - _loc11_) / (_loc13_ - _loc11_) + _loc10_;
            if(_loc14_)
            {
               _loc9_ = !_loc9_;
            }
            _loc6_ += 2;
         }
         return _loc9_;
      }
      
      public static function _4252(param1:Point, param2:Vector.<_656>) : Boolean
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Boolean = false;
         param2 = _5698(param2);
         var _loc3_:Number = param1.x;
         var _loc4_:Number = param1.y;
         var _loc8_:* = false;
         if(param2 == null)
         {
            return false;
         }
         _loc5_ = 0;
         _loc7_ = int(param2.length);
         while(_loc5_ < _loc7_)
         {
            _loc9_ = param2[_loc5_].x;
            _loc10_ = param2[_loc5_].y;
            _loc11_ = param2[_loc5_ + 1].x;
            _loc12_ = param2[_loc5_ + 1].y;
            _loc13_ = _loc10_ > _loc4_ != _loc12_ > _loc4_ && _loc3_ < (_loc11_ - _loc9_) * (_loc4_ - _loc10_) / (_loc12_ - _loc10_) + _loc9_;
            if(_loc13_)
            {
               _loc8_ = !_loc8_;
            }
            _loc5_ += 2;
         }
         return _loc8_;
      }
      
      public static function _5698(param1:Vector.<_656>) : Vector.<_656>
      {
         var _loc4_:_656 = null;
         var _loc5_:int = 0;
         var _loc2_:Vector.<_656> = param1.concat();
         var _loc3_:Vector.<_656> = new Vector.<_656>();
         _loc3_.push(_loc2_.shift());
         _loc3_.push(_loc2_.shift());
         _loc4_ = _loc3_[1];
         while(_loc2_.length > 0)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc2_.length)
            {
               if(_loc2_[_loc5_].id == _loc4_.id)
               {
                  _loc4_ = _loc2_[_loc5_ + 1];
                  _loc3_ = _loc3_.concat(_loc2_.splice(_loc5_,2));
                  break;
               }
               if(_loc2_[_loc5_ + 1].id == _loc4_.id)
               {
                  _loc4_ = _loc2_[_loc5_];
                  _loc3_ = _loc3_.concat(_loc2_.splice(_loc5_,2));
                  break;
               }
               if(_loc5_ >= _loc2_.length - 2)
               {
                  return null;
               }
               _loc5_ += 2;
            }
         }
         return _loc3_;
      }
      
      public static function _11283(param1:Point, param2:Vector.<_656>) : Boolean
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc9_:_656 = null;
         var _loc10_:_656 = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Boolean = false;
         var _loc3_:Number = param1.x;
         var _loc4_:Number = param1.y;
         var _loc8_:* = false;
         if(param2 == null)
         {
            return false;
         }
         _loc5_ = 0;
         _loc7_ = int(param2.length);
         while(_loc5_ < _loc7_)
         {
            _loc9_ = param2[_loc5_];
            if(_loc5_ < _loc7_ - 1)
            {
               _loc10_ = param2[_loc5_ + 1];
            }
            else
            {
               _loc10_ = param2[0];
            }
            _loc11_ = _loc9_.x;
            _loc12_ = _loc9_.y;
            _loc13_ = _loc10_.x;
            _loc14_ = _loc10_.y;
            _loc15_ = _loc12_ > _loc4_ != _loc14_ > _loc4_ && _loc3_ < (_loc13_ - _loc11_) * (_loc4_ - _loc12_) / (_loc14_ - _loc12_) + _loc11_;
            if(_loc15_)
            {
               _loc8_ = !_loc8_;
            }
            _loc5_++;
         }
         return _loc8_;
      }
      
      public static function _4273(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : Number
      {
         var _loc7_:Number = (param5 - param3) * (param1 - param3) + (param6 - param4) * (param2 - param4);
         if(_loc7_ <= 0)
         {
            return (param1 - param3) * (param1 - param3) + (param2 - param4) * (param2 - param4);
         }
         var _loc8_:Number = (param5 - param3) * (param5 - param3) + (param6 - param4) * (param6 - param4);
         if(_loc7_ >= _loc8_)
         {
            return (param1 - param5) * (param1 - param5) + (param2 - param6) * (param2 - param6);
         }
         var _loc9_:Number = _loc7_ / _loc8_;
         var _loc10_:Number = param3 + (param5 - param3) * _loc9_;
         var _loc11_:Number = param4 + (param6 - param4) * _loc9_;
         return (param1 - _loc10_) * (param1 - _loc10_) + (param2 - _loc11_) * (param2 - _loc11_);
      }
      
      public static function _4292(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number) : int
      {
         var _loc8_:Number = (param5 - param3) * (param1 - param3) + (param6 - param4) * (param2 - param4);
         if(_loc8_ <= 0)
         {
            if((param1 - param3) * (param1 - param3) + (param2 - param4) * (param2 - param4) < param7)
            {
               return 1;
            }
            return 0;
         }
         var _loc9_:Number = (param5 - param3) * (param5 - param3) + (param6 - param4) * (param6 - param4);
         if(_loc8_ >= _loc9_)
         {
            if((param1 - param5) * (param1 - param5) + (param2 - param6) * (param2 - param6) < param7)
            {
               return 2;
            }
            return 0;
         }
         var _loc10_:Number = _loc8_ / _loc9_;
         var _loc11_:Number = param3 + (param5 - param3) * _loc10_;
         var _loc12_:Number = param4 + (param6 - param4) * _loc10_;
         if((param1 - _loc11_) * (param1 - _loc11_) + (param2 - _loc12_) * (param2 - _loc12_) < param7)
         {
            return 3;
         }
         return 0;
      }
      
      public static function _4219(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : Array
      {
         var _loc7_:Number = (param5 - param3) * (param1 - param3) + (param6 - param4) * (param2 - param4);
         if(_loc7_ <= 0)
         {
            return null;
         }
         var _loc8_:Number = (param5 - param3) * (param5 - param3) + (param6 - param4) * (param6 - param4);
         if(_loc7_ >= _loc8_)
         {
            return null;
         }
         var _loc9_:Number = _loc7_ / _loc8_;
         var _loc10_:Number = param3 + (param5 - param3) * _loc9_;
         var _loc11_:Number = param4 + (param6 - param4) * _loc9_;
         return [_loc10_,_loc11_];
      }
      
      public static function _5703(param1:Point, param2:Point, param3:Point, param4:Point) : Point
      {
         var _loc5_:Number = param1.y - param2.y;
         var _loc6_:Number = param2.x - param1.x;
         var _loc7_:Number = param1.x * param2.y - param2.x * param1.y;
         var _loc8_:Number = param3.y - param4.y;
         var _loc9_:Number = param4.x - param3.x;
         var _loc10_:Number = param3.x * param4.y - param4.x * param3.y;
         var _loc11_:Number = _loc5_ * _loc9_ - _loc8_ * _loc6_;
         var _loc12_:Point = new Point();
         if(_loc11_ != 0)
         {
            _loc12_.x = (_loc6_ * _loc10_ - _loc9_ * _loc7_) / _loc11_;
            _loc12_.y = (_loc7_ * _loc8_ - _loc10_ * _loc5_) / _loc11_;
         }
         return _loc12_;
      }
      
      private static function _11734(param1:Point, param2:Point, param3:Point, param4:Point) : Point
      {
         var _loc5_:Number = param1.y - param2.y;
         var _loc6_:Number = param2.x - param1.x;
         var _loc7_:Number = param1.x * param2.y - param2.x * param1.y;
         var _loc8_:Number = param3.y - param4.y;
         var _loc9_:Number = param4.x - param3.x;
         var _loc10_:Number = param3.x * param4.y - param4.x * param3.y;
         var _loc11_:Number = _loc5_ * _loc9_ - _loc8_ * _loc6_;
         var _loc12_:Point = new Point();
         if(_loc11_ != 0)
         {
            _loc12_.x = (_loc6_ * _loc10_ - _loc9_ * _loc7_) / _loc11_;
            _loc12_.y = (_loc7_ * _loc8_ - _loc10_ * _loc5_) / _loc11_;
            return _loc12_;
         }
         return null;
      }
      
      public static function _5692(param1:Point, param2:Point, param3:Number) : Point
      {
         var _loc4_:Point = new Point();
         if(param1 != null && param2 != null)
         {
            _loc4_.x = param1.x + (param2.x - param1.x) * param3;
            _loc4_.y = param1.y + (param2.y - param1.y) * param3;
         }
         return _loc4_;
      }
      
      public static function _5690(param1:Point, param2:Point, param3:Point) : Number
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(_11733(param3,param1))
         {
            return 1;
         }
         if(_11732(param3.x,param1.x))
         {
            return (param2.y - param1.y) / (param3.y - param1.y);
         }
         if(_11732(param3.y,param1.y))
         {
            return (param2.x - param1.x) / (param3.x - param1.x);
         }
         _loc4_ = 0;
         _loc5_ = 0;
         if(param3.x != param1.x)
         {
            return (param2.x - param1.x) / (param3.x - param1.x);
         }
         if(param3.y != param1.y)
         {
            return (param2.y - param1.y) / (param3.y - param1.y);
         }
         return _loc4_ == 0 && _loc5_ == 0 ? 0 : (_loc4_ < _loc5_ ? _loc4_ : _loc5_);
      }
      
      public static function _11665(param1:_655, param2:_655, param3:Point) : Point
      {
         if(Boolean(param1) && Boolean(param2) && Boolean(param3))
         {
            return _4257(param1._4260,param1.bp,param1.cp,param3,param2._4260,param2.bp,param2.cp);
         }
         return null;
      }
      
      private static function _11732(param1:Number, param2:Number, param3:Number = 0.0001) : Boolean
      {
         return param1 + param3 > param2 && param1 - param3 < param2;
      }
      
      private static function _11733(param1:Point, param2:Point, param3:Number = 0.0001) : Boolean
      {
         if(param1.x + param3 > param2.x && param1.x - param3 < param2.x && (param1.y + param3 > param2.y && param1.y - param3 < param2.y))
         {
            return true;
         }
         return false;
      }
      
      public static function _4257(param1:Point, param2:Point, param3:Point, param4:Point, param5:Point, param6:Point, param7:Point) : Point
      {
         if(_11733(param1,param4))
         {
            return param5.clone();
         }
         if(_11733(param2,param4))
         {
            return param6.clone();
         }
         if(_11733(param3,param4))
         {
            return param7.clone();
         }
         var _loc8_:Point = _11734(param1,param4,param2,param3);
         if(_loc8_ == null)
         {
            _loc8_ = _11734(param2,param4,param3,param1);
            if(_loc8_ == null)
            {
               _loc8_ = _11734(param3,param4,param1,param2);
               return _11731(param1,param2,param3,param4,_loc8_,param5,param6,param7);
            }
            return _11731(param3,param1,param2,param4,_loc8_,param7,param5,param6);
         }
         return _11731(param2,param3,param1,param4,_loc8_,param6,param7,param5);
      }
      
      private static function _11731(param1:Point, param2:Point, param3:Point, param4:Point, param5:Point, param6:Point, param7:Point, param8:Point) : Point
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Point = null;
         var _loc12_:Point = null;
         _loc9_ = _5690(param1,param5,param2);
         _loc10_ = _5690(param3,param4,param5);
         _loc11_ = _5692(param6,param7,_loc9_);
         if(_loc10_ == 0)
         {
            return _loc11_;
         }
         return _5692(param8,_loc11_,_loc10_);
      }
      
      public static function _4250(param1:Point, param2:Point, param3:Point, param4:Point, param5:Point) : Point
      {
         var _loc6_:Number = _5690(param1,param3,param2);
         return _5692(param4,param5,_loc6_);
      }
      
      public static function _5704(param1:Vector.<Point>) : Array
      {
         var a:Vector.<Point>;
         var result:Array;
         var i:int = 0;
         var p:Vector.<Point> = null;
         var t:int = 0;
         var compareFun:Function = null;
         var allPoints:Vector.<Point> = param1;
         compareFun = function(param1:Point, param2:Point):int
         {
            if(param1.x == param2.x)
            {
               return param1.y < param2.y ? -1 : 1;
            }
            return param1.x < param2.x ? -1 : 1;
         };
         var top:int = 2;
         var stack:Array = [];
         var len:int = int(allPoints.length);
         var dict:Dictionary = new Dictionary();
         i = 0;
         len = int(allPoints.length);
         while(i < len)
         {
            dict[allPoints[i]] = i;
            i++;
         }
         a = allPoints.concat();
         p = a.sort(compareFun);
         stack.push(0);
         stack.push(1);
         i = 2;
         while(i < len)
         {
            while(top > 1 && crossProduct(p[i],p[stack[top - 1]],p[stack[top - 2]]) > 0)
            {
               top--;
            }
            var _loc3_:* = top++;
            stack[_loc3_] = i;
            i++;
         }
         t = top;
         _loc3_ = top++;
         stack[_loc3_] = len - 2;
         i = len - 3;
         while(i >= 0)
         {
            while(top > t && crossProduct(p[i],p[stack[top - 1]],p[stack[top - 2]]) > 0)
            {
               top--;
            }
            var _loc4_:*;
            stack[_loc4_ = top++] = i;
            i--;
         }
         result = [];
         i = 0;
         len = int(stack.length);
         while(i < len)
         {
            result.push(dict[p[stack[i]]]);
            i++;
         }
         return result;
      }
      
      public static function _12701(param1:Vector.<Point>) : Array
      {
         var a:Vector.<Point>;
         var startP:Point;
         var hullIndex:Array;
         var i:int = 0;
         var len:int = 0;
         var p:Vector.<Point> = null;
         var t:int = 0;
         var _11529:Vector.<Point> = null;
         var compareFun:Function = null;
         var nextHullP:Point = null;
         var allPoints:Vector.<Point> = param1;
         var findNextHull:Function = function():Point
         {
            var _loc4_:Number = NaN;
            var _loc1_:int = 0;
            var _loc2_:Point = _11529[_11529.length - 1];
            i = 0;
            len = p.length;
            while(i < len)
            {
               if(_loc1_ != i && p[i] != _loc2_)
               {
                  _loc4_ = crossProduct(_loc2_,p[i],p[_loc1_]);
                  if(_loc4_ > 0 || _loc4_ == 0 && far(_loc2_,p[i],p[_loc1_]))
                  {
                     _loc1_ = i;
                  }
               }
               ++i;
            }
            var _loc3_:Point = p[_loc1_];
            p.splice(_loc1_,1);
            return _loc3_;
         };
         var far:Function = function(param1:Point, param2:Point, param3:Point):Boolean
         {
            return length2(param1,param2) < length2(param1,param3);
         };
         compareFun = function(param1:Point, param2:Point):int
         {
            if(param1.x == param2.x)
            {
               return param1.y < param2.y ? -1 : 1;
            }
            return param1.x < param2.x ? -1 : 1;
         };
         var top:int = 2;
         var stack:Array = [];
         len = int(allPoints.length);
         var dict:Dictionary = new Dictionary();
         i = 0;
         len = int(allPoints.length);
         while(i < len)
         {
            dict[allPoints[i]] = i;
            i++;
         }
         a = allPoints.concat();
         p = a.sort(compareFun);
         _11529 = new Vector.<Point>();
         startP = p[0];
         _11529.push(startP);
         p.shift();
         p.push(startP);
         while(p.length > 0)
         {
            nextHullP = findNextHull();
            _11529.push(nextHullP);
            if(startP == nextHullP)
            {
               break;
            }
         }
         hullIndex = [];
         i = 0;
         len = int(_11529.length);
         while(i < len)
         {
            hullIndex.push(dict[_11529[i]]);
            i++;
         }
         return hullIndex;
      }
      
      public static function _5687(param1:int, param2:Array, param3:Array, param4:int, param5:int) : Object
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc16_:Array = null;
         var _loc17_:Array = null;
         var _loc22_:Number = NaN;
         var _loc25_:Boolean = false;
         var _loc26_:Array = null;
         var _loc6_:int = -1;
         var _loc7_:int = -1;
         var _loc8_:int = -1;
         var _loc9_:int = -1;
         var _loc12_:Number = Number.MAX_VALUE;
         var _loc13_:Number = -Number.MAX_VALUE;
         var _loc14_:Number = -Number.MAX_VALUE;
         var _loc15_:Number = Number.MAX_VALUE;
         var _loc18_:Array = [];
         var _loc19_:Number = param4 / 2;
         var _loc20_:Number = param5 / 2;
         _loc10_ = 0;
         _loc11_ = int(param3.length);
         while(_loc10_ < _loc11_)
         {
            _loc18_.push(param4 * param3[_loc10_] - _loc19_);
            _loc18_.push(param5 * param3[_loc10_ + 1] - _loc20_);
            _loc10_ += 2;
         }
         _loc10_ = 0;
         _loc11_ = int(_loc18_.length);
         while(_loc10_ < _loc11_)
         {
            if(_loc18_[_loc10_] < _loc12_)
            {
               _loc6_ = _loc10_ / 2;
               _loc12_ = Number(_loc18_[_loc10_]);
            }
            if(_loc18_[_loc10_] > _loc13_)
            {
               _loc7_ = _loc10_ / 2;
               _loc13_ = Number(_loc18_[_loc10_]);
            }
            if(_loc18_[_loc10_ + 1] > _loc14_)
            {
               _loc8_ = _loc10_ / 2;
               _loc14_ = Number(_loc18_[_loc10_ + 1]);
            }
            if(_loc18_[_loc10_ + 1] < _loc15_)
            {
               _loc9_ = _loc10_ / 2;
               _loc15_ = Number(_loc18_[_loc10_ + 1]);
            }
            _loc10_ += 2;
         }
         var _loc21_:int = _loc6_;
         var _loc23_:Array = _5697(_loc21_,_loc21_,param2,_loc18_,0);
         var _loc24_:int = -1;
         if(_loc23_[0] == _loc21_)
         {
            _loc24_ = int(_loc23_[1]);
         }
         else
         {
            _loc24_ = int(_loc23_[0]);
         }
         _loc22_ = Number(_loc23_[2]);
         if((_loc22_ = _loc22_ - Math.PI) < 0)
         {
            _loc22_ += Math.PI * 2;
         }
         if(_loc21_ >= 0 && _loc24_ >= 0)
         {
            _loc17_ = [];
            _loc17_.push(_loc21_,_loc24_);
            _loc26_ = _5697(_loc21_,_loc24_,param2,_loc18_,_loc22_);
            while(Boolean(_loc26_) && _loc26_.length == 3)
            {
               _loc17_.push(_loc26_[0],_loc26_[1]);
               if(_loc26_[1] == _loc17_[0] && _loc17_.length == param1)
               {
                  _loc25_ = true;
                  break;
               }
               if(_loc17_.length >= param1)
               {
                  break;
               }
               _loc22_ = Number(_loc26_[2]);
               if((_loc22_ = _loc22_ - Math.PI) < 0)
               {
                  _loc22_ += Math.PI * 2;
               }
               _loc26_ = _5697(_loc26_[0],_loc26_[1],param2,_loc18_,_loc22_);
            }
            if(_loc25_)
            {
               _loc10_ = 0;
               _loc11_ = int(_loc17_.length);
               while(_loc10_ < _loc11_)
               {
                  _5688(param2,_loc17_[_loc10_],_loc17_[_loc10_ + 1]);
                  _loc10_ += 2;
               }
               return {
                  "outline":_loc17_,
                  "userEdges":param2
               };
            }
         }
         return null;
      }
      
      private static function _5697(param1:int, param2:int, param3:Array, param4:Array, param5:Number) : Array
      {
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc6_:Array = _5689(param1,param2,param3);
         var _loc7_:Point = new Point();
         var _loc8_:Point = new Point();
         var _loc11_:Number = 10000;
         var _loc14_:Array = [];
         var _loc15_:int = 0;
         var _loc16_:int = int(_loc6_.length);
         while(_loc15_ < _loc16_)
         {
            _loc9_ = int(_loc6_[_loc15_]);
            _loc10_ = int(_loc6_[_loc15_ + 1]);
            _loc7_.x = param4[_loc9_ * 2];
            _loc7_.y = param4[_loc9_ * 2 + 1];
            _loc8_.x = param4[_loc10_ * 2];
            _loc8_.y = param4[_loc10_ * 2 + 1];
            _loc13_ = _5702(_loc7_,_loc8_);
            if((_loc12_ = _loc13_ - param5) < 0)
            {
               _loc12_ += Math.PI * 2;
            }
            if(_loc12_ < _loc11_)
            {
               _loc11_ = _loc12_;
               _loc14_[0] = _loc9_;
               _loc14_[1] = _loc10_;
               _loc14_[2] = _loc13_;
            }
            _loc15_ += 2;
         }
         return _loc14_;
      }
      
      private static function _5702(param1:Point, param2:Point) : Number
      {
         var _loc3_:Number = param2.x - param1.x;
         var _loc4_:Number = param2.y - param1.y;
         var _loc5_:Number = Math.atan2(_loc3_,_loc4_);
         if(_loc5_ < 0)
         {
            _loc5_ += Math.PI * 2;
         }
         return _loc5_;
      }
      
      public static function _5686(param1:int, param2:Array, param3:Array, param4:int, param5:int) : Object
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc16_:Array = null;
         var _loc17_:Array = null;
         var _loc23_:Vector.<Vector.<Point>> = null;
         var _loc24_:Vector.<Point> = null;
         var _loc25_:Vector.<Point> = null;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:Boolean = false;
         var _loc6_:int = -1;
         var _loc7_:int = -1;
         var _loc8_:int = -1;
         var _loc9_:int = -1;
         var _loc12_:Number = Number.MAX_VALUE;
         var _loc13_:Number = -Number.MAX_VALUE;
         var _loc14_:Number = -Number.MAX_VALUE;
         var _loc15_:Number = Number.MAX_VALUE;
         var _loc18_:Array = [];
         var _loc19_:Number = param4 / 2;
         var _loc20_:Number = param5 / 2;
         _loc10_ = 0;
         _loc11_ = int(param3.length);
         while(_loc10_ < _loc11_)
         {
            _loc18_.push(param4 * param3[_loc10_] - _loc19_);
            _loc18_.push(param5 * param3[_loc10_ + 1] - _loc20_);
            _loc10_ += 2;
         }
         _loc10_ = 0;
         _loc11_ = int(_loc18_.length);
         while(_loc10_ < _loc11_)
         {
            if(_loc18_[_loc10_] < _loc12_)
            {
               _loc6_ = _loc10_ / 2;
               _loc12_ = Number(_loc18_[_loc10_]);
            }
            if(_loc18_[_loc10_] > _loc13_)
            {
               _loc7_ = _loc10_ / 2;
               _loc13_ = Number(_loc18_[_loc10_]);
            }
            if(_loc18_[_loc10_ + 1] > _loc14_)
            {
               _loc8_ = _loc10_ / 2;
               _loc14_ = Number(_loc18_[_loc10_ + 1]);
            }
            if(_loc18_[_loc10_ + 1] < _loc15_)
            {
               _loc9_ = _loc10_ / 2;
               _loc15_ = Number(_loc18_[_loc10_ + 1]);
            }
            _loc10_ += 2;
         }
         var _loc21_:int = _loc6_;
         var _loc22_:int = -1;
         _loc10_ = 0;
         _loc11_ = int(param2.length);
         while(_loc10_ < _loc11_)
         {
            if(param2[_loc10_] == _loc21_)
            {
               _loc22_ = int(param2[_loc10_ + 1]);
               break;
            }
            if(param2[_loc10_ + 1] == _loc21_)
            {
               _loc22_ = _loc21_;
               _loc21_ = int(param2[_loc10_]);
               break;
            }
            _loc10_ += 2;
         }
         if(_loc21_ >= 0 && _loc22_ >= 0)
         {
            _loc16_ = _5695(_loc21_,_loc22_,param2);
            _loc10_ = 0;
            _loc11_ = int(_loc16_.length);
            while(_loc10_ < _loc11_)
            {
               if(_loc16_[_loc10_].length != param1)
               {
                  _loc16_.splice(_loc10_,1);
                  _loc10_--;
                  _loc11_--;
               }
               _loc10_++;
            }
            if(_loc16_.length == 1)
            {
               _loc17_ = _loc16_[0];
            }
            else
            {
               _loc10_ = 0;
               _loc11_ = int(_loc16_.length);
               while(_loc10_ < _loc11_)
               {
                  if(_loc16_[_loc10_].indexOf(_loc7_) == -1 || _loc16_[_loc10_].indexOf(_loc8_) == -1 || _loc16_[_loc10_].indexOf(_loc9_) == -1)
                  {
                     _loc16_.splice(_loc10_,1);
                     _loc10_--;
                     _loc11_--;
                  }
                  _loc10_++;
               }
               if(_loc16_.length == 1)
               {
                  _loc17_ = _loc16_[0];
               }
               else
               {
                  _loc23_ = new Vector.<Vector.<Point>>();
                  _loc10_ = 0;
                  _loc11_ = int(_loc16_.length);
                  while(_loc10_ < _loc11_)
                  {
                     _loc24_ = new Vector.<Point>();
                     _loc26_ = 0;
                     _loc27_ = int(_loc16_[_loc10_].length);
                     while(_loc26_ < _loc27_)
                     {
                        _loc24_.push(new Point(_loc18_[_loc16_[_loc10_][_loc26_] * 2],_loc18_[_loc16_[_loc10_][_loc26_] * 2 + 1]));
                        _loc26_++;
                     }
                     _loc23_.push(_loc24_);
                     _loc10_++;
                  }
                  _loc10_ = 0;
                  _loc11_ = int(_loc23_.length);
                  while(_loc10_ < _loc11_)
                  {
                     _loc24_ = _loc23_[_loc10_];
                     _loc28_ = true;
                     _loc26_ = 0;
                     _loc27_ = int(_loc23_.length);
                     while(_loc26_ < _loc27_)
                     {
                        if(_loc26_ != _loc10_)
                        {
                           _loc25_ = _loc23_[_loc26_];
                           if(_5691(_loc25_,_loc24_,_loc16_[_loc26_],_loc16_[_loc10_],_loc18_))
                           {
                              _loc28_ = false;
                              break;
                           }
                        }
                        _loc26_++;
                     }
                     if(_loc28_)
                     {
                        break;
                     }
                     _loc10_++;
                  }
                  _loc17_ = _loc16_[_loc10_];
               }
            }
            if(_loc17_)
            {
               _loc10_ = 0;
               _loc11_ = int(_loc17_.length);
               while(_loc10_ < _loc11_)
               {
                  _5688(param2,_loc17_[_loc10_],_loc17_[_loc10_ + 1]);
                  _loc10_ += 2;
               }
               return {
                  "outline":_loc17_,
                  "userEdges":param2
               };
            }
         }
         return null;
      }
      
      public static function _5695(param1:int, param2:int, param3:Array) : Array
      {
         var _loc7_:Array = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:Array = null;
         var _loc4_:Array = [];
         var _loc5_:Array = [];
         var _loc6_:Array = [];
         var _loc8_:* = false;
         var _loc11_:int = 0;
         _loc5_[0] = [param1,param2];
         while(!_loc8_)
         {
            _loc11_ = 0;
            while(_loc11_ < _loc5_.length)
            {
               _loc6_ = _loc5_[_loc11_];
               _loc9_ = int(_loc6_[_loc6_.length - 2]);
               _loc10_ = int(_loc6_[_loc6_.length - 1]);
               _loc7_ = _5689(_loc9_,_loc10_,param3);
               if(_loc7_.length == 0)
               {
                  _loc5_.splice(_loc11_,1);
                  _loc11_--;
               }
               else
               {
                  if(_loc7_.length > 2)
                  {
                     _loc13_ = 2;
                     while(_loc13_ < _loc7_.length)
                     {
                        _loc14_ = int(_loc6_.indexOf(_loc7_[_loc13_ + 1]));
                        if(_loc14_ % 2 != 1)
                        {
                           _loc15_ = _loc6_.concat();
                           _loc15_.push(_loc7_[_loc13_]);
                           _loc15_.push(_loc7_[_loc13_ + 1]);
                           if(_loc7_[_loc13_ + 1] == _loc15_[0])
                           {
                              _loc4_.push(_loc15_);
                           }
                           else
                           {
                              _loc5_.push(_loc15_);
                           }
                        }
                        _loc13_ += 2;
                     }
                  }
                  _loc14_ = int(_loc6_.indexOf(_loc7_[1]));
                  if(_loc14_ % 2 == 1)
                  {
                     _loc5_.splice(_loc11_,1);
                     _loc11_--;
                  }
                  else
                  {
                     _loc6_.push(_loc7_[0],_loc7_[1]);
                     if(_loc7_[1] == _loc6_[0])
                     {
                        _loc4_.push(_loc6_);
                        _loc5_.splice(_loc11_,1);
                        _loc11_--;
                     }
                  }
               }
               _loc11_++;
            }
            _loc8_ = _loc5_.length == 0;
         }
         return _loc4_;
      }
      
      private static function _5689(param1:int, param2:int, param3:Array) : Array
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Array = [];
         _loc4_ = 0;
         _loc5_ = param3.length / 2;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = int(param3[_loc4_ * 2]);
            _loc7_ = int(param3[_loc4_ * 2 + 1]);
            if(!(_loc6_ == param1 && _loc7_ == param2 || _loc6_ == param2 && _loc7_ == param1))
            {
               if(_loc6_ == param2)
               {
                  _loc8_.push(_loc6_,_loc7_);
               }
               else if(_loc7_ == param2)
               {
                  _loc8_.push(_loc7_,_loc6_);
               }
            }
            _loc4_++;
         }
         return _loc8_;
      }
      
      private static function _5694(param1:Point, param2:Vector.<Point>) : Boolean
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Boolean = false;
         var _loc3_:Number = param1.x;
         var _loc4_:Number = param1.y;
         var _loc8_:* = false;
         if(param2 == null)
         {
            return false;
         }
         _loc5_ = 0;
         _loc7_ = int(param2.length);
         while(_loc5_ < _loc7_)
         {
            _loc9_ = param2[_loc5_].x;
            _loc10_ = param2[_loc5_].y;
            _loc11_ = param2[_loc5_ + 1].x;
            _loc12_ = param2[_loc5_ + 1].y;
            _loc13_ = _loc10_ > _loc4_ != _loc12_ > _loc4_ && _loc3_ < (_loc11_ - _loc9_) * (_loc4_ - _loc10_) / (_loc12_ - _loc10_) + _loc9_;
            if(_loc13_)
            {
               _loc8_ = !_loc8_;
            }
            _loc5_ += 2;
         }
         return _loc8_;
      }
      
      private static function _5691(param1:Vector.<Point>, param2:Vector.<Point>, param3:Array, param4:Array, param5:Array) : Boolean
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Point = new Point();
         _loc6_ = 0;
         _loc7_ = int(param3.length);
         while(_loc6_ < _loc7_)
         {
            if(param4.indexOf(param3[_loc6_]) == -1)
            {
               _loc8_.x = param5[param3[_loc6_] * 2];
               _loc8_.y = param5[param3[_loc6_] * 2 + 1];
               if(_5694(_loc8_,param2))
               {
                  return false;
               }
               return true;
            }
            _loc6_++;
         }
         return true;
      }
      
      private static function _5696(param1:Array, param2:int, param3:int) : int
      {
         var _loc4_:int = -1;
         var _loc5_:int = 0;
         var _loc6_:int = int(param1.length);
         while(_loc5_ < _loc6_)
         {
            if(param1[_loc5_] == param2 && param1[_loc5_ + 1] == param3 || param1[_loc5_] == param3 && param1[_loc5_ + 1] == param2)
            {
               _loc4_ = _loc5_;
               break;
            }
            _loc5_ += 2;
         }
         return _loc4_;
      }
      
      private static function _5688(param1:Array, param2:int, param3:int) : void
      {
         var _loc4_:int = _5696(param1,param2,param3);
         if(_loc4_ >= 0)
         {
            param1.splice(_loc4_,2);
         }
      }
      
      public static function _5700(param1:Matrix, param2:Matrix) : void
      {
         param1.a += param2.a;
         param1.b += param2.b;
         param1.c += param2.c;
         param1.d += param2.d;
         param1.tx += param2.tx;
         param1.ty += param2.ty;
      }
      
      public static function _5693(param1:Matrix, param2:Number) : void
      {
         param1.a *= param2;
         param1.b *= param2;
         param1.c *= param2;
         param1.d *= param2;
         param1.tx *= param2;
         param1.ty *= param2;
      }
      
      public static function _11392(param1:Vector.<Point>) : Point
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(param1.length);
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ += param1[_loc2_].x;
            _loc5_ += param1[_loc2_].y;
            _loc2_++;
         }
         return new Point(_loc4_ / _loc3_,_loc5_ / _loc3_);
      }
      
      public static function _12660(param1:Vector.<Point>, param2:Point, param3:Point) : Vector.<Point>
      {
         var _loc6_:int = 0;
         var _loc4_:Array = _12701(param1);
         var _loc5_:int = 0;
         var _loc7_:Vector.<Point> = new Vector.<Point>();
         _loc5_ = 0;
         _loc6_ = int(_loc4_.length - 1);
         while(_loc5_ < _loc6_)
         {
            if(!(param1[_loc4_[_loc5_]] == param2 && param1[_loc4_[_loc5_ + 1]] == param3 || param1[_loc4_[_loc5_]] == param3 && param1[_loc4_[_loc5_ + 1]] == param2))
            {
               _loc7_.push(param1[_loc4_[_loc5_]],param1[_loc4_[_loc5_ + 1]]);
            }
            _loc5_++;
         }
         return _loc7_;
      }
      
      public static function _12700(param1:Point, param2:Point, param3:Point, param4:Point) : Boolean
      {
         return param1 == param3 && param2 == param4 || param1 == param4 && param2 == param3;
      }
      
      public static function _12661(param1:Point, param2:Point, param3:Vector.<Point>) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc4_ = 0;
         _loc5_ = int(param3.length);
         while(_loc4_ < _loc5_)
         {
            if(_12700(param1,param2,param3[_loc4_],param3[_loc4_ + 1]))
            {
               return true;
            }
            _loc4_ += 2;
         }
         return false;
      }
      
      public static function outline(param1:BitmapData, param2:Number = 1, param3:Number = 0.5) : Array
      {
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc12_:Array = null;
         var _loc4_:Vector.<uint> = _13914(param1,param2);
         var _loc5_:Array = [];
         var _loc8_:int = 0;
         while(_loc8_ < _loc4_.length)
         {
            _loc6_ = _loc8_ % param1.width;
            _loc7_ = _loc8_ / param1.width;
            if(_loc5_[_loc6_] == null)
            {
               _loc5_[_loc6_] = [];
            }
            _loc5_[_loc6_][_loc7_] = _loc4_[_loc8_];
            _loc8_++;
         }
         var _loc9_:Array = _13918(_loc4_,param1.width);
         var _loc10_:Array = [];
         var _loc11_:uint = uint.MIN_VALUE;
         for each(_loc12_ in _loc9_)
         {
            if(_loc12_.length > _loc11_)
            {
               _loc10_ = _loc12_;
               _loc11_ = _loc12_.length;
            }
         }
         return _13919(_loc10_,param3);
      }
      
      private static function _13918(param1:Vector.<uint>, param2:Number) : Array
      {
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc8_:_13543 = null;
         var _loc9_:_13543 = null;
         var _loc3_:Array = [];
         var _loc6_:Dictionary = new Dictionary();
         var _loc7_:_13543 = _13916(param1,param2,_loc6_);
         while(_loc7_)
         {
            _loc4_ = [];
            _loc5_ = [];
            _loc7_.index = _loc5_.push(_loc7_);
            _loc8_ = _13913(param1,param2,_loc7_,_loc6_);
            while(_loc8_)
            {
               _loc8_.index = _loc5_.push(_loc8_);
               _loc8_ = _13913(param1,param2,_loc8_,_loc6_);
               if(_loc8_ == null)
               {
                  _loc4_.push(_loc5_.concat());
                  _loc9_ = _13911(_loc5_,param1,param2,_loc6_);
                  if(_loc9_)
                  {
                     _loc8_ = _loc9_;
                  }
               }
            }
            if(_loc4_.length > 0)
            {
               _loc3_.push(_13915(_loc4_));
            }
            _loc7_ = _13916(param1,param2,_loc6_);
         }
         return _loc3_;
      }
      
      private static function _13915(param1:Array) : Array
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc2_:uint = uint.MIN_VALUE;
         for each(_loc4_ in param1)
         {
            if(_loc2_ < _loc4_.length)
            {
               _loc2_ = _loc4_.length;
               _loc3_ = _loc4_;
            }
         }
         return _loc3_;
      }
      
      private static function _13911(param1:Array, param2:Vector.<uint>, param3:Number, param4:Dictionary) : _13543
      {
         var _loc5_:_13543 = null;
         var _loc6_:_13543 = null;
         var _loc7_:int = int(param1.length - 1);
         while(_loc7_ >= 0)
         {
            _loc6_ = param1[_loc7_];
            _loc5_ = _13913(param2,param3,_loc6_,param4);
            if(_loc5_)
            {
               param1.splice(_loc7_ + 1,param1.length - (_loc7_ + 1));
               return _loc5_;
            }
            _loc7_--;
         }
         return null;
      }
      
      private static function _13919(param1:Array, param2:Number) : Array
      {
         var _loc4_:_13543 = null;
         var _loc5_:_13543 = null;
         var _loc6_:_13543 = null;
         var _loc7_:Vector3D = null;
         var _loc8_:Vector3D = null;
         var _loc9_:Number = NaN;
         var _loc3_:Array = [];
         (_loc5_ = _loc6_ = param1[0]).index = _loc3_.push(_loc5_);
         var _loc10_:int = 0;
         while(_loc10_ < param1.length)
         {
            _loc4_ = param1[_loc10_];
            if(_loc5_ != _loc6_)
            {
               _loc7_ = _13922(_loc6_,_loc4_);
               _loc8_ = _13922(_loc5_,_loc6_);
               if(_loc8_)
               {
                  _loc9_ = Math.abs(_loc7_.dotProduct(_loc8_));
                  if(_loc9_ < 1)
                  {
                     if(_loc9_ < param2)
                     {
                        _loc6_.index = _loc3_.push(_loc6_);
                        _loc5_ = _loc6_;
                     }
                  }
               }
            }
            _loc6_ = _loc4_;
            _loc10_++;
         }
         return _loc3_;
      }
      
      private static function _13920(param1:Number, param2:Number, param3:Number, param4:Number = 0, param5:Number = 1) : Number
      {
         var _loc6_:Number = _13921(param1,param2,param3);
         return (param5 - param4) * _loc6_ + param4;
      }
      
      public static function _13921(param1:Number, param2:Number, param3:Number) : Number
      {
         var _loc4_:Number = _13923((param3 - param1) / (param2 - param1));
         return _loc4_ * _loc4_ * (3 - 2 * _loc4_);
      }
      
      public static function _13923(param1:Number) : Number
      {
         return Math.max(0,Math.min(1,param1));
      }
      
      private static function _13912(param1:Point, param2:Point, param3:Point) : Boolean
      {
         if(param1 == param2 || param2 == param3)
         {
            return true;
         }
         if(param2.x - param1.x == param3.x - param2.x && param2.y - param1.y == param3.y - param2.y)
         {
            return true;
         }
         return false;
      }
      
      private static function _13913(param1:Vector.<uint>, param2:Number, param3:_13543, param4:Dictionary = null) : _13543
      {
         var _loc6_:int = 0;
         var _loc8_:_13543 = null;
         var _loc5_:_13543 = new _13543();
         var _loc7_:Number = Math.ceil(param1.length / param2);
         for each(_loc8_ in _13910)
         {
            _loc5_.x = param3.x + _loc8_.x;
            _loc5_.y = param3.y + _loc8_.y;
            if(_loc5_.x >= 0 && _loc5_.x < param2 && _loc5_.y >= 0 && _loc5_.y < _loc7_)
            {
               if(param4[_loc5_.x + "_" + _loc5_.y] != true)
               {
                  param4[_loc5_.x + "_" + _loc5_.y] = true;
                  _loc6_ = _loc5_.y * param2 + _loc5_.x;
                  if(param1[_loc6_] == 1)
                  {
                     return _loc5_;
                  }
               }
            }
         }
         return null;
      }
      
      private static function _13922(param1:_13543, param2:_13543) : Vector3D
      {
         var _loc3_:Vector3D = new Vector3D(param2.x - param1.x,param2.y - param1.y,0);
         _loc3_.normalize();
         return _loc3_;
      }
      
      private static function _13916(param1:Vector.<uint>, param2:Number, param3:Dictionary) : _13543
      {
         var _loc4_:_13543 = new _13543();
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            _loc4_.x = int(_loc5_ % param2);
            _loc4_.y = int(_loc5_ / param2);
            if(param1[_loc5_] == 1 && param3[_loc4_.x + "_" + _loc4_.y] != true)
            {
               param3[_loc4_.x + "_" + _loc4_.y] = true;
               return _loc4_;
            }
            _loc5_++;
         }
         return null;
      }
      
      public static function _13914(param1:BitmapData, param2:uint = 128) : Vector.<uint>
      {
         var _loc4_:Vector.<uint> = null;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:uint = 0;
         var _loc12_:uint = 0;
         var _loc3_:Vector.<uint> = new Vector.<uint>(param1.width * param1.height);
         _loc4_ = param1.getVector(param1.rect);
         HELP_BINARIZATION.length = 0;
         var _loc13_:int = 0;
         while(_loc13_ < _loc4_.length)
         {
            _loc5_ = uint(int(_loc13_ % param1.width));
            _loc6_ = uint(int(_loc13_ / param1.width));
            _loc11_ = uint(_13917(param1,_loc5_,_loc6_,param2));
            _loc7_ = _13917(param1,_loc5_,_loc6_ - 1,param2);
            _loc8_ = _13917(param1,_loc5_,_loc6_ + 1,param2);
            _loc9_ = _13917(param1,_loc5_ - 1,_loc6_,param2);
            _loc10_ = _13917(param1,_loc5_ + 1,_loc6_,param2);
            _loc3_[_loc13_] = _loc11_ & (_loc11_ ^ _loc11_ & _loc7_ & _loc8_ & _loc9_ & _loc10_);
            _loc13_++;
         }
         return _loc3_;
      }
      
      private static function _13917(param1:BitmapData, param2:uint, param3:uint, param4:uint = 1) : int
      {
         if(param2 < 0 || param2 > param1.width || param3 < 0 || param3 > param1.height)
         {
            return 0;
         }
         if(Boolean(HELP_BINARIZATION[param3]) && HELP_BINARIZATION[param3][param2] != null)
         {
            return HELP_BINARIZATION[param3][param2];
         }
         if(HELP_BINARIZATION[param3] == null)
         {
            HELP_BINARIZATION[param3] = [];
         }
         var _loc5_:uint = (param1.getPixel32(param2,param3) >> 24 & 0xFF) <= param4 ? 0 : 1;
         HELP_BINARIZATION[param3][param2] = _loc5_;
         return _loc5_;
      }
   }
}

