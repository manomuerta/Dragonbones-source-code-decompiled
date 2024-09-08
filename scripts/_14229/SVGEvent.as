package _14229
{
   import _14193._14197;
   import flash.events.Event;
   
   public class SVGEvent extends Event
   {
      public static const INVALIDATE:String = "invalidate";
      
      public static const SYNC_VALIDATED:String = "syncValidated";
      
      public static const ASYNC_VALIDATED:String = "asyncValidated";
      
      public static const VALIDATED:String = "validated";
      
      public static const RENDERED:String = "rendered";
      
      public static const PARSE_START:String = "parseStart";
      
      public static const PARSE_COMPLETE:String = "parseComplete";
      
      public static const ELEMENT_ADDED:String = "elementAdded";
      
      public static const ELEMENT_REMOVED:String = "elementRemoved";
      
      private var _14340:_14197;
      
      public function SVGEvent(param1:String, param2:_14197 = null, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this._14340 = param2;
      }
      
      public function get element() : _14197
      {
         return this._14340;
      }
      
      override public function clone() : Event
      {
         return new SVGEvent(type,this.element,bubbles,cancelable);
      }
   }
}

