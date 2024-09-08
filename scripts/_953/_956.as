package _953
{
   import egret.core._1140;
   
   public class _956 extends _1140
   {
      public var _4901:Boolean;
      
      public function _956()
      {
         super();
      }
      
      public function dispose() : void
      {
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         graphics.clear();
         graphics.beginFill(0,0);
         graphics.drawRect(0,0,param1,param2);
         graphics.endFill();
      }
   }
}

