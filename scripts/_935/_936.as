package _935
{
   import _1045._1046;
   import _1045._1084;
   import _1185._1189;
   import _1374.IconTabBarButton;
   
   public class _936 extends _1084
   {
      public var _2490:_1046;
      
      public function _936()
      {
         super();
         this.states = ["normal","disabled"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2490 = new _1046();
         this._2490.percentHeight = 100;
         this._2490.percentWidth = 100;
         this.addElement(this._2490);
         var _loc1_:_1189 = new _1189();
         _loc1_.gap = -1;
         this._2490.layout = _loc1_;
         this._2490.itemRenderer = IconTabBarButton;
         this._2490._2514 = EditModeTabBarButton;
      }
   }
}

import _1439._1457;

class EditModeTabBarButton extends _1457
{
   public function EditModeTabBarButton()
   {
      super();
   }
   
   override protected function _2438() : void
   {
      super._2438();
      _2528._2529 = 0;
   }
   
   override protected function _2519() : void
   {
      super._2519();
      if(_2080 == "over")
      {
         _2530.fillColor = 3687762;
      }
      else
      {
         _2530.fillColor = 2699835;
      }
      if(_2080 == "upAndSelected" || _2080 == "overAndSelected" || _2080 == "downAndSelected" || _2080 == "disabledAndSelected" || _2080 == "down")
      {
         _2530.fillColor = 1382686;
      }
   }
}

