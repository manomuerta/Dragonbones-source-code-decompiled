package _14123
{
   import _636.ExportEvent;
   import flash.events.Event;
   
   public class SettingEvent extends Event
   {
      public static const RULER_SETTING:String = "SettingEvent:RULER_SETTING";
      
      public static const NORMAL_SETTING:String = "SettingEvent:NORMAL_SETTING";
      
      public static const NORMAL_HOTKEY_SETTING:String = "SettingEvent:NORMAL_HOTKEY_SETTING";
      
      public static const NORMAL_HOTKEYDEFAULT:String = "SettingEvent:NORMAL_HOTKEYDEFAULT";
      
      public static const NORMAL_LANGDROPLIST_SETTING:String = "SettingEvent:NORMAL_LANGDROPLIST_SETTING";
      
      public static const SYSTEM_RESET_SETTING:String = "SettingEvent:SYSTEM_RESET_SETTING";
      
      public static const SYSTEM_LOG_SETTING:String = "SettingEvent:SYSTEM_LOG_SETTING";
      
      public static const SYSTEM_EXPORTDEFAULT:String = "SettingEvent:SYSTEM_EXPORTDEFAULT";
      
      public var data:*;
      
      public function SettingEvent(param1:String, param2:* = null, param3:Boolean = true, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.data = param2;
      }
      
      override public function clone() : Event
      {
         return new ExportEvent(this.type,this.data);
      }
   }
}

