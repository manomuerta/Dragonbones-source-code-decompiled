package _890
{
   import _1045.Label;
   import _1374.IconButton;
   import _636.PluginEvent;
   import egret.utils.tr;
   import flash.events.MouseEvent;
   
   public class _895 extends _891
   {
      public var btn:IconButton;
      
      public var _6490:Label;
      
      public function _895()
      {
         super();
         this.skinName = _896;
         this._2576 = false;
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(param1 && param1.operation && param1.operation.enabled == 1)
         {
            this.btn.icon = "/assets/plugin/PluginOn.png";
            this._6490.text = tr("Plugin.start");
            if(this.hasEventListener(MouseEvent.CLICK))
            {
               this.removeEventListener(MouseEvent.CLICK,this._6489);
            }
            this.addEventListener(MouseEvent.CLICK,this._6488);
         }
         else
         {
            this.btn.icon = "/assets/plugin/PluginOff.png";
            this._6490.text = tr("Plugin.stop");
            if(this.hasEventListener(MouseEvent.CLICK))
            {
               this.removeEventListener(MouseEvent.CLICK,this._6488);
            }
            this.addEventListener(MouseEvent.CLICK,this._6489);
         }
      }
      
      private function _6488(param1:MouseEvent) : void
      {
         var _loc2_:PluginEvent = null;
         if(this.hasEventListener(MouseEvent.CLICK))
         {
            this.removeEventListener(MouseEvent.CLICK,this._6488);
         }
         if(data)
         {
            _loc2_ = new PluginEvent(PluginEvent.PLUGIN_ENABLED_START);
            this.owner.dispatchEvent(_loc2_);
         }
      }
      
      private function _6489(param1:MouseEvent) : void
      {
         var _loc2_:PluginEvent = null;
         if(this.hasEventListener(MouseEvent.CLICK))
         {
            this.removeEventListener(MouseEvent.CLICK,this._6489);
         }
         if(data)
         {
            _loc2_ = new PluginEvent(PluginEvent.PLUGIN_ENABLED_STOP);
            this.owner.dispatchEvent(_loc2_);
         }
      }
   }
}

