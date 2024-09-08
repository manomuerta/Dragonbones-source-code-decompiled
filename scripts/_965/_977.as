package _965
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1084;
   import _1045._1105;
   import _1185._1189;
   import _1185._1196;
   import _1374._1375;
   import _1439._1268;
   import flash.geom.Rectangle;
   import flash.text.TextFormatAlign;
   
   public class _977 extends _1084
   {
      private var _2618:Class;
      
      private var _2617:Class;
      
      private var _2616:Class;
      
      private var ui1:_1105;
      
      private var ui2:_1105;
      
      private var ui3:_1105;
      
      public var _2440:Group;
      
      public var _2615:_1375;
      
      public var _2448:_1105;
      
      public var labelDisplay:Label;
      
      public function _977()
      {
         this._2618 = _977__2618;
         this._2617 = _977__2617;
         this._2616 = _977__2616;
         super();
         this.states = ["up","over","down","disabled"];
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Group = null;
         super._2438();
         _loc1_ = new Group();
         _loc1_.height = 23;
         _loc1_.left = _loc1_.right = 0;
         this.addElement(_loc1_);
         this.ui1 = new _1105(this._2618);
         this.ui1.left = this.ui1.right = this.ui1.top = this.ui1.bottom = 0;
         this.ui1.scale9Grid = new Rectangle(1,1,1,1);
         _loc1_.addElement(this.ui1);
         this.ui2 = new _1105(this._2617);
         this.ui2.left = this.ui2.right = this.ui2.top = this.ui2.bottom = 0;
         this.ui2.scale9Grid = new Rectangle(1,1,1,1);
         _loc1_.addElement(this.ui2);
         this.ui3 = new _1105(this._2616);
         this.ui3.left = this.ui3.right = this.ui3.top = this.ui3.bottom = 0;
         this.ui3.scale9Grid = new Rectangle(1,1,1,1);
         _loc1_.addElement(this.ui3);
         this._2440 = new Group();
         this._2440.top = 0;
         this._2440.bottom = 0;
         var _loc2_:_1189 = new _1189();
         _loc2_.verticalAlign = _1196.MIDDLE;
         this._2440.layout = _loc2_;
         _loc1_.addElement(this._2440);
         this._2615 = new _1375();
         this._2615.skinName = _1268;
         this._2440.addElement(this._2615);
         this._2448 = new _1105();
         this._2440.addElement(this._2448);
         this.labelDisplay = new Label();
         this.labelDisplay.verticalAlign = _1196.MIDDLE;
         this.labelDisplay.textAlign = TextFormatAlign.LEFT;
         this._2440.addElement(this.labelDisplay);
      }
      
      override protected function _2519() : void
      {
         if(_2080 == "up" || _2080 == "disabled" || _2080 == "over")
         {
            this.ui1.visible = true;
            this.ui2.visible = false;
            this.ui3.visible = false;
         }
         else if(_2080 != "over")
         {
            if(_2080 == "down")
            {
               this.ui1.visible = false;
               this.ui2.visible = true;
               this.ui3.visible = false;
            }
         }
      }
   }
}

