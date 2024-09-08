package _708
{
   import _73.DBEnumBase;
   
   public class ProjectType extends DBEnumBase
   {
      public static const SKELETAL_ANIMATION:ProjectType = new ProjectType("skeletal_animation");
      
      public static const BASIC_ANIMATION:ProjectType = new ProjectType("basic_animation");
      
      public function ProjectType(param1:String)
      {
         super(param1);
      }
   }
}

