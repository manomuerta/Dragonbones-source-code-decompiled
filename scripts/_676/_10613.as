package _676
{
   import _40.TimelineVOBase;
   import _703._702;
   import _703._705;
   
   public class _10613 extends _701
   {
      public function _10613()
      {
         super();
      }
      
      public static function _3996(param1:_702, param2:TimelineVOBase) : _10613
      {
         var _loc3_:_10613 = new _10613();
         _loc3_.parent = param1;
         _loc3_._10696 = param2;
         _705._10706[param2] = _loc3_;
         return _loc3_;
      }
      
      public function get _10696() : TimelineVOBase
      {
         return _3670 as TimelineVOBase;
      }
      
      public function set _10696(param1:TimelineVOBase) : void
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

