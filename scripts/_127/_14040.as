package _127
{
   import _1045.Group;
   import _1045._1105;
   import _11845._11949;
   import _13._12;
   import _13._14;
   import egret.core._1133;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class _14040 extends Group
   {
      private var _14342:Class;
      
      public var _14344:Number = 0;
      
      public var _14345:Number = 0;
      
      public var _14349:Number = 0;
      
      public var _14348:Number = 0;
      
      private var bg:_1105;
      
      private var _2440:Group;
      
      private var _14338:_1105;
      
      private var element:_1133 = null;
      
      private var _14341:Boolean = true;
      
      private var _1857:Number;
      
      public function _14040()
      {
         this._14342 = _14040__14342;
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.top = 0;
         this.left = 0;
         this.right = 0;
         this.bottom = 0;
         this.bg = new _1105();
         this.bg.source = new this._14342();
         this.bg.top = 0;
         this.bg.left = 0;
         this.bg.right = 0;
         this.bg.bottom = 0;
         this._14338 = new _1105();
         this._14338.source = new this._14342();
         this._14338.top = 0;
         this._14338.left = 0;
         this._14338.right = 0;
         this._14338.bottom = 0;
         this._2440 = new Group();
         this._2440.mask = this._14338;
         addElement(this.bg);
         addElement(this._2440);
         addElement(this._14338);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this._14336);
      }
      
      private function _14336(param1:MouseEvent) : void
      {
         if(!this._14341)
         {
            return;
         }
         this.addEventListener(MouseEvent.MOUSE_UP,this._14337);
         this.addEventListener(MouseEvent.ROLL_OUT,this._14337);
         _14.setCursor(_12.CURSOR_DRAG_HAND_FORTOOL);
         this._2440.startDrag(false);
      }
      
      private function _14337(param1:MouseEvent = null) : void
      {
         this.removeEventListener(MouseEvent.MOUSE_UP,this._14337);
         this.removeEventListener(MouseEvent.ROLL_OUT,this._14337);
         _14._1602();
         this._2440.stopDrag();
      }
      
      public function _14339(param1:_1133) : void
      {
         this.element = param1;
      }
      
      public function _2894(param1:Number, param2:Number, param3:Number = -1) : void
      {
         if(!this.element)
         {
            return;
         }
         this._2440.addElement(this.element);
         this._14341 = true;
         this._14349 = param1;
         this._14348 = param2;
         if(param3 == -1)
         {
            this.showAll();
            dispatchEvent(new Event(Event.CHANGE));
         }
         else
         {
            this.scale = param3;
         }
         this.element.x = -this._14349 * 0.5;
         this.element.y = -this._14348 * 0.5;
         this._2440.x = this._14346;
         this._2440.y = this._14347;
         this.bg.width = this.width;
         this.bg.height = this.height;
      }
      
      public function set scale(param1:Number) : void
      {
         this._1857 = param1;
         var _loc2_:Number = this._14349 * this._1857;
         var _loc3_:Number = this._14348 * this._1857;
         if(_loc2_ < this._14344 && _loc3_ < this._14345)
         {
            this._14341 = false;
            _11949.to(this._2440,0.4,{
               "x":this._14346,
               "y":this._14347
            });
            this._14337();
         }
         else
         {
            this._14341 = true;
         }
         _11949.to(this._2440,0.4,{
            "scaleX":this._1857,
            "scaleY":this._1857
         });
      }
      
      public function get scale() : Number
      {
         return this._1857;
      }
      
      public function showAll() : Number
      {
         this.scale = Math.min(this._14344 / this._14349,this._14345 / this._14348,1);
         this._2440.x = this._14346;
         this._2440.y = this._14347;
         return this.scale;
      }
      
      public function get _14346() : Number
      {
         return this._14344 * 0.5;
      }
      
      public function get _14347() : Number
      {
         return this._14345 * 0.5;
      }
      
      public function _14343(param1:int, param2:int) : void
      {
         this._14344 = param1;
         this._14345 = param2;
      }
   }
}

