package _708
{
   import _73.DBEnumBase;
   
   public class _707 extends DBEnumBase
   {
      public static const GLOBAL:_707 = new _707("global");
      
      public static const PARENT:_707 = new _707("parent");
      
      public static const LOCAL:_707 = new _707("local");
      
      public function _707(param1:String)
      {
         super(param1);
      }
      
      public static function _5623(param1:String) : _707
      {
         return DBEnumBase._1665[param1];
      }
   }
}

