package _804
{
   import _1045._1082;
   import _1045._1084;
   import _1045._1105;
   
   public class _807 extends _1084
   {
      private var ui:_1082;
      
      public var _2448:_1105;
      
      public function _807()
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
         this._6088();
         this._2448.x = -12;
         this.ui.x = -12;
         this._2448.y = -12;
         this.ui.y = -12;
         this.addElement(this._2448);
      }
      
      private function _6088() : void
      {
         this._2448.graphics.clear();
         this._2448.graphics.beginFill(16720418);
         this._2448.graphics.lineStyle(1.2,16777215);
         this._2448.graphics.moveTo(12,4);
         this._2448.graphics.lineTo(20,12);
         this._2448.graphics.lineTo(12,20);
         this._2448.graphics.lineTo(4,12);
         this._2448.graphics.lineTo(12,4);
         this._2448.graphics.endFill();
      }
      
      private function _6089() : void
      {
         this._2448.graphics.clear();
         this._2448.graphics.beginFill(16720418);
         this._2448.graphics.lineStyle(1.2,16776994);
         this._2448.graphics.moveTo(12,4);
         this._2448.graphics.lineTo(20,12);
         this._2448.graphics.lineTo(12,20);
         this._2448.graphics.lineTo(4,12);
         this._2448.graphics.lineTo(12,4);
         this._2448.graphics.endFill();
      }
      
      override protected function _2519() : void
      {
         if(!(_2080 == "up" || _2080 == "disabled"))
         {
            if(_2080 != "over")
            {
               if(_2080 == "down")
               {
               }
            }
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

