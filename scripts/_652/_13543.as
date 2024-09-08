package _652
{
   import flash.geom.Point;
   
   public class _13543 extends Point
   {
      public var index:int;
      
      public function _13543(param1:Number = 0, param2:Number = 0, param3:int = -1)
      {
         super(param1,param2);
         this.index = param3;
      }
      
      override public function toString() : String
      {
         return x.toFixed(2) + "|" + y.toFixed(2);
      }
   }
}

