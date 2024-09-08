package _11910
{
   import _11845._11949;
   
   public class _11913 extends _11912
   {
      public static const API:Number = 2;
      
      public function _11913()
      {
         super();
         _12315 = "bezierThrough";
      }
      
      override public function _12284(param1:Object, param2:*, param3:_11949) : Boolean
      {
         if(param2 is Array)
         {
            param2 = {"values":param2};
         }
         param2.type = "thru";
         return super._12284(param1,param2,param3);
      }
   }
}

