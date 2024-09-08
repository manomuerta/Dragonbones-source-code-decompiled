package _81
{
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class _86
   {
      public static var _2192:_86 = new _86();
      
      private static var _2194:Matrix = new Matrix();
      
      public var x:Number;
      
      public var y:Number;
      
      public var skewX:Number;
      
      public var skewY:Number;
      
      public var scaleX:Number;
      
      public var scaleY:Number;
      
      public function _86(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 1, param6:Number = 1)
      {
         super();
         this.x = param1;
         this.y = param2;
         this.skewX = param3;
         this.skewY = param4;
         this.scaleX = param5;
         this.scaleY = param6;
      }
      
      public function get rotation() : Number
      {
         return this.skewY;
      }
      
      public function set rotation(param1:Number) : void
      {
         var _loc2_:Number = param1 - this.skewY;
         this.skewY = param1;
         this.skewX += _loc2_;
      }
      
      public function get _2193() : Number
      {
         var _loc1_:Point = new Point(0,0);
         var _loc2_:Point = new Point(1,0);
         _88._2013(this,_2194);
         _88._2135(_loc1_,_2194);
         _88._2135(_loc2_,_2194);
         if(_loc1_.x == _loc2_.x)
         {
            if(_loc2_.y > _loc1_.y)
            {
               return Math.PI / 2;
            }
            if(_loc2_.y < _loc1_.y)
            {
               return -Math.PI / 2;
            }
            return 0;
         }
         return Math.atan((_loc2_.y - _loc1_.y) / (_loc2_.x - _loc1_.x));
      }
      
      public function copyFrom(param1:_86, param2:Boolean = false) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.x = param1.x;
         this.y = param1.y;
         this.skewX = param2 ? _85._1738(param1.skewX) : param1.skewX;
         this.skewY = param2 ? _85._1738(param1.skewY) : param1.skewY;
         this.scaleX = param1.scaleX;
         this.scaleY = param1.scaleY;
      }
      
      public function _2196(param1:_86) : Boolean
      {
         return this.x == param1.x && this.y == param1.y && this.skewX == param1.skewX && this.skewY == param1.skewY && this.scaleX == param1.scaleX && this.scaleY == param1.scaleY;
      }
      
      public function _2207(param1:_86) : Boolean
      {
         return this._11518(this.x,param1.x) && this._11518(this.y,param1.y) && this._11518(this.skewX,param1.skewX) && this._11518(this.skewY,param1.skewY) && this._11518(this.scaleX,param1.scaleX) && this._11518(this.scaleY,param1.scaleY);
      }
      
      private function _11518(param1:Number, param2:Number, param3:Number = 0.01) : Boolean
      {
         if(param1 + param3 >= param2 && param1 - param3 <= param2)
         {
            return true;
         }
         return false;
      }
      
      public function clone() : _86
      {
         var _loc1_:_86 = new _86();
         _loc1_.copyFrom(this);
         return _loc1_;
      }
      
      public function add(param1:_86) : void
      {
         this.x += param1.x;
         this.y += param1.y;
         this.skewX += param1.skewX;
         this.skewY += param1.skewY;
         this.scaleX *= param1.scaleX;
         this.scaleY *= param1.scaleY;
      }
      
      public function _1930(param1:_86) : void
      {
         this.x -= param1.x;
         this.y -= param1.y;
         this.skewX -= param1.skewX;
         this.skewY -= param1.skewY;
         this.scaleX /= param1.scaleX;
         this.scaleY /= param1.scaleY;
      }
      
      public function _2030(param1:Matrix, param2:_86, param3:Array = null, param4:Boolean = false, param5:Matrix = null) : _86
      {
         var _loc6_:_86 = param4 ? new _86() : this;
         var _loc7_:Matrix = !!param5 ? param5 : new Matrix();
         var _loc8_:_86 = this;
         var _loc9_:Boolean = true;
         var _loc10_:Boolean = true;
         var _loc11_:Number = 0;
         if(param3)
         {
            _loc9_ = Boolean(param3[0]);
            _loc10_ = Boolean(param3[1]);
            _loc11_ = Number(param3[2]);
         }
         _88._2013(_loc8_,_loc7_);
         _loc7_.concat(param1);
         if(_loc9_)
         {
            _88._2014(_loc7_,_loc6_,this.scaleX * param2.scaleX >= 0,this.scaleY * param2.scaleY >= 0);
            if(!_loc10_)
            {
               _loc6_.rotation -= _loc11_;
            }
         }
         else
         {
            _88._2003(_loc7_,_loc6_);
            _loc6_.scaleX = _loc8_.scaleX;
            _loc6_.scaleY = _loc8_.scaleY;
            _loc6_.rotation = _loc8_.rotation + (_loc10_ ? _loc11_ : 0);
            if(param5)
            {
               _88._2013(_loc6_,param5);
            }
         }
         return _loc6_;
      }
      
      public function _14293(param1:Matrix) : void
      {
         var _loc2_:Number = this.scaleX;
         var _loc3_:Number = this.scaleY;
         var _loc4_:Number = Math.PI * 0.25;
         this.x = param1.tx;
         this.y = param1.ty;
         this.skewX = Math.atan(-param1.c / param1.d);
         this.skewY = Math.atan(param1.b / param1.a);
         this.scaleX = this.skewY > -_loc4_ && this.skewY < _loc4_ ? param1.a / Math.cos(this.skewY) : param1.b / Math.sin(this.skewY);
         this.scaleY = this.skewX > -_loc4_ && this.skewX < _loc4_ ? param1.d / Math.cos(this.skewX) : -param1.c / Math.sin(this.skewX);
         if(_loc2_ >= 0 && this.scaleX < 0)
         {
            this.scaleX = -this.scaleX;
            this.skewY -= Math.PI;
         }
         if(_loc3_ >= 0 && this.scaleY < 0)
         {
            this.scaleY = -this.scaleY;
            this.skewX -= Math.PI;
         }
      }
      
      public function _14294(param1:Matrix) : void
      {
         param1.a = Math.cos(this.skewY) * this.scaleX;
         param1.b = Math.sin(this.skewY) * this.scaleX;
         param1.c = -Math.sin(this.skewX) * this.scaleY;
         param1.d = Math.cos(this.skewX) * this.scaleY;
         param1.tx = this.x;
         param1.ty = this.y;
      }
      
      public function _2195(param1:Matrix, param2:_86, param3:Array = null, param4:Boolean = false, param5:Matrix = null) : _86
      {
         _2194 = param1.clone();
         _2194.invert();
         var _loc6_:Object = param3;
         if(param3)
         {
            param3[2] = -param3[2];
         }
         return this._2030(_2194,param2,param3,param4,param5);
      }
      
      public function _1738(param1:int = 0) : void
      {
         if(param1 != 0)
         {
            if(param1 > 0 ? this.skewY >= 0 : this.skewY <= 0)
            {
               param1 = param1 > 0 ? param1 - 1 : param1 + 1;
            }
            this.skewX += Math.PI * 2 * param1;
            this.skewY += Math.PI * 2 * param1;
         }
         else
         {
            this.skewX = _85._1738(this.skewX);
            this.skewY = _85._1738(this.skewY);
         }
      }
      
      public function _1928() : Boolean
      {
         return this._2196(_2192);
      }
      
      public function clear() : void
      {
         this.x = 0;
         this.y = 0;
         this.rotation = 0;
         this.scaleX = 1;
         this.scaleY = 1;
      }
      
      public function toString() : String
      {
         return "x:" + this.x + " y:" + this.y + " skewX:" + this.skewX + " skewY:" + this.skewY + " scaleX:" + this.scaleX + " scaleY:" + this.scaleY;
      }
   }
}

