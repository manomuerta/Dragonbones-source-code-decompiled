package _978
{
   import _1374.IconButton;
   
   public class _13564 extends IconButton
   {
      public static const STATE_DISABLE:int = -1;
      
      public static const STATE_NORMAL:int = 0;
      
      public static const STATE_KEY:int = 1;
      
      public static const STATE_CACHE:int = 2;
      
      public static const ADD_KEY_WHITE:String = "/assets/timeline/timeline_addKey_white.png";
      
      public static const ADD_KEY_RED:String = "/assets/timeline/timeline_addKey_red.png";
      
      public static const ADD_KEY_GREEN:String = "/assets/timeline/timeline_addKey_green.png";
      
      public static const ADD_KEY_YELLOW:String = "/assets/timeline/timeline_addKey_yellow.png";
      
      public function _13564()
      {
         super();
         icon = TimelinePanel.ADD_KEY_WHITE;
         enabled = false;
      }
      
      public function set state(param1:int) : void
      {
         switch(param1)
         {
            case STATE_DISABLE:
               enabled = false;
               icon = ADD_KEY_WHITE;
               break;
            case STATE_NORMAL:
               enabled = true;
               icon = ADD_KEY_WHITE;
               break;
            case STATE_KEY:
               enabled = true;
               icon = ADD_KEY_RED;
               break;
            case STATE_CACHE:
               enabled = true;
               icon = ADD_KEY_YELLOW;
               break;
            default:
               enabled = true;
               icon = ADD_KEY_WHITE;
         }
      }
   }
}

