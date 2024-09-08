package _1421
{
   import flash.events.Event;
   
   public class FTETextSelectionEvent extends Event
   {
      public static const TEXT_SELECTION_CHANGED:String = "textSelectionChanged";
      
      public function FTETextSelectionEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}

