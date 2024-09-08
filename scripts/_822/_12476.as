package _822
{
   import _1045._1105;
   import egret.core._1110;
   import flash.geom.Matrix;
   
   public class _12476 extends _1105
   {
      public function _12476()
      {
         super();
      }
      
      override protected function _8597(param1:Object, param2:Object) : void
      {
         super._8597(param1,param2);
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         var _loc3_:_1110 = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Matrix = null;
         super._5823(param1,param2);
         if(content is _1110)
         {
            _loc3_ = content as _1110;
            if(_loc3_.bitmapData)
            {
               _loc4_ = _loc3_.bitmapData.width;
               _loc5_ = _loc3_.bitmapData.height;
               this.graphics.clear();
               (_loc6_ = new Matrix()).tx = (-_loc4_ + param1) / 2;
               _loc6_.ty = (-_loc5_ + param2) / 2;
               graphics.beginBitmapFill(_loc3_.bitmapData,_loc6_,false);
               graphics.drawRect(0,0,param1,param2);
               graphics.endFill();
            }
         }
      }
   }
}

