package _14164
{
   import flash.filters.BitmapFilter;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.BlurFilter;
   
   public class _14167 implements _14163
   {
      public var _15173:Number = 0;
      
      public var _15172:Number = 0;
      
      public function _14167()
      {
         super();
      }
      
      public function _15169() : BitmapFilter
      {
         return new BlurFilter(this._15173,this._15172,BitmapFilterQuality.HIGH);
      }
   }
}

