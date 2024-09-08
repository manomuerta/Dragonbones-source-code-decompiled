package _1439
{
   import _1045.Group;
   import _1045._1082;
   import _1045._1084;
   import _1045._1105;
   
   public class _1459 extends _1084
   {
      protected var ui:_1082;
      
      public var _2448:_1105;
      
      protected var group:Group;
      
      public function _1459()
      {
         super();
         states = ["up","over","down","disabled","upAndSelected","overAndSelected","downAndSelected","disabledAndSelected"];
         this._2080 = "up";
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.group = new Group();
         this.group.clipAndEnableScrolling = true;
         this.addElement(this.group);
         this.group.width = 24;
         this.group.height = 24;
         this.ui = new _1082();
         this.ui.percentWidth = this.ui.percentHeight = 100;
         this.ui.fillColor = 16777215;
         this.ui._2529 = 0;
         this.group.addElement(this.ui);
         this._2448 = new _1105();
         this._2448.verticalCenter = 0;
         this._2448.horizontalCenter = 0;
         this.group.addElement(this._2448);
      }
      
      override protected function _2519() : void
      {
         super._2519();
         if(_2080 == "up" || _2080 == "disabled")
         {
            this.ui.fillColor = 16777215;
            this.ui._2529 = 0;
         }
         else if(_2080 == "over")
         {
            this.ui.fillColor = 3425870;
            this.ui._2529 = 1;
         }
         else if(_2080 == "down" || _2080 == "upAndSelected" || _2080 == "overAndSelected" || _2080 == "downAndSelected" || _2080 == "disabledAndSelected")
         {
            this.ui.fillColor = 1777956;
            this.ui._2529 = 1;
         }
         if(_2080 == "disabled")
         {
            this.group.alpha = 0.5;
         }
         else
         {
            this.group.alpha = 1;
         }
      }
   }
}

