package _804
{
   import _1045.Label;
   import _1439._1459;
   import flash.text.TextFormatAlign;
   
   public class _805 extends _1459
   {
      public var _6063:Label;
      
      public function _805()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         ui._2529 = 1;
         group.width = 100;
         group.height = 140;
         this._6063 = new Label();
         this._6063.text = "";
         this._6063.width = 100;
         this._6063.textAlign = TextFormatAlign.CENTER;
         this._6063.y = 110;
         group.addElement(this._6063);
      }
      
      override protected function _2519() : void
      {
         if(_2080 == "up" || _2080 == "disabled")
         {
            ui.fillColor = 2699835;
         }
         else if(_2080 == "over")
         {
            ui.fillColor = 3425870;
         }
         else if(_2080 == "down" || _2080 == "upAndSelected" || _2080 == "overAndSelected" || _2080 == "downAndSelected" || _2080 == "disabledAndSelected")
         {
            ui.fillColor = 1777956;
         }
         if(_2080 == "disabled")
         {
            group.alpha = 0.5;
         }
         else
         {
            group.alpha = 1;
         }
      }
   }
}

