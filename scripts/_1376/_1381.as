package _1376
{
   import egret.core._1140;
   import flash.display.Graphics;
   
   public class _1381 extends _1140
   {
      public var target:BoxElement;
      
      public function _1381()
      {
         super();
         mouseChildren = false;
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         if(isNaN(param1))
         {
            param1 = 0;
         }
         if(isNaN(param2))
         {
            param2 = 0;
         }
         var _loc3_:Graphics = graphics;
         _loc3_.clear();
         _loc3_.lineStyle(0,1777701,0,true,"normal","square");
         if(param1 > param2)
         {
            _loc3_.moveTo(0,1);
            _loc3_.lineTo(param1,1);
         }
         else
         {
            _loc3_.moveTo(1,0);
            _loc3_.lineTo(1,param2 - 1);
         }
         _loc3_.endFill();
         _loc3_.lineStyle();
         _loc3_.beginFill(39679,0);
         _loc3_.drawRect(0,0,param1,param2);
         _loc3_.endFill();
      }
   }
}

