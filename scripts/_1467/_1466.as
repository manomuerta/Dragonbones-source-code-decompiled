package _1467
{
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1045.Scroller;
   import _1185._1188;
   import _1185._1189;
   import _1185._1191;
   import _1185._1196;
   import egret.utils.tr;
   
   public class _1466 extends _1469
   {
      public var firstButton:Button;
      
      public var secondButton:Button;
      
      public var _2509:Button;
      
      public var _2508:Label;
      
      protected var _10041:Group;
      
      public function _1466()
      {
         super();
         maxWidth = 600;
         minWidth = 400;
         minHeight = 160;
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Group = null;
         super._2438();
         _2440.layout = new _1191();
         _loc1_ = new Group();
         var _loc2_:_1189 = new _1189();
         _loc2_.gap = 16;
         _loc2_._2401 = _1188.CENTER;
         _loc2_.verticalAlign = _1196.MIDDLE;
         _loc1_.layout = _loc2_;
         _loc1_.bottom = 16;
         _loc1_.y = 51;
         _loc1_.horizontalCenter = 0;
         _2440.addElement(_loc1_);
         this.firstButton = new Button();
         this.firstButton.label = tr("AlertWindowSkin.ButtonOne");
         this.firstButton.x = 96;
         this.firstButton.y = 67;
         this.firstButton.minWidth = 60;
         _loc1_.addElement(this.firstButton);
         this.secondButton = new Button();
         this.secondButton.label = tr("AlertWindowSkin.ButtonTwo");
         this.secondButton.x = 96;
         this.secondButton.y = 67;
         this.secondButton.minWidth = 60;
         _loc1_.addElement(this.secondButton);
         this._2509 = new Button();
         this._2509.label = tr("AlertWindowSkin.ButtonThree");
         this._2509.x = 96;
         this._2509.y = 67;
         this._2509.minWidth = 60;
         _loc1_.addElement(this._2509);
         var _loc3_:Scroller = new Scroller();
         _loc3_.left = 10;
         _loc3_.right = 10;
         _loc3_.top = 10;
         _loc3_.bottom = 47;
         _loc3_.maxHeight = 600;
         _2440.addElement(_loc3_);
         this._10041 = new Group();
         this._10041.layout = new _1191();
         _loc3_.viewport = this._10041;
         this._2508 = new Label();
         this._2508.maxWidth = 340;
         this._2508.minHeight = 50;
         this._2508.horizontalCenter = 0;
         this._2508.verticalAlign = _1196.MIDDLE;
         this._10041.addElement(this._2508);
      }
   }
}

