package _883
{
   import _1045._1046;
   import _1045._1084;
   import _1185._1189;
   import _1374.IconTabBarButton;
   
   public class _882 extends _1084
   {
      public var _2490:_1046;
      
      public function _882()
      {
         super();
         this.states = ["normal","disabled"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2490 = new _1046();
         this._2490.percentWidth = 100;
         this._2490.percentHeight = 100;
         this.addElement(this._2490);
         var _loc1_:_1189 = new _1189();
         _loc1_.gap = 2;
         this._2490.layout = _loc1_;
         this._2490.itemRenderer = IconTabBarButton;
         this._2490._2514 = StageToolBarButton;
      }
      
      override protected function _2519() : void
      {
         super._2519();
         if(_2080 != "normal")
         {
            if(_2080 == "disabled")
            {
            }
         }
      }
   }
}

import _1439._1459;

class StageToolBarButton extends _1459
{
   public function StageToolBarButton()
   {
      super();
   }
   
   override protected function _2438() : void
   {
      super._2438();
      ui._2529 = 1;
   }
   
   override protected function _2519() : void
   {
      if(_2080 == "up" || _2080 == "disabled")
      {
         ui.fillColor = 2699835;
      }
      else if(_2080 == "over")
      {
         ui.fillColor = 3425870;
      }
      else if(_2080 == "down" || _2080 == "upAndSelected" || _2080 == "overAndSelected" || _2080 == "downAndSelected" || _2080 == "disabledAndSelected")
      {
         ui.fillColor = 1777956;
      }
      if(_2080 == "disabled")
      {
         group.alpha = 0.5;
      }
      else
      {
         group.alpha = 1;
      }
   }
}

