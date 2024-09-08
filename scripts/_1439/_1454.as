package _1439
{
   import _1045._1082;
   import _1045._1084;
   import _1045._1105;
   
   public class _1454 extends _1084
   {
      private var ui:_1082;
      
      public var _2448:_1105;
      
      public function _1454()
      {
         super();
         this.states = ["up","over","down","disabled"];
         this.minHeight = this.minWidth = 24;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.ui = new _1082();
         this.ui.percentWidth = this.ui.percentHeight = 100;
         this.ui.fillColor = 16777215;
         this.ui._2529 = 0;
         this.addElement(this.ui);
         this._2448 = new _1105();
         this._2448.verticalCenter = 0;
         this._2448.horizontalCenter = 0;
         this.addElement(this._2448);
      }
      
      override protected function _2519() : void
      {
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
         else if(_2080 == "down")
         {
            this.ui.fillColor = 1777956;
            this.ui._2529 = 1;
         }
         if(_2080 == "disabled")
         {
            this.ui.alpha = this._2448.alpha = 0.5;
         }
         else
         {
            this.ui.alpha = this._2448.alpha = 1;
         }
      }
   }
}

