package _14173
{
   import flash.geom.Point;
   
   public class _14172
   {
      public var position:Point;
      
      public var angle:Number;
      
      public var type:String;
      
      public var _15175:Number;
      
      public function _14172(param1:Point, param2:Number, param3:String, param4:Number = 0)
      {
         super();
         this.position = param1;
         this.angle = param2;
         this.type = param3;
         this._15175 = param4;
      }
      
      public function _15174(param1:Number) : void
      {
         this.angle = (this.angle + param1) * 0.5;
      }
   }
}

