package _14146
{
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class _14149
   {
      private var _x:Number;
      
      private var _y:Number;
      
      public function _14149(param1:Number = 0, param2:Number = 0)
      {
         super();
         this.x = param1;
         this.y = param2;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         this._x = param1;
      }
      
      public function get y() : Number
      {
         return this._y;
      }
      
      public function set y(param1:Number) : void
      {
         this._y = param1;
      }
      
      public function _15113(param1:_14149) : void
      {
         this.x = param1.x;
         this.y = param1.y;
      }
      
      public function _5702() : Number
      {
         return -Math.atan2(this.y,this.x);
      }
      
      public function length() : Number
      {
         return Math.sqrt(this.lengthSquared());
      }
      
      public function lengthSquared() : Number
      {
         return this.x * this.x + this.y * this.y;
      }
      
      public function _15110(param1:_14149) : Number
      {
         var _loc2_:Number = this.x - param1.x;
         var _loc3_:Number = this.y - param1.y;
         return Number(_loc2_ * _loc2_ + _loc3_ * _loc3_);
      }
      
      public function negate() : _14149
      {
         return new _14149(-this.x,-this.y);
      }
      
      public function _15114() : _14149
      {
         this.x = -this.x;
         this.y = -this.y;
         return this;
      }
      
      public function add(param1:_14149) : _14149
      {
         if(null == param1)
         {
            return null;
         }
         return new _14149(this.x + param1.x,this.y + param1.y);
      }
      
      public function _15118(param1:_14149) : _14149
      {
         if(null == param1)
         {
            return null;
         }
         this.x += param1.x;
         this.y += param1.y;
         return this;
      }
      
      public function subtract(param1:_14149) : _14149
      {
         return new _14149(this.x - param1.x,this.y - param1.y);
      }
      
      public function _15112(param1:_14149) : _14149
      {
         if(null == param1)
         {
            return null;
         }
         this.x -= param1.x;
         this.y -= param1.y;
         return this;
      }
      
      public function dot(param1:_14149) : Number
      {
         if(null == param1)
         {
            return 0;
         }
         return this.x * param1.x + this.y * param1.y;
      }
      
      public function mult(param1:Number) : _14149
      {
         return new _14149(this.x * param1,this.y * param1);
      }
      
      public function _15117(param1:Number) : _14149
      {
         this.x *= param1;
         this.y *= param1;
         return this;
      }
      
      public function _15116(param1:_14149) : _14149
      {
         if(null == param1)
         {
            return null;
         }
         this.x *= param1.x;
         this.y *= param1.y;
         return this;
      }
      
      public function _15120(param1:Number, param2:_14149) : _14149
      {
         if(null == param2)
         {
            param2 = new _14149();
         }
         param2.x = this.x * param1;
         param2.y = this.y * param1;
         return param2;
      }
      
      public function divide(param1:Number) : _14149
      {
         return new _14149(this.x / param1,this.y / param1);
      }
      
      public function _15115(param1:Number) : _14149
      {
         this.x /= param1;
         this.y /= param1;
         return this;
      }
      
      public function normalize() : _14149
      {
         var _loc1_:Number = this.length();
         if(_loc1_ != 0)
         {
            return this.divide(_loc1_);
         }
         return this.divide(1);
      }
      
      public function _15111() : _14149
      {
         var _loc1_:Number = this.length();
         if(_loc1_ != 0)
         {
            return this._15115(_loc1_);
         }
         return this._15115(1);
      }
      
      public function _15108(param1:_14149) : Number
      {
         var _loc2_:Number = this.dot(param1);
         return Math.acos(_loc2_);
      }
      
      public function angleBetween(param1:_14149) : Number
      {
         return Math.atan2(param1.y,param1.x) - Math.atan2(this.y,this.x);
      }
      
      public function interpolate(param1:_14149, param2:Number) : void
      {
         this.x = (1 - param2) * this.x + param2 * param1.x;
         this.y = (1 - param2) * this.y + param2 * param1.y;
      }
      
      public function zero() : void
      {
         this.x = this.y = 0;
      }
      
      public function toArray(param1:Vector.<Number>) : Vector.<Number>
      {
         if(param1 == null)
         {
            param1 = new Vector.<Number>();
         }
         param1[0] = this.x;
         param1[1] = this.y;
         return param1;
      }
      
      public function _15109(param1:Number, param2:Boolean) : void
      {
         if(param2)
         {
            param1 = -param1;
         }
         var _loc3_:Number = Math.cos(param1) * this.x - Math.sin(param1) * this.y;
         var _loc4_:Number = Math.sin(param1) * this.x + Math.cos(param1) * this.y;
         this.x = _loc3_;
         this.y = _loc4_;
      }
      
      public function equals(param1:_14149, param2:Number = 0.000001) : Boolean
      {
         return Math.abs(this.x - param1.x) < param2 && Math.abs(this.y - param1.y) < param2;
      }
      
      public function clone() : _14149
      {
         return new _14149(this.x,this.y);
      }
      
      public function _15119() : Point
      {
         return new Point(this.x,this.y);
      }
      
      public function draw(param1:Sprite) : void
      {
         var _loc2_:TextFormat = new TextFormat();
         _loc2_.color = 0;
         _loc2_.size = 10;
         var _loc3_:TextField = new TextField();
         _loc3_.mouseEnabled = false;
         _loc3_.defaultTextFormat = _loc2_;
         _loc3_.autoSize = TextFieldAutoSize.LEFT;
         _loc3_.x = this.x;
         _loc3_.y = this.y;
         _loc3_.text = this.toString();
         param1.addChild(_loc3_);
      }
      
      public function toString() : String
      {
         return "(" + this.x + "," + this.y + ")";
      }
   }
}

