package _178
{
   import _204._209;
   import flash.geom.Matrix;
   
   public class _184
   {
      public var x:Number;
      
      public var y:Number;
      
      public var skewX:Number;
      
      public var skewY:Number;
      
      public var scaleX:Number;
      
      public var scaleY:Number;
      
      public function _184()
      {
         super();
         this.x = 0;
         this.y = 0;
         this.skewX = 0;
         this.skewY = 0;
         this.scaleX = 1;
         this.scaleY = 1;
      }
      
      public function get rotation() : Number
      {
         return this.skewX;
      }
      
      public function set rotation(param1:Number) : void
      {
         this.skewX = this.skewY = param1;
      }
      
      public function copy(param1:_184) : void
      {
         this.x = param1.x;
         this.y = param1.y;
         this.skewX = param1.skewX;
         this.skewY = param1.skewY;
         this.scaleX = param1.scaleX;
         this.scaleY = param1.scaleY;
      }
      
      public function _2195(param1:_184, param2:Boolean = false) : _184
      {
         var _loc3_:_184 = param2 ? new _184() : this;
         var _loc4_:Matrix = new Matrix();
         _209._2013(param1,_loc4_);
         var _loc5_:Number = this.x - _loc4_.tx;
         var _loc6_:Number = this.y - _loc4_.ty;
         var _loc7_:Number = _loc4_.a * _loc4_.d - _loc4_.c * _loc4_.b;
         _loc3_.x = (_loc5_ * _loc4_.d - _loc6_ * _loc4_.c) / _loc7_;
         _loc3_.y = (_loc6_ * _loc4_.a - _loc5_ * _loc4_.b) / _loc7_;
         _loc3_.scaleX = this.scaleX;
         _loc3_.scaleY = this.scaleY;
         _loc3_.skewX = this.skewX - param1.skewX;
         _loc3_.skewY = this.skewY - param1.skewY;
         return _loc3_;
      }
      
      public function toString() : String
      {
         return "x:" + this.x + " y:" + this.y + " skewX:" + this.skewX + " skewY:" + this.skewY + " scaleX:" + this.scaleX + " scaleY:" + this.scaleY;
      }
   }
}

