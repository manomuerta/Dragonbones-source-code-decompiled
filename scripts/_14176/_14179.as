package _14176
{
   public class _14179 extends _14186
   {
      public var x2:Number = 0;
      
      public var y2:Number = 0;
      
      public var x:Number = 0;
      
      public var y:Number = 0;
      
      public var absolute:Boolean = false;
      
      public function _14179(param1:Boolean, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0)
      {
         super();
         this.absolute = param1;
         this.x2 = param2;
         this.y2 = param3;
         this.x = param4;
         this.y = param5;
      }
      
      override public function get type() : String
      {
         return this.absolute ? "S" : "s";
      }
      
      override public function clone() : _14186
      {
         var _loc1_:_14179 = new _14179(this.absolute);
         _loc1_.x2 = this.x2;
         _loc1_.y2 = this.y2;
         _loc1_.x = this.x;
         _loc1_.y = this.y;
         return _loc1_;
      }
   }
}

