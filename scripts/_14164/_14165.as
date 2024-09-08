package _14164
{
   import flash.filters.BitmapFilter;
   import flash.filters.ColorMatrixFilter;
   
   public class _14165 implements _14163
   {
      public var type:String;
      
      public var values:Array;
      
      public function _14165()
      {
         super();
      }
      
      public function _15169() : BitmapFilter
      {
         return new ColorMatrixFilter(this.values);
      }
   }
}

