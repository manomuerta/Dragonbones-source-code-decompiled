package _1177
{
   import flash.events.Event;
   
   public class StateChangeEvent extends Event
   {
      public static const CURRENT_STATE_CHANGE:String = "currentStateChange";
      
      public static const CURRENT_STATE_CHANGING:String = "currentStateChanging";
      
      public static const STATE_CHANGE_COMPLETE:String = "stateChangeComplete";
      
      public var _8332:String;
      
      public var _8331:String;
      
      public function StateChangeEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:String = null, param5:String = null)
      {
         super(param1,param2,param3);
         this._8331 = param4;
         this._8332 = param5;
      }
      
      override public function clone() : Event
      {
         return new StateChangeEvent(type,bubbles,cancelable,this._8331,this._8332);
      }
   }
}

