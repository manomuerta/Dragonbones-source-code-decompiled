package com.codeazur.as3swf.events
{
   import flash.events.Event;
   
   public class SWFProgressEvent extends Event
   {
      public static const PROGRESS:String = "progress";
      
      public static const COMPLETE:String = "complete";
      
      protected var processed:uint;
      
      protected var total:uint;
      
      public function SWFProgressEvent(param1:String, param2:uint, param3:uint, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         this.processed = param2;
         this.total = param3;
      }
      
      public function get progress() : Number
      {
         return this.processed / this.total;
      }
      
      public function get progressPercent() : Number
      {
         return Math.round(this.progress * 100);
      }
      
      override public function clone() : Event
      {
         return new SWFProgressEvent(type,this.processed,this.total,bubbles,cancelable);
      }
      
      override public function toString() : String
      {
         return "[SWFProgressEvent] processed: " + this.processed + ", total: " + this.total + " (" + this.progressPercent + "%)";
      }
   }
}

