package _14169
{
   import flash.display.GradientType;
   
   public class _14171 extends _14168
   {
      public var cx:String;
      
      public var cy:String;
      
      public var r:String;
      
      public var fx:String;
      
      public var fy:String;
      
      public function _14171()
      {
         super(GradientType.RADIAL);
      }
      
      override public function copyTo(param1:_14168) : void
      {
         super.copyTo(param1);
         var _loc2_:_14171 = param1 as _14171;
         if(_loc2_)
         {
            _loc2_.cx = this.cx;
            _loc2_.cy = this.cy;
            _loc2_.r = this.r;
            _loc2_.fx = this.fx;
            _loc2_.fy = this.fy;
         }
      }
   }
}

