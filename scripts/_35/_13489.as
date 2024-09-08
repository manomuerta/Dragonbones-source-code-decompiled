package _35
{
   import _11220._11219;
   import _13492._13491;
   import _13492._13493;
   import _13492._13494;
   import _13492._13495;
   import _13492._13496;
   import _13492._13498;
   import _13492._13499;
   import _13492._13501;
   import _13492._14034;
   import _13503._13502;
   import _13505._13504;
   import _13505._13506;
   import _13505._13507;
   import _13505._13508;
   import _13505._13509;
   import _13505._13510;
   import _13505._14035;
   import _204._205;
   import _204._211;
   import _40._44;
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
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class _13489
   {
      public static var currentVersion:String;
      
      public function _13489()
      {
         super();
      }
      
      public static function _10458(param1:_71, param2:String, param3:Boolean) : Object
      {
         var _loc7_:Object = null;
         var _loc4_:Object;
         (_loc4_ = {})[_101.A_VERSION] = param2;
         _loc4_[_101.A_NAME] = param1.name;
         currentVersion = param2;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         _loc4_[_101.ARMATURE] = [];
         _loc5_ = 0;
         _loc6_ = int(param1._2126.length);
         while(_loc5_ < _loc6_)
         {
            _loc7_ = {};
            _2684(param1._2126[_loc5_],_loc7_,param3,param2);
            _loc4_[_101.ARMATURE].push(_loc7_);
            _loc5_++;
         }
         _loc4_[_101.A_FRAME_RATE] = param1.frameRate > 0 ? param1.frameRate : 24;
         _loc4_[_101.A_IS_GLOBAL] = 0;
         if(param3)
         {
            _loc4_[_101.A_EXTRA] = true;
         }
         _211._2694(_loc4_);
         return _loc4_;
      }
      
      public static function _2684(param1:_50, param2:Object, param3:Boolean, param4:String) : void
      {
         var _loc9_:Boolean = false;
         var _loc10_:* = undefined;
         var _loc11_:Object = null;
         var _loc12_:Object = null;
         var _loc13_:Object = null;
         var _loc14_:Object = null;
         var _loc15_:Object = null;
         var _loc16_:Object = null;
         var _loc17_:Object = null;
         var _loc18_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         currentVersion = param4;
         var _loc7_:Array = param1._10659;
         param1._10663(param1._10658);
         param2[_101.A_NAME] = param1.name;
         param2[_101.A_TYPE] = param1._1811.toString();
         var _loc8_:Object;
         (_loc8_ = {})[_101.A_GOTOANDPLAY] = param1.defaultAnimation;
         param2[_101.A_DEFAULT_ACTIONS] = [_loc8_];
         param2[_101.A_FRAME_RATE] = param1.frameRate > 0 ? param1.frameRate : 24;
         param2[_101.BONE] = [];
         param2[_101.IK] = [];
         param2[_101.SLOT] = [];
         param2[_101.SKIN] = [];
         param2[_101.ANIMATION] = [];
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
            param2[_101.A_PLAY_TIMES] = param1.playTimes;
         }
         if(param1.aabb)
         {
            param2[_101.AABB] = {
               "x":param1.aabb.x,
               "y":param1.aabb.y,
               "width":param1.aabb.width,
               "height":param1.aabb.height
            };
         }
         if(param3)
         {
            param2[_101.A_ID] = param1.id;
         }
         _loc5_ = 0;
         _loc6_ = int(param1._1779.length);
         while(_loc5_ < _loc6_)
         {
            _loc11_ = {};
            _2702(param1._1779[_loc5_],_loc11_,param3);
            param2[_101.BONE].push(_loc11_);
            _loc5_++;
         }
         _loc5_ = 0;
         _loc6_ = int(param1._1999.length);
         while(_loc5_ < _loc6_)
         {
            _loc12_ = {};
            _2714(param1._1999[_loc5_],_loc12_,param3);
            param2[_101.IK].push(_loc12_);
            _loc5_++;
         }
         _loc5_ = 0;
         _loc6_ = int(param1._1780.length);
         while(_loc5_ < _loc6_)
         {
            _loc13_ = {};
            _2703(param1._1780[_loc5_],_loc5_,_loc13_,true,param3);
            param2[_101.SLOT].push(_loc13_);
            _loc5_++;
         }
         var _loc19_:int = 0;
         var _loc20_:* = param1._1795._1765;
         for(_loc10_ in _loc20_)
         {
            _loc9_ = true;
         }
         if(param1._1781.length == 1 && !_loc9_)
         {
            _loc14_ = {};
            _2704(param1._1781[0],_loc14_,param3);
            _loc14_[_101.A_NAME] = "";
            param2[_101.SKIN].push(_loc14_);
         }
         else
         {
            if(_loc9_ && (param1._1781 == null || param1._1781.length == 0))
            {
               _loc15_ = {};
               _2704(param1._1795,_loc15_,param3);
               param2[_101.SKIN].push(_loc15_);
            }
            _loc5_ = 0;
            _loc6_ = int(param1._1781.length);
            while(_loc5_ < _loc6_)
            {
               _loc16_ = {};
               _2704(param1._1781[_loc5_],_loc16_,param3);
               param2[_101.SKIN].push(_loc16_);
               _loc5_++;
            }
         }
         if(param1._1811 != SymbolType.COMIC)
         {
            _loc5_ = 0;
            _loc6_ = int(param1._13619.length);
            while(_loc5_ < _loc6_)
            {
               _loc17_ = {};
               _2681(param1._13619[_loc5_],_loc17_,param1._10658,param3,param4);
               param2[_101.ANIMATION].push(_loc17_);
               _loc5_++;
            }
         }
         else if(param3)
         {
            _loc18_ = [];
            if(param1._1763)
            {
               _2661(param1._1763,_loc18_);
               param2[_205.COMIC_ANIMATION] = _loc18_;
            }
         }
         param1._10663(_loc7_);
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
         param2[_101.A_NAME] = param1.name;
         if(param1.parentBoneData)
         {
            param2[_101.A_PARENT] = param1.parentBoneData.name;
         }
         if(param1.length > 0)
         {
            param2[_101.A_LENGTH] = param1.length;
         }
         param2[_101.TRANSFORM] = _2678(param1._1724,param3);
         param2[_101.A_INHERIT_ROTATION] = param1.inheritRotation;
         param2[_101.A_INHERIT_SCALE] = param1.inheritScale;
         if(param3)
         {
            param2[_101.A_ID] = param1.id;
            param2[_101.A_BONE_SYMBOL_COLOR] = param1._14270;
         }
      }
      
      private static function _2714(param1:_77, param2:Object, param3:Boolean) : void
      {
         param2[_101.A_NAME] = param1.name;
         param2[_101.A_IK_TARGET] = param1.target.name;
         if(param1.bones.length > 1)
         {
            param2[_101.A_IK_CHAIN] = 1;
            param2[_101.A_IK_BONE] = param1.bones[1].name;
         }
         else
         {
            param2[_101.A_IK_BONE] = param1.bones[0].name;
         }
         if(param1.bendDirection != 1)
         {
            param2[_101.A_IK_BENDPOSITIVE] = "false";
         }
         if(param1.weight != 1)
         {
            param2[_101.A_IK_WEIGHT] = param1.weight;
         }
         if(param3)
         {
            param2[_101.A_ID] = param1.id;
         }
      }
      
      private static function _2703(param1:_79, param2:int, param3:Object, param4:Boolean, param5:Boolean) : void
      {
         var _loc6_:Object = null;
         param3[_101.A_NAME] = param1.name;
         if(param1.parentBoneData)
         {
            param3[_101.A_PARENT] = param1.parentBoneData.name;
         }
         if(param1._1711)
         {
            param3[_101.A_DISPLAY_INDEX] = param1._1711.displayIndex;
         }
         else
         {
            param3[_101.A_DISPLAY_INDEX] = -1;
         }
         param3[_101.A_Z_ORDER] = param2;
         if(param4)
         {
            param3[_101.COLOR] = _2662(param1._2152,param5);
         }
         if(Boolean(param1.blendMode) && param1.blendMode != BlendMode.NORMAL)
         {
            param3[_101.A_BLENDMODE] = param1.blendMode;
         }
         if(param1.gotoAndPlay)
         {
            (_loc6_ = {})[_101.A_GOTOANDPLAY] = param1.gotoAndPlay;
            param3[_101.A_ACTIONS] = [_loc6_];
         }
         if(param5)
         {
            param3[_101.A_ID] = param1.id;
            param3[_101.ONLY_BOUNDINGBOX] = param1.onlyBoundingBox;
         }
      }
      
      private static function _2704(param1:_78, param2:Object, param3:Boolean) : void
      {
         var _loc4_:* = undefined;
         var _loc5_:Object = null;
         param2[_101.A_NAME] = param1.name;
         param2[_101.SLOT] = [];
         for(_loc4_ in param1._1765)
         {
            if(param1._1765[_loc4_] != null)
            {
               _loc5_ = {};
               _2683(_loc4_,param1._1765[_loc4_],_loc5_,param3);
               param2[_101.SLOT].push(_loc5_);
            }
         }
         if(param3)
         {
            param2[_101.A_ID] = param1.id;
         }
      }
      
      private static function _2683(param1:_79, param2:Dictionary, param3:Object, param4:Boolean) : void
      {
         var _loc5_:_70 = null;
         var _loc6_:_69 = null;
         var _loc9_:Object = null;
         _2703(param1,0,param3,false,param4);
         delete param3[_101.A_DISPLAY_INDEX];
         delete param3[_101.A_PARENT];
         delete param3[_101.A_Z_ORDER];
         param3[_101.DISPLAY] = [];
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
            param3[_101.DISPLAY].push(_loc9_);
            _loc7_++;
         }
         if(param4)
         {
            param3[_101.A_ID] = param1.id;
         }
      }
      
      private static function _2690(param1:_70, param2:Object, param3:Boolean) : void
      {
         if(param3)
         {
            param2[_101.A_NAME] = param1.name;
            if(param1.textureName)
            {
               param2[_101.A_TEXTURE_NAME] = param1.textureName;
            }
            if(param1.width > 0)
            {
               param2[_101.A_WIDTH] = param1.width;
            }
            if(param1.height > 0)
            {
               param2[_101.A_HEIGHT] = param1.height;
            }
         }
         else
         {
            param2[_101.A_NAME] = param1.name;
         }
         if(param1._13228 != null)
         {
            param2[_101.A_NAME] = param1._13230;
            param2[_101.A_PATH] = param1.name;
         }
         param2[_101.A_TYPE] = param1.type.toString();
         if(param1.filterType)
         {
            param2[_101.A_FILTER_TYPE] = param1.filterType.toString();
         }
         param2[_101.TRANSFORM] = _2678(param1.localTransform,param3);
         if(param3)
         {
            param2[_101.A_ID] = param1.id;
         }
         if(Boolean(param1) && param1.type == _74.MESH)
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
         param2[_101.A_UV] = _loc7_;
         param2[_101.A_VERTICES] = _loc8_;
         param2[_101.A_TRIANGLES] = _loc11_;
         param2[_101.A_EDGES] = _loc9_;
         param2[_101.A_WIDTH] = param1.mesh.maxWidth;
         param2[_101.A_HEIGHT] = param1.mesh.maxHeight;
         var _loc15_:Object = param1.mesh._2707();
         if(_loc15_)
         {
            param2[_101.A_WEIGHTS] = _loc15_[_101.A_WEIGHTS];
            param2[_101.A_SLOT_POSE] = _2706(_loc15_[_101.A_SLOT_POSE]);
            param2[_101.A_BONE_POSE] = [];
            _loc12_ = 0;
            _loc13_ = int(_loc15_[_101.A_BONE].length);
            while(_loc12_ < _loc13_)
            {
               _loc14_ = _loc15_[_101.A_BONE][_loc12_];
               param2[_101.A_BONE_POSE].push(int(_loc14_));
               param2[_101.A_BONE_POSE] = param2[_101.A_BONE_POSE].concat(_2706(_loc15_[_101.A_BONE_POSE][_loc14_]));
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
         param2[_101.A_USER_EDGES] = _loc10_;
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
      
      private static function _2681(param1:_13502, param2:Object, param3:Array, param4:Boolean, param5:String) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:_13504 = null;
         var _loc9_:_13508 = null;
         var _loc10_:Object = null;
         var _loc11_:Object = null;
         var _loc12_:Object = null;
         var _loc13_:Object = null;
         var _loc14_:Object = null;
         var _loc15_:Object = null;
         var _loc16_:Object = null;
         var _loc17_:Object = null;
         param2[_101.A_NAME] = param1.name;
         param2[_101.A_DURATION] = int(param1.duration);
         param2[_101.A_PLAY_TIMES] = param1.playTimes;
         param2[_101.A_FADE_IN_TIME] = param1.fadeInTime;
         param2[_101.A_SCALE] = 1;
         param2[_101.FRAME] = [];
         param2[_101.BONE] = [];
         param2[_101.SLOT] = [];
         param2[_101.FFD] = [];
         param2[_101.IK] = [];
         if(param5 != _101.DATA_VERSION_5_5)
         {
            _loc6_ = 0;
            _loc7_ = int(param1._1746.length);
            while(_loc6_ < _loc7_)
            {
               _loc8_ = param1._1746[_loc6_];
               _loc10_ = {};
               _14276(_loc8_,_loc10_,param4,param1.duration);
               param2[_101.BONE].push(_loc10_);
               _loc6_++;
            }
            _loc6_ = 0;
            _loc7_ = int(param1._1745.length);
            while(_loc6_ < _loc7_)
            {
               _loc9_ = param1._1745[_loc6_];
               if(param4 || ((param1._1745[_loc6_] as _13508)._13599._1816.length > 0 || (param1._1745[_loc6_] as _13508)._13572._1816.length > 0))
               {
                  _loc11_ = {};
                  _14275(_loc9_,_loc11_,param4,param1.duration);
                  param2[_101.SLOT].push(_loc11_);
               }
               _loc6_++;
            }
         }
         else
         {
            _loc6_ = 0;
            _loc7_ = int(param1._1746.length);
            while(_loc6_ < _loc7_)
            {
               _loc12_ = {};
               _2665(param1._1746[_loc6_],_loc12_,param1.duration,param4);
               param2[_101.BONE].push(_loc12_);
               _loc6_++;
            }
            _loc6_ = 0;
            _loc7_ = int(param1._1745.length);
            while(_loc6_ < _loc7_)
            {
               if(param4 || Boolean(param1._1745[_loc6_] as _13508))
               {
                  _loc13_ = {};
                  _2666(param1._1745[_loc6_],_loc13_,param1.duration,param4);
                  param2[_101.SLOT].push(_loc13_);
               }
               _loc6_++;
            }
         }
         if(param1._1753)
         {
            _loc6_ = 0;
            _loc7_ = int(param1._1753.length);
            while(_loc6_ < _loc7_)
            {
               if(param4 || (param1._1753[_loc6_] as _13507)._1816.length > 0)
               {
                  _loc14_ = {};
                  _2669(param1._1753[_loc6_],_loc14_,param1.duration,param4);
                  param2[_101.FFD].push(_loc14_);
               }
               _loc6_++;
            }
         }
         if(param1._10657)
         {
            if(param4 || param1._10657._1816.length > 0)
            {
               _loc15_ = {};
               _10681(param1._10657,_loc15_,param1.duration,param3,param4);
               param2[_101.Z_ORDER] = _loc15_;
            }
         }
         if(Boolean(param1._13597) && param1._13597._1816.length > 0)
         {
            _loc16_ = {};
            _13618(param1._13597,_loc16_,param1.duration,param4);
            param2[_101.FRAME] = _loc16_[_101.FRAME];
         }
         if(param1._14271)
         {
            _loc6_ = 0;
            _loc7_ = int(param1._14271.length);
            while(_loc6_ < _loc7_)
            {
               if(param4 || (param1._14271[_loc6_] as _14035)._1816.length > 0)
               {
                  _loc17_ = {};
                  _14277(param1._14271[_loc6_],_loc17_,param1.duration,param4);
                  param2[_101.IK].push(_loc17_);
               }
               _loc6_++;
            }
         }
         if(param4)
         {
            param2[_101.A_ID] = param1.id;
         }
      }
      
      private static function _2665(param1:_13504, param2:Object, param3:int, param4:Boolean) : void
      {
         param2[_101.A_NAME] = param1.name;
         param2[_101.A_SCALE] = 1;
         param2[_101.A_OFFSET] = 0;
         param2[_101.A_PIVOT_X] = param1._1797.x;
         param2[_101.A_PIVOT_Y] = param1._1797.y;
         param2[_101.FRAME] = [];
         param1._13640();
         if(param1._13581)
         {
            param2[_101.TRANSLATE_FRAME] = [];
            _13629(param1._13581,param2[_101.TRANSLATE_FRAME],param3,param4);
         }
         if(param1._13586)
         {
            param2[_101.ROTATE_FRAME] = [];
            _13629(param1._13586,param2[_101.ROTATE_FRAME],param3,param4);
         }
         if(param1._13598)
         {
            param2[_101.SCALE_FRAME] = [];
            _13629(param1._13598,param2[_101.SCALE_FRAME],param3,param4);
         }
         param1._13635();
      }
      
      private static function _13629(param1:_13510, param2:Array, param3:int, param4:Boolean) : void
      {
         var _loc5_:_13496 = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Object = null;
         if(Boolean(param1._1816) && param1._1816.length > 0)
         {
            _loc6_ = 0;
            _loc7_ = int(param1._1816.length);
            while(_loc6_ < _loc7_)
            {
               _loc8_ = {};
               _loc5_ = param1._1816[_loc6_];
               if(_loc5_ is _13498)
               {
                  _13626(_loc5_ as _13498,_loc8_,param4);
               }
               else if(_loc5_ is _13499)
               {
                  _13622(_loc5_ as _13499,_loc8_,param4);
               }
               else if(_loc5_ is _13493)
               {
                  _13620(_loc5_ as _13493,_loc8_,param4);
               }
               else if(_loc5_ is _13494)
               {
                  _13624(_loc5_ as _13494,_loc8_,param4);
               }
               else if(_loc5_ is _13501)
               {
                  _13617(_loc5_ as _13501,_loc8_,param4);
               }
               else if(_loc5_ is _14034)
               {
                  _14278(_loc5_ as _14034,_loc8_,param4);
               }
               if(_loc6_ == _loc7_ - 1)
               {
                  _loc8_[_101.A_DURATION] = param3 - _loc5_.startPos;
                  if(!param4)
                  {
                     _loc8_[_101.A_TWEEN_EASING] = null;
                     delete _loc8_[_101.CURVE];
                  }
                  if(_loc8_[_101.A_DURATION] < 0)
                  {
                     _loc8_[_101.A_DURATION] = 0;
                  }
               }
               param2.push(_loc8_);
               _loc6_++;
            }
         }
      }
      
      private static function _13609(param1:_13510, param2:Array, param3:_79, param4:int, param5:Boolean) : void
      {
         var _loc6_:_13496 = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Object = null;
         if(Boolean(param1._1816) && param1._1816.length > 0)
         {
            _loc7_ = 0;
            _loc8_ = int(param1._1816.length);
            while(_loc7_ < _loc8_)
            {
               _loc9_ = {};
               _loc6_ = param1._1816[_loc7_];
               if(_loc6_ is _13495)
               {
                  _13610(_loc6_ as _13495,_loc9_,param3,param5);
               }
               if(_loc7_ == _loc8_ - 1)
               {
                  _loc9_[_101.A_DURATION] = param4 - _loc6_.startPos;
                  if(_loc9_[_101.A_DURATION] < 0)
                  {
                     _loc9_[_101.A_DURATION] = 0;
                  }
               }
               param2.push(_loc9_);
               _loc7_++;
            }
         }
      }
      
      private static function _13633(param1:_13496, param2:Object, param3:Boolean) : void
      {
         param2[_101.A_DURATION] = int(param1.duration);
         if(param1._13642)
         {
            if(param1._11515)
            {
               param2[_101.CURVE] = param1.tweenCurve.toArray();
            }
            else
            {
               param2[_101.A_TWEEN_EASING] = 0;
            }
         }
         else
         {
            param2[_101.A_TWEEN_EASING] = null;
         }
         if(param3)
         {
            param2[_101.A_ID] = param1.id;
            param2[_101.IS_FILL_FIRST] = param1.isFillFirst;
         }
      }
      
      private static function _13626(param1:_13498, param2:Object, param3:Boolean) : void
      {
         param2[_101.A_X] = param1._13638.x;
         param2[_101.A_Y] = param1._13638.y;
         _13633(param1,param2,param3);
      }
      
      private static function _14278(param1:_14034, param2:Object, param3:Boolean) : void
      {
         param2[_101.A_IK_BENDPOSITIVE] = param1.bend == -1 ? false : true;
         param2[_101.A_IK_WEIGHT] = param1._14279;
         _13633(param1,param2,param3);
      }
      
      private static function _13622(param1:_13499, param2:Object, param3:Boolean) : void
      {
         if(param1.tweenRotate != 0)
         {
            param2[_101.CLOCKWISE] = param1.tweenRotate;
         }
         param2[_101.ROTATE] = param1._13639 * _101.RADIAN_TO_ANGLE;
         _13633(param1,param2,param3);
      }
      
      private static function _13620(param1:_13493, param2:Object, param3:Boolean) : void
      {
         param2[_101.VALUE] = param1._13630 ? 1 : 0;
         _13633(param1,param2,param3);
      }
      
      private static function _13624(param1:_13494, param2:Object, param3:Boolean) : void
      {
         param2[_101.COLOR] = _2662(param1._13601,param3);
         _13633(param1,param2,param3);
      }
      
      private static function _13617(param1:_13501, param2:Object, param3:Boolean) : void
      {
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc4_:Vector.<Number> = param1._13636;
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
         param2[_101.A_VERTICES] = _loc5_;
         param2[_101.A_OFFSET] = _loc6_;
         _13633(param1,param2,param3);
      }
      
      private static function _13610(param1:_13495, param2:Object, param3:_79, param4:Boolean) : void
      {
         var _loc5_:Object = null;
         param2[_101.VALUE] = param3._1715.indexOf(param1._13613);
         if(param1._13603 != null && param1._13603 != "")
         {
            (_loc5_ = {})[_101.A_GOTOANDPLAY] = param1._13603;
            param2[_101.A_ACTIONS] = [_loc5_];
         }
         _13633(param1,param2,param4);
      }
      
      private static function _13621(param1:_13491, param2:Object, param3:Array, param4:Boolean) : void
      {
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
         var _loc10_:int = 0;
         var _loc5_:Array = !!param1._13637 ? param1._13637.concat() : [];
         if(param4)
         {
            param2[_101.Z_ORDER] = _loc5_;
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
            _loc9_ = null;
            if(_loc6_.length > 0)
            {
               _loc9_ = _10600._10669(_loc6_);
            }
            param2[_101.Z_ORDER] = _loc9_ == null ? [] : _loc9_;
         }
         _13633(param1,param2,param4);
      }
      
      private static function _13628(param1:Array, param2:Array) : void
      {
         var _loc3_:_13496 = null;
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_ = param1[_loc4_];
            if(param2.indexOf(_loc3_.startPos) < 0)
            {
               param2.push(_loc3_.startPos);
            }
            _loc4_++;
         }
      }
      
      private static function _13616(param1:Array, param2:int) : _13496
      {
         var _loc3_:_13496 = null;
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_ = param1[_loc4_];
            if(_loc3_.startPos == param2)
            {
               return _loc3_;
            }
            _loc4_++;
         }
         return null;
      }
      
      private static function _14032(param1:Array, param2:int) : Object
      {
         var _loc3_:_13496 = null;
         var _loc4_:* = false;
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            _loc3_ = param1[_loc5_];
            if(_loc3_.startPos == param2)
            {
               _loc4_ = _loc5_ == param1.length - 1;
               return {
                  "vo":_loc3_,
                  "canAddCurse":!_loc4_
               };
            }
            _loc5_++;
         }
         return {"vo":null};
      }
      
      private static function _13607(param1:Array, param2:int, param3:Boolean) : _13496
      {
         var _loc4_:_13496 = null;
         var _loc5_:_13496 = null;
         var _loc6_:int = 0;
         while(_loc6_ < param1.length)
         {
            _loc5_ = param1[_loc6_];
            if(param3 && _loc5_.startPos < param2)
            {
               _loc4_ = _loc5_;
            }
            if(param3 && _loc5_.startPos >= param2)
            {
               return _loc4_;
            }
            if(!param3 && _loc5_.startPos > param2)
            {
               return _loc5_;
            }
            _loc6_++;
         }
         if(_loc4_)
         {
            return _loc4_;
         }
         return null;
      }
      
      private static function _13614(param1:Array, param2:int, param3:Boolean = false) : Object
      {
         var _loc4_:Object = _14032(param1,param2);
         if(_loc4_.vo)
         {
            return _loc4_;
         }
         var _loc5_:_13496 = _13607(param1,param2,true);
         var _loc6_:_13496 = _13607(param1,param2,false);
         var _loc7_:_13498;
         (_loc7_ = new _13498()).startPos = param2;
         _loc7_.endPos = !!_loc6_ ? _loc6_.startPos : param2;
         var _loc8_:Number = 0;
         if(_loc5_)
         {
            if(_loc5_._13642)
            {
               if(_loc6_)
               {
                  _loc8_ = (param2 - _loc5_.startPos) / _loc5_.duration;
               }
               _loc7_ = _loc5_._1905(_loc8_,_loc6_,_loc7_) as _13498;
            }
            else
            {
               _loc7_._13641((_loc5_ as _13498)._13638.x,(_loc5_ as _13498)._13638.y);
            }
         }
         if(!_loc5_ && param3)
         {
            _loc7_._13641(1,1);
         }
         return {
            "vo":_loc7_,
            "canAddCurse":false
         };
      }
      
      private static function _13611(param1:Array, param2:int) : Object
      {
         var _loc3_:Object = _14032(param1,param2);
         if(_loc3_.vo)
         {
            return _loc3_;
         }
         var _loc4_:_13496 = _13607(param1,param2,true);
         var _loc5_:_13496 = _13607(param1,param2,false);
         var _loc6_:_13499;
         (_loc6_ = new _13499()).startPos = param2;
         _loc6_.endPos = !!_loc5_ ? _loc5_.startPos : param2;
         var _loc7_:Number = 0;
         if(_loc4_)
         {
            if(_loc4_._13642)
            {
               if(_loc5_)
               {
                  _loc7_ = (param2 - _loc4_.startPos) / _loc4_.duration;
               }
               _loc6_ = _loc4_._1905(_loc7_,_loc5_,_loc6_) as _13499;
            }
            else
            {
               _loc6_.value = (_loc4_ as _13499).value;
            }
         }
         return {
            "vo":_loc6_,
            "canAddCurse":false
         };
      }
      
      public static function _14276(param1:_13504, param2:Object, param3:Boolean, param4:int) : void
      {
         var _loc11_:Object = null;
         var _loc12_:Object = null;
         var _loc13_:Object = null;
         var _loc14_:Object = null;
         var _loc15_:int = 0;
         var _loc17_:_13496 = null;
         var _loc18_:_13496 = null;
         var _loc19_:_13496 = null;
         var _loc20_:Object = null;
         var _loc21_:_86 = null;
         var _loc22_:int = 0;
         var _loc23_:Array = null;
         var _loc24_:int = 0;
         param2[_101.A_NAME] = param1.name;
         param2[_101.A_SCALE] = 1;
         param2[_101.A_OFFSET] = 0;
         param2[_101.FRAME] = [];
         param2[_101.A_PIVOT_X] = param1._1797.x;
         param2[_101.A_PIVOT_Y] = param1._1797.y;
         var _loc5_:Array = param1._13581._1816;
         var _loc6_:Array = param1._13586._1816;
         var _loc7_:Array = param1._13598._1816;
         var _loc8_:Array = [];
         _13628(_loc5_,_loc8_);
         _13628(_loc6_,_loc8_);
         _13628(_loc7_,_loc8_);
         _loc8_.sort(Array.NUMERIC);
         var _loc9_:int = 0;
         var _loc10_:int = param4;
         if(param1._13581._1816.length > 0 || param1._13586._1816.length > 0 || param1._13598._1816.length > 0)
         {
            _loc17_ = _13616(_loc5_,0);
            _loc18_ = _13616(_loc6_,0);
            _loc19_ = _13616(_loc7_,0);
            if(!_loc17_ && !_loc18_ && !_loc19_)
            {
               _loc11_ = {};
               if(param3)
               {
                  _loc11_[_205.A_DURATION] = _loc8_[0];
                  _loc11_[_205.TRANSFORM] = _2678(new _86(),param3);
                  _loc11_[_205.A_TWEEN_EASING] = NaN;
                  _loc11_[_205.A_ID] = -1;
               }
               else
               {
                  _loc11_[_205.TRANSFORM] = _2678(new _86(),param3);
                  _loc11_[_205.A_DURATION] = _loc8_[0];
                  _loc11_[_101.A_TWEEN_EASING] = null;
                  _loc9_ += _loc11_[_205.A_DURATION];
               }
               param2[_101.FRAME].push(_loc11_);
            }
         }
         else if(!param3)
         {
            (_loc11_ = {})[_205.TRANSFORM] = _2678(new _86(),param3);
            _loc11_[_205.A_DURATION] = _loc10_;
            _loc11_[_101.A_TWEEN_EASING] = null;
            param2[_101.FRAME].push(_loc11_);
            _loc9_ = _loc10_;
         }
         var _loc16_:int = 0;
         while(_loc16_ < _loc8_.length)
         {
            _loc15_ = int(_loc8_[_loc16_]);
            _loc12_ = _13614(_loc5_,_loc15_);
            _loc13_ = _13611(_loc6_,_loc15_);
            _loc14_ = _13614(_loc7_,_loc15_,true);
            _loc20_ = {};
            _loc21_ = new _86();
            if(Boolean(_loc12_.vo) && _loc12_.vo is _13498)
            {
               _loc21_.x = (_loc12_.vo as _13498)._13638.x;
               _loc21_.y = (_loc12_.vo as _13498)._13638.y;
            }
            if(Boolean(_loc14_.vo) && _loc14_.vo is _13498)
            {
               _loc21_.scaleX = (_loc14_.vo as _13498)._13638.x;
               _loc21_.scaleY = (_loc14_.vo as _13498)._13638.y;
            }
            if(Boolean(_loc13_.vo) && _loc13_.vo is _13499)
            {
               _loc21_.skewX = (_loc13_.vo as _13499)._13639;
               _loc21_.skewY = (_loc13_.vo as _13499)._13639;
            }
            if(_loc16_ == _loc8_.length - 1)
            {
               _loc20_[_205.A_DURATION] = _loc10_ - _loc15_;
            }
            else
            {
               _loc22_ = int(_loc8_[_loc16_ + 1]);
               _loc20_[_205.A_DURATION] = _loc22_ - _loc15_;
            }
            _loc23_ = [_loc12_,_loc13_,_loc14_];
            _13625(_loc23_,_loc20_,param3);
            _loc20_[_101.TRANSFORM] = _2678(_loc21_,param3);
            _loc20_[_101.A_TWEEN_ROTATE] = (_loc13_.vo as _13499).tweenRotate;
            _loc9_ += _loc20_[_205.A_DURATION];
            param2[_101.FRAME].push(_loc20_);
            _loc16_++;
         }
         if(param3)
         {
            param2[_205.A_ID] = param1.id;
         }
         else if(_loc9_ < _loc10_)
         {
            _loc24_ = !!param2[_205.FRAME] ? int(param2[_205.FRAME].length) : 0;
            if(_loc24_ > 0)
            {
               param2[_205.FRAME][_loc24_ - 1].duration += _loc10_ - _loc9_;
            }
         }
      }
      
      private static function _13625(param1:Array, param2:Object, param3:Boolean) : void
      {
         var _loc5_:_13496 = null;
         var _loc4_:Boolean = false;
         var _loc6_:int = 0;
         while(_loc6_ < param1.length)
         {
            if(Boolean(param1[_loc6_].vo) && Boolean(param1[_loc6_].vo._13642) && Boolean(param1[_loc6_].canAddCurse))
            {
               _loc5_ = param1[_loc6_].vo as _13496;
               _loc4_ = true;
               break;
            }
            _loc6_++;
         }
         if(!_loc4_)
         {
            param2[_205.A_TWEEN_EASING] = null;
         }
         else if(_loc5_._11515)
         {
            param2[_205.CURVE] = _loc5_.tweenCurve.toArray();
         }
         else
         {
            param2[_205.A_TWEEN_EASING] = 0;
         }
      }
      
      private static function _13623(param1:_13491, param2:Object, param3:Boolean) : void
      {
         var _loc4_:_44 = null;
         var _loc8_:Array = null;
         var _loc9_:Object = null;
         var _loc5_:* = Number(currentVersion) < Number(_101.DATA_VERSION_5_0);
         var _loc6_:int = 0;
         var _loc7_:int = int(param1._13637.length);
         while(_loc6_ < _loc7_)
         {
            _loc4_ = param1._13637[_loc6_] as _44;
            if((Boolean(_loc4_)) && Boolean(_loc4_.value))
            {
               if(_loc5_ || _loc4_._1622 != _75.DISPATCH_EVENT)
               {
                  param2[_loc4_._1622.toString()] = _loc4_.value;
               }
               if(!_loc5_ && Boolean(_loc4_.event))
               {
                  _loc8_ = param2[_101.EVENTS] = param2[_101.EVENTS] || [];
                  (_loc9_ = {})[_101.A_NAME] = _loc4_.value;
                  if(_loc4_.event.bone)
                  {
                     _loc9_[_101.BONE] = _loc4_.event.bone.name;
                  }
                  else if(_loc4_.event.slot)
                  {
                     _loc9_[_101.SLOT] = _loc4_.event.slot.name;
                  }
                  if(_loc4_.event.ints.length)
                  {
                     _loc9_[_101.INTS] = _loc4_.event.ints.concat();
                  }
                  if(_loc4_.event.floats.length)
                  {
                     _loc9_[_101.FLOATS] = _loc4_.event.floats.concat();
                  }
                  if(_loc4_.event.strings.length)
                  {
                     _loc9_[_101.STRINGS] = _loc4_.event.strings.concat();
                  }
                  _loc8_.push(_loc9_);
               }
            }
            _loc6_++;
         }
         _13633(param1,param2,param3);
      }
      
      private static function _13612(param1:Array, param2:int) : Object
      {
         var _loc3_:Object = _14032(param1,param2);
         if(_loc3_.vo)
         {
            return _loc3_;
         }
         var _loc4_:_13496 = _13607(param1,param2,true);
         var _loc5_:_13496 = _13607(param1,param2,false);
         var _loc6_:_13494;
         (_loc6_ = new _13494()).startPos = param2;
         _loc6_.endPos = !!_loc5_ ? _loc5_.startPos : param2;
         var _loc7_:Number = 0;
         if(_loc4_)
         {
            if(_loc4_._13642)
            {
               if(_loc5_)
               {
                  _loc7_ = (param2 - _loc4_.startPos) / _loc4_.duration;
               }
               _loc6_ = _loc4_._1905(_loc7_,_loc5_,_loc6_) as _13494;
               if(_loc4_._11515)
               {
                  _loc6_.tweenCurve = _loc4_.tweenCurve;
                  _loc6_.tweenType = _loc4_.tweenType;
               }
               else
               {
                  _loc6_.tweenType = _loc4_.tweenType;
               }
            }
            else
            {
               _loc6_._13601.copyFrom((_loc4_ as _13494)._13601);
            }
         }
         return {
            "vo":_loc6_,
            "canAddCurse":true
         };
      }
      
      private static function _14275(param1:_13508, param2:Object, param3:Boolean, param4:int) : void
      {
         var _loc9_:Object = null;
         var _loc12_:Object = null;
         var _loc13_:_13496 = null;
         var _loc14_:int = 0;
         var _loc17_:_13496 = null;
         var _loc18_:_13496 = null;
         var _loc19_:Object = null;
         var _loc20_:int = 0;
         var _loc21_:_13495 = null;
         var _loc22_:int = 0;
         var _loc23_:Object = null;
         var _loc24_:int = 0;
         param2[_101.A_NAME] = param1.name;
         param2[_101.A_SCALE] = 1;
         param2[_101.A_OFFSET] = 0;
         param2[_101.FRAME] = [];
         var _loc5_:_79 = param1._1824;
         var _loc6_:Array = param1._13599._1816;
         var _loc7_:Array = param1._13572._1816;
         var _loc8_:Array = [];
         _13628(_loc6_,_loc8_);
         _13628(_loc7_,_loc8_);
         _loc8_.sort(Array.NUMERIC);
         var _loc10_:int = param4;
         var _loc11_:int = 0;
         if(_loc6_.length > 0 || _loc7_.length > 0)
         {
            _loc17_ = _13616(_loc6_,0);
            _loc18_ = _13616(_loc7_,0);
            if(!_loc17_ && !_loc18_)
            {
               _loc9_ = {};
               if(param3)
               {
                  _loc9_[_205.A_DURATION] = _loc8_[0];
                  _loc9_[_205.A_TWEEN_EASING] = NaN;
                  _loc9_[_205.A_ID] = -1;
               }
               else
               {
                  _loc9_[_205.A_DURATION] = _loc8_[0];
                  _loc9_[_205.A_TWEEN_EASING] = null;
                  _loc9_[_205.COLOR] = _2662(new _83(),param3);
                  _loc9_[_205.A_DISPLAY_INDEX] = _loc5_._2154;
                  _loc9_[_205.A_Z_ORDER] = 0;
                  _loc11_ += _loc9_[_205.A_DURATION];
               }
               param2[_101.FRAME].push(_loc9_);
            }
         }
         var _loc15_:int = _loc5_._2154;
         var _loc16_:int = 0;
         while(_loc16_ < _loc8_.length)
         {
            _loc14_ = int(_loc8_[_loc16_]);
            _loc12_ = _13612(_loc6_,_loc14_);
            _loc13_ = _13616(_loc7_,_loc14_);
            if(Boolean(_loc12_.vo) || Boolean(_loc13_))
            {
               _loc19_ = {};
               if(_loc12_.vo)
               {
                  _loc19_[_205.COLOR] = _2662((_loc12_.vo as _13494)._13601,param3);
                  if(Boolean(_loc12_.vo._13642) && Boolean(_loc12_.canAddCurse))
                  {
                     if(_loc12_.vo._11515)
                     {
                        _loc19_[_205.CURVE] = _loc12_.vo.tweenCurve.toArray();
                     }
                     else
                     {
                        _loc19_[_205.A_TWEEN_EASING] = 0;
                     }
                  }
                  else
                  {
                     _loc19_[_205.A_TWEEN_EASING] = null;
                  }
               }
               if(_loc13_)
               {
                  _loc21_ = _loc13_ as _13495;
                  _loc22_ = -1;
                  if(_loc21_)
                  {
                     if(_loc21_._13613)
                     {
                        _loc15_ = _loc22_ = _loc21_._13613.displayIndex;
                     }
                     else
                     {
                        _loc15_ = _loc22_ = -1;
                     }
                     if(_loc21_._13603 != null && _loc21_._13603 != "")
                     {
                        (_loc23_ = {})[_101.A_GOTOANDPLAY] = _loc21_._13603;
                        _loc19_[_101.A_ACTIONS] = [_loc23_];
                     }
                  }
                  _loc19_[_205.A_DISPLAY_INDEX] = _loc22_;
               }
               else
               {
                  _loc19_[_205.A_DISPLAY_INDEX] = _loc15_;
               }
               if(_loc16_ == _loc8_.length - 1)
               {
                  _loc19_[_205.A_DURATION] = _loc10_ - _loc14_;
               }
               else
               {
                  _loc20_ = int(_loc8_[_loc16_ + 1]);
                  _loc19_[_205.A_DURATION] = _loc20_ - _loc14_;
               }
               param2[_101.FRAME].push(_loc19_);
               _loc11_ += _loc19_[_205.A_DURATION];
            }
            _loc16_++;
         }
         if(param3)
         {
            param2[_205.A_ID] = param1.id;
         }
         else if(_loc11_ < _loc10_)
         {
            _loc24_ = !!param2[_205.FRAME] ? int(param2[_205.FRAME].length) : 0;
            if(_loc24_ > 0)
            {
               param2[_205.FRAME][_loc24_ - 1].duration += _loc10_ - _loc11_;
            }
         }
      }
      
      private static function _2666(param1:_13508, param2:Object, param3:int, param4:Boolean) : void
      {
         var _loc5_:int = 0;
         param2[_101.A_NAME] = param1.name;
         param2[_101.A_SCALE] = 1;
         param2[_101.A_OFFSET] = 0;
         param2[_101.FRAME] = [];
         param1._13640();
         if(param1._13599)
         {
            param2[_101.COLOR_FRAME] = [];
            _13629(param1._13599,param2[_101.COLOR_FRAME],param3,param4);
         }
         if(param1._13572)
         {
            param2[_101.DISPLAY_FRAME] = [];
            _13609(param1._13572,param2[_101.DISPLAY_FRAME],param1._1824,param3,param4);
         }
         if(param1._13592)
         {
            param2[_101.VISIBLE_FRAME] = [];
            _13629(param1._13592,param2[_101.VISIBLE_FRAME],param3,param4);
         }
         param1._13635();
      }
      
      private static function _2669(param1:_13507, param2:Object, param3:int, param4:Boolean) : void
      {
         param2[_101.A_NAME] = param1.name;
         param2[_101.SLOT] = param1._1826._1760.name;
         param2[_101.SKIN] = param1._1826._1985.name;
         param2[_101.A_SCALE] = 1;
         param2[_101.A_OFFSET] = 0;
         param2[_101.FRAME] = [];
         param1._13640();
         _13629(param1,param2[_101.FRAME],param3,param4);
         param1._13635();
      }
      
      private static function _14277(param1:_14035, param2:Object, param3:int, param4:Boolean) : void
      {
         param2[_101.A_NAME] = param1.name;
         param2[_101.A_SCALE] = 1;
         param2[_101.A_OFFSET] = 0;
         param2[_101.FRAME] = [];
         param1._13640();
         _13629(param1,param2[_101.FRAME],param3,param4);
         param1._13635();
      }
      
      private static function _10681(param1:_13509, param2:Object, param3:int, param4:Array, param5:Boolean) : void
      {
         var _loc6_:_13491 = null;
         var _loc7_:_13496 = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Object = null;
         param2[_101.A_SCALE] = 1;
         param2[_101.A_OFFSET] = 0;
         param2[_101.FRAME] = [];
         param1._13640();
         if(param1._1816.length > 0)
         {
            _loc6_ = param1._1816[0] as _13491;
            if((Boolean(_loc6_)) && _loc6_.isFillFirst)
            {
               _loc6_.value = param4.concat();
            }
         }
         if(Boolean(param1._1816) && param1._1816.length > 0)
         {
            _loc8_ = 0;
            _loc9_ = int(param1._1816.length);
            while(_loc8_ < _loc9_)
            {
               _loc10_ = {};
               _loc7_ = param1._1816[_loc8_];
               if(_loc7_ is _13491)
               {
                  _13621(_loc7_ as _13491,_loc10_,param4,param5);
               }
               if(_loc8_ == _loc9_ - 1)
               {
                  _loc10_[_101.A_DURATION] = param3 - _loc7_.startPos;
                  if(_loc10_[_101.A_DURATION] < 0)
                  {
                     _loc10_[_101.A_DURATION] = 0;
                  }
               }
               param2[_101.FRAME].push(_loc10_);
               _loc8_++;
            }
         }
         param1._13635();
      }
      
      private static function _13618(param1:_13506, param2:Object, param3:int, param4:Boolean) : void
      {
         var _loc5_:_13496 = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Object = null;
         param2[_101.A_SCALE] = 1;
         param2[_101.A_OFFSET] = 0;
         param2[_101.FRAME] = [];
         param1._13640();
         if(Boolean(param1._1816) && param1._1816.length > 0)
         {
            _loc6_ = 0;
            _loc7_ = int(param1._1816.length);
            while(_loc6_ < _loc7_)
            {
               _loc8_ = {};
               _loc5_ = param1._1816[_loc6_];
               if(_loc5_ is _13491)
               {
                  _13623(_loc5_ as _13491,_loc8_,param4);
               }
               param2[_101.FRAME].push(_loc8_);
               _loc6_++;
            }
         }
         param1._13635();
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
         _loc3_[_101.A_ALPHA_OFFSET] = param1.alphaOffset;
         _loc3_[_101.A_RED_OFFSET] = param1.redOffset;
         _loc3_[_101.A_GREEN_OFFSET] = param1.greenOffset;
         _loc3_[_101.A_BLUE_OFFSET] = param1.blueOffset;
         _loc3_[_101.A_ALPHA_MULTIPLIER] = int(param1.alphaMultiplier * 100);
         _loc3_[_101.A_RED_MULTIPLIER] = int(param1.redMultiplier * 100);
         _loc3_[_101.A_GREEN_MULTIPLIER] = int(param1.greenMultiplier * 100);
         _loc3_[_101.A_BLUE_MULTIPLIER] = int(param1.blueMultiplier * 100);
         return _loc3_;
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
         _loc3_[_101.A_X] = param1.x;
         _loc3_[_101.A_Y] = param1.y;
         _loc3_[_101.A_SKEW_X] = param1.skewX * _101.RADIAN_TO_ANGLE;
         _loc3_[_101.A_SKEW_Y] = param1.skewY * _101.RADIAN_TO_ANGLE;
         _loc3_[_101.A_SCALE_X] = param1.scaleX;
         _loc3_[_101.A_SCALE_Y] = param1.scaleY;
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
               _2685(_loc4_[_101.TRANSFORM],param2);
               if(_loc4_[_101.A_LENGTH])
               {
                  _loc4_[_101.A_LENGTH] *= param2;
               }
            }
            for each(_loc5_ in _loc3_.skin)
            {
               for each(_loc7_ in _loc5_.slot)
               {
                  for each(_loc8_ in _loc7_.display)
                  {
                     _2685(_loc8_[_101.TRANSFORM],param2);
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
                     _2685(_loc10_[_101.TRANSFORM],param2);
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
         _2689(param1[_101.A_VERTICES],param2);
         _2688(param1[_101.A_BONE_POSE],param2);
         _2687(param1[_101.A_SLOT_POSE],param2);
         if(param1[_101.A_HEIGHT])
         {
            param1[_101.A_HEIGHT] *= param2;
            param1[_101.A_HEIGHT] = int(param1[_101.A_HEIGHT]);
         }
         if(param1[_101.A_WIDTH])
         {
            param1[_101.A_WIDTH] *= param2;
            param1[_101.A_WIDTH] = int(param1[_101.A_WIDTH]);
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

