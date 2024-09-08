package _1088
{
   import _1177.UIEvent;
   import egret.core.ns_egret;
   import flash.events.Event;
   
   use namespace ns_egret;
   
   public class _1102 extends _1087
   {
      private var _selected:Boolean;
      
      ns_egret var _8542:Boolean = true;
      
      public function _1102()
      {
         super();
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         if(param1 == this._selected)
         {
            return;
         }
         this._selected = param1;
         dispatchEvent(new UIEvent(UIEvent.VALUE_COMMIT));
         _2570();
      }
      
      override protected function _6231() : String
      {
         if(!this.selected)
         {
            return super._6231();
         }
         return super._6231() + "AndSelected";
      }
      
      override protected function _8239() : void
      {
         super._8239();
         if(!this.ns_egret::_8542 || !enabled)
         {
            return;
         }
         this.selected = !this.selected;
         dispatchEvent(new Event(Event.CHANGE));
      }
   }
}

