package _818
{
   import _1045.TabBarButton;
   import flash.events.MouseEvent;
   
   public class _819 extends TabBarButton
   {
      public function _819()
      {
         super();
      }
      
      override public function set data(param1:Object) : void
      {
         this.percentWidth = 100;
         super.data = param1;
         if(param1.hasOwnProperty("toolTip"))
         {
            this.toolTip = param1.toolTip;
         }
         if(param1.hasOwnProperty("enabled"))
         {
            this.enabled = param1.enabled;
            this.mouseEnabled = param1.enabled;
         }
         if(this.enabled == false)
         {
            this.addEventListener(MouseEvent.CLICK,this._6196);
            this.addEventListener(MouseEvent.MOUSE_UP,this._6196);
         }
      }
      
      private function _6196(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
      }
   }
}

