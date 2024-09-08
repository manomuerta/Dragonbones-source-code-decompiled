package _35
{
   import _81._86;
   import _97._101;
   import flash.geom.Point;
   
   public class _13490
   {
      public function _13490()
      {
         super();
      }
      
      public static function _13602(param1:Object) : Object
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:Array = param1[_101.ARMATURE];
         param1.version = "5.5";
         if(_loc2_.length > 0)
         {
            _loc3_ = 0;
            _loc3_ = 0;
            _loc4_ = int(_loc2_.length);
            while(_loc3_ < _loc4_)
            {
               _13647(_loc2_[_loc3_]);
               _loc3_++;
            }
         }
         return param1;
      }
      
      private static function _13647(param1:Object) : Object
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:Array = param1[_101.ANIMATION];
         if(Boolean(_loc2_) && _loc2_.length > 0)
         {
            _loc3_ = 0;
            _loc3_ = 0;
            _loc4_ = int(_loc2_.length);
            while(_loc3_ < _loc4_)
            {
               _13645(_loc2_[_loc3_]);
               _loc3_++;
            }
         }
         return param1;
      }
      
      private static function _13645(param1:Object) : Object
      {
         var _loc4_:int = 0;
         var _loc2_:Array = param1[_101.BONE];
         var _loc3_:int = 0;
         if(Boolean(_loc2_) && _loc2_.length > 0)
         {
            _loc3_ = 0;
            _loc4_ = int(_loc2_.length);
            while(_loc3_ < _loc4_)
            {
               _13644(_loc2_[_loc3_]);
               _loc3_++;
            }
         }
         var _loc5_:Array = param1[_101.SLOT];
         if((Boolean(_loc5_)) && _loc5_.length > 0)
         {
            _loc3_ = 0;
            _loc4_ = int(_loc5_.length);
            while(_loc3_ < _loc4_)
            {
               _13643(_loc5_[_loc3_]);
               _loc3_++;
            }
         }
         return param1;
      }
      
      private static function _13644(param1:Object) : Object
      {
         var _loc6_:Object = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
         var _loc2_:Array = param1[_101.FRAME];
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         var _loc5_:Array = [];
         if(Boolean(_loc2_) && _loc2_.length > 0)
         {
            _loc7_ = 0;
            _loc7_ = 0;
            _loc8_ = int(_loc2_.length);
            while(_loc7_ < _loc8_)
            {
               _loc6_ = _loc2_[_loc7_];
               _loc9_ = _13648(_loc6_);
               _loc3_.push(_loc9_[0]);
               _loc4_.push(_loc9_[1]);
               _loc5_.push(_loc9_[2]);
               _loc7_++;
            }
         }
         param1[_101.TRANSLATE_FRAME] = _loc3_;
         param1[_101.ROTATE_FRAME] = _loc4_;
         param1[_101.SCALE_FRAME] = _loc5_;
         return param1;
      }
      
      private static function _13648(param1:Object) : Array
      {
         var _loc2_:_86 = new _86();
         _1767(param1[_101.TRANSFORM],_loc2_);
         var _loc3_:Object = _13646(param1);
         _loc3_[_101.A_X] = _loc2_.x;
         _loc3_[_101.A_Y] = _loc2_.y;
         var _loc4_:Object;
         (_loc4_ = _13646(param1))[_101.ROTATE] = _loc2_.rotation * _101.RADIAN_TO_ANGLE;
         _loc4_[_101.CLOCKWISE] = param1[_101.A_TWEEN_ROTATE];
         var _loc5_:Object;
         (_loc5_ = _13646(param1))[_101.A_X] = _loc2_.scaleX;
         _loc5_[_101.A_Y] = _loc2_.scaleY;
         return [_loc3_,_loc4_,_loc5_];
      }
      
      private static function _13643(param1:Object) : Object
      {
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Array = null;
         var _loc2_:Array = param1[_101.FRAME];
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         if(Boolean(_loc2_) && _loc2_.length > 0)
         {
            _loc6_ = 0;
            _loc6_ = 0;
            _loc7_ = int(_loc2_.length);
            while(_loc6_ < _loc7_)
            {
               _loc5_ = _loc2_[_loc6_];
               _loc8_ = _13649(_loc5_);
               _loc3_.push(_loc8_[0]);
               _loc4_.push(_loc8_[1]);
               _loc6_++;
            }
         }
         param1[_101.COLOR_FRAME] = _loc3_;
         param1[_101.DISPLAY_FRAME] = _loc4_;
         return param1;
      }
      
      private static function _13649(param1:Object) : Array
      {
         var _loc2_:Object = _13646(param1);
         _loc2_[_101.COLOR] = param1[_101.COLOR];
         var _loc3_:Object = _13646(param1);
         _loc3_[_101.VALUE] = param1[_101.A_DISPLAY_INDEX];
         _loc3_[_101.A_GOTOANDPLAY] = param1[_101.A_GOTOANDPLAY];
         _loc3_[_101.A_ACTIONS] = param1[_101.A_ACTIONS];
         return [_loc2_,_loc3_];
      }
      
      private static function _13646(param1:Object) : Object
      {
         var _loc2_:Object = {};
         _loc2_[_101.A_DURATION] = param1[_101.A_DURATION];
         _loc2_[_101.A_TWEEN_EASING] = param1[_101.A_TWEEN_EASING];
         _loc2_[_101.CURVE] = param1[_101.CURVE];
         return _loc2_;
      }
      
      private static function _1767(param1:Object, param2:_86, param3:Point = null, param4:Boolean = false) : void
      {
         if(param1)
         {
            if(param2)
            {
               param2.x = _1815(param1,_101.A_X,0) || 0;
               param2.y = _1815(param1,_101.A_Y,0) || 0;
               param2.skewX = _1815(param1,_101.A_SKEW_X,0) * _101.ANGLE_TO_RADIAN || 0;
               param2.skewY = _1815(param1,_101.A_SKEW_Y,0) * _101.ANGLE_TO_RADIAN || 0;
               param2.scaleX = _1815(param1,_101.A_SCALE_X,1) || 0;
               param2.scaleY = _1815(param1,_101.A_SCALE_Y,1) || 0;
            }
            if(param3)
            {
               param3.x = _1815(param1,_101.A_PIVOT_X,0) || 0;
               param3.y = _1815(param1,_101.A_PIVOT_Y,0) || 0;
               param2.x -= param3.x;
               param2.y -= param3.y;
            }
         }
      }
      
      private static function _1815(param1:Object, param2:String, param3:Number) : Number
      {
         if(Boolean(param1) && param2 in param1)
         {
            switch(String(param1[param2]))
            {
               case "NaN":
               case "":
               case "false":
               case "null":
               case "undefined":
                  return NaN;
               default:
                  return Number(param1[param2]);
            }
         }
         else
         {
            return param3;
         }
      }
   }
}

