package _1177
{
   import egret.core._999;
   import flash.events.Event;
   
   public class ToolTipEvent extends Event
   {
      public static const TOOL_TIP_HIDE:String = "toolTipHide";
      
      public static const TOOL_TIP_SHOW:String = "toolTipShow";
      
      public var toolTip:_999;
      
      public function ToolTipEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:_999 = null)
      {
         super(param1,param2,param3);
         this.toolTip = param4;
      }
      
      override public function clone() : Event
      {
         return new ToolTipEvent(type,bubbles,cancelable,this.toolTip);
      }
   }
}

