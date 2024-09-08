package _81
{
   import flash.geom.Point;
   
   public class BoundingBox
   {
      public var _1821:Vector.<Point>;
      
      public var point1:Point;
      
      public var point2:Point;
      
      public var point3:Point;
      
      public var point4:Point;
      
      public function BoundingBox()
      {
         this._1821 = new Vector.<Point>();
         this.point1 = new Point();
         this.point2 = new Point();
         this.point3 = new Point();
         this.point4 = new Point();
         super();
         this._1821.push(this.point1,this.point2,this.point3,this.point4);
      }
   }
}

