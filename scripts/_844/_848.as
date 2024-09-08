package _844
{
   import _51._52;
   import _97._100;
   import egret.core._1140;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   
   public class _848 extends _1140
   {
      protected static var _6271:DropShadowFilter = new DropShadowFilter(0,0,3355443,0.8,4,4,2);
      
      private var _6281:_52;
      
      private var _6279:Boolean = true;
      
      private var _6278:Boolean = true;
      
      private var _6272:Boolean = false;
      
      private var _color:uint;
      
      public function _848()
      {
         this._color = _100._2269;
         super();
         filters = [_6271];
         addEventListener(MouseEvent.ROLL_OVER,this._6275);
         addEventListener(MouseEvent.ROLL_OUT,this._6276);
         visible = false;
      }
      
      public function dispose() : void
      {
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
         graphics.lineStyle(2,this._color);
         graphics.beginFill(16777215,0);
         graphics.drawCircle(0,0,4);
         graphics.endFill();
         graphics.lineStyle(2,this._color);
         graphics.moveTo(-5,-5);
         graphics.lineTo(-3,-3);
         graphics.moveTo(3,3);
         graphics.lineTo(5,5);
         graphics.moveTo(5,-5);
         graphics.lineTo(3,-3);
         graphics.moveTo(-3,3);
         graphics.lineTo(-5,5);
         graphics.endFill();
      }
      
      public function _4365(param1:Boolean) : void
      {
         this._6278 = false;
         this._6279 = param1;
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
            this._6279 = this._6272;
         }
         else
         {
            this._6207 = this._6279;
         }
      }
      
      public function get _6280() : Boolean
      {
         return this._6279;
      }
      
      public function get _5122() : Boolean
      {
         return this._6278;
      }
      
      public function get _1836() : _52
      {
         return this._6281;
      }
      
      public function set _1836(param1:_52) : void
      {
         if(this._6281 == param1)
         {
            return;
         }
         this._6281 = param1;
         visible = this._6281 != null;
         this.update();
      }
      
      private function set _6207(param1:Boolean) : void
      {
         this._color = param1 ? _100._2259 : _100._2269;
         invalidateDisplayList();
      }
   }
}

