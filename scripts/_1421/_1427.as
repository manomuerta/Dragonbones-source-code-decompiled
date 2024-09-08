package _1421
{
   import _1374._1396;
   import flash.events.Event;
   
   public class _1427 extends Event
   {
      public static const MAXIMIZED:String = "maximizedTabGroup";
      
      public static const MINIMIZED:String = "minimizedTabGroup";
      
      public static const CLOSE:String = "closeTabGroup";
      
      public static const CLOSING_PANEL:String = "closingPanel";
      
      public static const PANEL_OPENED:String = "panelOpened";
      
      public static const PANEL_CREATED:String = "panelCreated";
      
      public static const CLOSE_PANEL:String = "closePanel";
      
      public var _4928:Object;
      
      public var _4830:_1396;
      
      public function _1427(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         var _loc1_:_1427 = new _1427(type,bubbles,cancelable);
         _loc1_._4928 = this._4928;
         _loc1_._4830 = this._4830;
         return _loc1_;
      }
   }
}

