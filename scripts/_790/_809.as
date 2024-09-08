package _790
{
   import _1045.Group;
   import _1045._1105;
   import _721._763;
   import _81.BoundingBox;
   import _81._89;
   import _97._100;
   import flash.display.Graphics;
   import flash.events.TimerEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class _809 extends Group implements _89
   {
      private static const HIDE_TIME:int = 3;
      
      private static const FPS:int = 30;
      
      private static var _matrix:Matrix = new Matrix();
      
      private var _6105:_763;
      
      private var _6103:Point;
      
      private var _2558:_1105;
      
      private var _6108:_1105;
      
      private var _1857:Number;
      
      private var _6104:Number;
      
      private var _6102:Number;
      
      private var _6110:Number;
      
      private var _6111:Number;
      
      private var _6096:BoundingBox;
      
      private var _6095:Group;
      
      private var _6097:Boolean;
      
      private var _6101:Timer;
      
      public function _809()
      {
         super();
         this.mouseChildren = false;
         this.mouseEnabled = false;
         this._2558 = new _1105();
         this._6108 = new _1105();
         this._6103 = new Point();
         this._6101 = new Timer(FPS,FPS * HIDE_TIME);
         this._6101.addEventListener(TimerEvent.TIMER,this._6098);
         this._6101.addEventListener(TimerEvent.TIMER_COMPLETE,this._5429);
      }
      
      public function get _2000() : _763
      {
         return this._6105;
      }
      
      public function set _2000(param1:_763) : void
      {
         this._6105 = param1;
      }
      
      public function refresh() : void
      {
         this.draw(this._6104,this._6102);
         this._6112(this._6110);
         this._6113(this._6111);
         this._6106(this._1857,this._6104,this._6102);
      }
      
      public function draw(param1:Number, param2:Number) : void
      {
         this._6103.x = param1 / 2;
         this._6103.y = param2 / 2;
         this._6109(param1,param2);
      }
      
      private function _6109(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = -param1;
         var _loc4_:Number = -param2 - 20;
         var _loc5_:Graphics = this._2558.graphics;
         _loc5_.clear();
         _loc5_.beginFill(this._6105.bgColor);
         _loc5_.drawRect(0,0,this._6105.width,_loc4_);
         _loc5_.endFill();
         this._2558.x = this._6103.x;
         this._2558.y = this._6103.y;
         this._6108.y = this._6103.y - this._6105.height / 2 * this._1857;
      }
      
      public function _6106(param1:Number, param2:Number, param3:Number) : void
      {
         this._6104 = param2;
         this._6102 = param3;
         var _loc4_:Number = -param2;
         var _loc5_:Number = -param3 - 20;
         var _loc6_:Graphics = this._2558.graphics;
         this._1857 = param1;
         _loc6_.clear();
         _loc6_.beginFill(this._6105.bgColor);
         _loc6_.drawRect(0,0,this._6105.width * this._1857,-_loc5_);
         _loc6_.endFill();
         _loc6_ = this._6108.graphics;
         _loc6_.clear();
         _loc6_.lineStyle(1,_100.COMIC_CAMERA_COLOR);
         this._6100(_loc6_,0,0,this._6105.width * param1,0.5);
         this._6100(_loc6_,0,this._6105.height * param1,this._6105.width * param1,this._6105.height * param1);
         this._6100(_loc6_,0,0,0,this._6105.height * param1);
         this._6100(_loc6_,this._6105.width * param1,0.5,this._6105.width * param1,this._6105.height * param1);
         _loc6_.endFill();
         this._6108.y = this._6103.y - this._6105.height / 2 * this._1857;
      }
      
      public function _6112(param1:Number) : void
      {
         this._6110 = param1;
         this._2558.x = this._6103.x + param1;
         this._6108.x = this._6103.x + param1;
      }
      
      public function _6113(param1:Number) : void
      {
         this._6111 = param1;
         if(param1 > this._6102 / 2 + 10)
         {
            this._2558.y = this._6103.y + this._6102 / 2 + 10;
         }
         else if(param1 < -this._6102 / 2 - 10)
         {
            this._2558.y = this._6103.y - this._6102 / 2 - 10;
         }
         else
         {
            this._2558.y = this._6103.y + param1;
         }
      }
      
      private function _6107(param1:Graphics, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         graphics.moveTo(param2,param3);
         param1.lineTo(param4,param5);
      }
      
      private function _6100(param1:Graphics, param2:Number, param3:Number, param4:Number, param5:Number, param6:int = 4) : void
      {
         var _loc13_:int = 0;
         var _loc7_:int = param4 - param2;
         var _loc8_:int = param5 - param3;
         var _loc9_:int = Math.abs(_loc7_) > Math.abs(_loc8_) ? int(Math.abs(_loc7_)) : int(Math.abs(_loc8_));
         var _loc10_:int = _loc9_ / param6;
         var _loc11_:Number = _loc7_ / _loc10_;
         var _loc12_:Number = _loc8_ / _loc10_;
         if(_loc10_ <= 1)
         {
            this._6107(param1,param2,param3,param4,param5);
         }
         else
         {
            _loc13_ = 1;
            while(_loc13_ < _loc10_)
            {
               param1.moveTo(param2 + _loc11_ * (_loc13_ - 1),param3 + _loc12_ * (_loc13_ - 1));
               param1.lineTo(param2 + _loc11_ * _loc13_,param3 + _loc12_ * _loc13_);
               _loc13_ += 2;
            }
            param1.moveTo(param2 + _loc11_ * (_loc10_ - 1),param3 + _loc12_ * (_loc10_ - 1));
            param1.lineTo(param2 + _loc11_ * _loc10_,param3 + _loc12_ * _loc10_);
         }
      }
      
      private function _6094(param1:Graphics, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         var _loc7_:int = Math.abs((param4 - param2) / param6);
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            if(_loc8_ % 2 == 0)
            {
               param1.moveTo(param2 + _loc8_ * param6,param3);
               param1.lineTo(param2 + (_loc8_ + 1) * param6,param3);
            }
            _loc8_++;
         }
      }
      
      public function _5401() : void
      {
         if(this._6101.running)
         {
            this._6101.stop();
            this._6108.alpha = 1;
         }
         addElement(this._6108);
      }
      
      public function _5400() : void
      {
         this._6101.reset();
         this._6101.start();
      }
      
      private function _6098(param1:TimerEvent) : void
      {
         this._6108.alpha -= 1 / (HIDE_TIME * FPS);
      }
      
      private function _5429(param1:TimerEvent) : void
      {
         if(this._6108.parent)
         {
            removeElement(this._6108);
         }
         this._6108.alpha = 1;
      }
      
      public function get _2041() : Number
      {
         return 0;
      }
      
      public function get _2040() : Number
      {
         return 0;
      }
      
      public function get _2038() : Number
      {
         return this._6105.width;
      }
      
      public function get _2037() : Number
      {
         return this._6105.height;
      }
      
      public function get _2009() : Matrix
      {
         return _matrix;
      }
      
      public function set boundingBox(param1:BoundingBox) : void
      {
         this._6096 = param1;
      }
      
      public function get boundingBox() : BoundingBox
      {
         return this._6096;
      }
      
      public function set _6099(param1:Group) : void
      {
         this._6095 = param1;
         if(this._6095 != null)
         {
            this._6095.addElement(this._2558);
         }
      }
   }
}

