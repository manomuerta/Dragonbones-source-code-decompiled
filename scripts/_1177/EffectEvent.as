package _1177
{
   import _1146._1172;
   import flash.events.Event;
   
   public class EffectEvent extends Event
   {
      public static const EFFECT_END:String = "effectEnd";
      
      public static const EFFECT_STOP:String = "effectStop";
      
      public static const EFFECT_START:String = "effectStart";
      
      public static const EFFECT_REPEAT:String = "effectRepeat";
      
      public static const EFFECT_UPDATE:String = "effectUpdate";
      
      public var _8775:_1172;
      
      public function EffectEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:_1172 = null)
      {
         super(param1,param2,param3);
         this._8775 = param4;
      }
      
      override public function clone() : Event
      {
         return new EffectEvent(type,bubbles,cancelable,this._8775);
      }
   }
}

