package _1374
{
   import _1045.TabBarButton;
   import _1045._1105;
   
   public class IconTabBarButton extends TabBarButton
   {
      public var _2448:_1105;
      
      public function IconTabBarButton()
      {
         super();
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(this._2448 != null && Boolean(param1.hasOwnProperty("icon")))
         {
            this._2448.source = param1.icon;
         }
         if(param1.hasOwnProperty("toolTip"))
         {
            this.toolTip = param1.toolTip;
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(Boolean(data) && param2 == this._2448)
         {
            this._2448.source = data.icon;
         }
      }
   }
}

