package com.codeazur.as3swf.events
{
   import flash.events.Event;
   
   public class SWFErrorEvent extends Event
   {
      public static const ERROR:String = "error";
      
      public static const REASON_EOF:String = "eof";
      
      public var reason:String;
      
      public function SWFErrorEvent(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.reason = param2;
      }
      
      override public function clone() : Event
      {
         return new SWFErrorEvent(type,this.reason,bubbles,cancelable);
      }
      
      override public function toString() : String
      {
         return "[SWFErrorEvent] reason: " + this.reason;
      }
   }
}

