package _14176
{
   public class _14181 extends _14186
   {
      public var x:Number = 0;
      
      public var y:Number = 0;
      
      public var absolute:Boolean = false;
      
      public function _14181(param1:Boolean, param2:Number = 0, param3:Number = 0)
      {
         super();
         this.absolute = param1;
         this.x = param2;
         this.y = param3;
      }
      
      override public function get type() : String
      {
         return this.absolute ? "T" : "t";
      }
      
      override public function clone() : _14186
      {
         var _loc1_:_14181 = new _14181(this.absolute);
         _loc1_.x = this.x;
         _loc1_.y = this.y;
         return _loc1_;
      }
   }
}

