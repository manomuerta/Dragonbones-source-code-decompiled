package _625
{
   import _1009._1028;
   import _1177.UIEvent;
   import _1404._1407;
   import _6._9;
   import _648.PluginModel;
   import _783.CommandNotification;
   import _93._94;
   import _97._101;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class _632 extends _94
   {
      private var window:_1028;
      
      public var bound:Rectangle;
      
      public function _632()
      {
         this.bound = new Rectangle();
         super();
      }
      
      override protected function init() : void
      {
      }
      
      override protected function _1576() : void
      {
         _1565(CommandNotification.PLUGIN_SELECT_OPEN,this._3652);
      }
      
      private function _3652(param1:_9) : void
      {
         switch(param1.type)
         {
            case CommandNotification.PLUGIN_SELECT_OPEN:
               this._3155();
         }
      }
      
      private function _3155() : void
      {
         this.window = new _1028();
         this.window.bound = this.bound;
         this.window.addEventListener(UIEvent.CREATION_COMPLETE,this._5483);
         this.window.open();
      }
      
      protected function _5483(param1:UIEvent) : void
      {
         var _loc2_:PluginModel = null;
         _loc2_ = new PluginModel();
         _loc2_.icon = "DragonBones.png";
         _loc2_.author = "Egret Engine";
         _loc2_.name = "DragonBones Pro";
         _loc2_.version = _101.DATA_VERSION;
         this.window.invalidateDisplayList();
         var _loc3_:Array = [];
         _loc3_.push(_loc2_);
         this.window._5572(_loc3_.concat(this._3227._5507));
         this.window._5554.addEventListener(MouseEvent.CLICK,this._5601);
         this.window._5598.addEventListener(MouseEvent.DOUBLE_CLICK,this.doubleClick);
      }
      
      private function doubleClick(param1:MouseEvent) : void
      {
         this.window.close();
         _1567(new CommandNotification(CommandNotification.PLUGIN_SELECT_PLUGIN_COMPLETE,this.window._5598._2484));
      }
      
      private function _5601(param1:MouseEvent) : void
      {
         this.window.close();
         _1567(new CommandNotification(CommandNotification.PLUGIN_SELECT_PLUGIN_COMPLETE,this.window._5598._2484));
      }
      
      private function get _3227() : _627
      {
         return _1407.getInstance(_627) as _627;
      }
   }
}

