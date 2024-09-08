package _1467
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1082;
   import _1045._1084;
   import _1045._1105;
   import _1185._1188;
   import _1185._1189;
   import _1185._1196;
   import _1374._1399;
   import _1461._1462;
   import _1461._1463;
   import _1461._1464;
   import egret.core._1110;
   import flash.display.Shape;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class _1469 extends _1084
   {
      private var _10042:Class;
      
      private var titleIcon:Class;
      
      private var titleIcon_r:Class;
      
      public var shadow:_1105;
      
      public var _2522:Label;
      
      public var _2567:Group;
      
      public var _2631:_1399;
      
      public var _2630:_1399;
      
      public var closeButton:_1399;
      
      public var _2440:Group;
      
      public var _9563:Group;
      
      public var _9559:Group;
      
      public var _9565:Group;
      
      public var _9556:Group;
      
      public var _9552:Group;
      
      public var _9554:Group;
      
      public var _9545:Group;
      
      public var _9543:Group;
      
      public var _8746:_1105;
      
      public var _9567:_1105;
      
      private var _2530:_1082;
      
      public var group:Group;
      
      public var _3746:Group;
      
      public var _9547:Group;
      
      public function _1469()
      {
         this._10042 = _1469__10042;
         this.titleIcon = _1469_titleIcon;
         this.titleIcon_r = _1469_titleIcon_r;
         super();
         this.states = ["normal","maximized","minimized","disabled"];
      }
      
      override protected function _2438() : void
      {
         var _loc2_:Group = null;
         super._2438();
         this.shadow = new _1105();
         this.shadow.source = this._10042;
         this.shadow.scale9Grid = new Rectangle(8,8,3,3);
         this.shadow.left = 0;
         this.shadow.right = 0;
         this.shadow.top = 0;
         this.shadow.bottom = 0;
         this.addElement(this.shadow);
         this.group = new Group();
         this.addElement(this.group);
         this.group.left = 7;
         this.group.right = 7;
         this.group.bottom = 7;
         this.group.top = 7;
         this._2530 = new _1082();
         this._2530._2564 = 1;
         this._2530._2563 = 1777701;
         this._2530.fillColor = 2699835;
         this._2530.percentHeight = this._2530.percentWidth = 100;
         this.group.addElement(this._2530);
         var _loc1_:_1082 = new _1082();
         _loc1_.height = 1;
         _loc1_.percentWidth = 100;
         _loc1_.top = 35;
         _loc1_.fillColor = 1777701;
         this.group.addElement(_loc1_);
         this._2567 = new Group();
         this.group.addElement(this._2567);
         this._2567.top = 0;
         this._2567.left = 0;
         this._2567.right = 0;
         this._2567.height = 34;
         _loc2_ = new Group();
         _loc2_.height = 34;
         var _loc3_:_1189 = new _1189();
         _loc3_.verticalAlign = _1196.MIDDLE;
         _loc3_.gap = 4;
         _loc2_.left = 70;
         _loc2_.right = 5;
         _loc2_.layout = _loc3_;
         this.group.addElement(_loc2_);
         this._3746 = new Group();
         this._3746.verticalCenter = 0;
         this._3746.percentHeight = 100;
         _loc2_.addElement(this._3746);
         var _loc4_:Group = new Group();
         _loc3_ = new _1189();
         _loc3_._2401 = _1188.CENTER;
         _loc3_.verticalAlign = _1196.MIDDLE;
         _loc4_.layout = _loc3_;
         _loc4_.percentWidth = 100;
         _loc4_.height = 34;
         this.group.addElement(_loc4_);
         this._9567 = new _1105();
         this._9567.source = new _1110(this.titleIcon,this.titleIcon_r);
         _loc4_.addElement(this._9567);
         this._2522 = new Label();
         this._2522.size = 14;
         this._2522.verticalAlign = _1196.BOTTOM;
         _loc4_.addElement(this._2522);
         this._9547 = new Group();
         var _loc5_:_1189;
         (_loc5_ = new _1189())._2401 = _1188.RIGHT;
         _loc5_.verticalAlign = "middle";
         this._9547.layout = _loc5_;
         this._9547.verticalCenter = 0;
         this._9547.percentHeight = 100;
         this._9547.percentWidth = 100;
         _loc2_.addElement(this._9547);
         var _loc6_:Group = new Group();
         var _loc7_:_1189;
         (_loc7_ = new _1189()).gap = -1;
         this.group.addElement(_loc6_);
         this._2631 = new _1399();
         this._2631.skinName = _1464;
         this._2631.addEventListener(MouseEvent.ROLL_OVER,this._8132);
         this._2631.addEventListener(MouseEvent.ROLL_OUT,this._8142);
         this._2631.x = 28;
         this._2631.y = 10;
         _loc6_.addElement(this._2631);
         this._2630 = new _1399();
         this._2630.skinName = _1463;
         this._2630.addEventListener(MouseEvent.ROLL_OVER,this._8132);
         this._2630.addEventListener(MouseEvent.ROLL_OUT,this._8142);
         this._2630.x = 48;
         this._2630.y = 10;
         _loc6_.addElement(this._2630);
         this.closeButton = new _1399();
         this.closeButton.skinName = _1462;
         this.closeButton.addEventListener(MouseEvent.ROLL_OVER,this._8132);
         this.closeButton.addEventListener(MouseEvent.ROLL_OUT,this._8142);
         this.closeButton.x = 8;
         this.closeButton.y = 10;
         _loc6_.addElement(this.closeButton);
         this._2440 = new Group();
         this._2440.clipAndEnableScrolling = true;
         this._2440.top = 36;
         this._2440.left = 1;
         this._2440.right = 1;
         this._2440.bottom = 1;
         this.group.addElement(this._2440);
         this._9563 = new Group();
         this._9563.top = 5;
         this._9563.bottom = 20;
         this._9563.width = 4;
         this.group.addElement(this._9563);
         this._9559 = new Group();
         this._9559.top = 20;
         this._9559.bottom = 20;
         this._9559.width = 4;
         this._9559.right = 0;
         this.group.addElement(this._9559);
         this._9565 = new Group();
         this._9565.left = 5;
         this._9565.right = 20;
         this._9565.top = 0;
         this._9565.height = 4;
         this.group.addElement(this._9565);
         this._9556 = new Group();
         this._9556.left = 20;
         this._9556.right = 20;
         this._9556.height = 4;
         this._9556.bottom = 0;
         this.group.addElement(this._9556);
         this._9552 = new Group();
         this._9552.right = 0;
         this._9552.height = 20;
         this._9552.width = 4;
         this.group.addElement(this._9552);
         this._9554 = new Group();
         this._9554.left = 0;
         this._9554.top = 0;
         this._9554.height = 5;
         this._9554.width = 5;
         this.group.addElement(this._9554);
         this._9545 = new Group();
         this._9545.left = 0;
         this._9545.bottom = 0;
         this._9545.height = 20;
         this._9545.width = 20;
         this.group.addElement(this._9545);
         this._9543 = new Group();
         this._9543.right = 0;
         this._9543.bottom = 0;
         this._9543.height = 20;
         this._9543.width = 20;
         this.group.addElement(this._9543);
         this._8746 = new _1105();
         var _loc8_:Shape = new Shape();
         _loc8_.graphics.beginFill(16777215);
         _loc8_.graphics.drawRect(0,0,10,10);
         _loc8_.graphics.endFill();
         this._8746.source = _loc8_;
         this._8746.left = 0;
         this._8746.right = 0;
         this._8746.top = 0;
         this._8746.bottom = 0;
         this._8746.alpha = 0.1;
         this.group.addElement(this._8746);
      }
      
      protected function _8142(param1:MouseEvent) : void
      {
         this._2630._9786 = false;
         this.closeButton._9786 = false;
         this._2631._9786 = false;
      }
      
      protected function _8132(param1:MouseEvent) : void
      {
         this._2630._9786 = true;
         this.closeButton._9786 = true;
         this._2631._9786 = true;
      }
      
      override protected function _2519() : void
      {
         if(_2080 == "maximized")
         {
            this.group.left = 0;
            this.group.right = 0;
            this.group.bottom = 0;
            this.group.top = 0;
         }
         else if(_2080 == "normal")
         {
            this.group.left = 7;
            this.group.right = 7;
            this.group.bottom = 7;
            this.group.top = 7;
         }
      }
   }
}

