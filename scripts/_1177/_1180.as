package _1177
{
   import egret.core._1133;
   import flash.events.Event;
   
   public class _1180 extends Event
   {
      public static const ADD_POPUP:String = "addPopUp";
      
      public static const REMOVE_POPUP:String = "removePopUp";
      
      public static const BRING_TO_FRONT:String = "bringToFront";
      
      public var popUp:_1133;
      
      public var _2507:Boolean;
      
      public function _1180(param1:String, param2:Boolean = false, param3:Boolean = false, param4:_1133 = null, param5:Boolean = false)
      {
         super(param1,param2,param3);
         this.popUp = param4;
         this._2507 = param5;
      }
   }
}

