package _625
{
   import _1009.PSDPluginGrideWindow;
   import _6._9;
   import _783.CommandNotification;
   import _93._94;
   
   public class _10493 extends _94
   {
      private var window:PSDPluginGrideWindow;
      
      public function _10493()
      {
         super();
      }
      
      override protected function init() : void
      {
      }
      
      override protected function _1576() : void
      {
         _1565(CommandNotification.PSDPLUGIN_GUIDE,this._3652);
      }
      
      private function _3652(param1:_9) : void
      {
         this.window = new PSDPluginGrideWindow();
         this.window.open();
      }
   }
}

