package _127
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1084;
   import _1045._1105;
   import _1185._1189;
   import _1185._1196;
   import _1374._1375;
   import flash.geom.Rectangle;
   
   public class _166 extends _1084
   {
      private var _2618:Class;
      
      private var _2617:Class;
      
      private var _2616:Class;
      
      private var _2614:Class;
      
      private var _2530:_1105;
      
      public var _2440:Group;
      
      public var _2615:_1375;
      
      public var _2448:_1105;
      
      public var labelDisplay:Label;
      
      public var _2613:Boolean;
      
      public function _166()
      {
         this._2618 = _166__2618;
         this._2617 = _166__2617;
         this._2616 = _166__2616;
         this._2614 = _166__2614;
         super();
         this.minHeight = 22;
         this.states = ["up","over","down","disabled"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2530 = new _1105(this._2618);
         this._2530.left = this._2530.right = this._2530.top = this._2530.bottom = 0;
         this._2530.scale9Grid = new Rectangle(1,1,1,1);
         this.addElement(this._2530);
         this._2440 = new Group();
         var _loc1_:_1189 = new _1189();
         _loc1_._2419 = 2;
         _loc1_.gap = 2;
         _loc1_.verticalAlign = _1196.MIDDLE;
         this._2440.layout = _loc1_;
         this._2440.top = 0;
         this._2440.bottom = 0;
         this.addElement(this._2440);
         this._2615 = new _1375();
         this._2615.skinName = _164;
         this._2440.addElement(this._2615);
         this._2448 = new _1105();
         this._2440.addElement(this._2448);
         this.labelDisplay = new Label();
         this.labelDisplay.verticalAlign = _1196.MIDDLE;
         this._2440.addElement(this.labelDisplay);
      }
      
      protected function _2612() : void
      {
         this._2530.source = this._2614;
      }
      
      override protected function _2519() : void
      {
         if(_2080 == "up" || _2080 == "disabled")
         {
            this._2530.source = this._2618;
         }
         else if(_2080 == "over")
         {
            this._2530.source = this._2617;
         }
         else if(_2080 == "down")
         {
            this._2530.source = this._2616;
         }
      }
   }
}

