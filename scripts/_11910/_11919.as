package _11910
{
   import _11845._11949;
   import flash.filters.DropShadowFilter;
   
   public class _11919 extends _11922
   {
      public static const API:Number = 2;
      
      private static var _12287:Array = ["distance","angle","color","alpha","blurX","blurY","strength","quality","inner","knockout","hideObject"];
      
      public function _11919()
      {
         super("dropShadowFilter");
      }
      
      override public function _12284(param1:Object, param2:*, param3:_11949) : Boolean
      {
         return _12286(param1,param2,param3,DropShadowFilter,new DropShadowFilter(0,45,0,0,0,0,1,int(param2.quality) || 2,param2.inner,param2.knockout,param2.hideObject),_12287);
      }
   }
}

