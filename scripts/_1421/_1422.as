package _1421
{
   import flash.events.Event;
   
   public class _1422 extends Event
   {
      public static const CLOSE:String = "CloseCurrent";
      
      public static const CLOSE_OTHER:String = "CloseOther";
      
      public static const CLOSE_ALL:String = "CloseAll";
      
      public function _1422(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}

