package _1376
{
   import _1374.IconTabBarButton;
   
   public class _1378 extends IconTabBarButton
   {
      private var _9586:Boolean = true;
      
      public function _1378()
      {
         super();
      }
      
      public function get _9587() : Boolean
      {
         return this._9586;
      }
      
      public function set _9587(param1:Boolean) : void
      {
         if(this._9586 == param1)
         {
            return;
         }
         this._9586 = param1;
         _2570();
      }
      
      override protected function _6231() : String
      {
         if(this._9587 && this.selected)
         {
            return "focus";
         }
         return super._6231();
      }
   }
}

