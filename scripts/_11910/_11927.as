package _11910
{
   import _11845._11949;
   import flash.filters.GlowFilter;
   
   public class _11927 extends _11922
   {
      public static const API:Number = 2;
      
      private static var _12287:Array = ["color","alpha","blurX","blurY","strength","quality","inner","knockout"];
      
      public function _11927()
      {
         super("glowFilter");
      }
      
      override public function _12284(param1:Object, param2:*, param3:_11949) : Boolean
      {
         return _12286(param1,param2,param3,GlowFilter,new GlowFilter(16777215,0,0,0,Number(param2.strength) || 1,int(param2.quality) || 2,param2.inner,param2.knockout),_12287);
      }
   }
}

