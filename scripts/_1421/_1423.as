package _1421
{
   import _1374._1393;
   import flash.events.Event;
   
   public class _1423 extends Event
   {
      public static const SELECTED_DOC_CHANGE:String = "selectedDocChange";
      
      public static const DOC_FOCUS_IN:String = "docFocusIn";
      
      public var _1642:_1393;
      
      public var _3430:_1393;
      
      public function _1423(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         var _loc1_:_1423 = new _1423(type,bubbles,cancelable);
         _loc1_._1642 = this._1642;
         _loc1_._3430 = this._3430;
         return _loc1_;
      }
   }
}

