package _11910
{
   import _11845._11949;
   import flash.filters.BevelFilter;
   
   public class _11911 extends _11922
   {
      public static const API:Number = 2;
      
      private static var _12287:Array = ["distance","angle","highlightColor","highlightAlpha","shadowColor","shadowAlpha","blurX","blurY","strength","quality"];
      
      public function _11911()
      {
         super("bevelFilter");
      }
      
      override public function _12284(param1:Object, param2:*, param3:_11949) : Boolean
      {
         return _12286(param1,param2,param3,BevelFilter,new BevelFilter(0,0,16777215,0.5,0,0.5,2,2,0,int(param2.quality) || 2),_12287);
      }
   }
}

