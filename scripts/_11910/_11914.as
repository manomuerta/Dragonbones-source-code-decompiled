package _11910
{
   import _11845._11949;
   import flash.filters.BlurFilter;
   
   public class _11914 extends _11922
   {
      public static const API:Number = 2;
      
      private static var _12287:Array = ["blurX","blurY","quality"];
      
      public function _11914()
      {
         super("blurFilter");
      }
      
      override public function _12284(param1:Object, param2:*, param3:_11949) : Boolean
      {
         return _12286(param1,param2,param3,BlurFilter,new BlurFilter(0,0,int(param2.quality) || 2),_12287);
      }
   }
}

