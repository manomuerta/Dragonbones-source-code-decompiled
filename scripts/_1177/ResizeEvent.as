package _1177
{
   import flash.events.Event;
   
   public class ResizeEvent extends Event
   {
      public static const UI_RESIZE:String = "uiResize";
      
      public var _3121:Number;
      
      public var _3123:Number;
      
      public function ResizeEvent(param1:String, param2:Number = NaN, param3:Number = NaN, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         this._3123 = param2;
         this._3121 = param3;
      }
      
      override public function clone() : Event
      {
         return new ResizeEvent(type,this._3123,this._3121,bubbles,cancelable);
      }
   }
}

