package _844
{
   import egret.core._1140;
   import flash.events.MouseEvent;
   
   public class _847 extends _1140
   {
      private var _6277:Boolean = false;
      
      private var _6278:Boolean = true;
      
      private var _6272:Boolean = false;
      
      private var _6206:Boolean = false;
      
      public function _847()
      {
         super();
         addEventListener(MouseEvent.ROLL_OVER,this._6275);
         addEventListener(MouseEvent.ROLL_OUT,this._6276);
      }
      
      private function _6275(param1:MouseEvent) : void
      {
         this._6272 = true;
         this.update();
      }
      
      private function _6276(param1:MouseEvent) : void
      {
         this._6272 = false;
         this.update();
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         graphics.clear();
         graphics.lineStyle(1,0);
         graphics.beginFill(16777215,1);
         graphics.drawCircle(0,0,4);
         graphics.endFill();
      }
      
      public function _4365(param1:Boolean) : void
      {
         this._6278 = false;
         this._6277 = param1;
         this.update();
      }
      
      public function _4337() : void
      {
         this._6278 = true;
         this.update();
      }
      
      private function update() : void
      {
         if(this._6278)
         {
            this._6207 = this._6272;
            this._6277 = this._6272;
         }
         else
         {
            this._6207 = this._6277;
         }
      }
      
      public function get _5297() : Boolean
      {
         return this._6277;
      }
      
      public function get _5122() : Boolean
      {
         return this._6278;
      }
      
      public function set _6207(param1:Boolean) : void
      {
         if(this._6206 == param1)
         {
            return;
         }
         this._6206 = param1;
         invalidateDisplayList();
      }
   }
}

