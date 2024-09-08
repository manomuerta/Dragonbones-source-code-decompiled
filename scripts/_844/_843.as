package _844
{
   public class _843 extends _845
   {
      private var _6269:Number = 13;
      
      private var _6268:Number = 5;
      
      public function _843()
      {
         super();
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         graphics.clear();
         if(param1 != 0)
         {
            graphics.beginFill(0,0);
            graphics.drawRect(0,-this._6268 - 1,param1 + 1,(this._6268 + 1) * 2);
            graphics.endFill();
            graphics.lineStyle(1,_6270);
            graphics.moveTo(0,0);
            graphics.lineTo(param1 - this._6269,0);
            graphics.beginFill(_6270);
            graphics.moveTo(param1 - this._6269,this._6268);
            graphics.lineTo(param1,0);
            graphics.lineTo(param1 - this._6269,-this._6268);
            graphics.lineTo(param1 - this._6269,this._6268);
            graphics.endFill();
         }
      }
   }
}

