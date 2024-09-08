package _676
{
   import _40.TimelineVOBase;
   import _703._702;
   import _703._705;
   
   public class _688 extends _701
   {
      public function _688()
      {
         super();
      }
      
      public static function _3996(param1:_702, param2:TimelineVOBase) : _688
      {
         var _loc3_:_688 = new _688();
         _loc3_.parent = param1;
         _loc3_._3917 = param2;
         _705._3393[param2] = _loc3_;
         return _loc3_;
      }
      
      public function get _3917() : TimelineVOBase
      {
         return _3670 as TimelineVOBase;
      }
      
      public function set _3917(param1:TimelineVOBase) : void
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

