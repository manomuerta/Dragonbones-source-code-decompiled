package _676
{
   import _51._70;
   import _703._702;
   import _703._704;
   
   public class _685 extends _704
   {
      public function _685()
      {
         super();
      }
      
      public static function _1572(param1:_70, param2:_702) : _685
      {
         var _loc3_:_685 = new _685();
         _loc3_.parent = param2;
         _loc3_.displayVO = param1;
         return _loc3_;
      }
      
      public function get displayVO() : _70
      {
         return _3670 as _70;
      }
      
      public function set displayVO(param1:_70) : void
      {
         if(param1 == _3670)
         {
            return;
         }
         _3670 = param1;
      }
   }
}

