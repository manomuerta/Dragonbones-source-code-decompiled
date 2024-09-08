package _1491
{
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1045._1082;
   import _1045._1084;
   import _1045._1105;
   import _1177.UIEvent;
   import _1185._1189;
   import _1185._1196;
   import _1485._1486;
   import _1485._1487;
   import _1485._1488;
   import _1485._1489;
   import flash.display.Shape;
   import flash.geom.Rectangle;
   import flash.text.TextFormatAlign;
   
   public class _1493 extends _1084
   {
      protected var _10042:Class;
      
      protected var titleIcon:Class;
      
      public var shadow:_1105;
      
      public var _2522:Label;
      
      public var _2567:Group;
      
      public var _2631:Button;
      
      public var _2630:Button;
      
      public var closeButton:Button;
      
      public var _2440:Group;
      
      public var _9563:Group;
      
      public var _9559:Group;
      
      public var _9565:Group;
      
      public var _9556:Group;
      
      public var _9552:Group;
      
      public var _9554:Group;
      
      public var _9545:Group;
      
      public var _9543:Group;
      
      public var _9567:_1105;
      
      public var _8746:_1105;
      
      public var _2527:Group;
      
      public var _3746:Group;
      
      public var _9547:Group;
      
      public function _1493()
      {
         this._10042 = _1493__10042;
         this.titleIcon = _1493_titleIcon;
         super();
         this.states = ["normal","maximized","minimized","disabled","normalAndInactive","maximizedAndInactive"];
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Group = null;
         var _loc2_:Group = null;
         var _loc5_:Group = null;
         var _loc8_:Group = null;
         super._2438();
         this.shadow = new _1105();
         this.shadow.source = this._10042;
         this.shadow.scale9Grid = new Rectangle(8,8,3,3);
         this.shadow.left = 0;
         this.shadow.right = 0;
         this.shadow.top = 0;
         this.shadow.bottom = 0;
         this.addElement(this.shadow);
         _loc1_ = new Group();
         this.addElement(_loc1_);
         _loc2_ = new Group();
         _loc2_.percentWidth = 100;
         _loc2_.top = 7;
         _loc2_.right = 7;
         this.addElement(_loc2_);
         _loc1_.left = 7;
         _loc1_.right = 7;
         _loc1_.bottom = 7;
         _loc1_.top = 7;
         var _loc3_:_1082 = new _1082();
         _loc3_._2564 = 1;
         _loc3_._2563 = 1777701;
         _loc3_.fillColor = 2699835;
         _loc3_.percentHeight = _loc3_.percentWidth = 100;
         _loc1_.addElement(_loc3_);
         var _loc4_:_1082;
         (_loc4_ = new _1082()).height = 1;
         _loc4_.percentWidth = 100;
         _loc4_.top = 35;
         _loc4_.fillColor = 1777701;
         _loc1_.addElement(_loc4_);
         this._2567 = new Group();
         this._2567.height = 34;
         this._2567.left = 9;
         this._2567.right = 9;
         _loc1_.addElement(this._2567);
         (_loc5_ = new Group()).height = 34;
         var _loc6_:_1189;
         (_loc6_ = new _1189()).verticalAlign = _1196.MIDDLE;
         _loc6_.gap = 4;
         _loc5_.left = 5;
         _loc5_.right = 100;
         _loc5_.layout = _loc6_;
         _loc1_.addElement(_loc5_);
         this._9567 = new _1105();
         this._9567.source = this.titleIcon;
         _loc5_.addElement(this._9567);
         this._2527 = new Group();
         this._2527.addEventListener(UIEvent.UPDATE_COMPLETE,this._10065);
         _loc5_.addElement(this._2527);
         this._2527.verticalCenter = 0;
         this._3746 = new Group();
         this._3746.verticalCenter = 0;
         this._3746.percentHeight = 100;
         _loc5_.addElement(this._3746);
         var _loc7_:Group;
         (_loc7_ = new Group()).percentHeight = 100;
         _loc7_.percentWidth = 100;
         _loc5_.addElement(_loc7_);
         this._2522 = new Label();
         this._2522.size = 14;
         this._2522.verticalCenter = 0;
         this._2522.left = 5;
         this._2522.right = 5;
         this._2522.height = 20;
         _loc7_.addElement(this._2522);
         this._9547 = new Group();
         this._9547.verticalCenter = 0;
         this._9547.percentHeight = 100;
         _loc5_.addElement(this._9547);
         (_loc8_ = new Group()).right = 0;
         var _loc9_:_1189;
         (_loc9_ = new _1189()).gap = -1;
         _loc8_.layout = _loc9_;
         _loc2_.addElement(_loc8_);
         this._2631 = new Button();
         this._2631.skinName = _1488;
         _loc8_.addElement(this._2631);
         this._2630 = new Button();
         this._2630.skinName = _1487;
         _loc8_.addElement(this._2630);
         this.closeButton = new Button();
         this.closeButton.skinName = _1486;
         _loc8_.addElement(this.closeButton);
         this._2440 = new Group();
         this._2440.clipAndEnableScrolling = true;
         this._2440.top = 36;
         this._2440.left = 1;
         this._2440.right = 1;
         this._2440.bottom = 1;
         _loc1_.addElement(this._2440);
         this._9563 = new Group();
         this._9563.top = 20;
         this._9563.bottom = 20;
         this._9563.width = 4;
         _loc1_.addElement(this._9563);
         this._9559 = new Group();
         this._9559.top = 20;
         this._9559.bottom = 20;
         this._9559.width = 4;
         this._9559.right = 0;
         _loc1_.addElement(this._9559);
         this._9565 = new Group();
         this._9565.left = 20;
         this._9565.right = 20;
         this._9565.top = 0;
         this._9565.height = 4;
         _loc1_.addElement(this._9565);
         this._9556 = new Group();
         this._9556.left = 20;
         this._9556.right = 20;
         this._9556.height = 4;
         this._9556.bottom = 0;
         _loc1_.addElement(this._9556);
         this._9552 = new Group();
         this._9552.right = 0;
         this._9552.height = 20;
         this._9552.width = 4;
         _loc2_.addElement(this._9552);
         this._9554 = new Group();
         this._9554.left = 0;
         this._9554.top = 0;
         this._9554.height = 10;
         this._9554.width = 10;
         _loc1_.addElement(this._9554);
         this._9545 = new Group();
         this._9545.left = 0;
         this._9545.bottom = 0;
         this._9545.height = 20;
         this._9545.width = 20;
         _loc1_.addElement(this._9545);
         this._9543 = new Group();
         this._9543.right = 0;
         this._9543.bottom = 0;
         this._9543.height = 20;
         this._9543.width = 20;
         _loc1_.addElement(this._9543);
         this._8746 = new _1105();
         var _loc10_:Shape = new Shape();
         _loc10_.graphics.beginFill(16777215);
         _loc10_.graphics.drawRect(0,0,10,10);
         _loc10_.graphics.endFill();
         this._8746.source = _loc10_;
         this._8746.left = 0;
         this._8746.right = 0;
         this._8746.top = 0;
         this._8746.bottom = 0;
         this._8746.alpha = 0.1;
         _loc1_.addElement(this._8746);
      }
      
      protected function _10065(param1:UIEvent) : void
      {
         if(this._2527._2249 == 0 || this._2522.visible == false)
         {
            this._2522.textAlign = TextFormatAlign.LEFT;
            this._2522.alpha = 1;
         }
         else
         {
            this._2522.textAlign = TextFormatAlign.CENTER;
            this._2522.alpha = 0.8;
         }
      }
      
      override protected function _2519() : void
      {
         if(_2080 == "maximized" || _2080 == "maximizedAndInactive")
         {
            this._2630.skinName = _1489;
         }
         else
         {
            this._2630.skinName = _1487;
         }
         if(_2080 == "normal")
         {
            this._9563.visible = true;
            this._9559.visible = true;
            this._9565.visible = true;
            this._9556.visible = true;
            this._9552.visible = true;
            this._9552.visible = true;
            this._9545.visible = true;
            this._9543.visible = true;
         }
         else
         {
            this._9563.visible = false;
            this._9559.visible = false;
            this._9565.visible = false;
            this._9556.visible = false;
            this._9552.visible = false;
            this._9552.visible = false;
            this._9545.visible = false;
            this._9543.visible = false;
         }
      }
   }
}

