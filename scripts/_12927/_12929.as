package _12927
{
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   
   public class _12929
   {
      public function _12929()
      {
         super();
      }
      
      public static function image(param1:Array, param2:int = 4, param3:int = 4) : BitmapData
      {
         var _loc12_:int = 0;
         var _loc4_:int = int(param1.length);
         var _loc5_:int = int(param1[0].length);
         var _loc6_:int = _loc5_ + 2 * param3;
         var _loc7_:int = _loc4_ + 2 * param3;
         var _loc8_:BitmapData = new BitmapData(_loc6_,_loc7_,false,16777215);
         var _loc9_:int = 0;
         while(_loc9_ < _loc4_)
         {
            _loc12_ = 0;
            while(_loc12_ < _loc5_)
            {
               if(param1[_loc9_][_loc12_] == 1)
               {
                  _loc8_.setPixel(_loc12_ + param3,_loc9_ + param3,0);
               }
               _loc12_++;
            }
            _loc9_++;
         }
         var _loc10_:Matrix = new Matrix();
         _loc10_.scale(param2,param2);
         var _loc11_:BitmapData = new BitmapData(_loc6_ * param2,_loc7_ * param2,false,16777215);
         _loc11_.draw(_loc8_,_loc10_);
         _loc8_.dispose();
         return _loc11_;
      }
   }
}

