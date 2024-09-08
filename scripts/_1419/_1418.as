package _1419
{
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.utils.getTimer;
   
   public class _1418 extends Sprite
   {
      private var shape:Shape;
      
      private var _height:Number = 2;
      
      private var _width:Number = 2;
      
      private var _color:uint = 12955583;
      
      private var _timeStamp:int = 0;
      
      public function _1418()
      {
         super();
         this.shape = new Shape();
         this.addChild(this.shape);
         this._9958();
         this._9917();
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function set color(param1:uint) : void
      {
         this._color = param1;
         this._9958();
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = param1;
         this._9958();
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = param1;
         this._9958();
      }
      
      private function _9958() : void
      {
         this.shape.graphics.clear();
         this.shape.graphics.beginFill(this._color);
         this.shape.graphics.drawRect(0,0,this._width,this._height);
         this.shape.graphics.endFill();
      }
      
      public function _9917() : void
      {
         this.shape.visible = true;
         this._timeStamp = getTimer();
         this.addEventListener(Event.ENTER_FRAME,this._8632);
      }
      
      protected function _8632(param1:Event) : void
      {
         if(getTimer() - this._timeStamp > 500)
         {
            this.shape.visible = !this.shape.visible;
            this._timeStamp = getTimer();
         }
      }
      
      public function _9957() : void
      {
         this.shape.visible = true;
         this.removeEventListener(Event.ENTER_FRAME,this._8632);
      }
   }
}

