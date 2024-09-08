package _14176
{
   public class _14180 extends _14186
   {
      public var x1:Number = 0;
      
      public var y1:Number = 0;
      
      public var x:Number = 0;
      
      public var y:Number = 0;
      
      public var absolute:Boolean = false;
      
      public function _14180(param1:Boolean, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0)
      {
         super();
         this.absolute = param1;
         this.x1 = param2;
         this.y1 = param3;
         this.x = param4;
         this.y = param5;
      }
      
      override public function get type() : String
      {
         return this.absolute ? "Q" : "q";
      }
      
      override public function clone() : _14186
      {
         var _loc1_:_14180 = new _14180(this.absolute);
         _loc1_.x1 = this.x1;
         _loc1_.y1 = this.y1;
         _loc1_.x = this.x;
         _loc1_.y = this.y;
         return _loc1_;
      }
   }
}

