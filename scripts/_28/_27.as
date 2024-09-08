package _28
{
   import _639.HotkeysModel;
   import _97._115;
   
   public class _27
   {
      private static var _14266:HotkeysModel = HotkeysModel.getInstance();
      
      public function _27()
      {
         super();
      }
      
      public static function _1697(param1:String, param2:Object, param3:String = null, param4:String = null, param5:String = null, param6:* = null, param7:String = null) : _29
      {
         var _loc8_:_29;
         (_loc8_ = new _29(param1)).id = param2;
         _loc8_.shortcut = param3;
         _loc8_._14265 = param7 == null ? "" : _14266._14264(param7);
         _loc8_.icon = param4;
         _loc8_.type = param5;
         _loc8_.userData = param6;
         _115._1695(_loc8_);
         return _loc8_;
      }
      
      public static function _1696() : _29
      {
         return _1697(null,null,null,null,"separator");
      }
   }
}

