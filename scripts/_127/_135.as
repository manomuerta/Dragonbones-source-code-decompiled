package _127
{
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1185._1196;
   import _1491._1493;
   import _97._125;
   import egret.utils.tr;
   import flash.text.TextFormatAlign;
   
   public class _135 extends _1493
   {
      public var firstButton:Button;
      
      public var secondButton:Button;
      
      public var _2509:Button;
      
      public var _2508:Label;
      
      public var _2500:_128;
      
      public function _135()
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
         _loc1_ = _125._2413(12);
         _loc1_.percentHeight = 100;
         _loc1_.percentWidth = 100;
         _loc1_.left = 12;
         _loc1_.top = 12;
         _loc1_.right = 12;
         _loc1_.bottom = 12;
         _2440.addElement(_loc1_);
         var _loc2_:Group = _125._2398(16);
         _loc2_.percentWidth = 100;
         this.firstButton = new Button();
         this.firstButton.label = tr("AlertWindowSkin.ButtonOne");
         this.firstButton.x = 96;
         this.firstButton.y = 67;
         this.firstButton.minWidth = 80;
         this.firstButton.minHeight = 25;
         _loc2_.addElement(this.firstButton);
         this.secondButton = new Button();
         this.secondButton.label = tr("AlertWindowSkin.ButtonTwo");
         this.secondButton.x = 96;
         this.secondButton.y = 67;
         this.secondButton.minWidth = 80;
         this.secondButton.minHeight = 25;
         _loc2_.addElement(this.secondButton);
         this._2509 = new Button();
         this._2509.label = tr("AlertWindowSkin.ButtonThree");
         this._2509.x = 96;
         this._2509.y = 67;
         this._2509.minWidth = 80;
         this._2509.minHeight = 25;
         _loc2_.addElement(this._2509);
         this._2508 = new Label();
         this._2508.leading = 6;
         this._2508.percentWidth = 100;
         this._2508.textAlign = TextFormatAlign.LEFT;
         this._2508.verticalAlign = _1196.TOP;
         _loc1_.addElement(this._2508);
         this._2500 = new _128();
         this._2500.label = tr("RemoveWindow.NoPrompt");
         _loc1_.addElement(this._2500);
         _loc2_.right = 12;
         _loc2_.bottom = 12;
         _2440.addElement(_loc2_);
      }
   }
}

