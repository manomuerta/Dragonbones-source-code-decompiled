package _73
{
   public class BoundingBoxType extends DBEnumBase
   {
      public static const RECTANGLE:BoundingBoxType = new BoundingBoxType("rectangle");
      
      public static const ELLIPSE:BoundingBoxType = new BoundingBoxType("ellipse");
      
      public static const POLYGON:BoundingBoxType = new BoundingBoxType("polygon");
      
      public function BoundingBoxType(param1:String)
      {
         super(param1);
      }
   }
}

