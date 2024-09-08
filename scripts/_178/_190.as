package _178
{
   import _204._205;
   import _204._206;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public final class _190
   {
      private static var _2766:_187;
      
      public function _190()
      {
         super();
      }
      
      public static function _1720(param1:Object, param2:Number = 1) : Object
      {
         var _loc4_:Rectangle = null;
         var _loc5_:Object = null;
         var _loc6_:String = null;
         var _loc7_:Rectangle = null;
         var _loc8_:* = false;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc3_:Object = {};
         _loc3_.__name = param1[_205.A_NAME];
         for each(_loc5_ in param1[_205.SUB_TEXTURE])
         {
            _loc6_ = _loc5_[_205.A_NAME];
            (_loc7_ = new Rectangle()).x = int(_loc5_[_205.A_X]) / param2;
            _loc7_.y = int(_loc5_[_205.A_Y]) / param2;
            _loc7_.width = int(_loc5_[_205.A_WIDTH]) / param2;
            _loc7_.height = int(_loc5_[_205.A_HEIGHT]) / param2;
            _loc8_ = _loc5_[_205.A_ROTATED] == "true";
            _loc9_ = int(_loc5_[_205.A_FRAME_WIDTH]) / param2;
            _loc10_ = int(_loc5_[_205.A_FRAME_HEIGHT]) / param2;
            if(_loc9_ > 0 && _loc10_ > 0)
            {
               (_loc4_ = new Rectangle()).x = int(_loc5_[_205.A_FRAME_X]) / param2;
               _loc4_.y = int(_loc5_[_205.A_FRAME_Y]) / param2;
               _loc4_.width = _loc9_;
               _loc4_.height = _loc10_;
            }
            else
            {
               _loc4_ = null;
            }
            _loc3_[_loc6_] = new _197(_loc7_,_loc4_,_loc8_);
         }
         return _loc3_;
      }
      
      public static function _2659(param1:Object) : _187
      {
         var _loc5_:Object = null;
         if(!param1)
         {
            throw new ArgumentError();
         }
         var _loc2_:String = param1[_205.A_VERSION];
         switch(_loc2_)
         {
            case "2.3":
            case "3.0":
               throw new Error("Nonsupport version" + _loc2_ + "!");
            case "4.0":
               var _loc3_:uint = uint(int(param1[_205.A_FRAME_RATE]));
               var _loc4_:_187;
               (_loc4_ = new _187()).name = param1[_205.A_NAME];
               _loc4_._2763 = param1[_205.A_IS_GLOBAL] == "0" ? false : true;
               _loc4_.isRelativePivot = param1[_205.A_IS_RELATIVE_PIVOT] == "1" ? true : false;
               _2766 = _loc4_;
               for each(_loc5_ in param1[_205.ARMATURE])
               {
                  _loc4_._2128(_1736(_loc5_,_loc3_));
               }
               _2766 = null;
               return _loc4_;
            default:
               throw new Error("Nonsupport version!");
         }
      }
      
      private static function _1736(param1:Object, param2:uint) : _180
      {
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         var _loc8_:_179 = null;
         var _loc3_:_180 = new _180();
         _loc3_.name = param1[_205.A_NAME];
         for each(_loc4_ in param1[_205.BONE])
         {
            _loc3_._1794(_1772(_loc4_));
         }
         for each(_loc5_ in param1[_205.SLOT])
         {
            _loc3_._1792(_1774(_loc5_));
         }
         for each(_loc6_ in param1[_205.SKIN])
         {
            _loc3_._1790(_1773(_loc6_));
         }
         if(_2766._2763)
         {
            _206._2765(_loc3_);
         }
         _loc3_._1741();
         for each(_loc7_ in param1[_205.ANIMATION])
         {
            _loc8_ = _1730(_loc7_,param2);
            _206._2767(_loc8_,_loc3_);
            _206._2764(_loc8_,_loc3_,_2766._2763);
            _loc3_._1742(_loc8_);
         }
         return _loc3_;
      }
      
      private static function _1772(param1:Object) : _181
      {
         var _loc2_:_181 = new _181();
         _loc2_.name = param1[_205.A_NAME];
         _loc2_.parent = param1[_205.A_PARENT];
         _loc2_.length = Number(param1[_205.A_LENGTH]);
         _loc2_.inheritRotation = _1798(param1,_205.A_INHERIT_ROTATION,true);
         _loc2_.inheritScale = _1798(param1,_205.A_INHERIT_SCALE,true);
         _1767(param1[_205.TRANSFORM],_loc2_.transform);
         if(_2766._2763)
         {
            _loc2_.global.copy(_loc2_.transform);
         }
         return _loc2_;
      }
      
      private static function _1773(param1:Object) : _192
      {
         var _loc3_:Object = null;
         var _loc2_:_192 = new _192();
         _loc2_.name = param1[_205.A_NAME];
         for each(_loc3_ in param1[_205.SLOT])
         {
            _loc2_._1792(_1725(_loc3_));
         }
         return _loc2_;
      }
      
      private static function _1725(param1:Object) : _193
      {
         var _loc3_:Object = null;
         var _loc2_:_193 = new _193();
         _loc2_.name = param1[_205.A_NAME];
         _loc2_.displayIndex = _1815(_loc2_,_205.A_DISPLAY_INDEX,0);
         _loc2_.zOrder = _1815(param1,_205.A_Z_ORDER,0) || 0;
         _loc2_.blendMode = param1[_205.A_BLENDMODE];
         for each(_loc3_ in param1[_205.DISPLAY])
         {
            _loc2_._1766(_1740(_loc3_));
         }
         return _loc2_;
      }
      
      private static function _1774(param1:Object) : _193
      {
         var _loc2_:_193 = new _193();
         _loc2_.name = param1[_205.A_NAME];
         _loc2_.parent = param1[_205.A_PARENT];
         _loc2_.zOrder = _1815(param1,_205.A_Z_ORDER,0) || 0;
         _loc2_.displayIndex = _1815(param1,_205.A_DISPLAY_INDEX,0);
         _loc2_.blendMode = param1[_205.A_BLENDMODE];
         return _loc2_;
      }
      
      private static function _1740(param1:Object) : _186
      {
         var _loc2_:_186 = new _186();
         _loc2_.name = param1[_205.A_NAME];
         _loc2_.type = param1[_205.A_TYPE];
         _loc2_.filterType = param1[_205.A_FILTER_TYPE];
         _1767(param1[_205.TRANSFORM],_loc2_.transform,_loc2_.pivot);
         if(_2766 != null)
         {
            _2766._1766(_loc2_);
         }
         return _loc2_;
      }
      
      private static function _1730(param1:Object, param2:uint) : _179
      {
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         var _loc8_:_189 = null;
         var _loc9_:_200 = null;
         var _loc10_:_195 = null;
         var _loc3_:_179 = new _179();
         _loc3_.name = param1[_205.A_NAME];
         _loc3_.frameRate = param2;
         _loc3_.duration = int(param1[_205.A_DURATION]) || 1;
         _loc3_.playTimes = int(_1815(param1,_205.A_LOOP,1));
         _loc3_._2715 = _1815(param1,_205.A_FADE_IN_TIME,0) || 0;
         _loc3_.scale = _1815(param1,_205.A_SCALE,1) || 0;
         _loc3_.tweenEasing = _1815(param1,_205.A_TWEEN_EASING,NaN);
         _loc3_.autoTween = _1798(param1,_205.A_AUTO_TWEEN,true);
         for each(_loc4_ in param1[_205.FRAME])
         {
            _loc8_ = _1761(_loc4_,param2);
            _loc3_.addFrame(_loc8_);
         }
         _1776(param1,_loc3_);
         _loc5_ = _loc3_.duration;
         for each(_loc6_ in param1[_205.BONE])
         {
            _loc9_ = _1716(_loc6_,_loc3_.duration,param2,_loc3_.autoTween);
            if(_loc9_._1816.length > 0)
            {
               _loc5_ = Math.min(_loc5_,_loc9_._1816[_loc9_._1816.length - 1].duration);
            }
            _loc3_._2742(_loc9_);
         }
         for each(_loc7_ in param1[_205.SLOT])
         {
            _loc10_ = _1739(_loc7_,_loc3_.duration,param2,_loc3_.autoTween);
            if(_loc10_._1816.length > 0)
            {
               _loc5_ = Math.min(_loc5_,_loc10_._1816[_loc10_._1816.length - 1].duration);
            }
            _loc3_._2677(_loc10_);
         }
         if(_loc3_._1816.length > 0)
         {
            _loc5_ = Math.min(_loc5_,_loc3_._1816[_loc3_._1816.length - 1].duration);
         }
         _loc3_._1735 = _loc5_;
         return _loc3_;
      }
      
      private static function _1716(param1:Object, param2:int, param3:uint, param4:Boolean) : _200
      {
         var _loc6_:Object = null;
         var _loc7_:_199 = null;
         var _loc5_:_200;
         (_loc5_ = new _200()).name = param1[_205.A_NAME];
         _loc5_.scale = _1815(param1,_205.A_SCALE,1) || 0;
         _loc5_.offset = _1815(param1,_205.A_OFFSET,0) || 0;
         _loc5_._1797.x = _1815(param1,_205.A_PIVOT_X,0) || 0;
         _loc5_._1797.y = _1815(param1,_205.A_PIVOT_Y,0) || 0;
         _loc5_.duration = param2;
         for each(_loc6_ in param1[_205.FRAME])
         {
            _loc7_ = _1728(_loc6_,param3,param4);
            _loc5_.addFrame(_loc7_);
         }
         _1776(param1,_loc5_);
         return _loc5_;
      }
      
      private static function _1739(param1:Object, param2:int, param3:uint, param4:Boolean) : _195
      {
         var _loc6_:Object = null;
         var _loc7_:_194 = null;
         var _loc5_:_195;
         (_loc5_ = new _195()).name = param1[_205.A_NAME];
         _loc5_.scale = _1815(param1,_205.A_SCALE,1) || 0;
         _loc5_.offset = _1815(param1,_205.A_OFFSET,0) || 0;
         _loc5_.duration = param2;
         for each(_loc6_ in param1[_205.FRAME])
         {
            _loc7_ = _1759(_loc6_,param3,param4);
            _loc5_.addFrame(_loc7_);
         }
         _1776(param1,_loc5_);
         return _loc5_;
      }
      
      private static function _1761(param1:Object, param2:uint) : _189
      {
         var _loc3_:_189 = new _189();
         _1801(param1,_loc3_,param2);
         return _loc3_;
      }
      
      private static function _1728(param1:Object, param2:uint, param3:Boolean) : _199
      {
         var _loc4_:_199 = new _199();
         _1801(param1,_loc4_,param2);
         _loc4_.visible = !_1798(param1,_205.A_HIDE,false);
         _loc4_.tweenEasing = _1815(param1,_205.A_TWEEN_EASING,NaN);
         if(param3 && isNaN(_loc4_.tweenEasing))
         {
            _loc4_.tweenEasing = 10;
         }
         _loc4_.tweenRotate = int(_1815(param1,_205.A_TWEEN_ROTATE,0));
         _loc4_.tweenScale = _1798(param1,_205.A_TWEEN_SCALE,true);
         _loc4_.displayIndex = int(_1815(param1,_205.A_DISPLAY_INDEX,0));
         _1767(param1[_205.TRANSFORM],_loc4_.transform,_loc4_.pivot);
         if(_2766._2763)
         {
            _loc4_.global.copy(_loc4_.transform);
         }
         _loc4_._1787.x = _1815(param1,_205.A_SCALE_X_OFFSET,0) || 0;
         _loc4_._1787.y = _1815(param1,_205.A_SCALE_Y_OFFSET,0) || 0;
         return _loc4_;
      }
      
      private static function _1759(param1:Object, param2:uint, param3:Boolean) : _194
      {
         var _loc4_:_194 = new _194();
         _1801(param1,_loc4_,param2);
         _loc4_.visible = !_1798(param1,_205.A_HIDE,false);
         _loc4_.tweenEasing = _1815(param1,_205.A_TWEEN_EASING,NaN);
         if(param3 && isNaN(_loc4_.tweenEasing))
         {
            _loc4_.tweenEasing = 10;
         }
         _loc4_.displayIndex = int(_1815(param1,_205.A_DISPLAY_INDEX,0));
         _loc4_.zOrder = _1815(param1,_205.A_Z_ORDER,_2766._2763 ? NaN : 0);
         var _loc5_:Object = param1[_205.COLOR];
         if(_loc5_)
         {
            _loc4_.color = new ColorTransform();
            _1727(_loc5_,_loc4_.color);
         }
         return _loc4_;
      }
      
      private static function _1776(param1:Object, param2:_198) : void
      {
         var _loc4_:_189 = null;
         var _loc3_:int = 0;
         for each(_loc4_ in param2._1816)
         {
            _loc4_.position = _loc3_;
            _loc3_ += _loc4_.duration;
         }
      }
      
      private static function _1801(param1:Object, param2:_189, param3:uint) : void
      {
         param2.duration = int(param1[_205.A_DURATION]);
         param2.action = param1[_205.A_ACTION];
         param2.event = param1[_205.A_EVENT];
         param2.sound = param1[_205.A_SOUND];
      }
      
      private static function _1767(param1:Object, param2:_184, param3:Point = null) : void
      {
         if(param1)
         {
            if(param2)
            {
               param2.x = _1815(param1,_205.A_X,0) || 0;
               param2.y = _1815(param1,_205.A_Y,0) || 0;
               param2.skewX = _1815(param1,_205.A_SKEW_X,0) * _205.ANGLE_TO_RADIAN || 0;
               param2.skewY = _1815(param1,_205.A_SKEW_Y,0) * _205.ANGLE_TO_RADIAN || 0;
               param2.scaleX = _1815(param1,_205.A_SCALE_X,1) || 0;
               param2.scaleY = _1815(param1,_205.A_SCALE_Y,1) || 0;
            }
            if(param3)
            {
               param3.x = _1815(param1,_205.A_PIVOT_X,0) || 0;
               param3.y = _1815(param1,_205.A_PIVOT_Y,0) || 0;
            }
         }
      }
      
      private static function _1727(param1:Object, param2:ColorTransform) : void
      {
         if(param1)
         {
            if(param2)
            {
               param2.alphaOffset = int(param1[_205.A_ALPHA_OFFSET]);
               param2.redOffset = int(param1[_205.A_RED_OFFSET]);
               param2.greenOffset = int(param1[_205.A_GREEN_OFFSET]);
               param2.blueOffset = int(param1[_205.A_BLUE_OFFSET]);
               param2.alphaMultiplier = _1815(param1,_205.A_ALPHA_MULTIPLIER,100);
               param2.redMultiplier = _1815(param1,_205.A_RED_MULTIPLIER,100);
               param2.greenMultiplier = _1815(param1,_205.A_GREEN_MULTIPLIER,100);
               param2.blueMultiplier = _1815(param1,_205.A_BLUE_MULTIPLIER,100);
            }
         }
      }
      
      private static function _1798(param1:Object, param2:String, param3:Boolean) : Boolean
      {
         if(Boolean(param1) && param2 in param1)
         {
            switch(String(param1[param2]))
            {
               case "0":
               case "NaN":
               case "":
               case "false":
               case "null":
               case "undefined":
                  return false;
               case "1":
               case "true":
            }
            return true;
         }
         return param3;
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

