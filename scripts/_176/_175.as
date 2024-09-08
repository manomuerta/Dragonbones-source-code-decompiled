package _176
{
   import _11220._11219;
   import _178._179;
   import _178._180;
   import _178._181;
   import _178._184;
   import _178._186;
   import _178._187;
   import _178._189;
   import _178._190;
   import _178._192;
   import _178._193;
   import _178._194;
   import _178._195;
   import _178._199;
   import _178._200;
   import _178._201;
   import _204._205;
   import _204._208;
   import _204._209;
   import _204._211;
   import _35._37;
   import _40.BoneFrameVO;
   import _40._10598;
   import _40._10599;
   import _40._39;
   import _40._41;
   import _40._42;
   import _40._43;
   import _40._44;
   import _40._45;
   import _40._47;
   import _40._48;
   import _51._50;
   import _51._52;
   import _51._69;
   import _51._70;
   import _51._71;
   import _51._77;
   import _51._78;
   import _51._79;
   import _54._53;
   import _54._56;
   import _54._57;
   import _54._67;
   import _658._661;
   import _73.BoundingBoxType;
   import _73.SymbolType;
   import _73._74;
   import _73._75;
   import _81._83;
   import _81._86;
   import _97._100;
   import _97._101;
   import _97._10600;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.IBitmapDrawable;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class _175
   {
      public static var currentVersion:String;
      
      private static var frameRate:int;
      
      public static var _11126:Object = new Object();
      
      public static var _11127:String = "./image/";
      
      public function _175()
      {
         super();
      }
      
      public static function _1771(param1:*, param2:_37, param3:Object) : Object
      {
         var _loc4_:Object = null;
         var _loc5_:_187 = null;
         var _loc6_:String = null;
         var _loc7_:Boolean = false;
         var _loc8_:XML = null;
         var _loc9_:Object = null;
         if(param1 is XML)
         {
            _loc6_ = param1[_205.A_VERSION];
            switch(_loc6_)
            {
               case _101.DATA_VERSION_2_3:
               case _101.DATA_VERSION_3_0:
                  _loc8_ = _208._2274(XML(param1));
                  _loc5_ = _201._2659(_loc8_);
                  _loc7_ = true;
                  break;
               case _101.DATA_VERSION_4_0:
               case _101.DATA_VERSION_4_5:
               case _101.DATA_VERSION_5_0:
                  _loc8_ = XML(param1);
                  _loc4_ = _201._2717(_loc8_);
            }
         }
         else if(param1 is Object)
         {
            _loc6_ = param1.version;
            switch(_loc6_)
            {
               case _101.DATA_VERSION_2_3:
               case _101.DATA_VERSION_3_0:
                  _loc9_ = _208._2272(param1);
                  _loc5_ = _190._2659(_loc9_);
                  _loc7_ = true;
                  break;
               case _101.DATA_VERSION_4_0:
               case _101.DATA_VERSION_4_5:
               case _101.DATA_VERSION_5_0:
               case _101.DATA_VERSION_5_5:
                  _loc4_ = _loc9_ = param1;
            }
         }
         if(_loc7_)
         {
            if(_loc7_)
            {
               if(param2)
               {
                  _2654(_loc5_,param2);
               }
               else if(param3)
               {
                  _2657(_loc5_,param3);
               }
            }
            _loc5_._2655();
            _loc4_ = _2663(_loc5_,_loc7_);
         }
         return _loc4_;
      }
      
      private static function _2657(param1:_187, param2:Object) : void
      {
         var _loc3_:Vector.<_192> = null;
         var _loc4_:Vector.<_193> = null;
         var _loc5_:_193 = null;
         var _loc6_:_186 = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:Object = null;
         var _loc16_:Matrix = null;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Point = null;
         var _loc7_:int = 0;
         var _loc8_:int = int(param1._2126.length);
         while(_loc7_ < _loc8_)
         {
            _loc3_ = param1._2126[_loc7_]._1781;
            _loc9_ = 0;
            _loc10_ = int(_loc3_.length);
            while(_loc9_ < _loc10_)
            {
               _loc4_ = _loc3_[_loc9_]._1780;
               _loc11_ = 0;
               _loc12_ = int(_loc4_.length);
               while(_loc11_ < _loc12_)
               {
                  _loc5_ = _loc4_[_loc11_] as _193;
                  _loc13_ = 0;
                  _loc14_ = int(_loc5_._1752.length);
                  while(_loc13_ < _loc14_)
                  {
                     _loc6_ = _loc5_._1752[_loc13_];
                     _loc15_ = _2658(_loc6_.name,param2);
                     if(_loc15_)
                     {
                        if(param1.isRelativePivot)
                        {
                           _loc16_ = new Matrix();
                           _209._2013(_loc6_.transform,_loc16_);
                           _loc17_ = (_loc6_.pivot.x - 0.5) * _loc15_.width;
                           _loc18_ = (_loc6_.pivot.y - 0.5) * _loc15_.height;
                           _loc19_ = new Point(_loc17_,_loc18_);
                           _loc19_ = _loc16_.transformPoint(_loc19_);
                           _loc6_.pivot.x = _loc19_.x - _loc6_.transform.x;
                           _loc6_.pivot.y = _loc19_.y - _loc6_.transform.y;
                           if(isNaN(_loc6_.pivot.x))
                           {
                              _loc6_.pivot.x = 0;
                           }
                           if(isNaN(_loc6_.pivot.y))
                           {
                              _loc6_.pivot.y = 0;
                           }
                        }
                        else
                        {
                           _loc6_.pivot.x -= _loc15_.width / 2;
                           _loc6_.pivot.y -= _loc15_.height / 2;
                        }
                     }
                     _loc13_++;
                  }
                  _loc11_++;
               }
               _loc9_++;
            }
            _loc7_++;
         }
      }
      
      private static function _2658(param1:String, param2:Object) : Object
      {
         var _loc3_:RegExp = null;
         var _loc4_:String = null;
         for(_loc4_ in param2)
         {
            if(_loc4_ == param1)
            {
               return param2[_loc4_];
            }
            _loc3_ = new RegExp("/" + param1 + "$");
            if(_loc4_.search(_loc3_) >= 0)
            {
               return param2[_loc4_];
            }
         }
         return null;
      }
      
      private static function _2654(param1:_187, param2:_37) : void
      {
         var _loc3_:Vector.<_192> = null;
         var _loc4_:Vector.<_193> = null;
         var _loc5_:_193 = null;
         var _loc6_:_186 = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:BitmapData = null;
         var _loc16_:Rectangle = null;
         var _loc17_:Matrix = null;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Point = null;
         var _loc7_:int = 0;
         var _loc8_:int = int(param1._2126.length);
         while(_loc7_ < _loc8_)
         {
            _loc3_ = param1._2126[_loc7_]._1781;
            _loc9_ = 0;
            _loc10_ = int(_loc3_.length);
            while(_loc9_ < _loc10_)
            {
               _loc4_ = _loc3_[_loc9_]._1780;
               _loc11_ = 0;
               _loc12_ = int(_loc4_.length);
               while(_loc11_ < _loc12_)
               {
                  _loc5_ = _loc4_[_loc11_] as _193;
                  _loc13_ = 0;
                  _loc14_ = int(_loc5_._1752.length);
                  while(_loc13_ < _loc14_)
                  {
                     _loc6_ = _loc5_._1752[_loc13_];
                     _loc15_ = param2.getBitmapData(_loc6_.name);
                     _loc16_ = param2.getFrame(_loc6_.name);
                     if(_loc16_ == null)
                     {
                        _loc16_ = param2.getRegion(_loc6_.name);
                     }
                     if(_loc16_)
                     {
                        if(param1.isRelativePivot)
                        {
                           _loc17_ = new Matrix();
                           _209._2013(_loc6_.transform,_loc17_);
                           _loc18_ = (_loc6_.pivot.x - 0.5) * _loc16_.width;
                           _loc19_ = (_loc6_.pivot.y - 0.5) * _loc16_.height;
                           _loc20_ = new Point(_loc18_,_loc19_);
                           _loc20_ = _loc17_.transformPoint(_loc20_);
                           _loc6_.pivot.x = _loc20_.x - _loc6_.transform.x;
                           _loc6_.pivot.y = _loc20_.y - _loc6_.transform.y;
                           if(isNaN(_loc6_.pivot.x))
                           {
                              _loc6_.pivot.x = 0;
                           }
                           if(isNaN(_loc6_.pivot.y))
                           {
                              _loc6_.pivot.y = 0;
                           }
                        }
                        else
                        {
                           _loc6_.pivot.x -= _loc16_.width / 2;
                           _loc6_.pivot.y -= _loc16_.height / 2;
                        }
                     }
                     _loc13_++;
                  }
                  _loc11_++;
               }
               _loc9_++;
            }
            _loc7_++;
         }
      }
      
      public static function _2663(param1:_187, param2:Boolean) : Object
      {
         var _loc6_:Object = null;
         var _loc3_:Object = {};
         _loc3_[_205.A_VERSION] = _101.DATA_VERSION_5_0;
         _loc3_[_205.A_NAME] = param1.name;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc3_[_205.ARMATURE] = [];
         _loc4_ = 0;
         _loc5_ = int(param1._2126.length);
         while(_loc4_ < _loc5_)
         {
            _loc6_ = {};
            _2671(param1._2126[_loc4_],_loc6_,param2);
            _loc3_[_205.ARMATURE].push(_loc6_);
            _loc4_++;
         }
         _loc3_[_205.A_FRAME_RATE] = frameRate;
         _loc3_[_205.A_IS_GLOBAL] = false;
         return _loc3_;
      }
      
      private static function _2671(param1:_180, param2:Object, param3:Boolean) : void
      {
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         var _loc8_:Object = null;
         var _loc9_:Object = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         param2[_205.A_NAME] = param1.name;
         param2[_205.BONE] = [];
         param2[_205.SLOT] = [];
         param2[_205.SKIN] = [];
         param2[_205.ANIMATION] = [];
         _loc4_ = 0;
         _loc5_ = int(param1._1779.length);
         while(_loc4_ < _loc5_)
         {
            _loc6_ = {};
            _2699(param1._1779[_loc4_],_loc6_);
            param2[_205.BONE].push(_loc6_);
            _loc4_++;
         }
         _loc4_ = 0;
         _loc5_ = int(param1._1780.length);
         while(_loc4_ < _loc5_)
         {
            _loc7_ = {};
            _2698(param1._1780[_loc4_],_loc7_);
            param2[_205.SLOT].push(_loc7_);
            _loc4_++;
         }
         if(param3)
         {
            param2[_205.SLOT].sortOn("z",Array.NUMERIC);
         }
         _loc4_ = 0;
         _loc5_ = int(param1._1781.length);
         while(_loc4_ < _loc5_)
         {
            _loc8_ = {};
            _2697(param1._1781[_loc4_],_loc8_);
            param2[_205.SKIN].push(_loc8_);
            _loc4_++;
         }
         _loc4_ = 0;
         _loc5_ = int(param1._1963.length);
         while(_loc4_ < _loc5_)
         {
            _loc9_ = {};
            _2668(param1._1963[_loc4_],_loc9_,param2[_205.SLOT],param3);
            param2[_205.ANIMATION].push(_loc9_);
            _loc4_++;
         }
      }
      
      private static function _2699(param1:_181, param2:Object) : void
      {
         param2[_205.A_NAME] = param1.name;
         param2[_205.A_PARENT] = param1.parent;
         param2[_205.A_LENGTH] = param1.length;
         param2[_205.TRANSFORM] = _2691(param1.transform);
         param2[_205.A_INHERIT_ROTATION] = param1.inheritRotation;
         param2[_205.A_INHERIT_SCALE] = param1.inheritScale;
      }
      
      private static function _2698(param1:_193, param2:Object) : void
      {
         param2[_205.A_NAME] = param1.name;
         param2[_205.A_PARENT] = param1.parent;
         param2[_205.A_Z_ORDER] = param1.zOrder;
         param2[_205.A_BLENDMODE] = param1.blendMode;
         param2[_205.A_DISPLAY_INDEX] = param1.displayIndex;
      }
      
      private static function _2697(param1:_192, param2:Object) : void
      {
         var _loc5_:Object = null;
         if(param1.name == "default")
         {
            param1.name = "";
         }
         param2[_205.A_NAME] = param1.name;
         param2[_205.SLOT] = [];
         var _loc3_:int = 0;
         var _loc4_:int = int(param1._1780.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = {};
            _2696(param1._1780[_loc3_],_loc5_);
            param2[_205.SLOT].push(_loc5_);
            _loc3_++;
         }
      }
      
      private static function _2696(param1:_193, param2:Object) : void
      {
         var _loc5_:Object = null;
         _2698(param1,param2);
         param2[_205.DISPLAY] = [];
         var _loc3_:int = 0;
         var _loc4_:int = int(param1._1752.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = {};
            _2701(param1._1752[_loc3_],_loc5_);
            param2[_205.DISPLAY].push(_loc5_);
            _loc3_++;
         }
      }
      
      private static function _2701(param1:_186, param2:Object) : void
      {
         param2[_205.A_NAME] = param1.name;
         param2[_205.A_TYPE] = param1.type;
         param2[_205.A_FILTER_TYPE] = param1.filterType;
         param2[_205.TRANSFORM] = _2691(param1.transform);
         param2[_205.TRANSFORM][_205.A_PIVOT_X] = param1.pivot.x;
         param2[_205.TRANSFORM][_205.A_PIVOT_Y] = param1.pivot.y;
      }
      
      private static function _2668(param1:_179, param2:Object, param3:Array, param4:Boolean) : void
      {
         var _loc8_:Object = null;
         var _loc9_:Object = null;
         var _loc10_:Object = null;
         var _loc11_:Object = null;
         var _loc12_:Object = null;
         param2[_205.A_NAME] = param1.name;
         frameRate = param1.frameRate;
         param2[_205.A_DURATION] = int(param1.duration);
         param2[_205.A_PLAY_TIMES] = param1.playTimes;
         param2[_205.A_FADE_IN_TIME] = param1._2715;
         param2[_205.A_SCALE] = param1.scale;
         param2[_205.A_TWEEN_EASING] = param1.tweenEasing;
         param2[_205.FRAME] = [];
         param2[_205.BONE] = [];
         param2[_205.SLOT] = [];
         var _loc5_:int = 0;
         var _loc6_:int = int(param1._1816.length);
         while(_loc5_ < _loc6_)
         {
            _loc8_ = {};
            _2711(param1._1816[_loc5_],_loc8_);
            param2[_205.FRAME].push(_loc8_);
            _loc5_++;
         }
         _loc5_ = 0;
         _loc6_ = int(param1._2695.length);
         while(_loc5_ < _loc6_)
         {
            _loc9_ = {};
            _2672(param1._2695[_loc5_],_loc9_);
            param2[_205.BONE].push(_loc9_);
            _loc5_++;
         }
         var _loc7_:Object = {};
         _loc5_ = 0;
         _loc6_ = int(param1._1745.length);
         while(_loc5_ < _loc6_)
         {
            _loc10_ = {};
            _2673(param1._1745[_loc5_],_loc10_);
            _loc7_[_loc10_[_205.A_NAME]] = true;
            param2[_205.SLOT].push(_loc10_);
            _loc5_++;
         }
         if(param4)
         {
            _loc5_ = 0;
            _loc6_ = int(param3.length);
            while(_loc5_ < _loc6_)
            {
               if(!_loc7_[param3[_loc5_].name])
               {
                  (_loc11_ = {})[_205.A_NAME] = param3[_loc5_].name;
                  _loc11_[_205.A_SCALE] = 1;
                  _loc11_[_205.A_OFFSET] = 0;
                  (_loc12_ = {})[_205.A_HIDE] = 1;
                  _loc12_[_205.A_TWEEN_EASING] = 1;
                  _loc12_[_205.A_DISPLAY_INDEX] = -1;
                  _loc12_[_205.A_Z_ORDER] = 0;
                  _loc11_[_205.FRAME] = [_loc12_];
                  param2[_205.SLOT].push(_loc11_);
               }
               _loc5_++;
            }
         }
      }
      
      private static function _2672(param1:_200, param2:Object) : void
      {
         var _loc5_:Object = null;
         param2[_205.A_NAME] = param1.name;
         param2[_205.A_SCALE] = param1.scale;
         param2[_205.A_OFFSET] = param1.offset;
         param2[_205.A_PIVOT_X] = param1._1797.x;
         param2[_205.A_PIVOT_Y] = param1._1797.y;
         param2[_205.FRAME] = [];
         var _loc3_:int = 0;
         var _loc4_:int = int(param1._1816.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = {};
            _2693(param1._1816[_loc3_] as _199,_loc5_,param1._1904);
            param2[_205.FRAME].push(_loc5_);
            _loc3_++;
         }
      }
      
      private static function _2693(param1:_199, param2:Object, param3:_184) : void
      {
         _2711(param1,param2);
         param2[_205.A_TWEEN_EASING] = param1.tweenEasing;
         param2[_205.A_TWEEN_ROTATE] = param1.tweenRotate;
         param2[_205.A_TWEEN_SCALE] = param1.tweenScale;
         param2[_205.TRANSFORM] = _2691(param1.transform);
         var _loc4_:Object;
         (_loc4_ = param2[_205.TRANSFORM])[_205.A_X] = _loc4_[_205.A_X] + param3.x;
         _loc4_[_205.A_Y] += param3.y;
         _loc4_[_205.A_SKEW_X] += param3.skewX * _205.RADIAN_TO_ANGLE;
         _loc4_[_205.A_SKEW_Y] += param3.skewY * _205.RADIAN_TO_ANGLE;
         _loc4_[_205.A_SCALE_X] *= param3.scaleX;
         _loc4_[_205.A_SCALE_Y] *= param3.scaleY;
      }
      
      private static function _2673(param1:_195, param2:Object) : void
      {
         var _loc5_:Object = null;
         param2[_205.A_NAME] = param1.name;
         param2[_205.A_SCALE] = param1.scale;
         param2[_205.A_OFFSET] = param1.offset;
         param2[_205.FRAME] = [];
         var _loc3_:int = 0;
         var _loc4_:int = int(param1._1816.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = {};
            _2692(param1._1816[_loc3_] as _194,_loc5_);
            param2[_205.FRAME].push(_loc5_);
            _loc3_++;
         }
      }
      
      private static function _2692(param1:_194, param2:Object) : void
      {
         _2711(param1,param2);
         param2[_205.A_TWEEN_EASING] = param1.tweenEasing;
         param2[_205.A_DISPLAY_INDEX] = param1.displayIndex;
         if(!param1.visible)
         {
            param2[_205.A_DISPLAY_INDEX] = -1;
         }
         param2[_205.A_Z_ORDER] = param1.zOrder;
         if(param1.color)
         {
            param2[_205.COLOR] = _2664(param1.color);
         }
      }
      
      private static function _2664(param1:ColorTransform) : Object
      {
         var _loc2_:Object = {};
         _loc2_[_205.A_ALPHA_OFFSET] = param1.alphaOffset;
         _loc2_[_205.A_RED_OFFSET] = param1.redOffset;
         _loc2_[_205.A_GREEN_OFFSET] = param1.greenOffset;
         _loc2_[_205.A_BLUE_OFFSET] = param1.blueOffset;
         _loc2_[_205.A_ALPHA_MULTIPLIER] = param1.alphaMultiplier;
         _loc2_[_205.A_RED_MULTIPLIER] = param1.redMultiplier;
         _loc2_[_205.A_GREEN_MULTIPLIER] = param1.greenMultiplier;
         _loc2_[_205.A_BLUE_MULTIPLIER] = param1.blueMultiplier;
         return _loc2_;
      }
      
      private static function _2711(param1:_189, param2:Object) : void
      {
         param2[_205.A_DURATION] = int(param1.duration);
         param2[_205.A_ACTION] = param1.action;
         param2[_205.A_EVENT] = param1.event;
         param2[_205.A_SOUND] = param1.sound;
      }
      
      private static function _2691(param1:_184) : Object
      {
         var _loc2_:Object = {};
         _loc2_[_205.A_X] = param1.x;
         _loc2_[_205.A_Y] = param1.y;
         _loc2_[_205.A_SKEW_X] = param1.skewX * _205.RADIAN_TO_ANGLE;
         _loc2_[_205.A_SKEW_Y] = param1.skewY * _205.RADIAN_TO_ANGLE;
         _loc2_[_205.A_SCALE_X] = param1.scaleX;
         _loc2_[_205.A_SCALE_Y] = param1.scaleY;
         return _loc2_;
      }
      
      public static function _2670(param1:_71, param2:String, param3:Boolean, param4:Boolean) : Object
      {
         var _loc5_:_71 = null;
         if(param1._2126.length == 1 && param1._2126[0]._1811 == SymbolType.COMIC)
         {
            (_loc5_ = param1._2126[0]._1763._10440()).name = param1.name;
            _loc5_.version = "4.5";
            _loc5_.frameRate = param1.frameRate;
            return _10458(_loc5_,"4.5",param3,param4);
         }
         return _10458(param1,param2,param3,param4);
      }
      
      private static function _10458(param1:_71, param2:String, param3:Boolean, param4:Boolean) : Object
      {
         var _loc8_:Object = null;
         var _loc5_:Object;
         (_loc5_ = {})[_205.A_VERSION] = param2;
         currentVersion = param2;
         _loc5_[_205.A_NAME] = param1.name;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         _loc5_[_205.ARMATURE] = [];
         _loc6_ = 0;
         _loc7_ = int(param1._2126.length);
         while(_loc6_ < _loc7_)
         {
            _loc8_ = {};
            _2684(param1._2126[_loc6_],_loc8_,param3);
            _loc5_[_205.ARMATURE].push(_loc8_);
            _loc6_++;
         }
         _loc5_[_205.A_FRAME_RATE] = param1.frameRate > 0 ? param1.frameRate : 24;
         _loc5_[_205.A_IS_GLOBAL] = 0;
         if(param3)
         {
            _loc5_[_205.A_EXTRA] = true;
         }
         if(param4)
         {
            _211._2694(_loc5_);
         }
         return _loc5_;
      }
      
      public static function _2684(param1:_50, param2:Object, param3:Boolean) : void
      {
         var _loc8_:Boolean = false;
         var _loc9_:* = undefined;
         var _loc10_:Object = null;
         var _loc11_:Object = null;
         var _loc12_:Object = null;
         var _loc13_:Object = null;
         var _loc14_:Object = null;
         var _loc15_:Object = null;
         var _loc16_:Object = null;
         var _loc17_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Array = param1._10659;
         param1._10663(param1._10658);
         param2[_205.A_NAME] = param1.name;
         param2[_205.A_TYPE] = param1._1811.toString();
         var _loc7_:Object;
         (_loc7_ = {})[_205.A_GOTOANDPLAY] = param1.defaultAnimation;
         param2[_205.A_DEFAULT_ACTIONS] = [_loc7_];
         param2[_205.A_FRAME_RATE] = param1.frameRate > 0 ? param1.frameRate : 24;
         param2[_205.BONE] = [];
         param2[_205.IK] = [];
         param2[_205.SLOT] = [];
         param2[_205.SKIN] = [];
         param2[_205.ANIMATION] = [];
         if(param1._13655)
         {
            param2[_205.A_LIBRARY_PARENT] = param1._13655.name;
         }
         if(param1.libraryParentType)
         {
            param2[_205.A_LIBRARY_PARENT_TYPE] = param1.libraryParentType;
         }
         if(param1._1811 == SymbolType.COMIC)
         {
            param1.aabb = new Rectangle();
            if(param1._2000)
            {
               param1.aabb.width = param1._2000.width;
               param1.aabb.height = param1._2000.height;
            }
         }
         if(param1._1811 == SymbolType.SHEET && param3)
         {
            param2[_205.A_PLAY_TIMES] = param1.playTimes;
         }
         if(param1.aabb)
         {
            param2[_205.AABB] = {
               "x":param1.aabb.x,
               "y":param1.aabb.y,
               "width":param1.aabb.width,
               "height":param1.aabb.height
            };
         }
         if(param3)
         {
            param2[_205.A_ID] = param1.id;
         }
         _loc4_ = 0;
         _loc5_ = int(param1._1779.length);
         while(_loc4_ < _loc5_)
         {
            _loc10_ = {};
            _2702(param1._1779[_loc4_],_loc10_,param3);
            param2[_205.BONE].push(_loc10_);
            _loc4_++;
         }
         _loc4_ = 0;
         _loc5_ = int(param1._1999.length);
         while(_loc4_ < _loc5_)
         {
            _loc11_ = {};
            _2714(param1._1999[_loc4_],_loc11_,param3);
            param2[_205.IK].push(_loc11_);
            _loc4_++;
         }
         _loc4_ = 0;
         _loc5_ = int(param1._1780.length);
         while(_loc4_ < _loc5_)
         {
            _loc12_ = {};
            _2703(param1._1780[_loc4_],_loc4_,_loc12_,true,param3);
            param2[_205.SLOT].push(_loc12_);
            _loc4_++;
         }
         var _loc18_:int = 0;
         var _loc19_:* = param1._1795._1765;
         for(_loc9_ in _loc19_)
         {
            _loc8_ = true;
         }
         if(param1._1781.length == 1 && !_loc8_)
         {
            _loc13_ = {};
            _2704(param1._1781[0],_loc13_,param3);
            _loc13_[_205.A_NAME] = "";
            param2[_205.SKIN].push(_loc13_);
         }
         else
         {
            if(_loc8_ && (param1._1781 == null || param1._1781.length == 0))
            {
               _loc14_ = {};
               _2704(param1._1795,_loc14_,param3);
               param2[_205.SKIN].push(_loc14_);
            }
            _loc4_ = 0;
            _loc5_ = int(param1._1781.length);
            while(_loc4_ < _loc5_)
            {
               _loc15_ = {};
               _2704(param1._1781[_loc4_],_loc15_,param3);
               param2[_205.SKIN].push(_loc15_);
               _loc4_++;
            }
         }
         if(param1._1811 != SymbolType.COMIC)
         {
            _loc4_ = 0;
            _loc5_ = int(param1._1963.length);
            while(_loc4_ < _loc5_)
            {
               _loc16_ = {};
               _2681(param1._1963[_loc4_],_loc16_,param1._10658,param3);
               param2[_205.ANIMATION].push(_loc16_);
               _loc4_++;
            }
         }
         else if(param3)
         {
            _loc17_ = [];
            if(param1._1763)
            {
               _2661(param1._1763,_loc17_);
               param2[_205.COMIC_ANIMATION] = _loc17_;
            }
         }
         else
         {
            _loc4_ = 0;
            _loc5_ = int(param1._1963.length);
            while(_loc4_ < _loc5_)
            {
               _loc16_ = {};
               _2681(param1._1963[_loc4_],_loc16_,null,param3);
               param2[_205.ANIMATION].push(_loc16_);
               _loc4_++;
            }
            param2[_205.A_COMIC_EXTEND] = param1._1763._2046();
         }
         param1._10663(_loc6_);
         param1._10665 = false;
         if(param1._1811 != SymbolType.STAGE)
         {
            param2[_101.CANVAS] = _13238(param1,param3);
            if(param2[_101.CANVAS] == null)
            {
               delete param2[_101.CANVAS];
            }
         }
      }
      
      private static function _13238(param1:_50, param2:Boolean) : Object
      {
         if(param1._1811 != SymbolType.STAGE)
         {
            if(Boolean(param1._2000) && param1._2000.opened)
            {
               if(param2)
               {
                  return param1._2000._10373();
               }
               return param1._2000._13237();
            }
         }
         return null;
      }
      
      private static function _2702(param1:_52, param2:Object, param3:Boolean) : void
      {
         param2[_205.A_NAME] = param1.name;
         if(param1.parentBoneData)
         {
            param2[_205.A_PARENT] = param1.parentBoneData.name;
         }
         if(param1.length > 0)
         {
            param2[_205.A_LENGTH] = param1.length;
         }
         param2[_205.TRANSFORM] = _2678(param1._1724,param3);
         param2[_205.A_INHERIT_ROTATION] = param1.inheritRotation;
         param2[_205.A_INHERIT_SCALE] = param1.inheritScale;
         if(param3)
         {
            param2[_205.A_ID] = param1.id;
         }
      }
      
      private static function _2714(param1:_77, param2:Object, param3:Boolean) : void
      {
         param2[_205.A_NAME] = param1.name;
         param2[_205.A_IK_TARGET] = param1.target.name;
         if(param1.bones.length > 1)
         {
            param2[_205.A_IK_CHAIN] = 1;
            param2[_205.A_IK_BONE] = param1.bones[1].name;
         }
         else
         {
            param2[_205.A_IK_BONE] = param1.bones[0].name;
         }
         if(param1.bendDirection != 1)
         {
            param2[_205.A_IK_BENDPOSITIVE] = "false";
         }
         if(param1.weight != 1)
         {
            param2[_205.A_IK_WEIGHT] = param1.weight;
         }
         if(param3)
         {
            param2[_205.A_ID] = param1.id;
         }
      }
      
      private static function _2703(param1:_79, param2:int, param3:Object, param4:Boolean, param5:Boolean) : void
      {
         var _loc6_:Object = null;
         param3[_205.A_NAME] = param1.name;
         if(param1.parentBoneData)
         {
            param3[_205.A_PARENT] = param1.parentBoneData.name;
         }
         if(param1._1711)
         {
            param3[_205.A_DISPLAY_INDEX] = param1._1711.displayIndex;
         }
         else
         {
            param3[_205.A_DISPLAY_INDEX] = -1;
         }
         param3[_205.A_Z_ORDER] = param2;
         if(param4)
         {
            param3[_205.COLOR] = _2662(param1._2152,param5);
         }
         if(Boolean(param1.blendMode) && param1.blendMode != BlendMode.NORMAL)
         {
            param3[_205.A_BLENDMODE] = param1.blendMode;
         }
         if(param1.gotoAndPlay)
         {
            (_loc6_ = {})[_205.A_GOTOANDPLAY] = param1.gotoAndPlay;
            param3[_205.A_ACTIONS] = [_loc6_];
         }
         if(param5)
         {
            param3[_205.A_ID] = param1.id;
            param3[_101.ONLY_BOUNDINGBOX] = param1.onlyBoundingBox;
         }
      }
      
      private static function _2704(param1:_78, param2:Object, param3:Boolean) : void
      {
         var _loc4_:* = undefined;
         var _loc5_:Object = null;
         param2[_205.A_NAME] = param1.name;
         param2[_205.SLOT] = [];
         for(_loc4_ in param1._1765)
         {
            if(param1._1765[_loc4_] != null)
            {
               _loc5_ = {};
               _2683(_loc4_,param1._1765[_loc4_],_loc5_,param3);
               param2[_205.SLOT].push(_loc5_);
            }
         }
         if(param3)
         {
            param2[_205.A_ID] = param1.id;
         }
      }
      
      private static function _2683(param1:_79, param2:Dictionary, param3:Object, param4:Boolean) : void
      {
         var _loc5_:_70 = null;
         var _loc6_:_69 = null;
         var _loc9_:Object = null;
         _2703(param1,0,param3,false,param4);
         delete param3[_205.A_DISPLAY_INDEX];
         delete param3[_205.A_PARENT];
         delete param3[_205.A_Z_ORDER];
         param3[_205.DISPLAY] = [];
         var _loc7_:int = 0;
         var _loc8_:int = int(param1._1715.length);
         while(_loc7_ < _loc8_)
         {
            _loc6_ = param1._1715[_loc7_];
            _loc5_ = null;
            _loc5_ = param2[_loc6_];
            _loc9_ = {};
            if(_loc5_)
            {
               _2690(_loc5_,_loc9_,param4);
            }
            param3[_205.DISPLAY].push(_loc9_);
            _loc7_++;
         }
         if(param4)
         {
            param3[_205.A_ID] = param1.id;
         }
      }
      
      private static function _2690(param1:_70, param2:Object, param3:Boolean) : void
      {
         if(param3)
         {
            param2[_205.A_NAME] = param1.name;
            if(param1.textureName)
            {
               param2[_205.A_TEXTURE_NAME] = param1.textureName;
            }
            if(param1.width > 0)
            {
               param2[_205.A_WIDTH] = param1.width;
            }
            if(param1.height > 0)
            {
               param2[_205.A_HEIGHT] = param1.height;
            }
         }
         else
         {
            param2[_205.A_NAME] = param1.name;
         }
         if(param1._13228 != null)
         {
            param2[_205.A_NAME] = param1._13230;
            param2[_101.A_PATH] = param1.name;
         }
         param2[_205.A_TYPE] = param1.type.toString();
         if(param1.filterType)
         {
            param2[_205.A_FILTER_TYPE] = param1.filterType.toString();
         }
         param2[_205.TRANSFORM] = _2678(param1.localTransform,param3);
         if(param3)
         {
            param2[_205.A_ID] = param1.id;
         }
         if(param1 && param1.type == _74.MESH && param1.mesh != null)
         {
            _2705(param1,param2,param3);
         }
         else if(Boolean(param1) && param1.type == _74.BOUNDINGBOX)
         {
            _11293(param1,param2,param3);
         }
      }
      
      private static function _2705(param1:_70, param2:Object, param3:Boolean) : void
      {
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:String = null;
         var _loc4_:Vector.<Number> = param1.mesh._2708;
         var _loc5_:Vector.<_661> = param1.mesh._1812;
         var _loc6_:Vector.<uint> = param1.mesh._2709;
         var _loc7_:Array = [];
         var _loc8_:Array = [];
         var _loc9_:Array = [];
         var _loc10_:Array = [];
         var _loc11_:Array = [];
         _loc12_ = 0;
         _loc13_ = int(_loc4_.length);
         while(_loc12_ < _loc13_)
         {
            _loc8_.push(Number(_loc5_[_loc12_ / 4].x.toFixed(2)),Number(_loc5_[_loc12_ / 4].y.toFixed(2)));
            _loc7_.push(Number(_loc4_[_loc12_ + 2].toFixed(5)),Number(_loc4_[_loc12_ + 3].toFixed(5)));
            _loc12_ += 4;
         }
         _loc12_ = 0;
         _loc13_ = int(_loc6_.length);
         while(_loc12_ < _loc13_)
         {
            _loc11_.push(_loc6_[_loc12_]);
            _loc12_++;
         }
         _loc12_ = 0;
         _loc13_ = int(param1.mesh.outline.length);
         while(_loc12_ < _loc13_)
         {
            _loc9_.push(param1.mesh.outline[_loc12_].index,param1.mesh.outline[_loc12_ + 1].index);
            _loc12_ += 2;
         }
         param2[_205.A_UV] = _loc7_;
         param2[_205.A_VERTICES] = _loc8_;
         param2[_205.A_TRIANGLES] = _loc11_;
         param2[_205.A_EDGES] = _loc9_;
         param2[_205.A_WIDTH] = param1.mesh.maxWidth;
         param2[_205.A_HEIGHT] = param1.mesh.maxHeight;
         var _loc15_:Object = param1.mesh._2707();
         if(_loc15_)
         {
            param2[_205.A_WEIGHTS] = _loc15_[_205.A_WEIGHTS];
            param2[_205.A_SLOT_POSE] = _2706(_loc15_[_205.A_SLOT_POSE]);
            param2[_205.A_BONE_POSE] = [];
            _loc12_ = 0;
            _loc13_ = int(_loc15_[_205.A_BONE].length);
            while(_loc12_ < _loc13_)
            {
               _loc14_ = _loc15_[_205.A_BONE][_loc12_];
               param2[_205.A_BONE_POSE].push(int(_loc14_));
               param2[_205.A_BONE_POSE] = param2[_205.A_BONE_POSE].concat(_2706(_loc15_[_205.A_BONE_POSE][_loc14_]));
               _loc12_++;
            }
         }
         _loc12_ = 0;
         _loc13_ = int(param1.mesh.userEdges.length);
         while(_loc12_ < _loc13_)
         {
            _loc10_.push(param1.mesh.userEdges[_loc12_].index,param1.mesh.userEdges[_loc12_ + 1].index);
            _loc12_ += 2;
         }
         param2[_205.A_USER_EDGES] = _loc10_;
      }
      
      private static function _11293(param1:_70, param2:Object, param3:Boolean) : void
      {
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc4_:_11219 = param1._11278;
         if(_loc4_)
         {
            param2[_101.SUB_TYPE] = _loc4_.type.toString();
            if(_loc4_.color != _100.BOUNDINGBOX_COLOR)
            {
               param2[_101.COLOR] = _loc4_.color;
            }
            switch(_loc4_.type)
            {
               case BoundingBoxType.ELLIPSE:
               case BoundingBoxType.RECTANGLE:
                  param2[_101.A_WIDTH] = _loc4_.width;
                  param2[_101.A_HEIGHT] = _loc4_.height;
                  break;
               case BoundingBoxType.POLYGON:
                  if(Boolean(_loc4_.vertices) && _loc4_.vertices.length >= 3)
                  {
                     _loc5_ = [];
                     _loc7_ = int(_loc4_.vertices.length);
                     _loc6_ = 0;
                     while(_loc6_ < _loc7_)
                     {
                        _loc5_.push(_loc4_.vertices[_loc6_].x,_loc4_.vertices[_loc6_].y);
                        _loc6_++;
                     }
                     param2[_101.A_VERTICES] = _loc5_;
                  }
            }
         }
      }
      
      private static function _2681(param1:_39, param2:Object, param3:Array, param4:Boolean) : void
      {
         var _loc7_:_45 = null;
         var _loc8_:Object = null;
         var _loc9_:_45 = null;
         var _loc10_:Object = null;
         var _loc11_:Object = null;
         var _loc12_:Object = null;
         var _loc13_:Object = null;
         var _loc14_:Boolean = false;
         var _loc15_:Object = null;
         param2[_205.A_NAME] = param1.name;
         param2[_205.A_DURATION] = int(param1.duration);
         param2[_205.A_PLAY_TIMES] = param1.playTimes;
         param2[_205.A_FADE_IN_TIME] = param1.fadeInTime;
         param2[_205.A_SCALE] = 1;
         param2[_205.FRAME] = [];
         param2[_205.BONE] = [];
         param2[_205.SLOT] = [];
         param2[_205.FFD] = [];
         if(param1._1816.length > 0)
         {
            _loc7_ = param1._1816[0];
            if(_loc7_.startPos != 0)
            {
               _loc8_ = {};
               if(param4)
               {
                  _loc8_[_205.A_DURATION] = _loc7_.startPos;
                  _loc8_[_205.A_TWEEN_EASING] = NaN;
                  _loc8_[_205.A_ID] = -1;
               }
               else
               {
                  (_loc9_ = new _45(false)).startPos = 0;
                  _loc9_.endPos = _loc7_.startPos;
                  _2700(_loc9_,_loc8_,param4);
               }
               param2[_205.FRAME].push(_loc8_);
            }
         }
         var _loc5_:int = 0;
         var _loc6_:int = int(param1._1816.length);
         while(_loc5_ < _loc6_)
         {
            _loc10_ = {};
            _2700(param1._1816[_loc5_],_loc10_,param4);
            param2[_205.FRAME].push(_loc10_);
            _loc5_++;
         }
         _loc5_ = 0;
         _loc6_ = int(param1._1746.length);
         while(_loc5_ < _loc6_)
         {
            _loc11_ = {};
            _2665(param1._1746[_loc5_],_loc11_,param1.duration,param4);
            param2[_205.BONE].push(_loc11_);
            _loc5_++;
         }
         _loc5_ = 0;
         _loc6_ = int(param1._1745.length);
         while(_loc5_ < _loc6_)
         {
            if(param4 || (param1._1745[_loc5_] as _48)._1816.length > 0)
            {
               _loc12_ = {};
               _2666(param1._1745[_loc5_],_loc12_,param1.duration,param4);
               param2[_205.SLOT].push(_loc12_);
            }
            _loc5_++;
         }
         if(param1._1753)
         {
            _loc5_ = 0;
            _loc6_ = int(param1._1753.length);
            while(_loc5_ < _loc6_)
            {
               if(param4 || (param1._1753[_loc5_] as _43)._1816.length > 0)
               {
                  _loc13_ = {};
                  _loc14_ = _2669(param1._1753[_loc5_],_loc13_,param1.duration,param4);
                  if(_loc14_)
                  {
                     param2[_205.FFD].push(_loc13_);
                  }
               }
               _loc5_++;
            }
         }
         if(param1._10657)
         {
            if(param4 || param1._10657._1816.length > 0)
            {
               _loc15_ = {};
               _10681(param1._10657,_loc15_,param1.duration,param3,param4);
               param2[_205.Z_ORDER] = _loc15_;
            }
         }
         if(param4)
         {
            param2[_205.A_ID] = param1.id;
         }
      }
      
      private static function _2665(param1:_41, param2:Object, param3:int, param4:Boolean) : void
      {
         var _loc5_:int = 0;
         var _loc8_:_45 = null;
         var _loc9_:Object = null;
         var _loc10_:BoneFrameVO = null;
         var _loc11_:Object = null;
         param2[_205.A_NAME] = param1.name;
         param2[_205.A_SCALE] = 1;
         param2[_205.A_OFFSET] = 0;
         param2[_205.A_PIVOT_X] = param1._1797.x;
         param2[_205.A_PIVOT_Y] = param1._1797.y;
         param2[_205.FRAME] = [];
         if(param1._1816.length > 0)
         {
            _loc8_ = param1._1816[0];
            if(_loc8_.startPos != 0)
            {
               _loc9_ = {};
               if(param4)
               {
                  _loc9_[_205.A_DURATION] = _loc8_.startPos;
                  _loc9_[_205.TRANSFORM] = _2678(new _86(),param4);
                  _loc9_[_205.A_TWEEN_EASING] = NaN;
                  _loc9_[_205.A_ID] = -1;
               }
               else
               {
                  (_loc10_ = new BoneFrameVO(param1._1823,false)).startPos = 0;
                  _loc10_.endPos = _loc8_.startPos;
                  _2680(_loc10_,_loc9_,param1._1904,param4);
                  _loc5_ += _loc10_.duration;
               }
               param2[_205.FRAME].push(_loc9_);
            }
         }
         else if(!param4)
         {
            _loc9_ = {};
            (_loc10_ = new BoneFrameVO(param1._1823,false)).startPos = 0;
            _loc10_.endPos = param3;
            _2680(_loc10_,_loc9_,param1._1904,param4);
            param2[_205.FRAME].push(_loc9_);
            _loc5_ = param3;
         }
         var _loc6_:int = 0;
         var _loc7_:int = int(param1._1816.length);
         while(_loc6_ < _loc7_)
         {
            _loc11_ = {};
            _2680(param1._1816[_loc6_] as BoneFrameVO,_loc11_,param1._1904,param4);
            param2[_205.FRAME].push(_loc11_);
            _loc5_ += _loc11_.duration;
            if(!param4)
            {
               if(_loc6_ == _loc7_ - 1)
               {
                  _loc11_[_205.A_TWEEN_EASING] = NaN;
                  delete _loc11_[_205.CURVE];
               }
            }
            _loc6_++;
         }
         if(param4)
         {
            param2[_205.A_ID] = param1.id;
         }
         else if(_loc5_ < param3)
         {
            _loc7_ = !!param2[_205.FRAME] ? int(param2[_205.FRAME].length) : 0;
            if(_loc7_ > 0)
            {
               param2[_205.FRAME][_loc7_ - 1].duration += param3 - _loc5_;
            }
         }
      }
      
      private static function _2680(param1:BoneFrameVO, param2:Object, param3:_86, param4:Boolean) : void
      {
         _2700(param1,param2,param4);
         param2[_205.TRANSFORM] = _2678(param1.transform,param4);
         if(param1.tweenRotate != 0)
         {
            param2[_205.A_TWEEN_ROTATE] = param1.tweenRotate;
         }
         var _loc5_:Object;
         (_loc5_ = param2[_205.TRANSFORM])[_205.A_X] = _loc5_[_205.A_X] + param3.x;
         _loc5_[_205.A_Y] += param3.y;
         _loc5_[_205.A_SKEW_X] += param3.skewX * _205.RADIAN_TO_ANGLE;
         _loc5_[_205.A_SKEW_Y] += param3.skewY * _205.RADIAN_TO_ANGLE;
         _loc5_[_205.A_SCALE_X] *= param3.scaleX;
         _loc5_[_205.A_SCALE_Y] *= param3.scaleY;
      }
      
      private static function _2666(param1:_48, param2:Object, param3:int, param4:Boolean) : void
      {
         var _loc8_:_45 = null;
         var _loc9_:Object = null;
         var _loc10_:_47 = null;
         var _loc11_:Object = null;
         var _loc5_:int = 0;
         param2[_205.A_NAME] = param1.name;
         param2[_205.A_SCALE] = 1;
         param2[_205.A_OFFSET] = 0;
         param2[_205.FRAME] = [];
         if(param1._1816.length > 0)
         {
            _loc8_ = param1._1816[0];
            if(_loc8_.startPos != 0)
            {
               _loc9_ = {};
               if(param4)
               {
                  _loc9_[_205.A_DURATION] = _loc8_.startPos;
                  _loc9_[_205.A_TWEEN_EASING] = NaN;
                  _loc9_[_205.A_ID] = -1;
               }
               else
               {
                  (_loc10_ = new _47(param1._1824,false))._1732 = param1._1824._1711;
                  _loc10_.colorTransform = param1._1824._2152.clone();
                  _loc10_.startPos = 0;
                  _loc10_.endPos = _loc8_.startPos;
                  _2679(_loc10_,_loc9_,param4);
                  _loc5_ += _loc10_.duration;
               }
               param2[_205.FRAME].push(_loc9_);
            }
         }
         var _loc6_:int = 0;
         var _loc7_:int = int(param1._1816.length);
         while(_loc6_ < _loc7_)
         {
            _loc11_ = {};
            _2679(param1._1816[_loc6_] as _47,_loc11_,param4);
            param2[_205.FRAME].push(_loc11_);
            _loc5_ += _loc11_.duration;
            if(!param4)
            {
               if(_loc6_ == _loc7_ - 1)
               {
                  _loc11_[_205.A_TWEEN_EASING] = NaN;
               }
            }
            _loc6_++;
         }
         if(param4)
         {
            param2[_205.A_ID] = param1.id;
         }
         else if(_loc5_ < param3)
         {
            _loc7_ = !!param2[_205.FRAME] ? int(param2[_205.FRAME].length) : 0;
            if(_loc7_ > 0)
            {
               param2[_205.FRAME][_loc7_ - 1].duration += param3 - _loc5_;
            }
         }
      }
      
      private static function _2679(param1:_47, param2:Object, param3:Boolean) : void
      {
         var _loc4_:Object = null;
         _2700(param1,param2,param3);
         param2[_205.A_DISPLAY_INDEX] = !!param1._1732 ? param1._1732.displayIndex : -1;
         param2[_205.A_Z_ORDER] = param1.zOrder;
         if(param1.gotoAndPlay)
         {
            (_loc4_ = {})[_205.A_GOTOANDPLAY] = param1.gotoAndPlay;
            param2[_205.A_ACTIONS] = [_loc4_];
         }
         if(param1.colorTransform)
         {
            param2[_205.COLOR] = _2662(param1.colorTransform,param3);
         }
      }
      
      private static function _2669(param1:_43, param2:Object, param3:int, param4:Boolean) : Boolean
      {
         var _loc8_:_45 = null;
         var _loc9_:Object = null;
         var _loc10_:_42 = null;
         var _loc11_:Object = null;
         if(param1 == null || param1._1826 == null)
         {
            return false;
         }
         var _loc5_:int = 0;
         param2[_205.A_NAME] = param1.name;
         if(param1._1826._1760)
         {
            param2[_205.SLOT] = param1._1826._1760.name;
         }
         if(param1._1826._1985)
         {
            param2[_205.SKIN] = param1._1826._1985.name;
         }
         param2[_205.A_SCALE] = 1;
         param2[_205.A_OFFSET] = 0;
         param2[_205.FRAME] = [];
         if(Boolean(param1._1816) && param1._1816.length > 0)
         {
            _loc8_ = param1._1816[0];
            if((Boolean(_loc8_)) && _loc8_.startPos != 0)
            {
               _loc9_ = {};
               if(param4)
               {
                  _loc9_[_205.A_DURATION] = _loc8_.startPos;
                  _loc9_[_205.A_TWEEN_EASING] = NaN;
                  _loc9_[_205.A_ID] = -1;
               }
               else
               {
                  (_loc10_ = new _42(param1._1826,false)).ffd = null;
                  _loc10_.startPos = 0;
                  _loc10_.endPos = _loc8_.startPos;
                  _2686(_loc10_,_loc9_,param4);
                  _loc5_ += _loc10_.duration;
               }
               param2[_205.FRAME].push(_loc9_);
            }
         }
         var _loc6_:int = 0;
         var _loc7_:int = int(param1._1816.length);
         while(_loc6_ < _loc7_)
         {
            _loc11_ = {};
            _2686(param1._1816[_loc6_] as _42,_loc11_,param4);
            param2[_205.FRAME].push(_loc11_);
            _loc5_ += _loc11_.duration;
            if(!param4)
            {
               if(_loc6_ == _loc7_ - 1)
               {
                  _loc11_[_205.A_TWEEN_EASING] = NaN;
               }
            }
            _loc6_++;
         }
         if(param4)
         {
            param2[_205.A_ID] = param1.id;
         }
         else if(_loc5_ < param3)
         {
            _loc7_ = !!param2[_205.FRAME] ? int(param2[_205.FRAME].length) : 0;
            if(_loc7_ > 0)
            {
               param2[_205.FRAME][_loc7_ - 1].duration += param3 - _loc5_;
            }
         }
         return true;
      }
      
      private static function _2686(param1:_42, param2:Object, param3:Boolean) : void
      {
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         _2700(param1,param2,param3);
         var _loc4_:Vector.<Number> = param1.ffd;
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:Array = [];
         var _loc8_:int = 0;
         var _loc9_:int = int(_loc4_.length);
         while(_loc8_ < _loc9_)
         {
            if(_loc4_[_loc8_] == 0 && !_loc7_)
            {
               _loc6_++;
            }
            else
            {
               _loc7_ = true;
               _loc5_.push(Number(_loc4_[_loc8_].toFixed(2)));
            }
            _loc8_++;
         }
         _loc8_ = int(_loc5_.length);
         while(_loc8_ >= 0)
         {
            if(_loc5_[_loc8_] != 0)
            {
               break;
            }
            _loc5_.splice(_loc8_,1);
            _loc8_--;
         }
         if(_loc5_.length == 0)
         {
            _loc6_ = 0;
         }
         param2[_205.A_VERTICES] = _loc5_;
         param2[_205.A_OFFSET] = _loc6_;
      }
      
      private static function _10681(param1:_10599, param2:Object, param3:int, param4:Array, param5:Boolean) : void
      {
         var _loc7_:_10598 = null;
         var _loc8_:_10598 = null;
         var _loc9_:Object = null;
         var _loc12_:_45 = null;
         var _loc13_:Object = null;
         var _loc14_:_10598 = null;
         var _loc15_:Object = null;
         var _loc6_:int = 0;
         param2[_205.A_SCALE] = 1;
         param2[_205.A_OFFSET] = 0;
         param2[_205.FRAME] = [];
         if(param1._1816.length > 0)
         {
            _loc12_ = param1._1816[0];
            if(_loc12_.startPos != 0)
            {
               _loc13_ = {};
               if(param5)
               {
                  _loc13_[_205.A_DURATION] = _loc12_.startPos;
                  _loc13_[_205.A_TWEEN_EASING] = NaN;
                  _loc13_[_205.A_ID] = -1;
               }
               else
               {
                  (_loc14_ = new _10598()).zOrder = param1._1886._10658.concat();
                  _loc14_.startPos = 0;
                  _loc14_.endPos = _loc12_.startPos;
                  _10682(_loc14_,_loc13_,param4,param5);
                  _loc6_ += _loc14_.duration;
                  _loc7_ = _loc14_;
                  _loc9_ = _loc13_;
               }
               param2[_205.FRAME].push(_loc13_);
            }
         }
         var _loc10_:int = 0;
         var _loc11_:int = int(param1._1816.length);
         while(_loc10_ < _loc11_)
         {
            _loc15_ = {};
            if(_loc10_ > 0)
            {
               _loc7_ = param1._1816[_loc10_ - 1] as _10598;
            }
            _loc8_ = param1._1816[_loc10_] as _10598;
            if(!param5 && _loc7_ && _loc8_ && _10683(_loc7_.zOrder,_loc8_.zOrder) && _loc8_.duration != 0 && Boolean(_loc9_))
            {
               _loc9_[_205.A_DURATION] += _loc8_.duration;
               _loc6_ += _loc8_.duration;
            }
            else
            {
               _10682(_loc8_,_loc15_,param4,param5);
               param2[_205.FRAME].push(_loc15_);
               _loc9_ = _loc15_;
               if(!isNaN(_loc15_.duration))
               {
                  _loc6_ += _loc15_.duration;
               }
            }
            _loc10_++;
         }
         if(param5)
         {
            param2[_205.A_ID] = param1.id;
         }
         else if(_loc6_ < param3)
         {
            _loc11_ = !!param2[_205.FRAME] ? int(param2[_205.FRAME].length) : 0;
            if(_loc11_ > 0)
            {
               param2[_205.FRAME][_loc11_ - 1].duration += param3 - _loc6_;
            }
         }
      }
      
      private static function _10682(param1:_10598, param2:Object, param3:Array, param4:Boolean) : void
      {
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
         var _loc10_:int = 0;
         _2700(param1,param2,param4);
         var _loc5_:Array = param1.zOrder.concat();
         if(param4)
         {
            param2[_205.Z_ORDER] = _loc5_;
         }
         else if(Boolean(param3) && param3.length > 0)
         {
            _loc6_ = [];
            _loc5_ = _12514(param3,_loc5_);
            _loc7_ = 0;
            _loc8_ = int(param3.length);
            while(_loc7_ < _loc8_)
            {
               _loc10_ = int(param3.indexOf(_loc5_[_loc7_]));
               if(_loc10_ >= 0)
               {
                  _loc6_.push(_loc10_);
               }
               _loc7_++;
            }
            if(_loc6_.length > 0)
            {
               _loc9_ = _10600._10669(_loc6_);
            }
            param2[_205.Z_ORDER] = _loc9_;
         }
      }
      
      private static function _12514(param1:Array, param2:Array) : Array
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:Object = {};
         var _loc4_:Object = {};
         _loc5_ = 0;
         _loc6_ = int(param1.length);
         while(_loc5_ < _loc6_)
         {
            _loc3_[param1[_loc5_]] = _loc5_ + 1;
            _loc5_++;
         }
         var _loc7_:Array = [];
         _loc5_ = 0;
         _loc6_ = int(param2.length);
         while(_loc5_ < _loc6_)
         {
            if(_loc3_[param2[_loc5_]] > 0)
            {
               if(_loc4_[param2[_loc5_]] == null)
               {
                  _loc7_.push(param2[_loc5_]);
                  _loc4_[param2[_loc5_]] = true;
               }
            }
            _loc5_++;
         }
         if(_loc7_.length == param2.length)
         {
            return param2;
         }
         if(_loc7_.length == param1.length)
         {
            return _loc7_;
         }
         _loc3_ = {};
         _loc5_ = 0;
         _loc6_ = int(param2.length);
         while(_loc5_ < _loc6_)
         {
            _loc3_[param2[_loc5_]] = _loc5_ + 1;
            _loc5_++;
         }
         _loc5_ = 0;
         _loc6_ = int(param1.length);
         while(_loc5_ < _loc6_)
         {
            if(isNaN(_loc3_[param1[_loc5_]]))
            {
               _loc7_.push(param1[_loc5_]);
            }
            _loc5_++;
         }
         if(_loc7_.length == param1.length)
         {
            return _loc7_;
         }
         return param1.concat();
      }
      
      private static function _10683(param1:Array, param2:Array) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(Boolean(param1) && Boolean(param2))
         {
            if(param1.length == param2.length)
            {
               _loc3_ = 0;
               _loc4_ = int(param1.length);
               while(_loc3_ < _loc4_)
               {
                  if(param1[_loc3_] != param2[_loc3_])
                  {
                     return false;
                  }
                  _loc3_++;
               }
               return true;
            }
         }
         return false;
      }
      
      private static function _2662(param1:_83, param2:Boolean) : Object
      {
         var _loc3_:Object = {};
         _loc3_[_205.A_ALPHA_OFFSET] = param1.alphaOffset;
         _loc3_[_205.A_RED_OFFSET] = param1.redOffset;
         _loc3_[_205.A_GREEN_OFFSET] = param1.greenOffset;
         _loc3_[_205.A_BLUE_OFFSET] = param1.blueOffset;
         _loc3_[_205.A_ALPHA_MULTIPLIER] = int(param1.alphaMultiplier * 100);
         _loc3_[_205.A_RED_MULTIPLIER] = int(param1.redMultiplier * 100);
         _loc3_[_205.A_GREEN_MULTIPLIER] = int(param1.greenMultiplier * 100);
         _loc3_[_205.A_BLUE_MULTIPLIER] = int(param1.blueMultiplier * 100);
         return _loc3_;
      }
      
      private static function _2700(param1:_45, param2:Object, param3:Boolean) : void
      {
         var _loc5_:_44 = null;
         var _loc8_:Array = null;
         var _loc9_:Object = null;
         param2[_205.A_DURATION] = int(param1.duration);
         if(param1.tweenEnabled)
         {
            if(param1._11515)
            {
               param2[_205.CURVE] = param1.tweenCurve.toArray();
            }
            else
            {
               param2[_205.A_TWEEN_EASING] = 0;
            }
         }
         else
         {
            param2[_205.A_TWEEN_EASING] = null;
         }
         var _loc4_:* = Number(currentVersion) < Number(_101.DATA_VERSION_5_0);
         var _loc6_:int = 0;
         var _loc7_:int = int(param1._1636.length);
         while(_loc6_ < _loc7_)
         {
            _loc5_ = param1._1636[_loc6_] as _44;
            if((Boolean(_loc5_)) && Boolean(_loc5_.value))
            {
               if(_loc4_ || _loc5_._1622 != _75.DISPATCH_EVENT)
               {
                  param2[_loc5_._1622.toString()] = _loc5_.value;
               }
               if(!_loc4_ && Boolean(_loc5_.event))
               {
                  _loc8_ = param2[_101.EVENTS] = param2[_101.EVENTS] || [];
                  (_loc9_ = {})[_101.A_NAME] = _loc5_.value;
                  if(_loc5_.event.bone)
                  {
                     _loc9_[_101.BONE] = _loc5_.event.bone.name;
                  }
                  else if(_loc5_.event.slot)
                  {
                     _loc9_[_101.SLOT] = _loc5_.event.slot.name;
                  }
                  if(_loc5_.event.ints.length)
                  {
                     _loc9_[_101.INTS] = _loc5_.event.ints.concat();
                  }
                  if(_loc5_.event.floats.length)
                  {
                     _loc9_[_101.FLOATS] = _loc5_.event.floats.concat();
                  }
                  if(_loc5_.event.strings.length)
                  {
                     _loc9_[_101.STRINGS] = _loc5_.event.strings.concat();
                  }
                  _loc8_.push(_loc9_);
               }
               if(param3)
               {
                  param2[_loc5_._1622.toString() + _205.A_ID] = _loc5_.id;
               }
            }
            _loc6_++;
         }
         if(param3)
         {
            param2[_205.A_ID] = param1.id;
         }
      }
      
      private static function _2706(param1:Matrix) : Array
      {
         var _loc2_:Array = [];
         _loc2_.push(param1.a);
         _loc2_.push(param1.b);
         _loc2_.push(param1.c);
         _loc2_.push(param1.d);
         _loc2_.push(param1.tx);
         _loc2_.push(param1.ty);
         return _loc2_;
      }
      
      private static function _2678(param1:_86, param2:Boolean) : Object
      {
         var _loc3_:Object = {};
         _loc3_[_205.A_X] = param1.x;
         _loc3_[_205.A_Y] = param1.y;
         _loc3_[_205.A_SKEW_X] = param1.skewX * _205.RADIAN_TO_ANGLE;
         _loc3_[_205.A_SKEW_Y] = param1.skewY * _205.RADIAN_TO_ANGLE;
         _loc3_[_205.A_SCALE_X] = param1.scaleX;
         _loc3_[_205.A_SCALE_Y] = param1.scaleY;
         return _loc3_;
      }
      
      public static function _2656(param1:_71, param2:Array, param3:Function) : void
      {
         var _1837:_79 = null;
         var list:Array = null;
         var loadNum:int = 0;
         var getAssetData:Function = null;
         var displayVO:_70 = null;
         var dragonbonesVO:_71 = param1;
         var includeArmatures:Array = param2;
         var callback:Function = param3;
         getAssetData = function(param1:String, param2:IBitmapDrawable):void
         {
            if(param2 == null)
            {
               param2 = new BitmapData(1,1);
            }
            list.push({
               "name":param1,
               "assetData":param2
            });
            --loadNum;
            if(loadNum <= 0)
            {
               if(callback != null)
               {
                  callback(list);
                  callback = null;
               }
            }
         };
         var i:int = 0;
         var len:int = 0;
         var j:int = 0;
         var jLen:int = 0;
         list = [];
         var _13225:Array = [];
         var displayObj:Object = {};
         var k:int = 0;
         var numArmature:int = int(dragonbonesVO._2126.length);
         while(k < numArmature)
         {
            if(!(Boolean(includeArmatures) && includeArmatures.indexOf(dragonbonesVO._2126[k].name) == -1))
            {
               i = 0;
               len = int(dragonbonesVO._2126[k]._1780.length);
               while(i < len)
               {
                  _1837 = dragonbonesVO._2126[k]._1780[i];
                  for each(displayVO in _1837._1765)
                  {
                     if(displayVO.type != _74.BOUNDINGBOX)
                     {
                        if(displayObj[displayVO.name] == null)
                        {
                           _13225.push(displayVO);
                           if(displayVO._2104)
                           {
                              displayObj[displayVO.name] = displayVO._2104._2682;
                           }
                        }
                        else if(Boolean(displayVO._2104) && displayObj[displayVO.name] != displayVO._2104._2682)
                        {
                           _13225.push(displayVO);
                        }
                     }
                  }
                  i++;
               }
            }
            k++;
         }
         loadNum = int(_13225.length);
         if(loadNum <= 0)
         {
            callback(list);
         }
         else
         {
            i = 0;
            len = int(_13225.length);
            while(i < len)
            {
               displayVO = _13225[i] as _70;
               if(!displayVO._2099(getAssetData))
               {
                  loadNum--;
               }
               i++;
            }
            if(loadNum <= 0)
            {
               if(callback != null)
               {
                  callback(list);
                  callback = null;
               }
            }
         }
      }
      
      public static function _2660(param1:Object, param2:Number) : void
      {
         if(param1)
         {
            if(param1[_101.A_VERSION] == _101.DATA_VERSION_5_5)
            {
               _14014(param1,param2);
            }
            else
            {
               _14015(param1,param2);
            }
         }
      }
      
      public static function _14014(param1:Object, param2:Number) : void
      {
         var _loc3_:Object = null;
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         var _loc8_:Object = null;
         var _loc9_:Object = null;
         var _loc10_:Object = null;
         var _loc11_:Object = null;
         var _loc12_:Object = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         for each(_loc3_ in param1.armature)
         {
            for each(_loc4_ in _loc3_.bone)
            {
               _2685(_loc4_[_205.TRANSFORM],param2);
               if(_loc4_[_205.A_LENGTH])
               {
                  _loc4_[_205.A_LENGTH] *= param2;
               }
            }
            for each(_loc5_ in _loc3_.skin)
            {
               for each(_loc7_ in _loc5_.slot)
               {
                  for each(_loc8_ in _loc7_.display)
                  {
                     _2685(_loc8_[_205.TRANSFORM],param2);
                     _2712(_loc8_,param2);
                  }
               }
            }
            for each(_loc6_ in _loc3_.animation)
            {
               for each(_loc9_ in _loc6_.bone)
               {
                  if(_loc9_.translateFrame)
                  {
                     for each(_loc10_ in _loc9_.translateFrame)
                     {
                        _2685(_loc10_,param2);
                     }
                  }
               }
               if(_loc6_.ffd)
               {
                  for each(_loc11_ in _loc6_.ffd)
                  {
                     if(_loc11_.frame)
                     {
                        for each(_loc12_ in _loc11_.frame)
                        {
                           if(_loc12_ && _loc12_.vertices && _loc12_.vertices.length > 0)
                           {
                              _loc13_ = 0;
                              _loc14_ = int(_loc12_.vertices.length);
                              while(_loc13_ < _loc14_)
                              {
                                 _loc12_.vertices[_loc13_] *= param2;
                                 _loc13_++;
                              }
                           }
                        }
                     }
                  }
               }
            }
            if(_loc3_.aabb)
            {
               _14016(_loc3_.aabb,param2);
            }
            if(_loc3_.canvas)
            {
               _14016(_loc3_.canvas,param2);
            }
         }
      }
      
      public static function _14015(param1:Object, param2:Number) : void
      {
         var _loc3_:Object = null;
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         var _loc8_:Object = null;
         var _loc9_:Object = null;
         var _loc10_:Object = null;
         var _loc11_:Object = null;
         var _loc12_:Object = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         for each(_loc3_ in param1.armature)
         {
            for each(_loc4_ in _loc3_.bone)
            {
               _2685(_loc4_[_205.TRANSFORM],param2);
               if(_loc4_[_205.A_LENGTH])
               {
                  _loc4_[_205.A_LENGTH] *= param2;
               }
            }
            for each(_loc5_ in _loc3_.skin)
            {
               for each(_loc7_ in _loc5_.slot)
               {
                  for each(_loc8_ in _loc7_.display)
                  {
                     _2685(_loc8_[_205.TRANSFORM],param2);
                     _2712(_loc8_,param2);
                  }
               }
            }
            for each(_loc6_ in _loc3_.animation)
            {
               for each(_loc9_ in _loc6_.bone)
               {
                  for each(_loc10_ in _loc9_.frame)
                  {
                     _2685(_loc10_[_205.TRANSFORM],param2);
                  }
               }
               if(_loc6_.ffd)
               {
                  for each(_loc11_ in _loc6_.ffd)
                  {
                     if(_loc11_.frame)
                     {
                        for each(_loc12_ in _loc11_.frame)
                        {
                           if(_loc12_ && _loc12_.vertices && _loc12_.vertices.length > 0)
                           {
                              _loc13_ = 0;
                              _loc14_ = int(_loc12_.vertices.length);
                              while(_loc13_ < _loc14_)
                              {
                                 _loc12_.vertices[_loc13_] *= param2;
                                 _loc13_++;
                              }
                           }
                        }
                     }
                  }
               }
            }
            if(_loc3_.aabb)
            {
               _14016(_loc3_.aabb,param2);
            }
            if(_loc3_.canvas)
            {
               _14016(_loc3_.canvas,param2);
            }
         }
      }
      
      private static function _14016(param1:Object, param2:Number) : void
      {
         if(param1.x)
         {
            param1.x *= param2;
         }
         if(param1.y)
         {
            param1.y *= param2;
         }
         if(param1.height)
         {
            param1.height *= param2;
         }
         if(param1.width)
         {
            param1.width *= param2;
         }
      }
      
      private static function _2685(param1:Object, param2:Number) : void
      {
         if(param1.x)
         {
            param1.x *= param2;
         }
         if(param1.y)
         {
            param1.y *= param2;
         }
      }
      
      public static function _2667(param1:Object, param2:Number) : void
      {
         var _loc3_:Object = null;
         for each(_loc3_ in param1.SubTexture)
         {
            _loc3_.x *= param2;
            _loc3_.y *= param2;
            _loc3_.width *= param2;
            _loc3_.height *= param2;
         }
      }
      
      private static function _2712(param1:Object, param2:Number) : void
      {
         _2689(param1[_205.A_VERTICES],param2);
         _2688(param1[_205.A_BONE_POSE],param2);
         _2687(param1[_205.A_SLOT_POSE],param2);
         if(param1[_205.A_HEIGHT])
         {
            param1[_205.A_HEIGHT] *= param2;
            param1[_205.A_HEIGHT] = int(param1[_205.A_HEIGHT]);
         }
         if(param1[_205.A_WIDTH])
         {
            param1[_205.A_WIDTH] *= param2;
            param1[_205.A_WIDTH] = int(param1[_205.A_WIDTH]);
         }
      }
      
      private static function _2689(param1:Array, param2:Number) : void
      {
         var _loc4_:int = 0;
         if(!param1)
         {
            return;
         }
         var _loc3_:int = 0;
         _loc3_ = 0;
         _loc4_ = int(param1.length);
         while(_loc3_ < _loc4_)
         {
            param1[_loc3_] *= param2;
            _loc3_++;
         }
      }
      
      private static function _2688(param1:Array, param2:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1 == null)
         {
            return;
         }
         _loc3_ = 0;
         _loc4_ = int(param1.length);
         while(_loc3_ < _loc4_)
         {
            param1[_loc3_ + 5] *= param2;
            param1[_loc3_ + 6] *= param2;
            _loc3_ += 7;
         }
      }
      
      private static function _2687(param1:Array, param2:Number) : void
      {
         if(param1)
         {
            param1[4] *= param2;
            param1[5] *= param2;
         }
      }
      
      private static function _2661(param1:_53, param2:Array) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc3_ = 0;
         _loc4_ = int(param1._2062.length);
         while(_loc3_ < _loc4_)
         {
            param2.push(_2674(param1._2062[_loc3_]));
            _loc3_++;
         }
      }
      
      private static function _2674(param1:_56) : Object
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:Object = {};
         _loc2_[_205.A_STRIP_INDEX] = param1.index;
         _loc2_[_205.A_TRACKS] = [];
         _loc3_ = 0;
         _loc4_ = int(param1.tracks.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_[_205.A_TRACKS].push(_2675(param1.tracks[_loc3_]));
            _loc3_++;
         }
         return _loc2_;
      }
      
      private static function _2675(param1:_57) : Object
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:Object = {};
         _loc2_[_205.A_TRACK_INDEX] = param1.index;
         _loc2_[_205.A_TWEENS] = [];
         _loc3_ = 0;
         _loc4_ = int(param1.tweens.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_[_205.A_TWEENS].push(_2676(param1.tweens[_loc3_]));
            _loc3_++;
         }
         return _loc2_;
      }
      
      private static function _2676(param1:_67) : Object
      {
         var _loc2_:Object = {};
         _loc2_[_205.A_TWEEN_NAME] = param1.name;
         _loc2_[_205.A_TWEEN_TYPE] = param1.type.toString();
         _loc2_[_205.A_TWEEN_EASE] = param1.easing;
         _loc2_[_205.A_TWEEN_VALUE] = param1.value;
         _loc2_[_205.A_TWEEN_DURING] = param1.during;
         _loc2_[_205.A_TWEEN_DELAY] = param1.delay;
         _loc2_[_205.A_LOOP] = param1.loop;
         if(param1.appear)
         {
            _loc2_[_205.A_TWEEN_APPEAR] = param1.appear;
         }
         return _loc2_;
      }
   }
}

