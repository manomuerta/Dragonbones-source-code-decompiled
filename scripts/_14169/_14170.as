package _14169
{
   import flash.display.GradientType;
   
   public class _14170 extends _14168
   {
      public var x1:String;
      
      public var y1:String;
      
      public var x2:String;
      
      public var y2:String;
      
      public function _14170()
      {
         super(GradientType.LINEAR);
      }
      
      override public function copyTo(param1:_14168) : void
      {
         super.copyTo(param1);
         var _loc2_:_14170 = param1 as _14170;
         if(_loc2_)
         {
            _loc2_.x1 = this.x1;
            _loc2_.y1 = this.y1;
            _loc2_.x2 = this.x2;
            _loc2_.y2 = this.y2;
         }
      }
   }
}

