package _108
{
   import flash.geom.Point;
   
   public class _114
   {
      private static var _2352:Vector.<_109>;
      
      private static var _2340:_111 = new _111();
      
      private static var _2348:int = -1;
      
      private static var _2343:int = -1;
      
      public static var _2356:Boolean = false;
      
      private static var _2342:Point = new Point(0,0);
      
      private static var _2350:String = _113.AREA;
      
      private static var _2360:int = 0;
      
      private static var _2359:int = 0;
      
      private static var _2344:int = _107.BottomLeftRule;
      
      private static var _2341:String = "";
      
      private static var _2351:Array = [];
      
      private static var _2361:int = 1;
      
      private static var _h:int = 1;
      
      private static var _2358:int = 0;
      
      private static var _2357:int = 0;
      
      public static var area:int = 0;
      
      private static var _2355:int = 1;
      
      private static var _2354:int = 1;
      
      public function _114()
      {
         super();
      }
      
      public static function get result() : Vector.<_109>
      {
         return _2352.concat();
      }
      
      public static function get results() : Array
      {
         return _2351;
      }
      
      public static function get _2345() : String
      {
         return _2341;
      }
      
      public static function get _2346() : Point
      {
         return _2342;
      }
      
      public static function _2347(param1:int = -1, param2:int = -1) : void
      {
         _2348 = param1;
         _2343 = param2;
      }
      
      public static function _2349(param1:String) : void
      {
         _2350 = param1;
      }
      
      public static function _2353(param1:int = 0, param2:int = 0) : void
      {
         _2360 = param1;
         _2359 = param2;
      }
      
      public static function _2327(param1:Boolean) : void
      {
         _2340._2327(param1);
      }
      
      public static function _2338(param1:int) : void
      {
         _2344 = param1;
      }
      
      public static function _2336(param1:_109) : void
      {
         _2340._2332 = param1;
      }
      
      public static function _2337(param1:Vector.<_109>) : void
      {
         var _loc7_:int = 0;
         var _loc8_:_109 = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:Vector.<_109> = null;
         var _loc12_:Vector.<_109> = null;
         var _loc13_:Boolean = false;
         _2352 = null;
         _2351 = [];
         var _loc2_:Vector.<_109> = new Vector.<_109>();
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            if(param1[_loc3_].width > 0 && param1[_loc3_].height > 0)
            {
               _loc2_.push(param1[_loc3_]);
            }
            _loc3_++;
         }
         if(_loc2_.length != param1.length)
         {
            _2341 = _112.SHEET_EMPTY;
            log("有图的尺寸不对，宽和高都不能为零");
            return;
         }
         log("加载了:" + param1.length + " 个图片");
         if(_2360 > 0 || _2359 > 0)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               _loc2_[_loc3_].width += _2360;
               _loc2_[_loc3_].height += _2359;
               _loc3_++;
            }
         }
         log("间隙为 " + _2360 + " " + _2359);
         _2358 = 0;
         _2357 = 0;
         area = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(_loc2_[_loc3_].width > _2358)
            {
               _2358 = _loc2_[_loc3_].width;
            }
            if(_loc2_[_loc3_].height > _2357)
            {
               _2357 = _loc2_[_loc3_].height;
            }
            area += _loc2_[_loc3_].width * _loc2_[_loc3_].height;
            _loc3_++;
         }
         log("maxW:" + _2358 + " maxH:" + _2357 + " area:" + area);
         _2361 = 1;
         _h = 1;
         while(Math.pow(2,_2361) < _2358)
         {
            ++_2361;
         }
         while(Math.pow(2,_h) < _2357)
         {
            ++_h;
         }
         log("第一次过滤 宽幂:" + _2361 + " 宽:" + Math.pow(2,_2361) + " 高幂:" + _h + " 高:" + Math.pow(2,_h));
         _2355 = _2361;
         _2354 = _h;
         while(Math.pow(2,_2361) * Math.pow(2,_h) < area)
         {
            _2339();
         }
         _2355 = _2361;
         _2354 = _h;
         log("第二次过滤 宽幂:" + _2361 + " 宽:" + Math.pow(2,_2361) + " 高幂:" + _h + " 高:" + Math.pow(2,_h));
         if(_2350 == _113.AREA)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               _loc7_ = _loc3_;
               while(_loc7_ < _loc2_.length)
               {
                  if(_loc2_[_loc3_].height * _loc2_[_loc3_].width < _loc2_[_loc7_].height * _loc2_[_loc7_].width)
                  {
                     _loc8_ = _loc2_[_loc3_];
                     _loc2_[_loc3_] = _loc2_[_loc7_];
                     _loc2_[_loc7_] = _loc8_;
                  }
                  _loc7_++;
               }
               _loc3_++;
            }
         }
         else if(_2350 == _113.SIZE)
         {
            if(_2358 > _2357)
            {
               _loc3_ = 0;
               while(_loc3_ < _loc2_.length)
               {
                  _loc7_ = _loc3_;
                  while(_loc7_ < _loc2_.length)
                  {
                     if(_loc2_[_loc3_].width < _loc2_[_loc7_].width)
                     {
                        _loc8_ = _loc2_[_loc3_];
                        _loc2_[_loc3_] = _loc2_[_loc7_];
                        _loc2_[_loc7_] = _loc8_;
                     }
                     _loc7_++;
                  }
                  _loc3_++;
               }
            }
            else
            {
               _loc3_ = 0;
               while(_loc3_ < _loc2_.length)
               {
                  _loc7_ = _loc3_;
                  while(_loc7_ < _loc2_.length)
                  {
                     if(_loc2_[_loc3_].height < _loc2_[_loc7_].height)
                     {
                        _loc8_ = _loc2_[_loc3_];
                        _loc2_[_loc3_] = _loc2_[_loc7_];
                        _loc2_[_loc7_] = _loc8_;
                     }
                     _loc7_++;
                  }
                  _loc3_++;
               }
            }
         }
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         while(!_loc4_)
         {
            _loc9_ = Math.pow(2,_2361);
            _loc10_ = Math.pow(2,_h);
            _loc11_ = _loc2_.concat();
            log(_loc5_ + "次计算，" + "宽:" + _loc9_ + " 高:" + _loc10_ + "     " + "宽幂:" + _2361 + " 高幂:" + _h);
            _2340.init(_loc9_,_loc10_);
            _2340._2328(_loc11_,_2344);
            _loc12_ = _2340._2320;
            _loc4_ = true;
            _loc13_ = false;
            _loc3_ = 0;
            while(_loc3_ < _loc12_.length)
            {
               if(_loc12_[_loc3_].x == 0 && _loc12_[_loc3_].y == 0 && _loc12_[_loc3_].width == 0 && _loc12_[_loc3_].height == 0)
               {
                  _loc13_ = true;
                  break;
               }
               _loc3_++;
            }
            if(_loc13_)
            {
               _2339();
               _loc4_ = false;
            }
            _loc5_++;
            if(_loc9_ > _2348 && _2348 > 0 || _loc10_ > _2343 && _2343 > 0)
            {
               _loc4_ = true;
               _loc6_ = true;
            }
         }
         if(_loc6_)
         {
            _2341 = _112.SHEET_TO_BIG;
            log("图太多了，最大尺寸都不够");
            return;
         }
         log("成功了" + "最终宽度:" + _loc9_ + " 最终高度:" + _loc10_);
         _2342.x = _loc9_;
         _2342.y = _loc10_;
         _2341 = _112.SUCCESS;
         _2352 = _2340._2320;
         if(_2360 > 0 || _2359 > 0)
         {
            _loc3_ = 0;
            while(_loc3_ < _2352.length)
            {
               _2352[_loc3_].width -= _2360;
               _2352[_loc3_].height -= _2359;
               _2352[_loc3_].x += int(_2360 / 2);
               _2352[_loc3_].y += int(_2359 / 2);
               _loc3_++;
            }
         }
         _2351.push(_2352);
      }
      
      private static function _2339() : void
      {
         if(_2358 > _2357)
         {
            if(_2361 == _h)
            {
               ++_h;
               _2361 = _2355;
               return;
            }
            if(_h > _2361 + 1)
            {
               ++_2361;
               return;
            }
            if(_h == _2361 + 1)
            {
               _2361 = _h;
               _h = _2354;
               return;
            }
            if(_2361 > _h + 1)
            {
               ++_h;
               return;
            }
            if(_2361 == _h + 1)
            {
               _h = _2361;
               return;
            }
         }
         else
         {
            if(_h == _2361)
            {
               ++_2361;
               _h = _2354;
               return;
            }
            if(_2361 > _h + 1)
            {
               ++_h;
               return;
            }
            if(_2361 == _h + 1)
            {
               _h = _2361;
               _2361 = _2355;
               return;
            }
            if(_h > _2361 + 1)
            {
               ++_2361;
               return;
            }
            if(_h == _2361 + 1)
            {
               _2361 = _h;
               return;
            }
         }
      }
      
      public static function _2335(param1:Vector.<_109>) : void
      {
         var area:int;
         var finish:Boolean;
         var n:int;
         var tooBig:Boolean;
         var j:int = 0;
         var temp:_109 = null;
         var currentW:int = 0;
         var currentH:int = 0;
         var tempRectangles:Vector.<_109> = null;
         var results:Vector.<_109> = null;
         var _10676:Boolean = false;
         var resultPage:Vector.<_109> = null;
         var rectangles:Vector.<_109> = param1;
         var getMaxRectangleByData:Function = function(param1:Object):_109
         {
            var _loc2_:int = 0;
            var _loc3_:int = int(rectangles.length);
            while(_loc2_ < _loc3_)
            {
               if(rectangles[_loc2_].data == param1)
               {
                  return rectangles[_loc2_];
               }
               _loc2_++;
            }
            return null;
         };
         _2352 = null;
         _2351 = [];
         var newRects:Vector.<_109> = new Vector.<_109>();
         var i:int = 0;
         while(i < rectangles.length)
         {
            if(rectangles[i].width > 0 && rectangles[i].height > 0)
            {
               newRects.push(rectangles[i]);
            }
            i++;
         }
         if(newRects.length != rectangles.length)
         {
            _2341 = _112.SHEET_EMPTY;
            log("有图的尺寸不对，宽和高都不能为零");
            return;
         }
         log("加载了:" + rectangles.length + " 个图片");
         if(_2360 > 0 || _2359 > 0)
         {
            i = 0;
            while(i < newRects.length)
            {
               newRects[i].width += _2360;
               newRects[i].height += _2359;
               i++;
            }
         }
         log("间隙为 " + _2360 + " " + _2359);
         _2358 = 0;
         _2357 = 0;
         area = 0;
         i = 0;
         while(i < newRects.length)
         {
            if(newRects[i].width > _2358)
            {
               _2358 = newRects[i].width;
            }
            if(newRects[i].height > _2357)
            {
               _2357 = newRects[i].height;
            }
            area += newRects[i].width * newRects[i].height;
            i++;
         }
         log("maxW:" + _2358 + " maxH:" + _2357 + " area:" + area);
         if(_2348 < _2358 || _2343 < _2357)
         {
            _2341 = _112.SHEET_TO_BIG;
            return;
         }
         if(_2350 == _113.AREA)
         {
            i = 0;
            while(i < newRects.length)
            {
               j = i;
               while(j < newRects.length)
               {
                  if(newRects[i].height * newRects[i].width < newRects[j].height * newRects[j].width)
                  {
                     temp = newRects[i];
                     newRects[i] = newRects[j];
                     newRects[j] = temp;
                  }
                  j++;
               }
               i++;
            }
         }
         else if(_2350 == _113.SIZE)
         {
            if(_2358 > _2357)
            {
               i = 0;
               while(i < newRects.length)
               {
                  j = i;
                  while(j < newRects.length)
                  {
                     if(newRects[i].width < newRects[j].width)
                     {
                        temp = newRects[i];
                        newRects[i] = newRects[j];
                        newRects[j] = temp;
                     }
                     j++;
                  }
                  i++;
               }
            }
            else
            {
               i = 0;
               while(i < newRects.length)
               {
                  j = i;
                  while(j < newRects.length)
                  {
                     if(newRects[i].height < newRects[j].height)
                     {
                        temp = newRects[i];
                        newRects[i] = newRects[j];
                        newRects[j] = temp;
                     }
                     j++;
                  }
                  i++;
               }
            }
         }
         finish = false;
         n = 0;
         tooBig = false;
         while(!finish)
         {
            currentW = _2348;
            currentH = _2343;
            tempRectangles = newRects.concat();
            log(n + "次计算，" + "宽:" + currentW + " 高:" + currentH + "     " + "宽幂:" + _2361 + " 高幂:" + _h);
            _2340.init(currentW,currentH);
            _2340._2328(tempRectangles,_2344);
            results = _2340._2320;
            _10676 = false;
            newRects = new Vector.<_109>();
            resultPage = new Vector.<_109>();
            i = 0;
            while(i < results.length)
            {
               if(results[i].x == 0 && results[i].y == 0 && results[i].width == 0 && results[i].height == 0)
               {
                  newRects.push(getMaxRectangleByData(results[i].data));
               }
               else
               {
                  resultPage.push(results[i]);
               }
               i++;
            }
            if(newRects.length <= 0)
            {
               finish = true;
            }
            if(resultPage.length <= 0)
            {
               tooBig = true;
               finish = true;
            }
            else
            {
               _2351.push(resultPage);
            }
            n++;
         }
         if(tooBig)
         {
            _2341 = _112.SHEET_TO_BIG;
            log("图太多了，最大尺寸都不够");
            return;
         }
         log("成功了" + "最终宽度:" + currentW + " 最终高度:" + currentH);
         _2342.x = currentW;
         _2342.y = currentH;
         _2341 = _112.SUCCESS;
         if(_2360 > 0 || _2359 > 0)
         {
            i = 0;
            while(i < _2351.length)
            {
               j = 0;
               while(j < _2351[i].length)
               {
                  _2351[i][j].x += _2360;
                  _2351[i][j].y += _2359;
                  j++;
               }
               i++;
            }
         }
      }
      
      private static function log(param1:String) : void
      {
         if(_2356)
         {
         }
      }
   }
}

