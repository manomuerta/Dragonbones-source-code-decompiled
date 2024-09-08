package _915
{
   import _1045.Group;
   import _1045._1082;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class _918 extends Group
   {
      private const BAR_WIDTH:int = 58;
      
      private const THUMB_WIDTH:int = 8;
      
      public var _6600:_1082;
      
      public var _2557:_1082;
      
      public var maximum:int = 100;
      
      public var _6599:int = 0;
      
      private var _value:int;
      
      private var _6598:Number;
      
      private var _6597:Number;
      
      public function _918()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._6600 = new _1082();
         this._6600.fillColor = 3818056;
         this._6600.width = this.BAR_WIDTH;
         this._6600.height = 4;
         this._6600.radius = 4;
         this._6600.y = 2;
         addElement(this._6600);
         this._2557 = new _1082();
         this._2557.radius = 8;
         this._2557.fillColor = 16777215;
         this._2557.width = this.THUMB_WIDTH;
         this._2557.height = this.THUMB_WIDTH;
         addElement(this._2557);
         this.value = this._value;
         this._2557.addEventListener(MouseEvent.MOUSE_DOWN,this._4063);
         this._6600.addEventListener(MouseEvent.CLICK,this._6596);
      }
      
      private function _6596(param1:MouseEvent) : void
      {
         var _loc2_:Number = this._6600.mouseX;
         var _loc3_:int = _loc2_ / this.BAR_WIDTH * 100;
         if(_loc3_ > this.maximum)
         {
            _loc3_ = this.maximum;
         }
         else if(_loc3_ < this._6599)
         {
            _loc3_ = this._6599;
         }
         if(this._value != _loc3_)
         {
            this._value = _loc3_;
            dispatchEvent(new Event(Event.CHANGE,true));
         }
      }
      
      private function _4063(param1:MouseEvent) : void
      {
         if(this._2557.stage)
         {
            this._6598 = this._2557.stage.mouseX;
            this._6597 = this._value;
            this._2557.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            this._2557.stage.addEventListener(MouseEvent.MOUSE_UP,this._4083);
         }
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:Number = this._2557.stage.mouseX;
         var _loc3_:Number = _loc2_ - this._6598;
         var _loc4_:int = this._6597 + int(_loc3_);
         if(_loc4_ > this.maximum)
         {
            _loc4_ = this.maximum;
         }
         else if(_loc4_ < this._6599)
         {
            _loc4_ = this._6599;
         }
         if(this._value != _loc4_)
         {
            this._value = _loc4_;
            dispatchEvent(new Event(Event.CHANGE,true));
         }
      }
      
      private function _4083(param1:MouseEvent) : void
      {
         if(this._2557.stage)
         {
            this._2557.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            this._2557.stage.removeEventListener(MouseEvent.MOUSE_UP,this._4083);
         }
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function set value(param1:int) : void
      {
         this._value = param1;
         if(this._2557)
         {
            this._2557.x = this._value / this.maximum * (this.BAR_WIDTH - this.THUMB_WIDTH);
         }
      }
   }
}

