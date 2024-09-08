package _28
{
   import _97._115;
   
   public class _32
   {
      public static var _1710:Boolean = false;
      
      public function _32()
      {
         super();
      }
      
      public static function _1708(param1:String, param2:String) : _30
      {
         var _loc3_:_30 = _1710 ? new _31(param1,true) : new _33(param1);
         _loc3_.id = param2;
         return _loc3_;
      }
      
      public static function _1697(param1:String, param2:String, param3:String = null, param4:String = null, param5:String = null, param6:* = null) : _30
      {
         var _loc7_:_30;
         (_loc7_ = _1710 ? new _31(param1) : new _33(param1)).id = param2;
         _loc7_.shortcut = param3;
         _loc7_.icon = param4;
         _loc7_.type = param5;
         _loc7_.userData = param6;
         _115._1709(_loc7_);
         return _loc7_;
      }
      
      public static function _1696() : _30
      {
         return _1710 ? new _31("",false,true) : _1697(null,null,null,null,"separator");
      }
   }
}

