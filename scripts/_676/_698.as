package _676
{
   import _51._70;
   import _51._78;
   import _703._702;
   import _703._704;
   import _703._705;
   import flash.utils.Dictionary;
   
   public class _698 extends _704
   {
      public function _698()
      {
         super();
      }
      
      public static function _3996(param1:_702, param2:_78) : _698
      {
         var _loc3_:_698 = new _698();
         _loc3_.parent = param1;
         _loc3_._1839 = param2;
         return _loc3_;
      }
      
      public function init() : void
      {
         var _loc1_:Dictionary = null;
         var _loc2_:_70 = null;
         for each(_loc1_ in this._5865._1765)
         {
            for each(_loc2_ in _loc1_)
            {
               this._5825(_loc2_);
            }
         }
      }
      
      public function _5825(param1:_70) : void
      {
         _705._3014[param1] = _685._1572(param1,null);
      }
      
      public function _5824(param1:_70) : void
      {
         _705._3014[param1] = null;
      }
      
      public function set _1839(param1:_78) : void
      {
         if(_3670 == param1)
         {
            return;
         }
         _3670 = param1;
         this.init();
      }
      
      private function get _5865() : _78
      {
         return _3670 as _78;
      }
   }
}

