package _652
{
   import flash.geom.Point;
   
   public class _656 extends Point
   {
      public var id:uint;
      
      public var index:int;
      
      public function _656(param1:Number, param2:Number, param3:uint)
      {
         super(param1,param2);
         this.id = param3;
      }
      
      override public function toString() : String
      {
         return "[" + String(this.id) + "  x:" + x + " y:" + y + "]";
      }
   }
}

