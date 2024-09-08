package com.codeazur.as3swf.events
{
   import flash.events.Event;
   
   public class SWFWarningEvent extends Event
   {
      public static const OVERFLOW:String = "overflow";
      
      public static const UNDERFLOW:String = "underflow";
      
      public var index:uint;
      
      public var data:Object;
      
      public function SWFWarningEvent(param1:String, param2:uint, param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         this.index = param2;
         this.data = param3;
      }
      
      override public function clone() : Event
      {
         return new SWFWarningEvent(type,this.index,this.data,bubbles,cancelable);
      }
      
      override public function toString() : String
      {
         return "[SWFWarningEvent] index: " + this.index;
      }
   }
}

