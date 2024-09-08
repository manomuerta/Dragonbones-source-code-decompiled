package _470
{
   import _13492._13493;
   import _13492._13494;
   import _13492._13495;
   import _13492._13498;
   import _13492._13499;
   import _13503._13502;
   import _13505._13504;
   import _13505._13507;
   import _13505._13508;
   import _13505._13510;
   import _40._45;
   import _413._458;
   import _413._460;
   import _51._50;
   import _51._52;
   import _51._69;
   import _51._70;
   import _51._71;
   import _51._77;
   import _51._79;
   import _54._53;
   import _54._56;
   import _54._57;
   import _54._67;
   import _573.TimelinePanelController;
   import _644._645;
   import _644._646;
   import _708._715;
   import _708._719;
   import _721._763;
   import _724._13550;
   import _724._725;
   import _81._83;
   import _81._86;
   import _81._91;
   import _97._124;
   import egret.utils.tr;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class _469
   {
      public function _469()
      {
         super();
      }
      
      public static function _2860(param1:String, param2:_715) : Object
      {
         return {
            "projectPath":param1,
            "_2872":param2
         };
      }
      
      public static function _3492(param1:String, param2:Array = null, param3:Array = null) : Object
      {
         return {
            "projectPath":param1,
            "_3292":param2,
            "_13240":param3
         };
      }
      
      public static function _3493(param1:Object, param2:String) : Object
      {
         return {
            "_1897":param1,
            "name":param2
         };
      }
      
      public static function _3476(param1:Array, param2:int, param3:_715, param4:_719, param5:Array, param6:int = -1, param7:int = -1) : Object
      {
         return {
            "items":param1,
            "_2996":param2,
            "_2873":param3,
            "_2974":param4,
            "_2953":param5,
            "_2969":param6,
            "_2968":param7
         };
      }
      
      public static function _2980(param1:Object, param2:_719, param3:Array, param4:int = -1, param5:int = -1) : Object
      {
         return {
            "_1897":param1,
            "_2974":param2,
            "_2953":param3,
            "_2969":param4,
            "_2968":param5
         };
      }
      
      public static function _2979(param1:Array, param2:Array) : Object
      {
         return {
            "items":param1,
            "_2953":param2
         };
      }
      
      public static function _3477(param1:Array, param2:int = -1, param3:int = -1) : Object
      {
         var _loc5_:_52 = null;
         var _loc4_:Array = [];
         for each(_loc5_ in param1)
         {
            _loc4_.push(param2 != -1 ? Boolean(param2) : _loc5_.inheritScale,param3 != -1 ? Boolean(param3) : _loc5_.inheritRotation);
         }
         return {
            "items":param1,
            "inheritValueList":_loc4_
         };
      }
      
      public static function _3480(param1:_52, param2:Number, param3:Number) : Object
      {
         return {
            "_1836":param1,
            "length":param2,
            "rotation":param3
         };
      }
      
      public static function _3469(param1:String, param2:_52, param3:Vector.<_52>, param4:int = 1, param5:Number = 1) : Object
      {
         return {"_1897":_77._2132({
            "name":param1,
            "_1897":param2,
            "bones":param3,
            "bendDirection":param4,
            "weight":param5
         })};
      }
      
      public static function _3152(param1:_79, param2:_70) : Object
      {
         return {
            "_1837":param1,
            "_3013":param2
         };
      }
      
      public static function _3473(param1:Array, param2:Array, param3:Array) : Object
      {
         return {
            "_3022":param1,
            "_3019":param2,
            "_3018":param3
         };
      }
      
      public static function _3484(param1:_79, param2:_83, param3:_83) : Object
      {
         return {
            "_1837":param1,
            "newColor":param2,
            "_3007":param3
         };
      }
      
      public static function _14405(param1:_79, param2:String, param3:String) : Object
      {
         return {
            "_1837":param1,
            "_10564":param2,
            "_10563":param3
         };
      }
      
      public static function _3491(param1:_45, param2:Object) : Object
      {
         return {
            "_1946":param1,
            "data":param2
         };
      }
      
      public static function _3478(param1:Array, param2:Object) : Object
      {
         return {
            "_3437":param1,
            "data":param2
         };
      }
      
      public static function _3488(param1:Array, param2:Array) : Object
      {
         return {
            "_3437":param1,
            "datas":param2
         };
      }
      
      public static function _3494(param1:_763, param2:Number, param3:Number, param4:uint) : Object
      {
         return {
            "canvas":param1,
            "width":param2,
            "height":param3,
            "color":param4
         };
      }
      
      public static function _2916(param1:_52, param2:_52, param3:Array = null) : Object
      {
         return {
            "_1836":param1,
            "_2890":param2,
            "_2887":param3
         };
      }
      
      public static function _2934(param1:_52) : Object
      {
         return {"_1779":[param1]};
      }
      
      public static function _2897(param1:_79, param2:_52, param3:Number = NaN) : Object
      {
         return {
            "_1837":param1,
            "_2890":param2,
            "zOrder":param3
         };
      }
      
      public static function _2896(param1:_79) : Object
      {
         return {"_1837":param1};
      }
      
      public static function _3481(param1:_725, param2:String, param3:_50, param4:_52, param5:_13502, param6:_52, param7:_79, param8:int, param9:Point = null, param10:Boolean = false, param11:Boolean = false, param12:Boolean = true) : Object
      {
         var _loc16_:String = null;
         var _loc17_:_52 = null;
         var _loc18_:String = null;
         var _loc19_:_79 = null;
         var _loc20_:_13498 = null;
         var _loc21_:_13499 = null;
         var _loc22_:_13498 = null;
         var _loc23_:_13494 = null;
         var _loc24_:_13495 = null;
         var _loc25_:_13493 = null;
         var _loc13_:Object = {};
         var _loc14_:String = param1.name.split("/").pop();
         if(param10)
         {
            _loc16_ = _124._1747(_loc14_,param3._1793);
            _loc17_ = _52._1729(_loc16_,param4);
            _loc18_ = _124._1747(_loc14_,param3._1996);
            _loc19_ = _79._1729(_loc18_,_loc17_);
            _loc17_._1882 = _loc19_;
            _loc13_.newBoneVO = _loc17_;
            _loc13_._1836 = _loc17_;
            _loc13_.newSlotVO = _loc19_;
            _loc13_._1837 = _loc19_;
            _loc13_.displayVO = _3483(_loc19_,param1,_loc13_);
         }
         else
         {
            _loc13_._1836 = param6;
            _loc13_._1837 = param7;
            _loc13_.displayVO = _3483(param7,param1,_loc13_);
         }
         var _loc15_:_86 = new _86(param9.x,param9.y);
         _loc13_.transform = _loc15_;
         if(param10 || !param11)
         {
            (_loc20_ = new _13498()).startPos = param8;
            _loc20_._13641(_loc15_.x,_loc15_.y);
            (_loc21_ = new _13499()).startPos = param8;
            _loc21_.value = 0;
            (_loc22_ = new _13498()).startPos = param8;
            _loc22_._13641(1,1);
            _loc13_._13627 = _loc20_;
            _loc13_._13710 = _loc21_;
            _loc13_._13631 = _loc22_;
            (_loc23_ = new _13494()).startPos = param8;
            (_loc24_ = new _13495()).startPos = param8;
            (_loc25_ = new _13493()).startPos = param8;
            _loc25_.value = true;
            _loc13_._13632 = _loc23_;
            _loc13_._13707 = _loc24_;
            _loc13_._13708 = _loc25_;
         }
         _loc13_.imageFileVO = param1;
         _loc13_._2898 = param2;
         _loc13_._1886 = param3;
         _loc13_._1992 = param5;
         _loc13_.frameIndex = param8;
         _loc13_._3052 = param4;
         _loc13_.forceNewLayer = param10;
         _loc13_.addDisplayToEmptyFrame = param11;
         _loc13_.autoTween = param12;
         return _loc13_;
      }
      
      private static function _3483(param1:_79, param2:_725, param3:Object) : _70
      {
         var _loc4_:_69 = null;
         var _loc5_:_70 = null;
         for each(_loc5_ in param1._1765)
         {
            if(_loc5_._2104 == param2)
            {
               return _loc5_;
            }
         }
         _loc5_ = _70._2090(param2);
         param3.needAddDisplayVO = true;
         return _loc5_;
      }
      
      public static function _3482(param1:_70, param2:String, param3:_79, param4:_52, param5:Point = null) : Object
      {
         return {
            "displayVO":param1,
            "_2898":param2,
            "_2899":param3,
            "_2890":param4,
            "_2549":param5
         };
      }
      
      public static function _2895(param1:_70, param2:String, param3:_79, param4:_69 = null, param5:Boolean = true) : Object
      {
         return {
            "displayVO":param1,
            "_2898":param2,
            "_2899":param3,
            "_1733":param4,
            "_2904":param5
         };
      }
      
      public static function _14443(param1:_13502, param2:_13504) : Object
      {
         return {
            "_14396":param2,
            "_1992":param1
         };
      }
      
      public static function _14442(param1:_13502, param2:_13508) : Object
      {
         return {
            "_14415":param2,
            "_1992":param1
         };
      }
      
      public static function _14441(param1:_13502, param2:_13507) : Object
      {
         return {
            "_14402":param2,
            "_1992":param1
         };
      }
      
      public static function _2900(param1:_70, param2:_70 = null) : Object
      {
         return {
            "displayVO":param1,
            "_2924":param2
         };
      }
      
      public static function _2874(param1:Array, param2:_52) : Object
      {
         return {
            "items":param1,
            "_2890":param2
         };
      }
      
      public static function _3468(param1:Array, param2:_91, param3:_70, param4:Array, param5:Array = null) : Object
      {
         return {
            "_3038":param1,
            "toParentSlotVO":param2,
            "_3034":param3,
            "_3032":param4,
            "toParentPlaceHolderList":param5
         };
      }
      
      public static function _3467(param1:Array, param2:_91, param3:Array, param4:Array) : Object
      {
         return {
            "_3038":param1,
            "toParentBoneVO":param2,
            "toParentSlotVOList":param3,
            "_3032":param4
         };
      }
      
      public static function _3497(param1:Number, param2:Point, param3:Boolean = false) : Object
      {
         return {
            "zoom":param1,
            "_2549":param2
         };
      }
      
      public static function _3470(param1:String, param2:String, param3:Boolean) : Object
      {
         return {
            "target":param1,
            "type":param2,
            "value":param3
         };
      }
      
      public static function _3475(param1:Object, param2:String, param3:Boolean) : Object
      {
         return {
            "item":param1,
            "type":param2,
            "value":param3
         };
      }
      
      public static function _3471(param1:String, param2:Boolean) : Object
      {
         return {
            "target":param1,
            "value":param2
         };
      }
      
      public static function _3498(param1:_13502) : Object
      {
         var _loc2_:Object = {};
         var _loc3_:_50 = param1.rootArmatureData;
         var _loc4_:_52 = _loc3_._1990;
         var _loc5_:String = tr("Timeline.basic.newLayer");
         var _loc6_:String = _124._1747(_loc5_,_loc3_._1793);
         var _loc7_:_52 = _52._1729(_loc6_,_loc4_);
         var _loc8_:String = _124._1747(_loc5_,_loc3_._1996);
         var _loc9_:_79 = _79._1729(_loc8_,_loc7_);
         _loc7_._1882 = _loc9_;
         _loc2_.newBoneVO = _loc7_;
         _loc2_.newSlotVO = _loc9_;
         _loc2_._1992 = param1;
         _loc2_._3052 = _loc4_;
         return _loc2_;
      }
      
      public static function _3495(param1:Object, param2:_13504, param3:_13508, param4:_13502, param5:String) : Object
      {
         var _loc7_:String = null;
         var _loc8_:_13508 = null;
         var _loc9_:_79 = null;
         var _loc10_:_725 = null;
         var _loc11_:_13495 = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:_70 = null;
         var _loc6_:Object = {};
         var _loc15_:Array = [];
         var _loc16_:Array = [];
         var _loc17_:Object = {};
         var _loc18_:_79 = param3._1824;
         for(_loc7_ in param1.bones)
         {
            _loc6_._13756 = param1.bones[_loc7_]["translate"];
            _loc6_._13759 = param1.bones[_loc7_]["rotate"];
            _loc6_._13760 = param1.bones[_loc7_]["scale"];
         }
         for(_loc7_ in param1.slots)
         {
            _loc13_ = int(param1.slots[_loc7_]["color"].length);
            _loc6_._13761 = param1.slots[_loc7_]["color"];
            _loc6_._13758 = param1.slots[_loc7_]["display"];
            _loc6_._13757 = param1.slots[_loc7_]["visible"];
            _loc8_ = param4._1859(_loc7_);
            if(_loc8_ == null)
            {
               return null;
            }
            _loc9_ = _loc8_._1824;
            _loc12_ = 0;
            while(_loc12_ < _loc13_)
            {
               _loc11_ = param1.slots[_loc7_]["display"][_loc12_];
               if(_loc11_._13613)
               {
                  _loc10_ = (_loc9_._1765[_loc11_._13613] as _70)._2104;
                  _loc17_.needAddDisplayVO = false;
                  _loc14_ = _3483(_loc18_,_loc10_,_loc17_);
                  _loc15_.push(_loc14_);
                  if(_loc17_.needAddDisplayVO)
                  {
                     _loc16_.push(_loc14_);
                  }
               }
               else
               {
                  _loc15_.push(null);
               }
               _loc12_++;
            }
         }
         _loc6_._2978 = _loc15_;
         _loc6_._3422 = _loc16_;
         _loc6_.targetBoneTimeline = param2;
         _loc6_.targetSlotTimeline = param3;
         _loc6_._2898 = param5;
         _loc6_._3014 = new Dictionary();
         return _loc6_;
      }
      
      public static function _3490(param1:_71, param2:_50, param3:_50, param4:String) : Object
      {
         var _loc5_:Object;
         (_loc5_ = {}).dragonBonesVO = param1;
         _loc5_._2869 = param2;
         _loc5_._2870 = param3;
         _loc5_._2866 = param4;
         return _loc5_;
      }
      
      public static function _3487(param1:_71, param2:_50, param3:_50, param4:String) : Object
      {
         var _loc5_:_50 = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc6_:Object = {};
         if(param2.name == param3.name)
         {
            _loc7_ = 0;
            _loc8_ = int(param1._2126.length);
            while(_loc7_ < _loc8_)
            {
               if(param1._2126[_loc7_].name != param3.name)
               {
                  _loc5_ = param1._2126[_loc7_];
                  _loc6_._4154 = true;
                  break;
               }
               _loc7_++;
            }
         }
         _loc6_.dragonBonesVO = param1;
         _loc6_._2912 = _loc5_;
         _loc6_._2870 = param2;
         _loc6_._2913 = param4;
         return _loc6_;
      }
      
      public static function _3485(param1:_50, param2:String, param3:_79) : Object
      {
         var _loc4_:Object;
         (_loc4_ = {})._1837 = param3;
         _loc4_._1886 = param1;
         if(param3)
         {
            _loc4_._2945 = param3.gotoAndPlay;
         }
         else
         {
            _loc4_._2945 = param1.defaultAnimation;
         }
         _loc4_.newAnimation = param2;
         return _loc4_;
      }
      
      public static function _3486(param1:_460, param2:_458, param3:Array) : Object
      {
         var _loc4_:Object;
         (_loc4_ = {}).deleteFrames = param1;
         _loc4_._3413 = param2;
         _loc4_.pasteFrames = param3;
         return _loc4_;
      }
      
      public static function _3474(param1:_70, param2:String, param3:_50, param4:_52, param5:Point = null) : Object
      {
         var _loc6_:Object = {};
         var _loc7_:String = param1.name;
         var _loc8_:String = _124._1747(_loc7_,param3._1793);
         var _loc9_:_52 = _52._1729(_loc8_,param4);
         var _loc10_:String = _124._1747(_loc7_,param3._1996);
         var _loc11_:_79 = _79._1729(_loc10_,_loc9_);
         _loc9_._1882 = _loc11_;
         _loc6_._1836 = _loc9_;
         _loc6_._1837 = _loc11_;
         _loc6_.displayVO = param1;
         _loc6_.needAddDisplayVO = true;
         var _loc12_:_86 = new _86(param5.x,param5.y);
         _loc9_._1724.copyFrom(_loc12_);
         _loc6_._2898 = param2;
         _loc6_._1886 = param3;
         _loc6_._3052 = param4;
         return _loc6_;
      }
      
      public static function _3489(param1:_53, param2:_56, param3:_57, param4:_67, param5:_645, param6:_646) : Object
      {
         var _loc7_:Object;
         (_loc7_ = {})._1992 = param1;
         _loc7_._2070 = param2;
         _loc7_._2069 = param3;
         _loc7_._2071 = param4;
         _loc7_._3070 = param5;
         _loc7_._3077 = param6;
         return _loc7_;
      }
      
      public static function _3125(param1:_57, param2:_67, param3:int, param4:_646) : Object
      {
         var _loc5_:Object;
         (_loc5_ = {})._2069 = param1;
         _loc5_._2071 = param2;
         _loc5_._3075 = param3;
         _loc5_._3077 = param4;
         return _loc5_;
      }
      
      public static function _3479(param1:_56, param2:_57, param3:_67, param4:int, param5:_645, param6:int) : Object
      {
         var _loc7_:Object;
         (_loc7_ = {})._2070 = param1;
         _loc7_._2069 = param2;
         _loc7_._2071 = param3;
         _loc7_._3074 = param4;
         _loc7_._3070 = param5;
         _loc7_._3067 = param6;
         return _loc7_;
      }
      
      public static function _3472(param1:_53, param2:_56, param3:_57, param4:_67, param5:int, param6:_645, param7:int) : Object
      {
         var _loc8_:Object;
         (_loc8_ = {})._1744 = param1;
         _loc8_._2070 = param2;
         _loc8_._2069 = param3;
         _loc8_._2071 = param4;
         _loc8_._3068 = param5;
         _loc8_._3070 = param6;
         _loc8_._3067 = param7;
         return _loc8_;
      }
      
      public static function _3496(param1:_67, param2:_67, param3:_67) : Object
      {
         var _loc4_:Object;
         (_loc4_ = {}).dragTweenVO = param1;
         _loc4_._2056 = param2;
         _loc4_._3088 = param3;
         return _loc4_;
      }
      
      public static function _13765(param1:Array, param2:Array, param3:Array, param4:Array, param5:Array, param6:Array) : Object
      {
         return {
            "_13721":param1,
            "_13701":param2,
            "_13720":param3,
            "_13719":param4,
            "_13718":param5,
            "_13717":param6
         };
      }
      
      public static function _13764(param1:Object, param2:String) : Object
      {
         return {
            "_1897":param1,
            "name":param2
         };
      }
      
      public static function _13766(param1:Array, param2:_13550) : Object
      {
         return {
            "itemsVOList":param1,
            "_6074":param2
         };
      }
      
      public static function _13767(param1:_71, param2:Array, param3:Array, param4:_50) : Object
      {
         var _loc5_:_50 = null;
         var _loc8_:_50 = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:String = null;
         var _loc6_:Object = {};
         var _loc7_:Boolean = false;
         var _loc9_:Array = [];
         var _loc10_:int = 0;
         while(_loc10_ < param2.length)
         {
            if(param2[_loc11_].name == param4.name)
            {
               _loc7_ = true;
               _loc8_ = param2[_loc11_];
            }
            _loc9_.push(param2[_loc11_].name);
            _loc10_++;
         }
         if(_loc7_)
         {
            _loc11_ = 0;
            _loc12_ = int(param1._2126.length);
            while(_loc11_ < _loc12_)
            {
               _loc13_ = param1._2126[_loc11_].name;
               if(_loc9_.indexOf(_loc13_) < 0 && _loc13_ != param4.name)
               {
                  _loc5_ = param1._2126[_loc11_];
                  _loc6_._4154 = true;
                  break;
               }
               _loc11_++;
            }
         }
         _loc6_.dragonBonesVO = param1;
         _loc6_._2912 = _loc5_;
         _loc6_._13740 = param2;
         _loc6_._13741 = param3;
         _loc6_._13742 = _loc8_;
         return _loc6_;
      }
      
      public static function _13768(param1:_13550) : Object
      {
         var _loc2_:Object = {};
         _loc2_._13736 = param1;
         return _loc2_;
      }
      
      public static function _14404(param1:TimelinePanelController, param2:_79, param3:_83) : Object
      {
         var _loc8_:_13508 = null;
         var _loc9_:_13510 = null;
         var _loc10_:_13494 = null;
         var _loc4_:Object = new Object();
         var _loc5_:int = param1.timeline.curFrame;
         var _loc6_:_13502 = param1._13704;
         var _loc7_:Boolean = param1.autoKey;
         _loc4_.frameIndex = _loc5_;
         _loc4_._1992 = _loc6_;
         _loc4_.autoKey = param1.autoKey;
         _loc4_._1837 = param2;
         _loc4_.newColor = param3;
         _loc4_.alpha = true;
         if(_loc7_)
         {
            _loc8_ = _loc6_._1875(param2);
            if(_loc8_)
            {
               _loc9_ = _loc8_._13599;
               if((_loc10_ = _loc9_.getFrameByIndex(_loc5_) as _13494) == null)
               {
                  _loc4_._3005 = true;
                  (_loc10_ = new _13494()).startPos = param1.timeline.curFrame;
                  _loc10_.tweenType = 1;
                  _loc10_.value = param3;
               }
               _loc4_._3007 = _loc10_._13601;
               _loc4_._1945 = _loc9_;
               _loc4_._1946 = _loc10_;
            }
         }
         return _loc4_;
      }
      
      public static function _14403(param1:TimelinePanelController, param2:_79, param3:_70) : Object
      {
         var _loc8_:_13508 = null;
         var _loc9_:_13510 = null;
         var _loc10_:_13495 = null;
         var _loc4_:Object = new Object();
         var _loc5_:int = param1.timeline.curFrame;
         var _loc6_:_13502 = param1._13704;
         var _loc7_:Boolean = param1.autoKey;
         _loc4_.frameIndex = _loc5_;
         _loc4_._1992 = _loc6_;
         _loc4_.autoKey = param1.autoKey;
         _loc4_._1837 = param2;
         _loc4_._3013 = param3;
         if(_loc7_)
         {
            _loc8_ = _loc6_._1875(param2);
            if(_loc8_)
            {
               _loc9_ = _loc8_._13572;
               if((_loc10_ = _loc9_.getFrameByIndex(_loc5_) as _13495) == null)
               {
                  _loc4_._3005 = true;
                  (_loc10_ = new _13495()).startPos = _loc5_;
                  _loc10_.value = !!param3 ? param3._1733 : null;
               }
               _loc4_.oldDisplay = param2._1765[_loc10_._13613];
               _loc4_._1945 = _loc9_;
               _loc4_._1946 = _loc10_;
            }
         }
         return _loc4_;
      }
   }
}

