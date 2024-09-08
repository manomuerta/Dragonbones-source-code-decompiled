package _625
{
   import _1177.UIEvent;
   import _127._126;
   import _93._94;
   
   public class _624 extends _94
   {
      private var window:_126;
      
      public function _624()
      {
         super();
      }
      
      public function _3155() : void
      {
         this.window = new _126();
         this.window.addEventListener(UIEvent.CREATION_COMPLETE,this._5481);
         this.window.open();
      }
      
      protected function _5481(param1:UIEvent) : void
      {
      }
   }
}

