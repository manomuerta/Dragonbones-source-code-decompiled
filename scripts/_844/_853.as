package _844
{
   import _1045.Group;
   import _97._100;
   import flash.events.MouseEvent;
   
   public class _853 extends Group
   {
      private var _6285:Number = 0;
      
      private var _6307:Number = 5;
      
      private var _6309:_843;
      
      private var _6310:_843;
      
      private var _4367:Boolean = false;
      
      private var _4366:Boolean = false;
      
      private var _6278:Boolean = true;
      
      private var _6272:Boolean = false;
      
      public function _853()
      {
         this._6309 = new _843();
         this._6310 = new _843();
         super();
         width = 0;
         height = 0;
         this.radius = 30;
         addEventListener(MouseEvent.ROLL_OVER,this._6283);
         addEventListener(MouseEvent.ROLL_OUT,this._6284);
      }
      
      public function _4365(param1:Boolean, param2:Boolean) : void
      {
         this._6278 = false;
         this._4367 = param1;
         this._4366 = param2;
         this.update();
      }
      
      public function _4337() : void
      {
         this._6278 = true;
         this.update();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._6308(this._6309,_100._2264,this._6307);
         this._6308(this._6310,_100._2265,0,this._6307,90);
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         graphics.clear();
         graphics.beginFill(0,0);
         graphics.drawCircle(0,0,this._6307 + 1);
         graphics.endFill();
         graphics.lineStyle(1,6710886,0.5,true,"none");
         graphics.drawCircle(0,0,this._6307);
      }
      
      private function _6308(param1:_843, param2:uint, param3:Number = 0, param4:Number = 0, param5:Number = 0) : void
      {
         param1.color = param2;
         param1.x = param3;
         param1.y = param4;
         param1.rotation = param5;
         this.addElement(param1);
         param1.addEventListener(MouseEvent.ROLL_OVER,this._6305);
         param1.addEventListener(MouseEvent.ROLL_OUT,this._6306);
      }
      
      private function _6283(param1:MouseEvent) : void
      {
         this._6272 = true;
         this.update();
      }
      
      private function _6284(param1:MouseEvent) : void
      {
         this._6272 = false;
         this.update();
      }
      
      private function _6305(param1:MouseEvent) : void
      {
         (param1.currentTarget as _843)._6272 = true;
         this.update();
      }
      
      private function _6306(param1:MouseEvent) : void
      {
         (param1.currentTarget as _843)._6272 = false;
         this.update();
      }
      
      private function update() : void
      {
         if(this._6278)
         {
            this._6309._6207 = this._6309._6272;
            this._6310._6207 = this._6310._6272;
            this._4367 = this._6272 && !this._6310._6272;
            this._4366 = this._6272 && !this._6309._6272;
         }
         else
         {
            this._6309._6207 = this._4367 != this._4366 ? this._4367 : false;
            this._6310._6207 = this._4367 != this._4366 ? this._4366 : false;
         }
      }
      
      public function get radius() : Number
      {
         return this._6285;
      }
      
      public function set radius(param1:Number) : void
      {
         if(this._6285 == param1)
         {
            return;
         }
         this._6285 = param1;
         this._6309.width = this._6285 - this._6307;
         this._6310.width = this._6285 - this._6307;
      }
      
      public function get _4368() : Boolean
      {
         return this._4367;
      }
      
      public function get _4369() : Boolean
      {
         return this._4366;
      }
      
      public function get _5122() : Boolean
      {
         return this._6278;
      }
   }
}

