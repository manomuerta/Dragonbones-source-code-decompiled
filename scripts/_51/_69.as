package _51
{
   public class _69
   {
      public var id:int;
      
      public var _1760:_79;
      
      public function _69()
      {
         super();
      }
      
      public static function _1807(param1:int) : _69
      {
         var _loc2_:_69 = new _69();
         _loc2_.id = param1;
         return _loc2_;
      }
      
      public function get displayIndex() : int
      {
         return this._1760._1715.indexOf(this);
      }
   }
}

