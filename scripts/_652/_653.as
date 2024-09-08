package _652
{
   import flash.geom.Point;
   
   public class _653
   {
      private static const N0_INDEX:uint = uint.MAX_VALUE - 2;
      
      private static const N1_INDEX:uint = uint.MAX_VALUE - 1;
      
      private static const N2_INDEX:uint = uint.MAX_VALUE;
      
      public static const EPSILON:Number = 0.0005;
      
      public function _653()
      {
         super();
      }
      
      public static function _5674(param1:Vector.<_656>, param2:Vector.<_656>, param3:Vector.<_656>) : Vector.<_655>
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc4_:Vector.<_656> = new Vector.<_656>();
         var _loc5_:Vector.<_656> = new Vector.<_656>();
         _loc7_ = 0;
         _loc8_ = int(param1.length);
         while(_loc7_ < _loc8_)
         {
            if(param2.indexOf(param1[_loc7_]) > -1)
            {
               _loc4_.push(param1[_loc7_]);
            }
            else if(_654._4252(param1[_loc7_],param2))
            {
               _loc4_.push(param1[_loc7_]);
            }
            else
            {
               _loc5_.push(param1[_loc7_]);
            }
            _loc7_++;
         }
         var _loc6_:Vector.<_655> = _3165(_loc4_);
         _loc7_ = 0;
         _loc8_ = int(param2.length);
         while(_loc7_ < _loc8_)
         {
            _loc6_ = _5682(param1,param2[_loc7_],param2[_loc7_ + 1],_loc6_);
            _loc7_ += 2;
         }
         _loc6_ = _5676(_loc6_,param2);
         if(Boolean(param3) && param3.length > 0)
         {
            _loc7_ = 0;
            _loc8_ = int(param3.length);
            while(_loc7_ < _loc8_)
            {
               _loc6_ = _5682(param1,param3[_loc7_],param3[_loc7_ + 1],_loc6_);
               _loc7_ += 2;
            }
         }
         return _loc6_;
      }
      
      private static function _5682(param1:Vector.<_656>, param2:_656, param3:_656, param4:Vector.<_655>) : Vector.<_655>
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc12_:Vector.<_656> = null;
         var _loc5_:Vector.<_655> = new Vector.<_655>();
         var _loc6_:Vector.<_655> = new Vector.<_655>();
         var _loc7_:Vector.<_656> = new Vector.<_656>();
         var _loc10_:uint = param2.id;
         var _loc11_:uint = param3.id;
         _loc8_ = 0;
         _loc9_ = int(param4.length);
         while(_loc8_ < _loc9_)
         {
            if(param4[_loc8_]._5681(_loc10_,_loc11_))
            {
               return param4;
            }
            _loc8_++;
         }
         _loc8_ = 0;
         _loc9_ = int(param4.length);
         while(_loc8_ < _loc9_)
         {
            _loc12_ = param4[_loc8_]._5677(param2,param3);
            if(_loc12_ != null && _loc12_.length > 0)
            {
               _loc5_.push(param4[_loc8_]);
               _loc7_ = _loc7_.concat(_loc12_);
            }
            else
            {
               _loc6_.push(param4[_loc8_]);
            }
            _loc8_++;
         }
         var _loc13_:Vector.<_656> = new Vector.<_656>();
         var _loc14_:Vector.<int> = new Vector.<int>();
         _loc8_ = 0;
         _loc9_ = int(_loc5_.length);
         while(_loc8_ < _loc9_)
         {
            if(_loc14_.indexOf(_loc5_[_loc8_]._4260.id) == -1)
            {
               _loc14_.push(_loc5_[_loc8_]._4260.id);
               _loc13_.push(_loc5_[_loc8_]._4260);
            }
            if(_loc14_.indexOf(_loc5_[_loc8_].bp.id) == -1)
            {
               _loc14_.push(_loc5_[_loc8_].bp.id);
               _loc13_.push(_loc5_[_loc8_].bp);
            }
            if(_loc14_.indexOf(_loc5_[_loc8_].cp.id) == -1)
            {
               _loc14_.push(_loc5_[_loc8_].cp.id);
               _loc13_.push(_loc5_[_loc8_].cp);
            }
            _loc8_++;
         }
         var _loc15_:Vector.<_656> = new Vector.<_656>();
         var _loc16_:Vector.<_656> = new Vector.<_656>();
         _loc8_ = 0;
         _loc9_ = int(_loc13_.length);
         while(_loc8_ < _loc9_)
         {
            if(_5683(_loc13_[_loc8_],param2,param3))
            {
               _loc15_.push(_loc13_[_loc8_]);
            }
            else
            {
               _loc16_.push(_loc13_[_loc8_]);
            }
            _loc8_++;
         }
         _loc15_.push(param2);
         _loc15_.push(param3);
         _loc16_.push(param2);
         _loc16_.push(param3);
         var _loc17_:Vector.<_655> = _3165(_loc15_,_loc7_);
         var _loc18_:Vector.<_655> = _3165(_loc16_,_loc7_);
         _loc8_ = 0;
         _loc9_ = int(_loc17_.length);
         while(_loc8_ < _loc9_)
         {
            _loc6_.push(_loc17_[_loc8_]);
            _loc8_++;
         }
         _loc8_ = 0;
         _loc9_ = int(_loc18_.length);
         while(_loc8_ < _loc9_)
         {
            _loc6_.push(_loc18_[_loc8_]);
            _loc8_++;
         }
         return _loc6_;
      }
      
      private static function _5683(param1:Point, param2:Point, param3:Point) : Boolean
      {
         var _loc4_:Number = param2.x - param1.x;
         var _loc5_:Number = param2.y - param1.y;
         var _loc6_:Number = param3.x - param1.x;
         var _loc7_:Number = param3.y - param1.y;
         return _loc4_ * _loc7_ - _loc6_ * _loc5_ > 0;
      }
      
      public static function _3165(param1:Vector.<_656>, param2:Vector.<_656> = null) : Vector.<_655>
      {
         var i:int = 0;
         var j:int = 0;
         var st:Vector.<_656> = null;
         var open:Array = null;
         var closed:Array = null;
         var edges:Vector.<_656> = null;
         var dx:Number = NaN;
         var dy:Number = NaN;
         var a:int = 0;
         var b:int = 0;
         var c:int = 0;
         var cv:_656 = null;
         var av:_656 = null;
         var bv:_656 = null;
         var len:int = 0;
         var sortByX:Function = null;
         var cir:Object = null;
         var vertices:Vector.<_656> = param1;
         var outlines:Vector.<_656> = param2;
         sortByX = function(param1:Point, param2:Point):int
         {
            return param2.x - param1.x;
         };
         var n:int = int(vertices.length);
         var triangles:Vector.<_655> = new Vector.<_655>();
         if(n < 3)
         {
            return triangles;
         }
         if(n == 3)
         {
            triangles.push(new _655(vertices[0],vertices[1],vertices[2]));
            return triangles;
         }
         vertices = vertices.slice(0);
         vertices.sort(sortByX);
         st = _5678(vertices);
         open = [_5679(st[0],st[1],st[2])];
         closed = [];
         edges = new Vector.<_656>();
         i = int(vertices.length);
         while(i--)
         {
            cv = vertices[i];
            j = int(open.length);
            while(j--)
            {
               if(open[j] != null)
               {
                  dx = cv.x - open[j].x;
                  if(dx > 0 && dx * dx > open[j].r)
                  {
                     closed.push(open[j]);
                     open.splice(j,1);
                  }
                  else
                  {
                     dy = cv.y - open[j].y;
                     if(dx * dx + dy * dy - open[j].r <= EPSILON)
                     {
                        if(open[j].i != open[j].j)
                        {
                           edges.push(open[j].i,open[j].j);
                        }
                        if(open[j].j != open[j].k)
                        {
                           edges.push(open[j].j,open[j].k);
                        }
                        if(open[j].k != open[j].i)
                        {
                           edges.push(open[j].k,open[j].i);
                        }
                        open.splice(j,1);
                     }
                  }
               }
            }
            _5685(edges);
            j = int(edges.length);
            while(j)
            {
               bv = edges[--j];
               av = edges[--j];
               cir = _5679(av,bv,cv);
               if(cir != null)
               {
                  open.push(cir);
               }
            }
            edges.length = 0;
         }
         i = int(open.length);
         while(i--)
         {
            closed.push(open[i]);
         }
         open.length = 0;
         i = int(closed.length);
         while(i--)
         {
            av = closed[i].i;
            bv = closed[i].j;
            cv = closed[i].k;
            if(av.id < N0_INDEX && bv.id < N0_INDEX && cv.id < N0_INDEX)
            {
               triangles.push(new _655(av,bv,cv));
            }
         }
         if(outlines != null)
         {
            return _5676(triangles,outlines);
         }
         return triangles;
      }
      
      private static function _5676(param1:Vector.<_655>, param2:Vector.<_656>) : Vector.<_655>
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Vector.<_655> = null;
         if(param2 != null)
         {
            _loc5_ = new Vector.<_655>();
            _loc3_ = 0;
            _loc4_ = int(param1.length);
            while(_loc3_ < _loc4_)
            {
               if(!_5680(param1[_loc3_],param2))
               {
                  _loc5_.push(param1[_loc3_]);
               }
               _loc3_++;
            }
            return _loc5_;
         }
         return param1;
      }
      
      private static function _5678(param1:Vector.<_656>) : Vector.<_656>
      {
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc2_:Number = Number.POSITIVE_INFINITY;
         var _loc3_:Number = Number.POSITIVE_INFINITY;
         var _loc4_:Number = Number.NEGATIVE_INFINITY;
         var _loc5_:Number = Number.NEGATIVE_INFINITY;
         _loc6_ = int(param1.length);
         while(_loc6_--)
         {
            if(param1[_loc6_].x < _loc2_)
            {
               _loc2_ = param1[_loc6_].x;
            }
            if(param1[_loc6_].x > _loc4_)
            {
               _loc4_ = param1[_loc6_].x;
            }
            if(param1[_loc6_].y < _loc3_)
            {
               _loc3_ = param1[_loc6_].y;
            }
            if(param1[_loc6_].y > _loc5_)
            {
               _loc5_ = param1[_loc6_].y;
            }
         }
         _loc7_ = _loc4_ - _loc2_;
         _loc8_ = _loc5_ - _loc3_;
         _loc9_ = Math.max(_loc7_,_loc8_);
         _loc10_ = _loc2_ + _loc7_ * 0.5;
         _loc11_ = _loc3_ + _loc8_ * 0.5;
         var _loc12_:Vector.<_656> = new Vector.<_656>();
         _loc12_.push(new _656(_loc10_ - 2000 * _loc9_,_loc11_ - _loc9_,N0_INDEX));
         _loc12_.push(new _656(_loc10_,_loc11_ + 2000 * _loc9_,N1_INDEX));
         _loc12_.push(new _656(_loc10_ + 2000 * _loc9_,_loc11_ - _loc9_,N2_INDEX));
         return _loc12_;
      }
      
      public static function _5679(param1:_656, param2:_656, param3:_656) : Object
      {
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc4_:Number = param1.x;
         var _loc5_:Number = param1.y;
         var _loc6_:Number = param2.x;
         var _loc7_:Number = param2.y;
         var _loc8_:Number = param3.x;
         var _loc9_:Number = param3.y;
         var _loc10_:Number = Math.abs(_loc5_ - _loc7_);
         var _loc11_:Number = Math.abs(_loc7_ - _loc9_);
         if(_loc10_ < EPSILON && _loc11_ < EPSILON)
         {
            return null;
         }
         if(_loc10_ < EPSILON)
         {
            _loc15_ = -((_loc8_ - _loc6_) / (_loc9_ - _loc7_));
            _loc17_ = (_loc6_ + _loc8_) / 2;
            _loc19_ = (_loc7_ + _loc9_) / 2;
            _loc12_ = (_loc6_ + _loc4_) / 2;
            _loc13_ = _loc15_ * (_loc12_ - _loc17_) + _loc19_;
         }
         else if(_loc11_ < EPSILON)
         {
            _loc14_ = -((_loc6_ - _loc4_) / (_loc7_ - _loc5_));
            _loc16_ = (_loc4_ + _loc6_) / 2;
            _loc18_ = (_loc5_ + _loc7_) / 2;
            _loc12_ = (_loc8_ + _loc6_) / 2;
            _loc13_ = _loc14_ * (_loc12_ - _loc16_) + _loc18_;
         }
         else
         {
            _loc14_ = -((_loc6_ - _loc4_) / (_loc7_ - _loc5_));
            _loc15_ = -((_loc8_ - _loc6_) / (_loc9_ - _loc7_));
            _loc16_ = (_loc4_ + _loc6_) / 2;
            _loc17_ = (_loc6_ + _loc8_) / 2;
            _loc18_ = (_loc5_ + _loc7_) / 2;
            _loc19_ = (_loc7_ + _loc9_) / 2;
            _loc12_ = (_loc14_ * _loc16_ - _loc15_ * _loc17_ + _loc19_ - _loc18_) / (_loc14_ - _loc15_);
            _loc13_ = _loc10_ > _loc11_ ? _loc14_ * (_loc12_ - _loc16_) + _loc18_ : _loc15_ * (_loc12_ - _loc17_) + _loc19_;
         }
         _loc20_ = _loc6_ - _loc12_;
         _loc21_ = _loc7_ - _loc13_;
         return {
            "i":param1,
            "j":param2,
            "k":param3,
            "x":_loc12_,
            "y":_loc13_,
            "r":_loc20_ * _loc20_ + _loc21_ * _loc21_
         };
      }
      
      private static function _5685(param1:Vector.<_656>) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_656 = null;
         var _loc5_:_656 = null;
         var _loc6_:_656 = null;
         var _loc7_:_656 = null;
         _loc3_ = int(param1.length);
         while(_loc3_)
         {
            _loc5_ = param1[--_loc3_];
            _loc4_ = param1[--_loc3_];
            _loc2_ = _loc3_;
            while(_loc2_)
            {
               _loc7_ = param1[--_loc2_];
               _loc6_ = param1[--_loc2_];
               if(_loc4_.id == _loc6_.id && _loc5_.id == _loc7_.id || _loc4_.id == _loc7_.id && _loc5_.id == _loc6_.id)
               {
                  param1.splice(_loc3_,2);
                  param1.splice(_loc2_,2);
                  _loc3_ -= 2;
                  break;
               }
            }
         }
      }
      
      private static function _5680(param1:_655, param2:Vector.<_656>) : Boolean
      {
         return !_654._4252(param1._2549(),param2);
      }
      
      private static function _5675(param1:Point, param2:Vector.<_656>) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = int(param2.length);
         while(_loc4_ < _loc5_)
         {
            if(_654._5684(param1,param2[_loc4_],param2[_loc4_ + 1]))
            {
               _loc3_++;
            }
            _loc4_ += 2;
         }
         return _loc3_ % 2 == 0;
      }
   }
}

