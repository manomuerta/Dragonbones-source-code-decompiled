package _1331
{
   import flash.events.Event;
   
   public class ProtocolEvent extends Event
   {
      public static const LOGIN_COMPLETE:String = "login_complete";
      
      public static const LOGIN_ERROR:String = "login_error";
      
      public static const LOGOUT_COMPLETE:String = "logout_complete";
      
      public static const CHECK_EMAIL_COMPLETE:String = "check_email_complete";
      
      public static const CHECK_USERNAME_COMPLETE:String = "check_username_complete";
      
      public static const REGISTER_COMPLETE:String = "register_complete";
      
      public static const CHANGEPASSWORD_COMPLETE:String = "change_password_complete";
      
      public static const RETRIEVE_PASSWORD_COMPLETE:String = "retrieve_password_complete";
      
      public static const RESET_PASSWORD_COMPLETE:String = "reset_password_complete";
      
      public var data:*;
      
      public function ProtocolEvent(param1:String, param2:*)
      {
         super(param1);
         this.data = param2;
      }
   }
}

