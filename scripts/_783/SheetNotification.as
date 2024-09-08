package _783
{
   import _6._9;
   
   public class SheetNotification extends _9
   {
      public static const SELECT_FRAME:String = "SheetNotification:SELECT_FRAME";
      
      public static const CUR_FRAAME_CHANGE:String = "SheetNotification:CUR_FRAAME_CHANGE";
      
      public static const PLAY:String = "SheetNotification:PLAY";
      
      public static const STOP_PLAY:String = "SheetNotification:STOP_PLAY";
      
      public static const FPS_CHANGE:String = "SheetNotification:FPS_CHANGE";
      
      public static const PLAY_TIME_CHANGE:String = "SheetNotification:PLAY_TIME_CHANGE";
      
      public static const UPDATE_CUR_DISPLAY:String = "SheetNotification:UPDATE_CUR_DISPLAY";
      
      public function SheetNotification(param1:String, param2:Object = null)
      {
         super(param1);
         this.data = param2;
      }
   }
}

