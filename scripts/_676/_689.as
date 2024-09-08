package _676
{
   import _40._43;
   import _703._702;
   import _703._705;
   
   public class _689 extends _701
   {
      public function _689()
      {
         super();
      }
      
      public static function _3996(param1:_702, param2:_43) : _689
      {
         var _loc3_:_689 = new _689();
         _loc3_.parent = param1;
         _loc3_._1770 = param2;
         _705._1878[param2] = _loc3_;
         return _loc3_;
      }
      
      public function get _1770() : _43
      {
         return _3670 as _43;
      }
      
      public function set _1770(param1:_43) : void
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

