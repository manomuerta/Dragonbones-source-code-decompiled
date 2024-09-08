package _439
{
   import _40._45;
   
   public class _445
   {
      public static const TWEEN_ENABLED:String = "tweenEnabled";
      
      public static const ALL:String = "all";
      
      public static const TRANSFORM:String = "transform";
      
      public static const ALL_WITHOUT_PLACEHOLDER:String = "allWithoutPlaceHolder";
      
      public var _1946:_45;
      
      public var _3136:String = "";
      
      public var value:*;
      
      public function _445()
      {
         super();
      }
      
      public static function _1572(param1:_45, param2:String, param3:*) : _445
      {
         var _loc4_:_445;
         (_loc4_ = new _445())._1946 = param1;
         _loc4_._3136 = param2;
         _loc4_.value = param3;
         return _loc4_;
      }
   }
}

