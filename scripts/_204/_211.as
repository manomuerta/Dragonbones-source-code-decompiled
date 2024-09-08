package _204
{
   import _97._101;
   
   public class _211
   {
      private static var _2815:Array = [_101.A_INHERIT_ROTATION,_101.A_INHERIT_SCALE];
      
      private static var _2822:Array = [true,true];
      
      private static var _2816:Array = [_101.A_DISPLAY_INDEX,_101.A_Z_ORDER];
      
      private static var _2821:Array = [0,0];
      
      private static var _2809:Array = [_101.A_FADE_IN_TIME,_101.A_SCALE,_101.A_PLAY_TIMES];
      
      private static var _2812:Array = [0,1,1];
      
      private static var _2810:Array = [_101.A_SCALE,_101.A_OFFSET,_101.A_PIVOT_X,_101.A_PIVOT_Y];
      
      private static var _2813:Array = [1,0,0,0];
      
      private static var _2814:Array = [_101.A_TWEEN_SCALE,_101.A_TWEEN_ROTATE,_101.A_HIDE,_101.A_DISPLAY_INDEX,_101.A_SCALE_X_OFFSET,_101.A_SCALE_Y_OFFSET];
      
      private static var _2820:Array = [1,0,0,0,0,0];
      
      private static var _2808:Array = [_101.A_X,_101.A_Y,_101.A_SKEW_X,_101.A_SKEW_Y,_101.A_SCALE_X,_101.A_SCALE_Y,_101.A_PIVOT_X,_101.A_PIVOT_Y];
      
      private static var _2811:Array = [0,0,0,0,1,1,0,0];
      
      private static var _2805:Array = [_101.A_ALPHA_OFFSET,_101.A_RED_OFFSET,_101.A_GREEN_OFFSET,_101.A_BLUE_OFFSET,_101.A_ALPHA_MULTIPLIER,_101.A_RED_MULTIPLIER,_101.A_GREEN_MULTIPLIER,_101.A_BLUE_MULTIPLIER];
      
      private static var _2806:Array = [0,0,0,0,100,100,100,100];
      
      public function _211()
      {
         super();
      }
      
      public static function _2694(param1:Object) : void
      {
         if(param1)
         {
            if(param1[_101.A_VERSION] == _101.DATA_VERSION_5_5)
            {
               _13697(param1);
            }
            else
            {
               _13696(param1);
            }
         }
      }
      
      public static function _13696(param1:Object) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         var _loc4_:Object = null;
         var _loc5_:Array = null;
         var _loc6_:Object = null;
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc9_:Array = null;
         var _loc10_:Object = null;
         var _loc11_:Array = null;
         var _loc12_:Array = null;
         var _loc13_:Array = null;
         var _loc14_:Object = null;
         var _loc15_:Object = null;
         var _loc16_:Object = null;
         var _loc17_:Object = null;
         var _loc18_:Object = null;
         var _loc19_:Object = null;
         var _loc20_:Object = null;
         for each(_loc2_ in param1.armature)
         {
            _loc3_ = _loc2_.bone;
            for each(_loc4_ in _loc3_)
            {
               _2825(_loc4_,_2815,_2822);
               _2818(_loc4_.transform);
            }
            _loc5_ = _loc2_.slot;
            for each(_loc6_ in _loc5_)
            {
               _2825(_loc6_,_2816,_2821);
               _2807(_loc6_.color);
            }
            _loc7_ = _loc2_.skin;
            for each(_loc10_ in _loc7_)
            {
               _loc8_ = _loc10_.slot;
               for each(_loc15_ in _loc8_)
               {
                  _loc9_ = _loc15_.display;
                  for each(_loc16_ in _loc9_)
                  {
                     _2818(_loc16_.transform);
                  }
               }
            }
            _loc11_ = _loc2_.animation;
            for each(_loc14_ in _loc11_)
            {
               _2817(_loc14_);
               _loc12_ = _loc14_.bone;
               for each(_loc17_ in _loc12_)
               {
                  _2819(_loc17_);
                  _loc13_ = _loc17_.frame;
                  for each(_loc19_ in _loc13_)
                  {
                     _2823(_loc19_);
                     _2818(_loc19_.transform);
                  }
               }
               _loc12_ = _loc14_.slot;
               for each(_loc18_ in _loc12_)
               {
                  _2819(_loc18_);
                  _loc13_ = _loc18_.frame;
                  for each(_loc20_ in _loc13_)
                  {
                     _2825(_loc20_,_2816,_2821);
                     _2807(_loc20_.color);
                     if(_loc20_.color[_101.A_ALPHA_OFFSET] == null && _loc20_.color[_101.A_RED_OFFSET] == null && _loc20_.color[_101.A_GREEN_OFFSET] == null && _loc20_.color[_101.A_BLUE_OFFSET] == null && _loc20_.color[_101.A_ALPHA_MULTIPLIER] == null && _loc20_.color[_101.A_RED_MULTIPLIER] == null && _loc20_.color[_101.A_GREEN_MULTIPLIER] == null && _loc20_.color[_101.A_BLUE_MULTIPLIER] == null)
                     {
                        delete _loc20_.color;
                     }
                  }
               }
               if(_loc14_.zOrder)
               {
                  _2819(_loc14_.zOrder);
               }
            }
         }
      }
      
      public static function _13697(param1:Object) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         var _loc4_:Object = null;
         var _loc5_:Array = null;
         var _loc6_:Object = null;
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc9_:Array = null;
         var _loc10_:Object = null;
         var _loc11_:Array = null;
         var _loc12_:Array = null;
         var _loc13_:Array = null;
         var _loc14_:Object = null;
         var _loc15_:Object = null;
         var _loc16_:Object = null;
         var _loc17_:Object = null;
         var _loc18_:Object = null;
         var _loc19_:Array = null;
         var _loc20_:Array = null;
         var _loc21_:Array = null;
         var _loc22_:Object = null;
         var _loc23_:Object = null;
         var _loc24_:Object = null;
         var _loc25_:Array = null;
         var _loc26_:Array = null;
         var _loc27_:Object = null;
         var _loc28_:Object = null;
         for each(_loc2_ in param1.armature)
         {
            _loc3_ = _loc2_.bone;
            for each(_loc4_ in _loc3_)
            {
               _2825(_loc4_,_2815,_2822);
               _2818(_loc4_.transform);
            }
            _loc5_ = _loc2_.slot;
            for each(_loc6_ in _loc5_)
            {
               _2825(_loc6_,_2816,_2821);
               _2807(_loc6_.color);
            }
            _loc7_ = _loc2_.skin;
            for each(_loc10_ in _loc7_)
            {
               _loc8_ = _loc10_.slot;
               for each(_loc15_ in _loc8_)
               {
                  _loc9_ = _loc15_.display;
                  for each(_loc16_ in _loc9_)
                  {
                     _2818(_loc16_.transform);
                  }
               }
            }
            _loc11_ = _loc2_.animation;
            for each(_loc14_ in _loc11_)
            {
               _2817(_loc14_);
               _loc12_ = _loc14_.bone;
               for each(_loc17_ in _loc12_)
               {
                  _2819(_loc17_);
                  _loc19_ = _loc17_.translateFrame;
                  _loc20_ = _loc17_.rotateFrame;
                  _loc21_ = _loc17_.scaleFrame;
                  delete _loc17_.frame;
                  if(_loc19_)
                  {
                     for each(_loc22_ in _loc19_)
                     {
                        _2823(_loc22_);
                        _2825(_loc22_,[_101.A_X,_101.A_Y],[0,0]);
                     }
                  }
                  if(_loc20_)
                  {
                     for each(_loc23_ in _loc20_)
                     {
                        _2823(_loc23_);
                        _2825(_loc23_,[_101.ROTATE,_101.CLOCKWISE],[0,0]);
                     }
                  }
                  if(_loc21_)
                  {
                     for each(_loc24_ in _loc21_)
                     {
                        _2823(_loc24_);
                        _2825(_loc24_,[_101.A_X,_101.A_Y],[1,1]);
                     }
                  }
               }
               _loc12_ = _loc14_.slot;
               for each(_loc18_ in _loc12_)
               {
                  _2819(_loc18_);
                  _loc25_ = _loc18_.colorFrame;
                  _loc26_ = _loc18_.displayFrame;
                  delete _loc18_.frame;
                  delete _loc18_.visibleFrame;
                  if(_loc26_)
                  {
                     for each(_loc27_ in _loc26_)
                     {
                        _2823(_loc27_);
                        _2825(_loc27_,[_101.VALUE],[0]);
                     }
                  }
                  if(_loc25_)
                  {
                     for each(_loc28_ in _loc25_)
                     {
                        _2823(_loc28_);
                        _2807(_loc28_.color);
                        if(_loc28_.color[_101.A_ALPHA_OFFSET] == null && _loc28_.color[_101.A_RED_OFFSET] == null && _loc28_.color[_101.A_GREEN_OFFSET] == null && _loc28_.color[_101.A_BLUE_OFFSET] == null && _loc28_.color[_101.A_ALPHA_MULTIPLIER] == null && _loc28_.color[_101.A_RED_MULTIPLIER] == null && _loc28_.color[_101.A_GREEN_MULTIPLIER] == null && _loc28_.color[_101.A_BLUE_MULTIPLIER] == null)
                        {
                           delete _loc28_.color;
                        }
                     }
                  }
               }
               if(_loc14_.zOrder)
               {
                  _2819(_loc14_.zOrder);
               }
            }
         }
      }
      
      private static function _2817(param1:Object) : void
      {
         _2825(param1,_2809,_2812,4);
      }
      
      private static function _2819(param1:Object) : void
      {
         _2825(param1,_2810,_2813,4);
      }
      
      private static function _2823(param1:Object) : void
      {
         _2825(param1,_2814,_2820,4);
         if(param1[_101.A_TWEEN_EASING] == null)
         {
            delete param1[_101.A_TWEEN_EASING];
         }
      }
      
      private static function _2818(param1:Object) : void
      {
         _2825(param1,_2808,_2811,4);
      }
      
      private static function _2807(param1:Object) : void
      {
         _2825(param1,_2805,_2806,4);
      }
      
      private static function _2825(param1:Object, param2:Array, param3:Array, param4:uint = 4) : void
      {
         var _loc6_:String = null;
         var _loc7_:Number = NaN;
         if(!param1)
         {
            return;
         }
         var _loc5_:int = int(param2.length);
         while(_loc5_--)
         {
            _loc6_ = param2[_loc5_];
            _loc7_ = Number(param3[_loc5_]);
            if(param1.hasOwnProperty(_loc6_))
            {
               if(_2826(param1[_loc6_],_loc7_,param4))
               {
                  delete param1[_loc6_];
               }
               else if(param1[_loc6_] is Number)
               {
                  param1[_loc6_] = Number(Number(param1[_loc6_]).toFixed(param4));
               }
            }
         }
      }
      
      private static function _2826(param1:Number, param2:Number, param3:uint) : Boolean
      {
         var _loc4_:Number = 1 / Math.pow(10,param3);
         if(param1 >= param2 - _loc4_ && param1 <= param2 + _loc4_)
         {
            return true;
         }
         return false;
      }
   }
}

