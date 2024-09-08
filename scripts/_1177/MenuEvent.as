package _1177
{
   import _1045.Menu;
   import _1075._1078;
   import flash.events.Event;
   
   public class MenuEvent extends ListEvent
   {
      public static const MENU_CHANGE:String = "menuChange";
      
      public static const MENU_HIDE:String = "menuHide";
      
      public static const MENU_SHOW:String = "menuShow";
      
      public static const ITEM_CLICK:String = "itemClick";
      
      public static const ITEM_ROLL_OUT:String = "itemRollOut";
      
      public static const ITEM_ROLL_OVER:String = "itemRollOver";
      
      public var menu:Menu;
      
      public function MenuEvent(param1:String, param2:Boolean = false, param3:Boolean = true, param4:Menu = null, param5:Object = null, param6:int = -1, param7:_1078 = null)
      {
         super(param1,param2,param3);
         this.menu = param4;
         this.item = param5;
         this.itemRenderer = param7;
         this.itemIndex = param6;
      }
      
      override public function clone() : Event
      {
         return new MenuEvent(type,bubbles,cancelable,this.menu,item,itemIndex,_1078(itemRenderer));
      }
   }
}

