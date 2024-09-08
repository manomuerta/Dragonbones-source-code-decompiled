package _676
{
   import _40._48;
   import _703._702;
   import _703._705;
   
   public class _699 extends _701
   {
      public function _699()
      {
         super();
      }
      
      public static function _3996(param1:_702, param2:_48) : _699
      {
         var _loc3_:_699 = new _699();
         _loc3_.parent = param1;
         _loc3_._1879 = param2;
         _705._1877[param2] = _loc3_;
         return _loc3_;
      }
      
      public function get _1879() : _48
      {
         return _3670 as _48;
      }
      
      public function set _1879(param1:_48) : void
      {
         if(_3670 == param1)
         {
            return;
         }
         _3670 = param1;
         init();
      }
   }
}

