package egret.utils
{
   import flash.display.Screen;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class _1547
   {
      public function _1547()
      {
         super();
      }
      
      public static function _10208(param1:Point) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:Rectangle = null;
         var _loc2_:Boolean = false;
         try
         {
            _loc3_ = 0;
            while(_loc3_ < Screen.screens.length)
            {
               _loc4_ = Screen.screens[_loc3_].visibleBounds;
               if(param1.x >= _loc4_.x && param1.x <= _loc4_.x + _loc4_.width && param1.y >= _loc4_.y && param1.y <= _loc4_.y + _loc4_.height)
               {
                  _loc2_ = true;
                  break;
               }
               _loc3_++;
            }
         }
         catch(error:Error)
         {
         }
         return _loc2_;
      }
      
      public static function _10209(param1:Rectangle) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:Rectangle = null;
         var _loc2_:Boolean = false;
         try
         {
            _loc3_ = 0;
            while(_loc3_ < Screen.screens.length)
            {
               _loc4_ = Screen.screens[_loc3_].visibleBounds;
               if(param1.x >= _loc4_.x && param1.x + param1.width <= _loc4_.x + _loc4_.width && param1.y >= _loc4_.y && param1.y + param1.height <= _loc4_.y + _loc4_.height)
               {
                  _loc2_ = true;
                  break;
               }
               _loc3_++;
            }
         }
         catch(error:Error)
         {
         }
         return _loc2_;
      }
      
      public static function _9546(param1:Rectangle, param2:Rectangle) : Rectangle
      {
         var _loc3_:Rectangle = new Rectangle(param2.x,param2.y,param2.width,param2.height);
         _loc3_.x += param1.x;
         _loc3_.y += param1.y;
         if(!_10209(_loc3_))
         {
            if(_loc3_.x > Screen.mainScreen.visibleBounds.x + Screen.mainScreen.visibleBounds.width)
            {
               param1.x = Screen.mainScreen.visibleBounds.x + Screen.mainScreen.visibleBounds.width - _loc3_.width;
            }
            if(_loc3_.y > Screen.mainScreen.visibleBounds.y + Screen.mainScreen.visibleBounds.height)
            {
               param1.y = Screen.mainScreen.visibleBounds.y + Screen.mainScreen.visibleBounds.height - _loc3_.height;
            }
            if(_loc3_.x + _loc3_.width < Screen.mainScreen.visibleBounds.x)
            {
               param1.x = 0;
            }
            if(_loc3_.y + _loc3_.height < Screen.mainScreen.visibleBounds.y)
            {
               param1.y = 0;
            }
         }
         return param1;
      }
      
      public static function _7288(param1:Rectangle, param2:Rectangle, param3:Screen) : Rectangle
      {
         var _loc4_:Rectangle = new Rectangle(param2.x,param2.y,param2.width,param2.height);
         _loc4_.x += param1.x;
         _loc4_.y += param1.y;
         if(!_10209(_loc4_))
         {
            if(_loc4_.x + _loc4_.width > param3.visibleBounds.x + param3.visibleBounds.width)
            {
               param1.x = param3.visibleBounds.x + param3.visibleBounds.width - _loc4_.width;
            }
            if(_loc4_.y + _loc4_.height > param3.visibleBounds.y + param3.visibleBounds.height)
            {
               param1.y = param3.visibleBounds.y + param3.visibleBounds.height - _loc4_.height;
            }
            if(_loc4_.x < param3.visibleBounds.x)
            {
               param1.x = param3.visibleBounds.x;
            }
            if(_loc4_.y < param3.visibleBounds.y)
            {
               param1.y = param3.visibleBounds.y;
            }
         }
         return param1;
      }
      
      public static function _9536(param1:Point) : Screen
      {
         var _loc2_:Screen = null;
         var _loc3_:int = 0;
         var _loc4_:Rectangle = null;
         try
         {
            _loc3_ = 0;
            while(_loc3_ < Screen.screens.length)
            {
               _loc4_ = Screen.screens[_loc3_].visibleBounds;
               if(param1.x >= _loc4_.x && param1.x <= _loc4_.x + _loc4_.width && param1.y >= _loc4_.y && param1.y <= _loc4_.y + _loc4_.height)
               {
                  _loc2_ = Screen.screens[_loc3_];
                  break;
               }
               _loc3_++;
            }
         }
         catch(error:Error)
         {
         }
         return _loc2_;
      }
      
      public static function _7289(param1:Point) : Screen
      {
         var _loc2_:Screen = null;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:Rectangle = null;
         var _loc6_:Number = NaN;
         try
         {
            _loc3_ = NaN;
            _loc4_ = 0;
            while(_loc4_ < Screen.screens.length)
            {
               _loc5_ = Screen.screens[_loc4_].visibleBounds;
               _loc6_ = _10210(param1.x,param1.y,_loc5_.x,_loc5_.y);
               if(isNaN(_loc3_))
               {
                  _loc3_ = _loc6_;
                  _loc2_ = Screen.screens[_loc4_];
               }
               if(_loc6_ < _loc3_)
               {
                  _loc3_ = _loc6_;
                  _loc2_ = Screen.screens[_loc4_];
               }
               _loc6_ = _10210(param1.x,param1.y,_loc5_.x + _loc5_.width,_loc5_.y);
               if(_loc6_ < _loc3_)
               {
                  _loc3_ = _loc6_;
                  _loc2_ = Screen.screens[_loc4_];
               }
               _loc6_ = _10210(param1.x,param1.y,_loc5_.x,_loc5_.y + _loc5_.height);
               if(_loc6_ < _loc3_)
               {
                  _loc3_ = _loc6_;
                  _loc2_ = Screen.screens[_loc4_];
               }
               _loc6_ = _10210(param1.x,param1.y,_loc5_.x + _loc5_.width,_loc5_.y + _loc5_.height);
               if(_loc6_ < _loc3_)
               {
                  _loc3_ = _loc6_;
                  _loc2_ = Screen.screens[_loc4_];
               }
               _loc4_++;
            }
         }
         catch(error:Error)
         {
         }
         return _loc2_;
      }
      
      private static function _10210(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return Math.sqrt((param1 - param3) * (param1 - param3) + (param2 - param4) * (param2 - param4));
      }
   }
}

