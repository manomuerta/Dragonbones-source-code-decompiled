package _636
{
   import flash.events.Event;
   
   public class PluginEvent extends Event
   {
      public static var PLUGIN_ENABLED_START:String = "PluginEvent:PLUGIN_ENABLED_START";
      
      public static var PLUGIN_ENABLED_STOP:String = "PluginEvent:PLUGIN_ENABLED_STOP";
      
      public var data:*;
      
      public function PluginEvent(param1:String, param2:* = null, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.data = param2;
      }
   }
}

