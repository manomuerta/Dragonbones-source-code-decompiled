package _834
{
   import _1045.Label;
   import _1045._1082;
   import _1045._1084;
   import flash.text.TextFormatAlign;
   
   public class _12479 extends _1084
   {
      public var labelDisplay:Label;
      
      public function _12479()
      {
         super();
         this.states = ["up","over","down","disabled"];
         this.minHeight = 23;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         var _loc1_:_1082 = new _1082();
         _loc1_._2529 = 0;
         _loc1_.fillColor = 16777215;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.top = 0;
         this.addElement(_loc1_);
         this.labelDisplay = new Label();
         this.labelDisplay.buttonMode = true;
         this.labelDisplay.verticalCenter = 0;
         this.labelDisplay.textAlign = TextFormatAlign.LEFT;
         this.labelDisplay._6080 = 1;
         this.labelDisplay.textColor = 16711422;
         this.labelDisplay.underline = true;
         this.addElement(this.labelDisplay);
      }
      
      override protected function _2519() : void
      {
         this.labelDisplay.alpha = 1;
         this.labelDisplay.textColor = 16711422;
         switch(_2080)
         {
            case "up":
               this.labelDisplay.textColor = 38624;
               break;
            case "over":
               this.labelDisplay.textColor = 5029097;
               break;
            case "down":
               this.labelDisplay.textColor = 16777215;
               break;
            case "disabled":
               this.labelDisplay.textColor = 16777215;
               this.labelDisplay.alpha = 0.2;
         }
      }
   }
}

