package _844
{
   public class _846 extends _845
   {
      private var _6274:Number = 6;
      
      private var _6273:Number = 6;
      
      public function _846()
      {
         super();
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         graphics.clear();
         graphics.beginFill(0,0);
         graphics.drawRect(0,-this._6273 / 2 - 1,param1,this._6273 + 2);
         graphics.endFill();
         var _loc3_:Number = param1 - (this._6274 + 1) / 2;
         if(_loc3_ > 0)
         {
            graphics.lineStyle(1,_6270);
            graphics.moveTo(0,0);
            graphics.lineTo(_loc3_,0);
         }
         graphics.beginFill(_6270);
         graphics.drawRect(_loc3_,-this._6273 / 2,this._6274,this._6273);
         graphics.endFill();
      }
   }
}

