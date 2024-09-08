package egret.utils
{
   import flash.desktop.NativeApplication;
   
   public class _1288
   {
      private static var _renderMode:String;
      
      public function _1288()
      {
         super();
      }
      
      public static function get renderMode() : String
      {
         if(_renderMode)
         {
            return _renderMode;
         }
         var _loc1_:XML = NativeApplication.nativeApplication.applicationDescriptor;
         var _loc2_:Namespace = _loc1_.namespace();
         _renderMode = _loc1_._loc2_::initialWindow[0]._loc2_::renderMode[0];
         return _renderMode;
      }
   }
}

