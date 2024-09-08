package _217
{
   import _13503._13502;
   
   public class _221
   {
      public static const TWEEN_ENABLED:String = "tweenEnabled";
      
      public var target:_13502;
      
      public var fadeInTime:Number;
      
      public var playTimes:int;
      
      public function _221()
      {
         super();
      }
      
      public static function _1572(param1:_13502, param2:Number, param3:int) : _221
      {
         var _loc4_:_221;
         (_loc4_ = new _221()).target = param1;
         _loc4_.fadeInTime = param2;
         _loc4_.playTimes = param3;
         return _loc4_;
      }
   }
}

