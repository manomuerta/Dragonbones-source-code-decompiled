package _609
{
   import _521._528;
   import flash.display.BitmapData;
   
   public class _612 extends _620
   {
      public function _612()
      {
         super();
      }
      
      override public function run() : void
      {
         var _loc1_:Object = null;
         if(_3613._5414)
         {
            complete();
            return;
         }
         var _loc2_:int = 0;
         var _loc3_:int = int(_3613.images.length);
         while(_loc2_ < _loc3_)
         {
            _loc1_ = _3613.images[_loc2_];
            if(_loc1_.assetData == null || _loc1_.assetData == _528._14513)
            {
               _loc1_.assetData = new BitmapData(1,1);
            }
            _loc2_++;
         }
         complete();
      }
   }
}

