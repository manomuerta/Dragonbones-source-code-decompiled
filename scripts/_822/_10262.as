package _822
{
   import _1374.IconTabBarButton;
   
   public class _10262 extends IconTabBarButton
   {
      public function _10262()
      {
         super();
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(_2448 != null && Boolean(param1.hasOwnProperty("icon")))
         {
         }
         if(_2448)
         {
            this._6232();
         }
         if(param1.hasOwnProperty("toolTip"))
         {
            this.toolTip = param1.toolTip;
         }
      }
      
      override protected function _6232() : void
      {
         super._6232();
         var _loc1_:String = _6231();
         switch(_loc1_)
         {
            case "up":
            case "over":
            case "disabled":
               _2448.source = data.icon + ".png";
               break;
            case "upAndSelected":
            case "overAndSelected":
            case "disabledAndSelected":
               _2448.source = data.icon + "_selected" + ".png";
         }
      }
   }
}

