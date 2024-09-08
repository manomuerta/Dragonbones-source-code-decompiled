package _14164
{
   import flash.filters.BitmapFilter;
   
   public class _14166
   {
      public var _15171:Vector.<_14163>;
      
      public function _14166()
      {
         this._15171 = new Vector.<_14163>();
         super();
      }
      
      public function _15170() : Array
      {
         var _loc2_:_14163 = null;
         var _loc3_:BitmapFilter = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this._15171)
         {
            _loc3_ = _loc2_._15169();
            if(_loc3_)
            {
               _loc1_.push(_loc3_);
            }
         }
         return _loc1_;
      }
   }
}

