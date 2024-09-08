package _1177
{
   import flash.events.Event;
   
   public class UIEvent extends Event
   {
      public static const SHOW_CHANGE:String = "showChange";
      
      public static const DATA_CHANGE:String = "dataChange";
      
      public static const CONFIRM:String = "confirm";
      
      public static const INITIALIZE:String = "initialize";
      
      public static const CREATION_COMPLETE:String = "creationComplete";
      
      public static const UPDATE_COMPLETE:String = "updateComplete";
      
      public static const BUTTON_DOWN:String = "buttonDown";
      
      public static const CHANGE_END:String = "changeEnd";
      
      public static const CHANGE_START:String = "changeStart";
      
      public static const CHANGING:String = "changing";
      
      public static const VALUE_COMMIT:String = "valueCommit";
      
      public static const SKIN_CHANGED:String = "skinChanged";
      
      public static const CONTENT_CHANGED:String = "contentChanged";
      
      public static const OPEN:String = "open";
      
      public static const CLOSE:String = "close";
      
      public static const ENTER:String = "enter";
      
      public static const SCREEN_DPI_CHANGED:String = "screenDPIChanged";
      
      public static const PLAY_COMPLETE:String = "playComplete";
      
      public function UIEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}

