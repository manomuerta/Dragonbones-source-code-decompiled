package _18
{
   import _217._216;
   import _217._218;
   import _217._219;
   import _217._220;
   import _217._221;
   import _217._222;
   import _217._223;
   import _217._224;
   import _226._231;
   import _226._232;
   import _226._248;
   import _226._261;
   import _226._264;
   import _35.HashObject;
   import _388._404;
   import _40.TimelineVOBase;
   import _40._39;
   import _40._45;
   import _40._47;
   import _413._412;
   import _413._434;
   import _413._436;
   import _413._455;
   import _413._456;
   import _413._457;
   import _413._458;
   import _413._461;
   import _413._466;
   import _416._418;
   import _416._421;
   import _439._11233;
   import _439._11234;
   import _439._11235;
   import _439._443;
   import _51._52;
   import _51._79;
   import _708._707;
   import _708._715;
   import _708._718;
   import _73.DBEnumBase;
   import _73._74;
   import _73._75;
   import _81._83;
   import _81._86;
   import avmplus.getQualifiedClassName;
   import flash.geom.Point;
   
   public class _17
   {
      private static var e1:_74 = _74.ARMATURE;
      
      private static var e2:_75 = _75.DISPATCH_EVENT;
      
      private static var e3:_707 = _707.PARENT;
      
      private static var e4:_715 = _715.ANIMATE;
      
      private static var e5:_718 = _718.ROTATION;
      
      private static var _1623:Object = {
         "AddDisplayToBone":_231,
         "AddDisplayToSlot":_232,
         "ModifySlotDefaultDisplay":_261,
         "ModifyBoneAnimationTransform":_418,
         "ModifyBoneTransform":_248,
         "ModifySlotTransform":_264,
         "SelectItems":_404,
         "_216":_216,
         "AddFrameActionCmd":_11233,
         "_412":_412,
         "_434":_434,
         "_218":_218,
         "DelFrameActionCmd":_11234,
         "_436":_436,
         "_219":_219,
         "_220":_220,
         "ModifyFrameActionCmd":_11235,
         "_443":_443,
         "_421":_421,
         "_455":_455,
         "_457":_457,
         "_222":_222,
         "_224":_224
      };
      
      public static var _1624:Object = {
         "int":int,
         "Number":Number,
         "String":String,
         "Array":Array,
         "Point":Point,
         "HashObject":HashObject,
         "DBEnumBase":DBEnumBase,
         "_86":_86,
         "_45":_45,
         "_221":_221,
         "_39":_39,
         "_47":_47,
         "_83":_83,
         "_456":_456,
         "TimelineVOBase":TimelineVOBase,
         "_458":_458,
         "_461":_461,
         "_223":_223,
         "_466":_466,
         "_79":_79,
         "_52":_52
      };
      
      public function _17()
      {
         super();
         e1 = null;
         e2 = null;
         e3 = null;
         e4 = null;
         e5 = null;
      }
      
      public static function _1618(param1:String) : Class
      {
         return _1623[param1];
      }
      
      public static function _1619(param1:String) : Class
      {
         return _1624[param1];
      }
      
      public static function _1620(param1:*) : String
      {
         var _loc2_:String = null;
         for(_loc2_ in _1623)
         {
            if(getQualifiedClassName(_1623[_loc2_]) == getQualifiedClassName(param1))
            {
               return _loc2_;
            }
         }
         return "";
      }
      
      public static function _1621(param1:*) : String
      {
         var _loc2_:String = null;
         for(_loc2_ in _1624)
         {
            if(param1 is (_1624[_loc2_] as Class))
            {
               return _loc2_;
            }
         }
         return "Object";
      }
   }
}

