package _14176
{
   public class _14184 extends _14186
   {
      public var y:Number = 0;
      
      public var absolute:Boolean = false;
      
      public function _14184(param1:Boolean, param2:Number = 0)
      {
         super();
         this.absolute = param1;
         this.y = param2;
      }
      
      override public function get type() : String
      {
         return this.absolute ? "V" : "v";
      }
      
      override public function clone() : _14186
      {
         var _loc1_:_14184 = new _14184(this.absolute);
         _loc1_.y = this.y;
         return _loc1_;
      }
   }
}

