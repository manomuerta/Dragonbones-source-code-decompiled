package _625
{
   import _13555._13559;
   import _6._9;
   import _783.CommandNotification;
   import _93._94;
   
   public class _13542 extends _94
   {
      private var window:_13559;
      
      public function _13542()
      {
         super();
      }
      
      override protected function init() : void
      {
      }
      
      override protected function _1576() : void
      {
         _1565(CommandNotification.NEWFEATHER_GUIDE,this._3652);
      }
      
      private function _3652(param1:_9) : void
      {
         this.window = new _13559();
         this.window.open();
      }
   }
}

