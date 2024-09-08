package _676
{
   import _40._41;
   import _703._702;
   import _703._705;
   
   public class _683 extends _701
   {
      public function _683()
      {
         super();
      }
      
      public static function _3996(param1:_702, param2:_41) : _683
      {
         var _loc3_:_683 = new _683();
         _loc3_.parent = param1;
         _loc3_._1880 = param2;
         _705._1876[param2] = _loc3_;
         return _loc3_;
      }
      
      public function get _1880() : _41
      {
         return _3670 as _41;
      }
      
      public function set _1880(param1:_41) : void
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

