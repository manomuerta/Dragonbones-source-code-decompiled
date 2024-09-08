package _1374
{
   import egret.core._1140;
   
   public class _1386 extends _1140
   {
      public function _1386()
      {
         super();
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         graphics.clear();
         graphics.beginFill(16777215,0);
         graphics.drawRect(0,0,param1,param2);
         graphics.endFill();
      }
   }
}

