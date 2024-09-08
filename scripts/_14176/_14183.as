package _14176
{
   public class _14183 extends _14186
   {
      public var x:Number = 0;
      
      public var absolute:Boolean = false;
      
      public function _14183(param1:Boolean, param2:Number = 0)
      {
         super();
         this.absolute = param1;
         this.x = param2;
      }
      
      override public function get type() : String
      {
         return this.absolute ? "H" : "h";
      }
      
      override public function clone() : _14186
      {
         var _loc1_:_14183 = new _14183(this.absolute);
         _loc1_.x = this.x;
         return _loc1_;
      }
   }
}

