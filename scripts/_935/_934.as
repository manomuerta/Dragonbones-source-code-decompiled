package _935
{
   import _1374.IconTabBarButton;
   
   public class _934 extends IconTabBarButton
   {
      public function _934()
      {
         super();
         this._6675 = true;
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(param1.hasOwnProperty("enabled"))
         {
            this.enabled = param1.enabled;
         }
      }
   }
}

