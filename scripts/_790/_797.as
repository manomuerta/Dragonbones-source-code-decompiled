package _790
{
   import _1045.Label;
   import _1374.IconTabBarButton;
   import _804._805;
   
   public class _797 extends IconTabBarButton
   {
      public var _6063:Label;
      
      public function _797()
      {
         super();
         this.skinName = _805;
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(this._6063)
         {
            this._6063.text = String(data.data);
         }
         if(param1.hasOwnProperty("enabled"))
         {
            this.enabled = param1.enabled;
         }
      }
   }
}

