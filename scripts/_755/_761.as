package _755
{
   public class _761
   {
      public var autoRecordKeyFrame:Boolean = false;
      
      public var autoTween:Boolean = true;
      
      public function _761()
      {
         super();
      }
      
      public static function _1630(param1:Object) : _761
      {
         var _loc2_:_761 = new _761();
         _loc2_.autoRecordKeyFrame = param1.autoRecordKeyFrame == 1;
         _loc2_.autoTween = param1.autoTween == 1;
         return _loc2_;
      }
      
      public static function _1629(param1:_761) : Object
      {
         var _loc2_:Object = {};
         _loc2_.autoRecordKeyFrame = param1.autoRecordKeyFrame;
         _loc2_.autoTween = param1.autoTween;
         return _loc2_;
      }
   }
}

