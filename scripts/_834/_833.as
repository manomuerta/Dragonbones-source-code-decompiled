package _834
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1082;
   import _1045._1084;
   import _1045._1105;
   import _1185._1189;
   
   public class _833 extends _1084
   {
      public var _2530:_1082;
      
      public var labelDisplay:Label;
      
      public var _2448:_1105;
      
      public function _833()
      {
         super();
         this.states = ["up","over","down","disabled"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2530 = new _1082();
         this._2530._2563 = 1777701;
         this._2530._2564 = 1;
         this._2530.fillColor = 3753298;
         this._2530.top = 0;
         this._2530.left = 0;
         this._2530.right = 0;
         this._2530.bottom = 0;
         this.addElement(this._2530);
         var _loc1_:Group = new Group();
         _loc1_.mouseEnabled = false;
         var _loc2_:_1189 = new _1189();
         _loc2_.verticalAlign = "middle";
         _loc2_.gap = 10;
         _loc2_._2401 = "middle";
         _loc2_._2420 = _loc2_._2410 = 3;
         _loc1_.layout = _loc2_;
         _loc1_.horizontalCenter = 0;
         this.addElement(_loc1_);
         this._2448 = new _1105();
         _loc1_.addElement(this._2448);
         this.labelDisplay = new Label();
         _loc1_.addElement(this.labelDisplay);
      }
      
      override protected function _2519() : void
      {
         super._2519();
         if(_2080 == "over")
         {
            this._2530.fillColor = 4675431;
         }
         else
         {
            this._2530.fillColor = 3753298;
         }
         if(_2080 == "upAndSelected" || _2080 == "overAndSelected" || _2080 == "focus" || _2080 == "downAndSelected" || _2080 == "disabledAndSelected" || _2080 == "down")
         {
            this._2530.fillColor = 1975081;
         }
      }
   }
}

