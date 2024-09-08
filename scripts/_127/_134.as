package _127
{
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1045.Scroller;
   import _1185._1188;
   import _1185._1189;
   import _1185._1191;
   import _1185._1196;
   import _1467._1469;
   import _97._125;
   import egret.utils.tr;
   import flash.text.TextFormatAlign;
   
   public class _134 extends _1469
   {
      public var firstButton:Button;
      
      public var secondButton:Button;
      
      public var _2509:Button;
      
      public var _2508:Label;
      
      public var _2500:_128;
      
      private var _2510:Group;
      
      public function _134()
      {
         super();
         maxWidth = 350;
         minWidth = 350;
         minHeight = 170;
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Group = null;
         super._2438();
         _2440.layout = new _1191();
         _loc1_ = new Group();
         var _loc2_:_1189 = new _1189();
         _loc2_.gap = 16;
         _loc2_._2401 = _1188.RIGHT;
         _loc2_.verticalAlign = _1196.MIDDLE;
         _loc2_._2416 = 12;
         _loc1_.layout = _loc2_;
         _loc1_.bottom = 12;
         _loc1_.y = 51;
         _loc1_.percentWidth = 100;
         _2440.addElement(_loc1_);
         this.firstButton = new Button();
         this.firstButton.label = tr("AlertWindowSkin.ButtonOne");
         this.firstButton.x = 96;
         this.firstButton.y = 67;
         this.firstButton.minWidth = 80;
         this.firstButton.minHeight = 25;
         _loc1_.addElement(this.firstButton);
         this.secondButton = new Button();
         this.secondButton.label = tr("AlertWindowSkin.ButtonTwo");
         this.secondButton.x = 96;
         this.secondButton.y = 67;
         this.secondButton.minWidth = 80;
         this.secondButton.minHeight = 25;
         _loc1_.addElement(this.secondButton);
         this._2509 = new Button();
         this._2509.label = tr("AlertWindowSkin.ButtonThree");
         this._2509.x = 96;
         this._2509.y = 67;
         this._2509.minWidth = 80;
         this._2509.minHeight = 25;
         _loc1_.addElement(this._2509);
         var _loc3_:Scroller = new Scroller();
         _loc3_.left = 10;
         _loc3_.right = 10;
         _loc3_.top = 10;
         _loc3_.bottom = 47;
         _loc3_.maxHeight = 600;
         _2440.addElement(_loc3_);
         var _loc4_:Group;
         (_loc4_ = new Group()).layout = new _1191();
         _loc3_.viewport = _loc4_;
         this._2508 = new Label();
         this._2508.percentWidth = 100;
         this._2508.percentHeight = 100;
         this._2508.textAlign = TextFormatAlign.LEFT;
         this._2508.verticalAlign = _1196.TOP;
         _loc4_.addElement(this._2508);
         this._2500 = new _128();
         this._2500.label = tr("RemoveWindow.NoPrompt");
         this._2510 = _125._2414();
         this._2510.addElement(this._2500);
         Group(_2440).addElement(this._2510);
         this._2510.y = 67;
         this._2510.x = 10;
      }
   }
}

