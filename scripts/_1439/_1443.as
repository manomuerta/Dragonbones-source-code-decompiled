package _1439
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1082;
   import _1045._1084;
   import _1045._1105;
   import _1185._1189;
   import _1185._1196;
   import egret.core._1110;
   
   public class _1443 extends _1084
   {
      private var _2616:Class;
      
      private var _10023:Class;
      
      private var _2618:Class;
      
      private var _10024:Class;
      
      private var rect1:_1082;
      
      private var line1:_1082;
      
      public var _9689:Group;
      
      public var _9688:Group;
      
      public var sortDown:_1105;
      
      public var sortUp:_1105;
      
      public var labelDisplay:Label;
      
      public function _1443()
      {
         this._2616 = _1443__2616;
         this._10023 = _1443__10023;
         this._2618 = _1443__2618;
         this._10024 = _1443__10024;
         super();
         this.states = ["up","over","down"];
      }
      
      override protected function _2438() : void
      {
         var _loc1_:_1082 = null;
         super._2438();
         this.rect1 = new _1082();
         this.rect1.left = this.rect1.right = this.rect1.bottom = this.rect1.top = 0;
         this.rect1.fillColor = 3424588;
         this.addElement(this.rect1);
         _loc1_ = new _1082();
         _loc1_.y = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.height = 1;
         _loc1_.fillColor = 1777701;
         this.addElement(_loc1_);
         this.line1 = new _1082();
         this.line1.y = 0;
         this.line1.left = _loc1_.right = 0;
         this.line1.height = 1;
         this.line1.fillColor = 1777701;
         this.addElement(this.line1);
         _loc1_ = new _1082();
         _loc1_.bottom = _loc1_.left = _loc1_.right = 0;
         _loc1_.height = 1;
         _loc1_.fillColor = 1777701;
         this.addElement(_loc1_);
         var _loc2_:Group = new Group();
         var _loc3_:_1189 = new _1189();
         _loc3_.gap = 2;
         _loc3_.verticalAlign = _1196.MIDDLE;
         _loc2_.layout = _loc3_;
         _loc2_.left = _loc2_.right = 7;
         _loc2_.percentHeight = 100;
         this.addElement(_loc2_);
         this._9689 = new Group();
         this._9689.percentWidth = 100;
         _loc2_.addElement(this._9689);
         this.labelDisplay = new Label();
         this.labelDisplay.left = 0;
         this.labelDisplay.right = 0;
         this.labelDisplay.verticalAlign = _1196.MIDDLE;
         this.labelDisplay._6080 = 1;
         this._9689.addElement(this.labelDisplay);
         this._9688 = new Group();
         this._9688.includeInLayout = false;
         _loc2_.addElement(this._9688);
         this.sortDown = new _1105();
         this.sortDown.source = new _1110(this._2616,this._10023);
         this.sortDown.includeInLayout = false;
         this.sortDown.visible = false;
         this._9688.addElement(this.sortDown);
         this.sortUp = new _1105();
         this.sortUp.source = new _1110(this._2618,this._10024);
         this.sortUp.includeInLayout = false;
         this.sortUp.visible = false;
         this._9688.addElement(this.sortUp);
      }
      
      override protected function _2519() : void
      {
         super._2519();
         if(_2080 == "up")
         {
            this.rect1.fillColor = 3424588;
            this.line1.visible = true;
         }
         else if(_2080 == "over")
         {
            this.rect1.fillColor = 3885139;
            this.line1.visible = true;
         }
         else if(_2080 == "down")
         {
            this.rect1.fillColor = 1975081;
            this.line1.visible = false;
         }
      }
   }
}

