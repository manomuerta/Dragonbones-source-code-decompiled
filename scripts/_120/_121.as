package _120
{
   import flash.events.Event;
   
   public class _121 extends Event
   {
      public static const START:String = "TASK_START";
      
      public static const SUB_START:String = "TASK_SUB_START";
      
      public static const SUB_COMPLETE:String = "TASK_SUB_COMPLETE";
      
      public static const COMPLETE:String = "TASK_COMPLETE";
      
      public static const FAIL:String = "TASK_FAIL";
      
      public static const PROGRESS:String = "TASK_PROGRESS";
      
      public var data:*;
      
      public function _121(param1:String, param2:* = null)
      {
         super(param1);
         this.data = param2;
      }
      
      override public function clone() : Event
      {
         return new _121(this.type,this.data);
      }
   }
}

