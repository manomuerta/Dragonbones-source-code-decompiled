package _1439
{
   import _1045.Label;
   import _1045._1084;
   import _1185._1196;
   import flash.text.TextFormatAlign;
   
   public class _1449 extends _1084
   {
      public var labelDisplay:Label;
      
      public function _1449()
      {
         super();
         this.states = ["up","over","down"];
         this.minHeight = 25;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.labelDisplay = new Label();
         this.labelDisplay.left = this.labelDisplay.right = 5;
         this.labelDisplay.textAlign = TextFormatAlign.LEFT;
         this.labelDisplay.verticalAlign = _1196.MIDDLE;
         this.labelDisplay._6080 = 1;
         this.labelDisplay.size = 12;
         this.labelDisplay.verticalCenter = 0;
         this.addElement(this.labelDisplay);
      }
   }
}

